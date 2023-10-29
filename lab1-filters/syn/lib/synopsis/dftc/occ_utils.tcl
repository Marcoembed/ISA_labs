
#!/usr/local/bin/tclsh

################################################################
# adds prefix and suffix to module base name
################################################################
proc get_design_name { base_name } {
    global module_prefix
    global module_suffix
    return "${module_prefix}_${base_name}_${module_suffix}"
}


##########################################################################
# returns port signal declaration depending to hdl language and signal size
##########################################################################
proc get_port { hdl name sense size last } {
    set end_c ";"
    if { $last } { set end_c "" }
    if {![string compare $hdl "verilog"] } { 
	if { $size > 1 } {
	    puts "${sense}put \[[expr $size - 1]:0\] $name ${end_c}"
	} else {
	    puts "${sense}put $name ${end_c}"
	}
    } else {
	if { $size > 1 } {
	    puts "          $name : $sense std_logic_vector([expr $size - 1] downto 0)${end_c}"
	} else {
	    puts "          $name : $sense std_logic${end_c}"
	}
    }
}
