module cv32e40px_top_wrap ();

    localparam COREV_X_IF       = 0;
    localparam COREV_PULP       = 0;
    localparam COREV_CLUSTER    = 0;
    localparam FPU              = 0;
    localparam FPU_ADDMUL_LAT   = 0;
    localparam FPU_OTHERS_LAT   = 0;
    localparam ZFINX            = 0;
    localparam NUM_MHPMCOUNTERS = 1;

    import cv32e40px_core_v_xif_pkg::*;
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
    logic  x_compressed_valid_o;
    logic  x_compressed_ready_i;
    x_compressed_req_t  x_compressed_req_o;
    x_compressed_resp_t  x_compressed_resp_i;
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
        .x_compressed_valid_o (x_compressed_valid_o),
        .x_compressed_ready_i (x_compressed_ready_i),
        .x_compressed_req_o   (x_compressed_req_o),
        .x_compressed_resp_i  (x_compressed_resp_i),
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


    logic [7:0] inst_count_d;
    logic [7:0] inst_count_q;
    
    assign inst_count_d = cv32e40px_top_inst.core_i.mhpmevent_minstret ? (inst_count_q + 1) : inst_count_q; 
    always_ff @(posedge clk_i or negedge rst_ni) begin : inst_count
        if (!rst_ni) begin
            inst_count_q <= '0;
        end else begin 
            inst_count_q <= inst_count_d;
        end
    end

endmodule
