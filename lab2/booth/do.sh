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

# Standard dirs for the project
HDL_DIR="./src"
TB_DIR="./tb"
SIM_DIR="./sim"
SYN_DIR="./syn"
 
##########################################
# HDL .f files path
EXCLUDE_FILE="fpnew_fma.sv"
COMPILE_VHDL_FILE_PATH_LIST=("$HDL_DIR/compile_VHDL.f" "$TB_DIR/compile_VHDL.f")
COMPILE_VLOG_FILE_PATH_LIST=("$HDL_DIR/compile_VLOG.f" "$TB_DIR/compile_VLOG.f")
# SIMULATION TOP level entity name
SIM_TOP_LVL_ENTITY="tb"
# SIMULATION work directory
SIM_WORK_DIR="$SIM_DIR/work"
# SIMULATION variables
SIM_TIME="40us"
# SIMULATION tcl script file path
SIM_SCRIPT_FILE="$SIM_DIR/sim.do"
# SYNTHESIS TOP level entity name
SYN_TOP_LVL_ENTITY="IIR"
# SYNTHESIS work directory
SYN_WORK_DIR="$SYN_DIR/work"
# SYNTHESIS tcl script file path
SYN_SCRIPT_FILE="$SYN_DIR/syn.tcl"
##########################################




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
	echo "            init:     file initialization"
    echo "            cln:      artifacts clean"
    echo "            ela:      elaborates design files (first verilog then vhdl)"
    echo "            ela_vhdl: elaborates vhdl design files"
    echo "            ela_vlog: elaborates vlog design files"
    echo "            sim:      simaulates design files on the predefined testbench"
    echo "            syn:      synthesize design files"
    echo "    shell"
    echo "        open a shell on the server"
    echo "    ssh_key"
    echo "        create a ssh key in .ssh directory"
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

#@brief adds questasim software into PATH on the remote
remote_add_to_path_questa(){
    # Source this file to be able to run vsim,vcom,vlog etc...
    source "/eda/scripts/init_questa_core_prime"
}

#@brief adds design vision/compiler software into PATH on the remote
remote_add_to_path_dvc(){
    # Source this file to be able to run dc_shell-xg-t,pt_shell...
    source "/eda/scripts/init_design_vision"
}


# @brief clean simulation objects/folders of MODULE
# @ret $? analysis return code or error (1)
# NOTE: must be already in the prj root folder
remote_cmd_clean() {
    # clean all, if nothing to clean throw error away
    for i in "$LOCAL_PRJ_ROOT_PATH" "$SIM_DIR" "$SYN_DIR"; do
        pushd "$i"
        vdel -all >/dev/null 2>&1
        echo "Remove all modelsim dirs in $(pwd)"
        popd
    done
}

#@brief files initialization 
remote_cmd_init(){

	# create file sim.do in sim/ directory
	echo 'puts "\n########## SIMULATION STARTS ##########\n"' > $SIM_SCRIPT_FILE 
	echo "run $SIM_TIME" >> $SIM_SCRIPT_FILE 
	echo 'puts "\n##########  SIMULATION ENDS  ##########\n"' >> $SIM_SCRIPT_FILE 
	echo 'exit' >> $SIM_SCRIPT_FILE 
	
	# compilation files initialization for src\ and tb\
	find "$HDL_DIR" -name "*.v" -not -name "$EXCLUDE_FILE" -or -name "*.sv" -not -name "$EXCLUDE_FILE" > "$HDL_DIR"/compile_VLOG.f
	find "$HDL_DIR" -name "*.vhdl" -not -name "$EXCLUDE_FILE" -or -name "*.vhd" -not -name "$EXCLUDE_FILE"  > "$HDL_DIR"/compile_VHDL.f
	find "$TB_DIR" -name "*.v" -not -name "$EXCLUDE_FILE" -or -name "*.sv" -not -name "$EXCLUDE_FILE"   > "$TB_DIR"/compile_VLOG.f
	find "$TB_DIR" -name "*.vhdl" -not -name "$EXCLUDE_FILE" -or -name "*.vhd" -not -name "$EXCLUDE_FILE"  > "$TB_DIR"/compile_VHDL.f
	return $ret
}

# @brief compile verilog files
# @ret $? analysis return code or error (1)
# NOTE: must be in project root
remote_cmd_vlog_elaborate() {
    # Check compile_VLOG file existance
    for i in "${COMPILE_VLOG_FILE_PATH_LIST[@]}"; do
        if ! [ -f "$i" ]; then 
            echo "Error: Cannot find $i file" 
            return 1 
        fi
    done

    # create the work folder if doesn't exists otherwise throw out the error
    vlib "$SIM_WORK_DIR" >/dev/null 2>&1

    echo "#########################################"
    echo "####                                 ####"
    echo "##       VERILOG COMPILATION           ##"
    echo "####                                 ####"
    echo "#########################################"

    for i in "${COMPILE_VLOG_FILE_PATH_LIST[@]}"; do
        # if file is not empty
        if [ -s "$i" ]; then
            # compile verilog and verilog files
            vlog -work "$SIM_WORK_DIR" -F "$i"
        fi
    done

    # return compilation code
    return $ret

}
# @brief compile vhdl files
# @ret $? analysis return code or error (1)
# NOTE: must be in project root
remote_cmd_vhdl_elaborate() {

    # Check compile_VHDL file existance
    for i in "${COMPILE_VHDL_FILE_PATH_LIST[@]}"; do
        if ! [ -f "$i" ]; then 
            echo "Error: Cannot find $i file" 
            return 1 
        fi
    done

    # create the work folder if doesn't exists otherwise throw out the error
    vlib "$SIM_WORK_DIR" >/dev/null 2>&1

    echo "#########################################"
    echo "####                                 ####"
    echo "##          VHDL COMPILATION           ##"
    echo "####                                 ####"
    echo "#########################################"

    for i in "${COMPILE_VHDL_FILE_PATH_LIST[@]}"; do
        # if file is not empty
        if [ -s "$i" ]; then
            # compile verilog and VHDL files with 2008 std
            #echo "vcom -mixedsvvh -F "$i" -2008"
            vcom -work "$SIM_WORK_DIR" -mixedsvvh -F "$i" -2008
        fi
    done

    # return compilation code
    return $ret

}
remote_cmd_hdl_elaborate() {
    remote_cmd_vlog_elaborate && remote_cmd_vhdl_elaborate 
    return $ret
}
 
# @brief simulate designs using the ./sim.do script
# @ret $? simulation return code or error (1)
# NOTE: must be already in the prj root folder
remote_cmd_sim() {

    if ! [ -f "$SIM_SCRIPT_FILE" ]; then 
        echo "Error: Cannot find file $SIM_SCRIPT_FILE" 
        return 1 
    fi

    echo "#########################################"
    echo "####                                 ####"
    echo "##             SIMULATION              ##"
    echo "####                                 ####"
    echo "#########################################"

    # Simulate the $SIM_TOP_LVL_ENTITY entity deisng using sim.do tcl script
    vsim -work "$SIM_WORK_DIR" -sv_seed random -onfinish stop -voptargs=+acc -do "$SIM_SCRIPT_FILE" "$SIM_TOP_LVL_ENTITY"
    #vsim -work "$SIM_WORK_DIR" -c -sv_seed random -onfinish stop -voptargs=+acc -do "$SIM_SCRIPT_FILE" "$SIM_TOP_LVL_ENTITY"

    # return simulation code
    return $?

}

# @brief synthesize designs using the ./syn.do script
# @ret $? simulation return code or error (1)
# NOTE: must be already in the syn/ folder
remote_cmd_syn() {
    if ! [ -f "$SYN_SCRIPT_FILE" ]; then 
        echo "Error: Cannot find file $SYN_SCRIPT_FILE" 
        return 1 
    fi

    # Make work directory for synthesis
    mkdir -p "$SYN_WORK_DIR"

    echo "#########################################"
    echo "####                                 ####"
    echo "##              SYNTHESIS              ##"
    echo "####                                 ####"
    echo "#########################################"

    #dc_shell-xg-t -F "$SYN_SCRIPT_FILE" | tee syn_dlx.log
    dc_shell-xg-t -F "$SYN_SCRIPT_FILE" -output_log_file "$SYN_DIR/syn.log"
    #rm command.log
    #rm default.svf

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
            "init")
                cmd="$cd_prj_cmd; $0 is_remote init"
                ;;
            "ela_vhdl")
                cmd="$cd_prj_cmd; $0 is_remote ela_vhdl"
                ;;
            "ela_vlog")
                cmd="$cd_prj_cmd; $0 is_remote ela_vlog"
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
        # 1) Add questasim to path
        remote_add_to_path_questa
        # 2) Add design compiler to path
        remote_add_to_path_dvc
        # 3) Check what to do
        case "$2" in 
            "cln")
                remote_cmd_clean 
                ;;
            "init")
				remote_cmd_init
                ;;
            "ela_vhdl")
                remote_cmd_vhdl_elaborate
                ;;
            "ela_vlog")
                remote_cmd_vlog_elaborate
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




