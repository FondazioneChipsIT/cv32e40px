module cv32e40px_top_wrap ();

    localparam COREV_X_IF       = 1;
    localparam COREV_PULP       = 0;
    localparam COREV_CLUSTER    = 0;
    localparam FPU              = 1;
    localparam FPU_ADDMUL_LAT   = 0;
    localparam FPU_OTHERS_LAT   = 0;
    localparam ZFINX            = 0;
    localparam NUM_MHPMCOUNTERS = 1;

    import cv32e40px_core_v_xif_pkg::*;
    import cv32e40px_pkg::*;
    logic  clk_i;
    logic  rst_ni;
    logic  pulp_clock_en_i;
    logic  scan_cg_en_i;
    logic [31:0] boot_addr_i;
    logic [31:0] mtvec_addr_i;
    logic [31:0] dm_halt_addr_i;
    logic [31:0] hart_id_i;
    logic [31:0] dm_exception_addr_i;
    logic  instr_req_o;
    logic  instr_gnt_i;
    logic  instr_rvalid_i;
    logic [31:0] instr_addr_o;
    logic [31:0] instr_rdata_i;
    logic  data_req_o;
    logic  data_gnt_i;
    logic  data_rvalid_i;
    logic  data_we_o;
    logic [3:0] data_be_o;
    logic [31:0] data_addr_o;
    logic [31:0] data_wdata_o;
    logic [31:0] data_rdata_i;
    logic  x_compressed_valid;
    logic  x_compressed_ready;
    x_compressed_req_t  x_compressed_req;
    x_compressed_resp_t  x_compressed_resp;
    logic  x_issue_valid_o;
    logic  x_issue_ready_i;
    x_issue_req_t  x_issue_req_o;
    x_issue_resp_t  x_issue_resp_i;
    logic  x_commit_valid_o;
    x_commit_t  x_commit_o;
    logic  x_mem_valid_i;
    logic  x_mem_ready_o;
    x_mem_req_t  x_mem_req_i;
    x_mem_resp_t  x_mem_resp_o;
    logic  x_mem_result_valid_o;
    x_mem_result_t  x_mem_result_o;
    logic  x_result_valid_i;
    logic  x_result_ready_o;
    x_result_t  x_result_i;
    logic [31:0] irq_i;
    logic  irq_ack_o;
    logic [4:0] irq_id_o;
    logic  debug_req_i;
    logic  debug_havereset_o;
    logic  debug_running_o;
    logic  debug_halted_o;
    logic  fetch_enable_i;
    logic  core_sleep_o;

    assign hart_id_i = '0;
    assign boot_addr_i = 32'h80;
    assign dm_halt_addr_i = '0;
    assign dm_exception_addr_i = 32'h8000;
    assign mtvec_addr_i = 32'h8000;

    assign fetch_enable_i = 1'b1;
    assign pulp_clock_en_i = 1'b1;
    assign scan_cg_en_i = '0;
    assign debug_req_i = '0;
    assign irq_i = '0;

    assign instr_gnt_i = 1'b1;
    assume property (@(posedge clk_i) disable iff (!rst_ni) instr_req_o |=>  instr_rvalid_i);

    cv32e40px_top
    #(
        .COREV_X_IF       (COREV_X_IF),
        .COREV_PULP       (COREV_PULP),
        .COREV_CLUSTER    (COREV_CLUSTER),
        .FPU              (FPU),
        .FPU_ADDMUL_LAT   (FPU_ADDMUL_LAT),
        .FPU_OTHERS_LAT   (FPU_OTHERS_LAT),
        .ZFINX            (ZFINX),
        .NUM_MHPMCOUNTERS (NUM_MHPMCOUNTERS)
    )
    cv32e40px_top_inst
    (
        .clk_i                (clk_i),
        .rst_ni               (rst_ni),
        .pulp_clock_en_i      (pulp_clock_en_i),
        .scan_cg_en_i         (scan_cg_en_i),
        .boot_addr_i          (boot_addr_i),
        .mtvec_addr_i         (mtvec_addr_i),
        .dm_halt_addr_i       (dm_halt_addr_i),
        .hart_id_i            (hart_id_i),
        .dm_exception_addr_i  (dm_exception_addr_i),
        .instr_req_o          (instr_req_o),
        .instr_gnt_i          (instr_gnt_i),
        .instr_rvalid_i       (instr_rvalid_i),
        .instr_addr_o         (instr_addr_o),
        .instr_rdata_i        (instr_rdata_i),
        .data_req_o           (data_req_o),
        .data_gnt_i           (data_gnt_i),
        .data_rvalid_i        (data_rvalid_i),
        .data_we_o            (data_we_o),
        .data_be_o            (data_be_o),
        .data_addr_o          (data_addr_o),
        .data_wdata_o         (data_wdata_o),
        .data_rdata_i         (data_rdata_i),
        .x_compressed_valid_o (x_compressed_valid),
        .x_compressed_ready_i (x_compressed_ready),
        .x_compressed_req_o   (x_compressed_req),
        .x_compressed_resp_i  (x_compressed_resp),
        .x_issue_valid_o      (x_issue_valid_o),
        .x_issue_ready_i      (x_issue_ready_i),
        .x_issue_req_o        (x_issue_req_o),
        .x_issue_resp_i       (x_issue_resp_i),
        .x_commit_valid_o     (x_commit_valid_o),
        .x_commit_o           (x_commit_o),
        .x_mem_valid_i        (x_mem_valid_i),
        .x_mem_ready_o        (x_mem_ready_o),
        .x_mem_req_i          (x_mem_req_i),
        .x_mem_resp_o         (x_mem_resp_o),
        .x_mem_result_valid_o (x_mem_result_valid_o),
        .x_mem_result_o       (x_mem_result_o),
        .x_result_valid_i     (x_result_valid_i),
        .x_result_ready_o     (x_result_ready_o),
        .x_result_i           (x_result_i),
        .irq_i                (irq_i),
        .irq_ack_o            (irq_ack_o),
        .irq_id_o             (irq_id_o),
        .debug_req_i          (debug_req_i),
        .debug_havereset_o    (debug_havereset_o),
        .debug_running_o      (debug_running_o),
        .debug_halted_o       (debug_halted_o),
        .fetch_enable_i       (fetch_enable_i),
        .core_sleep_o         (core_sleep_o)
    );

    generate
    if (COREV_X_IF) begin: cf_decoder_gen  
        cf_decoder i_cf_decoder
        (
            //.clk_i,
            //.rst_ni,
            .x_compressed_valid_i (x_compressed_valid),
            .x_compressed_req_i   (x_compressed_req),
            .x_compressed_ready_o (x_compressed_ready),
            .x_compressed_resp_o  (x_compressed_resp)
        );

        //bind cv32e40px_top riscv_decoder riscv_decode_XIF (.instruction(cv32e40px_top_inst.x_issue_req_o.instr));
        vector_pkg::riscv_v_instr_e vec_instruction;
        bind  cv32e40px_top_wrap vector_decoder rv_v_decode_XIF (.instruction(x_issue_req_o.instr), .rv_instruction(vec_instruction));

        assign x_issue_resp_i.dualwrite = '0;
        assign x_issue_resp_i.dualread = '0;
        assign x_issue_resp_i.ecswrite = '0;
        assign x_issue_resp_i.exc = '0;
        assign x_issue_ready_i = 1'b1;
        
        always_comb begin 
            if (x_issue_valid_o) begin
                x_issue_resp_i.accept = vec_instruction != vector_pkg::RV_UNKNOWN;

                case(vec_instruction)
                vector_pkg::RV_VRGATHER_VI,
                vector_pkg::RV_VRGATHER_VV,
                vector_pkg::RV_VRGATHER_VX,
                vector_pkg::RV_VRGATHEREI16_VV,
                vector_pkg::RV_VLSE16_V,
                vector_pkg::RV_VLSE32_V,
                vector_pkg::RV_VLSE64_V,
                vector_pkg::RV_VLSE8_V,
                vector_pkg::RV_VLE16_V,
                vector_pkg::RV_VLE16FF_V,
                vector_pkg::RV_VLE32_V,
                vector_pkg::RV_VLE32FF_V,
                vector_pkg::RV_VLE64_V,
                vector_pkg::RV_VLE64FF_V,
                vector_pkg::RV_VLE8_V,
                vector_pkg::RV_VLE8FF_V,
                vector_pkg::RV_VSE16_V,
                vector_pkg::RV_VSE32_V,
                vector_pkg::RV_VSE64_V,
                vector_pkg::RV_VSE8_V,
                vector_pkg::RV_VSETIVLI,
                vector_pkg::RV_VSETVL,
                vector_pkg::RV_VSETVLI,
                vector_pkg::RV_VSEXT_VF2,
                vector_pkg::RV_VSEXT_VF4,
                vector_pkg::RV_VSEXT_VF8,
                vector_pkg::RV_VLM_V,
                vector_pkg::RV_VSM_V:   x_issue_resp_i.loadstore = 1'b1;
                default:                x_issue_resp_i.loadstore = 1'b0;
                endcase
            end else begin
                x_issue_resp_i.accept = 1'b0;
                x_issue_resp_i.loadstore = 1'b0;
            end
        end
        
    end else begin
        assign x_compressed_ready = '0;
        assign x_compressed_resp  = '0;

        assign x_issue_ready_i = '0;
        assign x_issue_resp_i = '0;
    end
    endgenerate

    assign x_mem_req_i = '0;
    assign x_mem_valid_i = '0;

    logic [7:0] inst_count_d;
    logic [7:0] inst_count_q;
    
    assign inst_count_d = cv32e40px_top_inst.core_i.id_stage_i.minstret ? (inst_count_q + 1) : inst_count_q; 
    always_ff @(posedge clk_i or negedge rst_ni) begin : inst_count
        if (!rst_ni) begin
            inst_count_q <= '0;
        end else begin 
            inst_count_q <= inst_count_d;
        end
    end

    logic ret_valid;
    assign ret_valid = cv32e40px_top_inst.core_i.id_stage_i.minstret;
    
    logic is_jal, is_jalr, is_br, is_jump;
    assign is_jal  = (cv32e40px_top_inst.core_i.id_stage_i.ctrl_transfer_insn_in_id == BRANCH_JAL);
    assign is_jalr = (cv32e40px_top_inst.core_i.id_stage_i.ctrl_transfer_insn_in_id == BRANCH_JALR);
    assign is_br   = (cv32e40px_top_inst.core_i.id_stage_i.ctrl_transfer_insn_in_id == BRANCH_COND);
    assign is_jump = (is_jal || is_jalr || is_br);

    logic is_pc_plus_4;
    assign is_pc_plus_4 = ret_valid && !is_jump && !cv32e40px_top_inst.core_i.id_stage_i.is_compressed_i;

    logic [31:0] ret_pc_d;
    logic [31:0] ret_pc_q;

    assign ret_pc_d = ret_valid ? cv32e40px_top_inst.core_i.pc_id : ret_pc_q;  

    always_ff @(posedge clk_i or negedge rst_ni) begin : ret_ff
       if (!rst_ni) begin 
           ret_pc_q <= boot_addr_i; 
       end else begin     
           ret_pc_q <= ret_pc_d;
       end
    end

    a_pc_plus_4:
    assert property (@(posedge clk_i) disable iff (!rst_ni) 
        (inst_count_q > 8'd1) && ret_valid && $past(is_pc_plus_4) |-> 
            cv32e40px_top_inst.core_i.pc_id == (ret_pc_q + 32'd4)); 

    bind cv32e40px_top riscv_decoder riscv_decode_IF (.instruction(cv32e40px_top_inst.core_i.if_stage_i.fetch_rdata));
    bind cv32e40px_top riscv_decoder riscv_decode_ID (.instruction(cv32e40px_top_inst.core_i.id_stage_i.instr));

endmodule
