clear -all
analyze -sv17 -f flist
elaborate -top cv32e40px_top_wrap

clock clk_i
reset -expression ~rst_ni

cover -name run30 { ##30 1'b1 }
