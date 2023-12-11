source /eda/scripts/init_design_vision
dc_shell-xg-t -f syn_basic.tcl          #> ../logs/syn_basic.log 
dc_shell-xg-t -f syn_compile_ultra.tcl  #> ../logs/syn_compile_ultra.log 
dc_shell-xg-t -f syn_flatten_csa.tcl    #> ../logs/syn_flatten_csa.log 
dc_shell-xg-t -f syn_flatten_pparch.tcl #> ../logs/syn_flatten_pparch.log 
dc_shell-xg-t -f syn_opt_reg.tcl        #> ../logs/syn_opt_reg.log 
