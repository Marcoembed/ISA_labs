#! /usr/bin/env bash

# IMPORTANT! This file must remain in the project directory root

# SSH 
SSH_USER="isa01_2023_2024"
SSH_PORT="10038"
SSH_PRIV_KEY_PATH="$HOME/.ssh/${USER}_isa_ed25519"
SSH_HOSTNAME="led-x3850-2.polito.it"

# Remote storage paths
LOCAL_PRJ_ROOT_PATH="$(dirname "$(readlink -f "$0")")"
LOCAL_PRJ_ROOT_NAME="$(basename "$LOCAL_PRJ_ROOT_PATH")"
SERVER_PRJ_ROOT_PATH="$USER/$LOCAL_PRJ_ROOT_NAME"


DBG_ON=0 # if 1 enables debug for this script
GUI="nogui"

# Standard dirs for the project
HDL_DIR="./src"
TB_DIR="./tb"
SIM_DIR="./sim"
SYN_DIR="./syn"
 
##########################################
# HDL .f files path
EXCLUDE_FILE=""
COMPILE_VHDL_FILE_PATH_LIST=("$HDL_DIR/compile_VHDL.f" "$TB_DIR/compile_VHDL.f")
COMPILE_VLOG_FILE_PATH_LIST=("$HDL_DIR/compile_VLOG.f" "$TB_DIR/compile_VLOG.f")
# SIMULATION TOP level entity name
SIM_TOP_LVL_ENTITY="tb_real"
# SIMULATION work directory
SIM_WORK_DIR="$SIM_DIR/work"
# SIMULATION variables
SIM_TIME="5 us"
# SIMULATION tcl script file path
SIM_SCRIPT_FILE="$SIM_DIR/sim.do"
# SYNTHESIS TOP level entity name
SYN_TOP_LVL_ENTITY="riscv_top"
# SYNTHESIS work directory
SYN_WORK_DIR="$SYN_DIR/work"
# SYNTHESIS tcl script file path
SYN_SCRIPT_FILE="$SYN_DIR/syn_real.tcl"
##########################################


base_dir=$(dirname "$0") # Directory of this script
cd "$base_dir" || exit


usage(){
    echo "Usage: $(basename "$0") { push | shell | {cmd} [ATTRIBUTES] | --help | -h }"
}

help(){
    echo "$(basename "$0") do stuff on this project"
    echo ""
    usage
    echo ""
    echo "IMPORTANT: This script must be located in the root dir of the project"
    echo "IMPORTANT: Credentials if missing will be created as file: $SSH_PRIV_KEY_PATH"
    echo "IMPORTANT: ATTRIBUTES must be used only without 'remote' OPTION, local or server"
    echo ""
    echo "    push"
    echo "        push local content to remote server"
    echo "    cmd:"
	echo "         init:         file initialization"
    echo "         comp:         elaborates design files (first verilog then vhdl)"
    echo "         sim:          simulates design files on the predefined testbench"
    echo "         sim_post_syn: simulates post synthesis design on the predefined testbench"
    echo "         syn:          synthesize design files"
    echo ""
    echo "	  ATTRIBUTES:"
	echo "            gui:      only for {cmd}=sim or sim_post_syn, GUI mode (e.g. sim gui)"
	echo "          nogui:      only for {cmd}=sim or sim_post_syn, shell mode, DEFAULT (e.g. sim nogui | sim)"
    echo "    shell"
    echo "        open a shell on the server"
    echo "    ssh_key"
    echo "        create a ssh key in .ssh directory"
    echo ""
    echo "Examples:"
    echo "    $(basename "$0") push"
    echo "    $(basename "$0") sim"
    echo "    $(basename "$0") sim gui"
    echo "    $(basename "$0") syn"
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

    local dir=$1
    
    # First create directory if not available
    ssh "$SSH_USER@$SSH_HOSTNAME" -p "$SSH_PORT" -i "$SSH_PRIV_KEY_PATH" "mkdir -p ~/$SERVER_PRJ_ROOT_PATH"
    # Move stuff
    [ $? -eq 0 ] && rsync -hh -a -s --info=stats1,progress2 --partial \
        -e "ssh -p $SSH_PORT -i $SSH_PRIV_KEY_PATH" \
        "$LOCAL_PRJ_ROOT_PATH/$dir" "$SSH_USER@$SSH_HOSTNAME":"$SERVER_PRJ_ROOT_PATH/$dir"
    # In rsync the "/" at the end of paths are important, it means copy the
    # content not the folder itself (the same applies for the destination)
    exit $?
}

#@brief open a shell on the server
#@note ssh connection must be available
cmd_shell(){
    ssh -t "$SSH_USER@$SSH_HOSTNAME" -X -p "$SSH_PORT" -i "$SSH_PRIV_KEY_PATH" "cd ~/$SERVER_PRJ_ROOT_PATH && exec bash -l"; 
    exit $?
}

#@brief files initialization 
cmd_init(){

	# create file sim.do in sim/ directory
	echo "set StdArithNoWarnings 1" > $SIM_SCRIPT_FILE
	if find "$SIM_DIR" -name "wave_real.do" -print -quit | grep -q .; then
    	echo "do wave_real.do" >> "$SIM_SCRIPT_FILE"
	fi
	echo 'puts "\n########## SIMULATION STARTS ##########\n"' >> $SIM_SCRIPT_FILE 
	echo "run $SIM_TIME" >> $SIM_SCRIPT_FILE 
	echo 'puts "\n##########  SIMULATION ENDS  ##########\n"' >> $SIM_SCRIPT_FILE 
	
	# compilation files initialization for src\ and tb\
	find "$HDL_DIR" -name "*.v" -not -name "$EXCLUDE_FILE" -or -name "*.sv" -not -name "$EXCLUDE_FILE" > "$HDL_DIR"/compile_VLOG.f
	find "$HDL_DIR" -name "*.vhdl" -not -name "$EXCLUDE_FILE" -or -name "*.vhd" -not -name "$EXCLUDE_FILE"  > "$HDL_DIR"/compile_VHDL.f
	find "$TB_DIR" -name "*.v" -not -name "$EXCLUDE_FILE" -or -name "*.sv" -not -name "$EXCLUDE_FILE"   > "$TB_DIR"/compile_VLOG.f
	find "$TB_DIR" -name "*.vhdl" -not -name "$EXCLUDE_FILE" -or -name "*.vhd" -not -name "$EXCLUDE_FILE"  > "$TB_DIR"/compile_VHDL.f

    # compile pkg first
	for i in "${COMPILE_VLOG_FILE_PATH_LIST[@]}"; do
		if grep -q "pkg" "$i"; then
			line=$(grep "pkg" "$i")
			sed -i '/pkg/d' "$i"
			sed -i "1i\\$line" "$i"
		fi	
	done

	return $ret
}

# @brief compile verilog files
# @ret $? analysis return code or error (1)
# NOTE: must be in project root
cmd_vlog_elaborate() {
    # Check compile_VLOG file existance
	
    for i in "${COMPILE_VLOG_FILE_PATH_LIST[@]}"; do
        if ! [ -f "$i" ]; then 
            echo "Error: Cannot find $i file" 
            return 1 
        fi
    done

	# Check if compile_VLOG.f is empty
    #if ! [ -s "$COMPILE_VLOG_FILE_PATH_LIST" ]; then 
    #    echo "Warning: file $COMPILE_VLOG_FILE_PATH_LIST is empty" 
    #    return $ret
    #fi

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
            vlog -svinputport=relaxed -work "$SIM_WORK_DIR" -F "$i"
            vlog -work "$SIM_WORK_DIR" sram_32_1024_freepdk45/sram_32_1024_freepdk45.v
        fi
    done

    # return compilation code
	cd -

    return $ret

}
# @brief compile vhdl files
# @ret $? analysis return code or error (1)
# NOTE: must be in project root
cmd_vhdl_elaborate() {

    # Check compile_VHDL file existance
    for i in "${COMPILE_VHDL_FILE_PATH_LIST[@]}"; do
        if ! [ -f "$i" ]; then 
            echo "Error: Cannot find $i file" 
            return 1 
        fi
    done

	# Check if compile_VHDL.f is empty
    #if ! [ -s "$COMPILE_VHDL_FILE_PATH_LIST[@]" ]; then 
	#	echo "$COMPILE_VHDL_FILE_PATH_LIST";
    #    echo "Warning: file $COMPILE_VHDL_FILE_PATH_LIST is empty" 
    #    return $ret
    #fi


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
cmd_comp() {
    source /eda/scripts/init_questa_core_prime

    cmd_init
    rm -rf "$SIM_WORK_DIR"
    cmd_vlog_elaborate && cmd_vhdl_elaborate 
    return $ret
}
 
# @brief simulate designs using the ./sim.do script
# @ret $? simulation return code or error (1)
# NOTE: must be already in the prj root folder
cmd_sim() {
    source /eda/scripts/init_questa_core_prime
    echo
    echo "Compilation before simulation:"
    echo
    cmd_comp

    if [ -e "./vsim.wlf" ]; then
        rm ./vsim.wlf;
    else
        echo "Warning: vsim.wlf cannot be removed, No such file";
    fi

    if ! [ -f "$SIM_SCRIPT_FILE" ]; then 
        echo "Error: Cannot find file $SIM_SCRIPT_FILE" 
        return 1 
    fi

    echo "#########################################"
    echo "####                                 ####"
    echo "##             SIMULATION              ##"
    echo "####                                 ####"
    echo "#########################################"

    # Simulate the $SIM_TOP_LVL_ENTITY entity design using sim.do tcl script
	if [ $GUI == nogui ]; then
		vsim -t ps -c -suppress 3009 -work "$SIM_DIR"/work "$SIM_DIR"/work."$SIM_TOP_LVL_ENTITY" -do "$SIM_SCRIPT_FILE" -voptargs=+acc 
    	#vsim -work "$SIM_WORK_DIR" -c -sv_seed random -onfinish stop -voptargs=+acc -do "$SIM_SCRIPT_FILE" "$SIM_TOP_LVL_ENTITY"
	elif [ $GUI == gui ]; then
    	#vsim -work "$SIM_WORK_DIR" -sv_seed random -onfinish stop -voptargs=+acc -do "$SIM_SCRIPT_FILE" "$SIM_TOP_LVL_ENTITY"
		vsim -t ps -suppress 3009 -work "$SIM_DIR"/work "$SIM_DIR"/work."$SIM_TOP_LVL_ENTITY" -do "$SIM_SCRIPT_FILE" -voptargs=+acc 
	else
		echo "Error: $2 is a wrong parameter"; usage; exit 1;
	fi

    # return simulation code
    return $?

}

cmd_sim_post_syn() {
    source /eda/scripts/init_questa_core_prime
    echo
    echo "Compilation before simulation:"
    echo
    cmd_comp

    echo "#########################################"
    echo "####                                 ####"
    echo "##       NETLIST COMPILATION           ##"
    echo "####                                 ####"
    echo "#########################################"

    vlog -svinputport=relaxed -work "$SIM_WORK_DIR" "./netlist/riscv_top.v"

    if [ -e "./vsim.wlf" ]; then
        rm ./vsim.wlf;
    else
        echo "Warning: vsim.wlf cannot be removed, No such file";
    fi

    if ! [ -f "$SIM_SCRIPT_FILE" ]; then 
        echo "Error: Cannot find file $SIM_SCRIPT_FILE" 
        return 1 
    fi

    echo "#########################################"
    echo "####                                 ####"
    echo "##             SIMULATION              ##"
    echo "####                                 ####"
    echo "#########################################"

    # Simulate the $SIM_TOP_LVL_ENTITY entity design using sim.do tcl script
	if [ $GUI == nogui ]; then
		vsim -t ps -c -suppress 3009 -L /eda/dk/nangate45/verilog/qsim2020.4 -work "$SIM_DIR"/work "$SIM_DIR"/work."$SIM_TOP_LVL_ENTITY" -do "$SIM_SCRIPT_FILE" -voptargs=+acc 
    	#vsim -work "$SIM_WORK_DIR" -c -sv_seed random -onfinish stop -voptargs=+acc -do "$SIM_SCRIPT_FILE" "$SIM_TOP_LVL_ENTITY"
	elif [ $GUI == gui ]; then
    	#vsim -work "$SIM_WORK_DIR" -sv_seed random -onfinish stop -voptargs=+acc -do "$SIM_SCRIPT_FILE" "$SIM_TOP_LVL_ENTITY"
		vsim -t ps -suppress 3009 -L /eda/dk/nangate45/verilog/qsim2020.4 -work "$SIM_DIR"/work "$SIM_DIR"/work."$SIM_TOP_LVL_ENTITY" -do "$SIM_SCRIPT_FILE" -voptargs=+acc 
	else
		echo "Error: $2 is a wrong parameter"; usage; exit 1;
	fi

    # return simulation code
    return $?

}

# @brief synthesize designs using the ./syn.do script
# @ret $? simulation return code or error (1)
# NOTE: must be already in the syn/ folder
cmd_syn() {
    if ! [ -f "$SYN_SCRIPT_FILE" ]; then 
        echo "Error: Cannot find file $SYN_SCRIPT_FILE" 
        return 1 
    fi

    source  /eda/scripts/init_design_vision 

    # Make work directory for synthesis
    rm -rf "$SYN_WORK_DIR"
    mkdir -p "$SYN_WORK_DIR"
    rm -rf "RISCV_rep_real"
    mkdir -p "RISCV_rep_real"

    echo "#########################################"
    echo "####                                 ####"
    echo "##              SYNTHESIS              ##"
    echo "####                                 ####"
    echo "#########################################"

    #dc_shell-xg-t -F "$SYN_SCRIPT_FILE" | tee syn_dlx.log
    cp "$HDL_DIR/compile_VLOG.f" "$SYN_DIR"
    dc_shell-xg-t -F "$SYN_SCRIPT_FILE"
    #rm command.log
    #rm default.svf

    return $?
}

# @param $1 remote: are we asking to running in the remote
# @param $2 cmd: command to deploy|execute
main() {
    	if [ -n "$2" ]; then 
			GUI="$2"
		fi 
        case "$1" in 
            "cln")
                cmd_clean 
                ;;
            "init")
				cmd_init
                ;;
            "comp")
                cmd_comp
                ;;
            "sim")
                cmd_sim
                ;;
            "sim_post_syn")
                cmd_sim_post_syn
                ;;
            "syn")
                cmd_syn
                ;;
            *)
                echo "$1 is not a cmd"; usage; exit 1
                ;;
        esac
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
if [ -n "$1" ] && [ "$1" = "push" ] ; then  cmd_push "$2"; fi 

################################################################################
# SHELL
################################################################################
if [ -n "$1" ] && [ "$1" = "shell" ] ; then cmd_shell; fi  

################################################################################
# MAIN COMMANDS
################################################################################
if [ -n "$1" ]; then main "$1" "$2"; fi 




