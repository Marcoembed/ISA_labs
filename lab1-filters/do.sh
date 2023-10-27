#! /usr/bin/env bash

# IMPORTANT! This file must remain in the project directory root

# SSH 
SSH_HOSTNAME="led-x3850-2.polito.it"
SSH_USER="isa01_2023_2024"
SSH_PORT="10038"
SSH_PRIV_KEY_PATH="$HOME/.ssh/${USER}_isa_ed25519"

# Remote storage paths
LOCAL_PRJ_ROOT_PATH="$(dirname "$(readlink -f "$0")")"
LOCAL_PRJ_ROOT_NAME="$(basename "$LOCAL_PRJ_ROOT_PATH")"
SERVER_PRJ_ROOT_PATH="$USER/$LOCAL_PRJ_ROOT_NAME"

DBG_ON=0 # if 1 enables debug for this script

# Questa stuff
HDL_DIR="./hdl"
TB_DIR="./tb"
SIM_DIR="./sim"

TOP_DESIGN_NAME="IIR"
COMPILE_HDL_FILE_PATH_LIST=("./$HDL_DIR/compile_VHDL.f" "./$TB_DIR/compile_VHDL.f")
SIM_SCRIPT_FILE="./$SIM_DIR/sim.do"


base_dir=$(dirname "$0") # Directory of this script
cd "$base_dir" || exit


usage(){
    echo "Usage: $(basename "$0") { push | shell | remote {remote_cmd} | --help | -h }"
}

help(){
    echo "$(basename "$0") do stuff on this project"
    echo ""
    usage
    echo ""
    echo "IMPORTANT: This script must be located in the root dir of the project"
    echo "IMPORTANT: Credentials if missing will be created as file: $SSH_PRIV_KEY_PATH"
    echo ""
    echo "    push"
    echo "        push local content to remote server"
    #echo "    pull OBJECT:               pull remote objects in local directory"
    #echo "        OBJECT = func_cover.txt  retrive the functional coverage file for"
    #echo "        all entities in ./sim"
    echo "    remote {remote_cmd}"
    echo "        run remote_cmd on the remote server" 
    echo "        remote_cmd:"
    echo "            cln: questa artifacts clean"
    echo "            ela: elaborates design files"
    echo "            sim: simaulates design files on the predefined testbench"
    echo "            syn: synthesize design files"
    echo "    shell"
    echo "        open a shell on the server"
    echo ""
    echo "Examples:"
    echo "    $(basename "$0") push"
    #echo "    $(basename "$0") pull func_cover.txt"
    echo "    $(basename "$0") remote ela"
    echo ""
    echo ""
    exit 0;
}

generate_ssh_key() {
    if [ ! -f "$SSH_PRIV_KEY_PATH" ]; then
        # If file not available
        
        # Generate ssh id file
        ssh-keygen -t ed25519 -f "$SSH_PRIV_KEY_PATH"
        # Copy ssh key to server (will ask for password)
        [ $? -eq 0 ] && ssh-copy-id -p "$SSH_PORT" -i "$SSH_PRIV_KEY_PATH.pub" "$SSH_USER@$SSH_HOSTNAME" 
    fi
    # If something did not go correctly warn the user and exit with error
    [ $? -ne 0 ] && echo "problems accessing server, you must copy by yourself this key $SSH_PRIV_KEY_PATH" && exit 1
}

#@brief push local prj dir to server-home/<your_usrname>/prj_dir/
#@note ssh connection must be available
cmd_push(){
    
    # First create directory if not available
    ssh "$SSH_USER@$SSH_HOSTNAME" -p "$SSH_PORT" -i "$SSH_PRIV_KEY_PATH" "mkdir -p ~/$SERVER_PRJ_ROOT_PATH"
    # Move stuff
    [ $? -eq 0 ] && rsync -hh -a -s --info=stats1,progress2 --partial \
        -e "ssh -p $SSH_PORT -i $SSH_PRIV_KEY_PATH" \
        "$LOCAL_PRJ_ROOT_PATH/" "$SSH_USER@$SSH_HOSTNAME":"$SERVER_PRJ_ROOT_PATH/"
    # In rsync the "/" at the end of paths are important, it means copy the
    # content not the folder itself (the same applies for the destination)
    exit $?
}

#@brief open a shell on the server
#@note ssh connection must be available
cmd_shell(){
    ssh "$SSH_USER@$SSH_HOSTNAME" -p "$SSH_PORT" -i "$SSH_PRIV_KEY_PATH"
    exit $?
}

#@brief get questasim software into PATH on the remote
remote_get_questa(){
    # Source this file to be able to run vsim,vcom,vlog etc...
    source "/eda/scripts/init_questa_core_prime"
}

# @brief clean simulation objects/folders of MODULE
# @ret $? analysis return code or error (1)
# NOTE: must be already in the prj root folder
remote_cmd_clean() {
    # clean all, if nothing to clean throw error away
    vdel -all >/dev/null 2>&1
    echo "All modelsim dirs in" $(pwd) "cleaned"
}

# @brief compile hdl files (vhdl and verilog)
# @ret $? analysis return code or error (1)
# NOTE: must be in project root
remote_cmd_hdl_elaborate() {

    # Check compile_VHDL file existance
    for i in "${COMPILE_HDL_FILE_PATH_LIST[@]}"; do
        if ! [ -f "$i" ]; then 
            echo "Error: Cannot find $i file" 
            return 1 
        fi
    done

    # create the work folder if doesn't exists otherwise throw out the error
    vlib work >/dev/null 2>&1

    echo "#########################################"
    echo "####                                 ####"
    echo "##          VHDL COMPILATION           ##"
    echo "####                                 ####"
    echo "#########################################"

    for i in "${COMPILE_HDL_FILE_PATH_LIST[@]}"; do
        # compile verilog and VHDL files with 2008 std
        #echo "vcom -mixedsvvh -F "$i" -2008"
        vcom -mixedsvvh -F "$i" -2008
    done

    # return compilation code
    return $?

}
 
# @brief simulate designs using the ./sim.do script
# @ret $? simulation return code or error (1)
# NOTE: must be already in the prj root folder
remote_cmd_sim() {

    if ! [ -f "$SIM_SCRIPT_FILE" ]; then 
        echo "Error: Missig $SIM_SCRIPT_FILE file in $(pwd) folder" 
        return 1 
    fi

    echo "#########################################"
    echo "####                                 ####"
    echo "##             SIMULATION              ##"
    echo "####                                 ####"
    echo "#########################################"

    # Simulate the $TOP_DESIGN_NAME entity of MODULE deisng using sim.do tcl script
    echo "vsim -c -sv_seed random -onfinish stop -do $SIM_SCRIPT_FILE $TOP_DESIGN_NAME"
    vsim -c -sv_seed random -onfinish stop -do "$SIM_SCRIPT_FILE" "$TOP_DESIGN_NAME"

    # return simulation code
    return $?

}

# @brief synthesize designs using the ./syn.do script
# @ret $? simulation return code or error (1)
# NOTE: must be already in the syn/ folder
remote_cmd_syn() {

    if ! [ -f "$SIM_SCRIPT_FILE" ]; then 
        echo "Error: Missig $SIM_SCRIPT_FILE file in $(pwd) folder" 
        return 1 
    fi

    echo "#########################################"
    echo "####                                 ####"
    echo "##             SYNTHESIS               ##"
    echo "####                                 ####"
    echo "#########################################"

    # Simulate the $TOP_DESIGN_NAME entity of MODULE deisng using sim.do tcl script
    echo "vsim -c -sv_seed random -onfinish stop -do $SIM_SCRIPT_FILE $TOP_DESIGN_NAME"
    vsim -c -sv_seed random -onfinish stop -do "$SIM_SCRIPT_FILE" "$TOP_DESIGN_NAME"

    # return simulation code
    return $?

}

# @param $1 remote|is_remote: are we asking to remote or running in the remote
# @param $2 remote_cmd: remote command to deploy|execute
cmd_remote() {
    remote_shell="ssh $SSH_USER@$SSH_HOSTNAME -p $SSH_PORT -i $SSH_PRIV_KEY_PATH "

    cd_prj_cmd="cd ~/$SERVER_PRJ_ROOT_PATH"

    if [ -z "$2" ]; then echo "No remote_cmd provided"; usage; exit 1 ; fi 
    if [ "$1" = "remote" ]; then
        case "$2" in 
            "cln")
                cmd="$cd_prj_cmd; ./$0 is_remote cln"
                ;;
            "ela")
                cmd="$cd_prj_cmd; $0 is_remote ela"
                ;;
            "sim")
                cmd="$cd_prj_cmd; $0 is_remote sim"
                ;;
            "syn")
                cmd="$cd_prj_cmd; $0 is_remote syn"
                ;;
            *)
                echo "$1 is not a remote_cmd"; usage; exit 1
                ;;
        esac

        set -x
        $remote_shell "$cmd"
        set +x

        exit $?
    elif [ "$1" = "is_remote" ]; then
        # Here we are executing commands on the server
        # 1) Enable questa 
        remote_get_questa;
        case "$2" in 
            "cln")
                remote_cmd_clean 
                ;;
            "ela")
                remote_cmd_hdl_elaborate
                ;;
            "sim")
                remote_cmd_sim
                ;;
            "syn")
                remote_cmd_syn
                ;;
            *)
                echo "$1 is not a remote_cmd"; usage; exit 1
                ;;
        esac
    fi
}

## if first parameter is empty then exit
if [ -z "$1" ]  ; then echo "Nothing to do"; usage; exit 0 ; fi 

################################################################################
# HELP
################################################################################
if [ -n "$1" ] && ( [ "$1" = "--help" ] || [ "$1" == "-h" ] ); then help; fi

################################################################################
# PUSH
################################################################################
if [ -n "$1" ] && [ "$1" = "push" ] ; then cmd_push; fi 

################################################################################
# SHELL
################################################################################
if [ -n "$1" ] && [ "$1" = "shell" ] ; then  cmd_shell; fi 

################################################################################
# PULL
################################################################################
#if [ -n "$1" ] && [ "$1" == "pull" ] ; then 
#    if [ -n "$2" ] && [ "$2" == "func_cover.txt" ] ; then 
#        ## Get Functional coverage from server
#        for f in $(ls "$prj_dir_path"/sim); do 
#            scp "$SERVER_SSH_CREDENTIALS":"$SERVER_PRJ_ROOT_PATH/sim/$f/func_cover.txt" "$prj_dir_path/sim/$f/"
#        done
#        exit 0
#    else
#        echo "Error on OBJECT, try" 
#        usage 
#        exit 1 
#    fi 
#else
#    echo "Nothing to do" 
#    usage 
#    exit 0 
#fi 

################################################################################
# REMOTE COMMANDS
################################################################################
if [ -n "$1" ] && [ "$1" = "remote" -o "$1" = "is_remote" ] ; then cmd_remote "$1" "$2"; fi 




