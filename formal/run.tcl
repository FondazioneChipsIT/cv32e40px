clear -all
analyze -sv17 -f flist
elaborate -top cv32e40px_top_wrap

clock clk_i
reset -expression ~rst_ni

cover -name run30 { ##30 1'b1 }
cover -name run_10_inst { inst_count_q == 8'd10 ##1 1'b1 }

