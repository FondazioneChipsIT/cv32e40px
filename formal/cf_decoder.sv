module cf_decoder 
    import cv32e40px_core_v_xif_pkg::*;
(
    input logic x_compressed_valid_i,
    input x_compressed_req_t x_compressed_req_i,
    output logic x_compressed_ready_o,
    output x_compressed_resp_t x_compressed_resp_o
);

    localparam logic [15:0] C_FLW    = 16'b011???????????00;
    localparam logic [15:0] C_FLWSP  = 16'b011???????????10;
    localparam logic [15:0] C_FSW    = 16'b111???????????00;
    localparam logic [15:0] C_FSWSP  = 16'b111???????????10;

    localparam logic [6:0] OP_FL = 7'b0000111;
    localparam logic [6:0] OP_FS = 7'b0100111;

    localparam logic [2:0] WORD = 3'b010;

    localparam logic [4:0] X2 = 5'd2;

    // case(rp)
    // 3'b000: return 5'd8;
    // 3'b001: return 5'd9;
    // 3'b010: return 5'd10;
    // 3'b011: return 5'd11;
    // 3'b100: return 5'd12;
    // 3'b101: return 5'd13;
    // 3'b110: return 5'd14;
    // 3'b111: return 5'd15;
    // endcase
    //function logic [4:0] rvc_register_number (logic [2:0] rp);
    //    return {2'b01, rp};
    //endfunction

    logic [15:0] cinst;
    assign cinst = x_compressed_req_i.instr;  

    logic [4:0] rd;
    assign rd = cinst[11:7];

    logic [4:0] rs2;
    assign rs2 = cinst[6:2];

    logic [4:0] rd_p;
    logic [4:0] rs1_p;
    logic [4:0] rs2_p;

    assign rd_p  = {2'b01, cinst[4:2]};
    assign rs2_p = rd_p; 
    assign rs1_p = {2'b01, cinst[9:7]};

    logic [4:0] offset_clw;
    assign offset_clw = {cinst[5], cinst[12:10], cinst[6]};

    // imm for CI format used by C_FLWSP, C_FLDSP
    logic [4:0] offset_ci;
    assign offset_ci = { cinst[3:2], cinst[12], cinst[6:4] };

    logic [4:0] offset_css;
    assign offset_css = { cinst[8:7], cinst[12:9] }; 

    logic vld;
    assign vld = x_compressed_valid_i;

    logic accept;
    logic [31:0] instr;

    always_comb begin
        casez(cinst)
        C_FLW   : {instr, accept} = {{5'b0, offset_clw, 2'b00, rs1_p, WORD, rd_p, OP_FL}, vld};
        C_FSW   : {instr, accept} = {{5'b0, cinst[5], cinst[12], rs2_p, rs1_p, WORD, cinst[11:10], cinst[6], 2'b00, OP_FS}, vld};
        C_FLWSP : {instr, accept} = {{4'b0, offset_ci, 2'b0, X2, WORD, rd, OP_FL}, vld};
        C_FSWSP : {instr, accept} = {{4'b0, offset_css[4:2], rs2,  X2,   WORD, offset_css[1:0], 2'b0, OP_FS}, vld};
        default : {instr, accept} = {32'b0, 1'b0};
        endcase
    end
    
    //always_ff @(posedge clk_i or negedge rst_ni) begin
    //   if (!rst_ni) begin 
    //       x_compressed_resp_o <= '0;
    //   end else begin     
    //       x_compressed_resp_o.instr <= instr;
    //       x_compressed_resp_o.accept <= accept;
    //   end
    //end

    assign x_compressed_ready_o = 1'b1;
    assign x_compressed_ready_o = 1'b1;
    assign x_compressed_resp_o.instr = instr;
    assign x_compressed_resp_o.accept = accept;
endmodule
