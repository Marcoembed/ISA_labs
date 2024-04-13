quietly regexp {20[1-3][0-9]\.[0-9]{1,2}} [vsim -version] ver
quietly if {$ver > 2020} { set src_opt "-srcfile=*" } else { set src_opt "-byfile" }
coverage report -output func_cover.txt $src_opt -details -all -directive -cvg