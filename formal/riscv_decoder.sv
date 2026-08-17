/* SPDX-License-Identifier: BSD-3-Clause */
module riscv_decoder
    import riscv_pkg::*;
(
    input logic [31:0] instruction,
    output logic is_ADD,
    output logic is_ADDI,
    output logic is_AMOADD_W,
    output logic is_AMOAND_W,
    output logic is_AMOMAX_W,
    output logic is_AMOMAXU_W,
    output logic is_AMOMIN_W,
    output logic is_AMOMINU_W,
    output logic is_AMOOR_W,
    output logic is_AMOSWAP_W,
    output logic is_AMOXOR_W,
    output logic is_AND,
    output logic is_ANDI,
    output logic is_AUIPC,
    output logic is_BEQ,
    output logic is_BGE,
    output logic is_BGEU,
    output logic is_BLT,
    output logic is_BLTU,
    output logic is_BNE,
    output logic is_C_ADD,
    output logic is_C_ADDI,
    output logic is_C_ADDI16SP,
    output logic is_C_ADDI4SPN,
    output logic is_C_AND,
    output logic is_C_ANDI,
    output logic is_C_BEQZ,
    output logic is_C_BNEZ,
    output logic is_C_EBREAK,
    output logic is_C_FLW,
    output logic is_C_FLWSP,
    output logic is_C_FSW,
    output logic is_C_FSWSP,
    output logic is_C_J,
    output logic is_C_JAL,
    output logic is_C_JALR,
    output logic is_C_JR,
    output logic is_C_LI,
    output logic is_C_LUI,
    output logic is_C_LW,
    output logic is_C_LWSP,
    output logic is_C_MV,
    output logic is_C_NOP,
    output logic is_C_OR,
    output logic is_C_SLLI,
    output logic is_C_SRAI,
    output logic is_C_SRLI,
    output logic is_C_SUB,
    output logic is_C_SW,
    output logic is_C_SWSP,
    output logic is_C_XOR,
    output logic is_CSRRC,
    output logic is_CSRRCI,
    output logic is_CSRRS,
    output logic is_CSRRSI,
    output logic is_CSRRW,
    output logic is_CSRRWI,
    output logic is_CV_ABS,
    output logic is_CV_ABS_B,
    output logic is_CV_ABS_H,
    output logic is_CV_ADDN,
    output logic is_CV_ADDNR,
    output logic is_CV_ADDRN,
    output logic is_CV_ADDRNR,
    output logic is_CV_ADD_B,
    output logic is_CV_ADD_DIV2,
    output logic is_CV_ADD_DIV4,
    output logic is_CV_ADD_DIV8,
    output logic is_CV_ADD_H,
    output logic is_CV_ADD_SC_B,
    output logic is_CV_ADD_SC_H,
    output logic is_CV_ADD_SCI_B,
    output logic is_CV_ADD_SCI_H,
    output logic is_CV_ADDUN,
    output logic is_CV_ADDUNR,
    output logic is_CV_ADDURN,
    output logic is_CV_ADDURNR,
    output logic is_CV_AND_B,
    output logic is_CV_AND_H,
    output logic is_CV_AND_SC_B,
    output logic is_CV_AND_SC_H,
    output logic is_CV_AND_SCI_B,
    output logic is_CV_AND_SCI_H,
    output logic is_CV_AVG_B,
    output logic is_CV_AVG_H,
    output logic is_CV_AVG_SC_B,
    output logic is_CV_AVG_SC_H,
    output logic is_CV_AVG_SCI_B,
    output logic is_CV_AVG_SCI_H,
    output logic is_CV_AVGU_B,
    output logic is_CV_AVGU_H,
    output logic is_CV_AVGU_SC_B,
    output logic is_CV_AVGU_SC_H,
    output logic is_CV_AVGU_SCI_B,
    output logic is_CV_AVGU_SCI_H,
    output logic is_CV_BCLR,
    output logic is_CV_BCLRR,
    output logic is_CV_BEQIMM,
    output logic is_CV_BITREV,
    output logic is_CV_BNEIMM,
    output logic is_CV_BSET,
    output logic is_CV_BSETR,
    output logic is_CV_CLB,
    output logic is_CV_CLIP,
    output logic is_CV_CLIPR,
    output logic is_CV_CLIPU,
    output logic is_CV_CLIPUR,
    output logic is_CV_CMPEQ_B,
    output logic is_CV_CMPEQ_H,
    output logic is_CV_CMPEQ_SC_B,
    output logic is_CV_CMPEQ_SC_H,
    output logic is_CV_CMPEQ_SCI_B,
    output logic is_CV_CMPEQ_SCI_H,
    output logic is_CV_CMPGE_B,
    output logic is_CV_CMPGE_H,
    output logic is_CV_CMPGE_SC_B,
    output logic is_CV_CMPGE_SC_H,
    output logic is_CV_CMPGE_SCI_B,
    output logic is_CV_CMPGE_SCI_H,
    output logic is_CV_CMPGEU_B,
    output logic is_CV_CMPGEU_H,
    output logic is_CV_CMPGEU_SC_B,
    output logic is_CV_CMPGEU_SC_H,
    output logic is_CV_CMPGEU_SCI_B,
    output logic is_CV_CMPGEU_SCI_H,
    output logic is_CV_CMPGT_B,
    output logic is_CV_CMPGT_H,
    output logic is_CV_CMPGT_SC_B,
    output logic is_CV_CMPGT_SC_H,
    output logic is_CV_CMPGT_SCI_B,
    output logic is_CV_CMPGT_SCI_H,
    output logic is_CV_CMPGTU_B,
    output logic is_CV_CMPGTU_H,
    output logic is_CV_CMPGTU_SC_B,
    output logic is_CV_CMPGTU_SC_H,
    output logic is_CV_CMPGTU_SCI_B,
    output logic is_CV_CMPGTU_SCI_H,
    output logic is_CV_CMPLE_B,
    output logic is_CV_CMPLE_H,
    output logic is_CV_CMPLE_SC_B,
    output logic is_CV_CMPLE_SC_H,
    output logic is_CV_CMPLE_SCI_B,
    output logic is_CV_CMPLE_SCI_H,
    output logic is_CV_CMPLEU_B,
    output logic is_CV_CMPLEU_H,
    output logic is_CV_CMPLEU_SC_B,
    output logic is_CV_CMPLEU_SC_H,
    output logic is_CV_CMPLEU_SCI_B,
    output logic is_CV_CMPLEU_SCI_H,
    output logic is_CV_CMPLT_B,
    output logic is_CV_CMPLT_H,
    output logic is_CV_CMPLT_SC_B,
    output logic is_CV_CMPLT_SC_H,
    output logic is_CV_CMPLT_SCI_B,
    output logic is_CV_CMPLT_SCI_H,
    output logic is_CV_CMPLTU_B,
    output logic is_CV_CMPLTU_H,
    output logic is_CV_CMPLTU_SC_B,
    output logic is_CV_CMPLTU_SC_H,
    output logic is_CV_CMPLTU_SCI_B,
    output logic is_CV_CMPLTU_SCI_H,
    output logic is_CV_CMPNE_B,
    output logic is_CV_CMPNE_H,
    output logic is_CV_CMPNE_SC_B,
    output logic is_CV_CMPNE_SC_H,
    output logic is_CV_CMPNE_SCI_B,
    output logic is_CV_CMPNE_SCI_H,
    output logic is_CV_CNT,
    output logic is_CV_COUNT,
    output logic is_CV_COUNTI,
    output logic is_CV_CPLXCONJ,
    output logic is_CV_CPLXMUL_I,
    output logic is_CV_CPLXMUL_I_DIV2,
    output logic is_CV_CPLXMUL_I_DIV4,
    output logic is_CV_CPLXMUL_I_DIV8,
    output logic is_CV_CPLXMUL_R,
    output logic is_CV_CPLXMUL_R_DIV2,
    output logic is_CV_CPLXMUL_R_DIV4,
    output logic is_CV_CPLXMUL_R_DIV8,
    output logic is_CV_DOTSP_B,
    output logic is_CV_DOTSP_H,
    output logic is_CV_DOTSP_SC_B,
    output logic is_CV_DOTSP_SC_H,
    output logic is_CV_DOTSP_SCI_B,
    output logic is_CV_DOTSP_SCI_H,
    output logic is_CV_DOTUP_B,
    output logic is_CV_DOTUP_H,
    output logic is_CV_DOTUP_SC_B,
    output logic is_CV_DOTUP_SC_H,
    output logic is_CV_DOTUP_SCI_B,
    output logic is_CV_DOTUP_SCI_H,
    output logic is_CV_DOTUSP_B,
    output logic is_CV_DOTUSP_H,
    output logic is_CV_DOTUSP_SC_B,
    output logic is_CV_DOTUSP_SC_H,
    output logic is_CV_DOTUSP_SCI_B,
    output logic is_CV_DOTUSP_SCI_H,
    output logic is_CV_END,
    output logic is_CV_ENDI,
    output logic is_CV_EXTBS,
    output logic is_CV_EXTBZ,
    output logic is_CV_EXTHS,
    output logic is_CV_EXTHZ,
    output logic is_CV_EXTRACT,
    output logic is_CV_EXTRACT_B,
    output logic is_CV_EXTRACT_H,
    output logic is_CV_EXTRACTR,
    output logic is_CV_EXTRACTU,
    output logic is_CV_EXTRACTU_B,
    output logic is_CV_EXTRACTU_H,
    output logic is_CV_EXTRACTUR,
    output logic is_CV_FF1,
    output logic is_CV_FL1,
    output logic is_CV_INSERT,
    output logic is_CV_INSERT_B,
    output logic is_CV_INSERT_H,
    output logic is_CV_INSERTR,
    output logic is_CV_LB,
    output logic is_CV_LBU,
    output logic is_CV_LH,
    output logic is_CV_LHU,
    output logic is_CV_LW,
    output logic is_CV_MAC,
    output logic is_CV_MACHHSN,
    output logic is_CV_MACHHSRN,
    output logic is_CV_MACHHUN,
    output logic is_CV_MACHHURN,
    output logic is_CV_MACSN,
    output logic is_CV_MACSRN,
    output logic is_CV_MACUN,
    output logic is_CV_MACURN,
    output logic is_CV_MAX,
    output logic is_CV_MAX_B,
    output logic is_CV_MAX_H,
    output logic is_CV_MAX_SC_B,
    output logic is_CV_MAX_SC_H,
    output logic is_CV_MAX_SCI_B,
    output logic is_CV_MAX_SCI_H,
    output logic is_CV_MAXU,
    output logic is_CV_MAXU_B,
    output logic is_CV_MAXU_H,
    output logic is_CV_MAXU_SC_B,
    output logic is_CV_MAXU_SC_H,
    output logic is_CV_MAXU_SCI_B,
    output logic is_CV_MAXU_SCI_H,
    output logic is_CV_MIN,
    output logic is_CV_MIN_B,
    output logic is_CV_MIN_H,
    output logic is_CV_MIN_SC_B,
    output logic is_CV_MIN_SC_H,
    output logic is_CV_MIN_SCI_B,
    output logic is_CV_MIN_SCI_H,
    output logic is_CV_MINU,
    output logic is_CV_MINU_B,
    output logic is_CV_MINU_H,
    output logic is_CV_MINU_SC_B,
    output logic is_CV_MINU_SC_H,
    output logic is_CV_MINU_SCI_B,
    output logic is_CV_MINU_SCI_H,
    output logic is_CV_MSU,
    output logic is_CV_MULHHSN,
    output logic is_CV_MULHHSRN,
    output logic is_CV_MULHHUN,
    output logic is_CV_MULHHURN,
    output logic is_CV_MULSN,
    output logic is_CV_MULSRN,
    output logic is_CV_MULUN,
    output logic is_CV_MULURN,
    output logic is_CV_OR_B,
    output logic is_CV_OR_H,
    output logic is_CV_OR_SC_B,
    output logic is_CV_OR_SC_H,
    output logic is_CV_OR_SCI_B,
    output logic is_CV_OR_SCI_H,
    output logic is_CV_PACK,
    output logic is_CV_PACK_H,
    output logic is_CV_PACKHI_B,
    output logic is_CV_PACKLO_B,
    output logic is_CV_PI_LB,
    output logic is_CV_PI_LBI,
    output logic is_CV_PI_LBU,
    output logic is_CV_PI_LBUI,
    output logic is_CV_PI_LH,
    output logic is_CV_PI_LHI,
    output logic is_CV_PI_LHU,
    output logic is_CV_PI_LHUI,
    output logic is_CV_PI_LW,
    output logic is_CV_PI_LWI,
    output logic is_CV_PI_SB,
    output logic is_CV_PI_SBI,
    output logic is_CV_PI_SH,
    output logic is_CV_PI_SHI,
    output logic is_CV_PI_SW,
    output logic is_CV_PI_SWI,
    output logic is_CV_ROR,
    output logic is_CV_SB,
    output logic is_CV_SDOTSP_B,
    output logic is_CV_SDOTSP_H,
    output logic is_CV_SDOTSP_SC_B,
    output logic is_CV_SDOTSP_SC_H,
    output logic is_CV_SDOTSP_SCI_B,
    output logic is_CV_SDOTSP_SCI_H,
    output logic is_CV_SDOTUP_B,
    output logic is_CV_SDOTUP_H,
    output logic is_CV_SDOTUP_SC_B,
    output logic is_CV_SDOTUP_SC_H,
    output logic is_CV_SDOTUP_SCI_B,
    output logic is_CV_SDOTUP_SCI_H,
    output logic is_CV_SDOTUSP_B,
    output logic is_CV_SDOTUSP_H,
    output logic is_CV_SDOTUSP_SC_B,
    output logic is_CV_SDOTUSP_SC_H,
    output logic is_CV_SDOTUSP_SCI_B,
    output logic is_CV_SDOTUSP_SCI_H,
    output logic is_CV_SETUP,
    output logic is_CV_SETUPI,
    output logic is_CV_SH,
    output logic is_CV_SHUFFLE2_B,
    output logic is_CV_SHUFFLE2_H,
    output logic is_CV_SHUFFLEI0_SCI_B,
    output logic is_CV_SHUFFLEI1_SCI_B,
    output logic is_CV_SHUFFLEI2_SCI_B,
    output logic is_CV_SHUFFLEI3_SCI_B,
    output logic is_CV_SHUFFLE_B,
    output logic is_CV_SHUFFLE_H,
    output logic is_CV_SHUFFLE_SCI_H,
    output logic is_CV_SLE,
    output logic is_CV_SLEU,
    output logic is_CV_SLL_B,
    output logic is_CV_SLL_H,
    output logic is_CV_SLL_SC_B,
    output logic is_CV_SLL_SC_H,
    output logic is_CV_SLL_SCI_B,
    output logic is_CV_SLL_SCI_H,
    output logic is_CV_SRA_B,
    output logic is_CV_SRA_H,
    output logic is_CV_SRA_SC_B,
    output logic is_CV_SRA_SC_H,
    output logic is_CV_SRA_SCI_B,
    output logic is_CV_SRA_SCI_H,
    output logic is_CV_SRL_B,
    output logic is_CV_SRL_H,
    output logic is_CV_SRL_SC_B,
    output logic is_CV_SRL_SC_H,
    output logic is_CV_SRL_SCI_B,
    output logic is_CV_SRL_SCI_H,
    output logic is_CV_START,
    output logic is_CV_STARTI,
    output logic is_CV_SUBN,
    output logic is_CV_SUBNR,
    output logic is_CV_SUBRN,
    output logic is_CV_SUBRNR,
    output logic is_CV_SUB_B,
    output logic is_CV_SUB_DIV2,
    output logic is_CV_SUB_DIV4,
    output logic is_CV_SUB_DIV8,
    output logic is_CV_SUB_H,
    output logic is_CV_SUB_SC_B,
    output logic is_CV_SUB_SC_H,
    output logic is_CV_SUB_SCI_B,
    output logic is_CV_SUB_SCI_H,
    output logic is_CV_SUBROTMJ,
    output logic is_CV_SUBROTMJ_DIV2,
    output logic is_CV_SUBROTMJ_DIV4,
    output logic is_CV_SUBROTMJ_DIV8,
    output logic is_CV_SUBUN,
    output logic is_CV_SUBUNR,
    output logic is_CV_SUBURN,
    output logic is_CV_SUBURNR,
    output logic is_CV_SW,
    output logic is_CV_XOR_B,
    output logic is_CV_XOR_H,
    output logic is_CV_XOR_SC_B,
    output logic is_CV_XOR_SC_H,
    output logic is_CV_XOR_SCI_B,
    output logic is_CV_XOR_SCI_H,
    output logic is_DIV,
    output logic is_DIVU,
    output logic is_EBREAK,
    output logic is_ECALL,
    output logic is_FADD_S,
    output logic is_FCLASS_S,
    output logic is_FCVT_S_W,
    output logic is_FCVT_S_WU,
    output logic is_FCVT_W_S,
    output logic is_FCVT_WU_S,
    output logic is_FDIV_S,
    output logic is_FENCE,
    output logic is_FEQ_S,
    output logic is_FLE_S,
    output logic is_FLT_S,
    output logic is_FLW,
    output logic is_FMADD_S,
    output logic is_FMAX_S,
    output logic is_FMIN_S,
    output logic is_FMSUB_S,
    output logic is_FMUL_S,
    output logic is_FMV_W_X,
    output logic is_FMV_X_W,
    output logic is_FNMADD_S,
    output logic is_FNMSUB_S,
    output logic is_FSGNJ_S,
    output logic is_FSGNJN_S,
    output logic is_FSGNJX_S,
    output logic is_FSQRT_S,
    output logic is_FSUB_S,
    output logic is_FSW,
    output logic is_JAL,
    output logic is_JALR,
    output logic is_LB,
    output logic is_LBU,
    output logic is_LH,
    output logic is_LHU,
    output logic is_LR_W,
    output logic is_LUI,
    output logic is_LW,
    output logic is_MUL,
    output logic is_MULH,
    output logic is_MULHSU,
    output logic is_MULHU,
    output logic is_OR,
    output logic is_ORI,
    output logic is_REM,
    output logic is_REMU,
    output logic is_SB,
    output logic is_SC_W,
    output logic is_SH,
    output logic is_SLL,
    output logic is_SLLI,
    output logic is_SLT,
    output logic is_SLTI,
    output logic is_SLTIU,
    output logic is_SLTU,
    output logic is_SRA,
    output logic is_SRAI,
    output logic is_SRL,
    output logic is_SRLI,
    output logic is_SUB,
    output logic is_SW,
    output logic is_XOR,
    output logic is_XORI,
    output riscv_instr_e rv_instruction
);

    /* is_X instruction flags  */
    assign is_ADD                = instruction ==? ADD;
    assign is_ADDI               = instruction ==? ADDI;
    assign is_AMOADD_W           = instruction ==? AMOADD_W;
    assign is_AMOAND_W           = instruction ==? AMOAND_W;
    assign is_AMOMAX_W           = instruction ==? AMOMAX_W;
    assign is_AMOMAXU_W          = instruction ==? AMOMAXU_W;
    assign is_AMOMIN_W           = instruction ==? AMOMIN_W;
    assign is_AMOMINU_W          = instruction ==? AMOMINU_W;
    assign is_AMOOR_W            = instruction ==? AMOOR_W;
    assign is_AMOSWAP_W          = instruction ==? AMOSWAP_W;
    assign is_AMOXOR_W           = instruction ==? AMOXOR_W;
    assign is_AND                = instruction ==? AND;
    assign is_ANDI               = instruction ==? ANDI;
    assign is_AUIPC              = instruction ==? AUIPC;
    assign is_BEQ                = instruction ==? BEQ;
    assign is_BGE                = instruction ==? BGE;
    assign is_BGEU               = instruction ==? BGEU;
    assign is_BLT                = instruction ==? BLT;
    assign is_BLTU               = instruction ==? BLTU;
    assign is_BNE                = instruction ==? BNE;
    assign is_C_ADD              = instruction ==? C_ADD;
    assign is_C_ADDI             = instruction ==? C_ADDI;
    assign is_C_ADDI16SP         = instruction ==? C_ADDI16SP;
    assign is_C_ADDI4SPN         = instruction ==? C_ADDI4SPN;
    assign is_C_AND              = instruction ==? C_AND;
    assign is_C_ANDI             = instruction ==? C_ANDI;
    assign is_C_BEQZ             = instruction ==? C_BEQZ;
    assign is_C_BNEZ             = instruction ==? C_BNEZ;
    assign is_C_EBREAK           = instruction ==? C_EBREAK;
    assign is_C_FLW              = instruction ==? C_FLW;
    assign is_C_FLWSP            = instruction ==? C_FLWSP;
    assign is_C_FSW              = instruction ==? C_FSW;
    assign is_C_FSWSP            = instruction ==? C_FSWSP;
    assign is_C_J                = instruction ==? C_J;
    assign is_C_JAL              = instruction ==? C_JAL;
    assign is_C_JALR             = instruction ==? C_JALR;
    assign is_C_JR               = instruction ==? C_JR;
    assign is_C_LI               = instruction ==? C_LI;
    assign is_C_LUI              = instruction ==? C_LUI;
    assign is_C_LW               = instruction ==? C_LW;
    assign is_C_LWSP             = instruction ==? C_LWSP;
    assign is_C_MV               = instruction ==? C_MV;
    assign is_C_NOP              = instruction ==? C_NOP;
    assign is_C_OR               = instruction ==? C_OR;
    assign is_C_SLLI             = instruction ==? C_SLLI;
    assign is_C_SRAI             = instruction ==? C_SRAI;
    assign is_C_SRLI             = instruction ==? C_SRLI;
    assign is_C_SUB              = instruction ==? C_SUB;
    assign is_C_SW               = instruction ==? C_SW;
    assign is_C_SWSP             = instruction ==? C_SWSP;
    assign is_C_XOR              = instruction ==? C_XOR;
    assign is_CSRRC              = instruction ==? CSRRC;
    assign is_CSRRCI             = instruction ==? CSRRCI;
    assign is_CSRRS              = instruction ==? CSRRS;
    assign is_CSRRSI             = instruction ==? CSRRSI;
    assign is_CSRRW              = instruction ==? CSRRW;
    assign is_CSRRWI             = instruction ==? CSRRWI;
    assign is_CV_ABS             = instruction ==? CV_ABS;
    assign is_CV_ABS_B           = instruction ==? CV_ABS_B;
    assign is_CV_ABS_H           = instruction ==? CV_ABS_H;
    assign is_CV_ADDN            = instruction ==? CV_ADDN;
    assign is_CV_ADDNR           = instruction ==? CV_ADDNR;
    assign is_CV_ADDRN           = instruction ==? CV_ADDRN;
    assign is_CV_ADDRNR          = instruction ==? CV_ADDRNR;
    assign is_CV_ADD_B           = instruction ==? CV_ADD_B;
    assign is_CV_ADD_DIV2        = instruction ==? CV_ADD_DIV2;
    assign is_CV_ADD_DIV4        = instruction ==? CV_ADD_DIV4;
    assign is_CV_ADD_DIV8        = instruction ==? CV_ADD_DIV8;
    assign is_CV_ADD_H           = instruction ==? CV_ADD_H;
    assign is_CV_ADD_SC_B        = instruction ==? CV_ADD_SC_B;
    assign is_CV_ADD_SC_H        = instruction ==? CV_ADD_SC_H;
    assign is_CV_ADD_SCI_B       = instruction ==? CV_ADD_SCI_B;
    assign is_CV_ADD_SCI_H       = instruction ==? CV_ADD_SCI_H;
    assign is_CV_ADDUN           = instruction ==? CV_ADDUN;
    assign is_CV_ADDUNR          = instruction ==? CV_ADDUNR;
    assign is_CV_ADDURN          = instruction ==? CV_ADDURN;
    assign is_CV_ADDURNR         = instruction ==? CV_ADDURNR;
    assign is_CV_AND_B           = instruction ==? CV_AND_B;
    assign is_CV_AND_H           = instruction ==? CV_AND_H;
    assign is_CV_AND_SC_B        = instruction ==? CV_AND_SC_B;
    assign is_CV_AND_SC_H        = instruction ==? CV_AND_SC_H;
    assign is_CV_AND_SCI_B       = instruction ==? CV_AND_SCI_B;
    assign is_CV_AND_SCI_H       = instruction ==? CV_AND_SCI_H;
    assign is_CV_AVG_B           = instruction ==? CV_AVG_B;
    assign is_CV_AVG_H           = instruction ==? CV_AVG_H;
    assign is_CV_AVG_SC_B        = instruction ==? CV_AVG_SC_B;
    assign is_CV_AVG_SC_H        = instruction ==? CV_AVG_SC_H;
    assign is_CV_AVG_SCI_B       = instruction ==? CV_AVG_SCI_B;
    assign is_CV_AVG_SCI_H       = instruction ==? CV_AVG_SCI_H;
    assign is_CV_AVGU_B          = instruction ==? CV_AVGU_B;
    assign is_CV_AVGU_H          = instruction ==? CV_AVGU_H;
    assign is_CV_AVGU_SC_B       = instruction ==? CV_AVGU_SC_B;
    assign is_CV_AVGU_SC_H       = instruction ==? CV_AVGU_SC_H;
    assign is_CV_AVGU_SCI_B      = instruction ==? CV_AVGU_SCI_B;
    assign is_CV_AVGU_SCI_H      = instruction ==? CV_AVGU_SCI_H;
    assign is_CV_BCLR            = instruction ==? CV_BCLR;
    assign is_CV_BCLRR           = instruction ==? CV_BCLRR;
    assign is_CV_BEQIMM          = instruction ==? CV_BEQIMM;
    assign is_CV_BITREV          = instruction ==? CV_BITREV;
    assign is_CV_BNEIMM          = instruction ==? CV_BNEIMM;
    assign is_CV_BSET            = instruction ==? CV_BSET;
    assign is_CV_BSETR           = instruction ==? CV_BSETR;
    assign is_CV_CLB             = instruction ==? CV_CLB;
    assign is_CV_CLIP            = instruction ==? CV_CLIP;
    assign is_CV_CLIPR           = instruction ==? CV_CLIPR;
    assign is_CV_CLIPU           = instruction ==? CV_CLIPU;
    assign is_CV_CLIPUR          = instruction ==? CV_CLIPUR;
    assign is_CV_CMPEQ_B         = instruction ==? CV_CMPEQ_B;
    assign is_CV_CMPEQ_H         = instruction ==? CV_CMPEQ_H;
    assign is_CV_CMPEQ_SC_B      = instruction ==? CV_CMPEQ_SC_B;
    assign is_CV_CMPEQ_SC_H      = instruction ==? CV_CMPEQ_SC_H;
    assign is_CV_CMPEQ_SCI_B     = instruction ==? CV_CMPEQ_SCI_B;
    assign is_CV_CMPEQ_SCI_H     = instruction ==? CV_CMPEQ_SCI_H;
    assign is_CV_CMPGE_B         = instruction ==? CV_CMPGE_B;
    assign is_CV_CMPGE_H         = instruction ==? CV_CMPGE_H;
    assign is_CV_CMPGE_SC_B      = instruction ==? CV_CMPGE_SC_B;
    assign is_CV_CMPGE_SC_H      = instruction ==? CV_CMPGE_SC_H;
    assign is_CV_CMPGE_SCI_B     = instruction ==? CV_CMPGE_SCI_B;
    assign is_CV_CMPGE_SCI_H     = instruction ==? CV_CMPGE_SCI_H;
    assign is_CV_CMPGEU_B        = instruction ==? CV_CMPGEU_B;
    assign is_CV_CMPGEU_H        = instruction ==? CV_CMPGEU_H;
    assign is_CV_CMPGEU_SC_B     = instruction ==? CV_CMPGEU_SC_B;
    assign is_CV_CMPGEU_SC_H     = instruction ==? CV_CMPGEU_SC_H;
    assign is_CV_CMPGEU_SCI_B    = instruction ==? CV_CMPGEU_SCI_B;
    assign is_CV_CMPGEU_SCI_H    = instruction ==? CV_CMPGEU_SCI_H;
    assign is_CV_CMPGT_B         = instruction ==? CV_CMPGT_B;
    assign is_CV_CMPGT_H         = instruction ==? CV_CMPGT_H;
    assign is_CV_CMPGT_SC_B      = instruction ==? CV_CMPGT_SC_B;
    assign is_CV_CMPGT_SC_H      = instruction ==? CV_CMPGT_SC_H;
    assign is_CV_CMPGT_SCI_B     = instruction ==? CV_CMPGT_SCI_B;
    assign is_CV_CMPGT_SCI_H     = instruction ==? CV_CMPGT_SCI_H;
    assign is_CV_CMPGTU_B        = instruction ==? CV_CMPGTU_B;
    assign is_CV_CMPGTU_H        = instruction ==? CV_CMPGTU_H;
    assign is_CV_CMPGTU_SC_B     = instruction ==? CV_CMPGTU_SC_B;
    assign is_CV_CMPGTU_SC_H     = instruction ==? CV_CMPGTU_SC_H;
    assign is_CV_CMPGTU_SCI_B    = instruction ==? CV_CMPGTU_SCI_B;
    assign is_CV_CMPGTU_SCI_H    = instruction ==? CV_CMPGTU_SCI_H;
    assign is_CV_CMPLE_B         = instruction ==? CV_CMPLE_B;
    assign is_CV_CMPLE_H         = instruction ==? CV_CMPLE_H;
    assign is_CV_CMPLE_SC_B      = instruction ==? CV_CMPLE_SC_B;
    assign is_CV_CMPLE_SC_H      = instruction ==? CV_CMPLE_SC_H;
    assign is_CV_CMPLE_SCI_B     = instruction ==? CV_CMPLE_SCI_B;
    assign is_CV_CMPLE_SCI_H     = instruction ==? CV_CMPLE_SCI_H;
    assign is_CV_CMPLEU_B        = instruction ==? CV_CMPLEU_B;
    assign is_CV_CMPLEU_H        = instruction ==? CV_CMPLEU_H;
    assign is_CV_CMPLEU_SC_B     = instruction ==? CV_CMPLEU_SC_B;
    assign is_CV_CMPLEU_SC_H     = instruction ==? CV_CMPLEU_SC_H;
    assign is_CV_CMPLEU_SCI_B    = instruction ==? CV_CMPLEU_SCI_B;
    assign is_CV_CMPLEU_SCI_H    = instruction ==? CV_CMPLEU_SCI_H;
    assign is_CV_CMPLT_B         = instruction ==? CV_CMPLT_B;
    assign is_CV_CMPLT_H         = instruction ==? CV_CMPLT_H;
    assign is_CV_CMPLT_SC_B      = instruction ==? CV_CMPLT_SC_B;
    assign is_CV_CMPLT_SC_H      = instruction ==? CV_CMPLT_SC_H;
    assign is_CV_CMPLT_SCI_B     = instruction ==? CV_CMPLT_SCI_B;
    assign is_CV_CMPLT_SCI_H     = instruction ==? CV_CMPLT_SCI_H;
    assign is_CV_CMPLTU_B        = instruction ==? CV_CMPLTU_B;
    assign is_CV_CMPLTU_H        = instruction ==? CV_CMPLTU_H;
    assign is_CV_CMPLTU_SC_B     = instruction ==? CV_CMPLTU_SC_B;
    assign is_CV_CMPLTU_SC_H     = instruction ==? CV_CMPLTU_SC_H;
    assign is_CV_CMPLTU_SCI_B    = instruction ==? CV_CMPLTU_SCI_B;
    assign is_CV_CMPLTU_SCI_H    = instruction ==? CV_CMPLTU_SCI_H;
    assign is_CV_CMPNE_B         = instruction ==? CV_CMPNE_B;
    assign is_CV_CMPNE_H         = instruction ==? CV_CMPNE_H;
    assign is_CV_CMPNE_SC_B      = instruction ==? CV_CMPNE_SC_B;
    assign is_CV_CMPNE_SC_H      = instruction ==? CV_CMPNE_SC_H;
    assign is_CV_CMPNE_SCI_B     = instruction ==? CV_CMPNE_SCI_B;
    assign is_CV_CMPNE_SCI_H     = instruction ==? CV_CMPNE_SCI_H;
    assign is_CV_CNT             = instruction ==? CV_CNT;
    assign is_CV_COUNT           = instruction ==? CV_COUNT;
    assign is_CV_COUNTI          = instruction ==? CV_COUNTI;
    assign is_CV_CPLXCONJ        = instruction ==? CV_CPLXCONJ;
    assign is_CV_CPLXMUL_I       = instruction ==? CV_CPLXMUL_I;
    assign is_CV_CPLXMUL_I_DIV2  = instruction ==? CV_CPLXMUL_I_DIV2;
    assign is_CV_CPLXMUL_I_DIV4  = instruction ==? CV_CPLXMUL_I_DIV4;
    assign is_CV_CPLXMUL_I_DIV8  = instruction ==? CV_CPLXMUL_I_DIV8;
    assign is_CV_CPLXMUL_R       = instruction ==? CV_CPLXMUL_R;
    assign is_CV_CPLXMUL_R_DIV2  = instruction ==? CV_CPLXMUL_R_DIV2;
    assign is_CV_CPLXMUL_R_DIV4  = instruction ==? CV_CPLXMUL_R_DIV4;
    assign is_CV_CPLXMUL_R_DIV8  = instruction ==? CV_CPLXMUL_R_DIV8;
    assign is_CV_DOTSP_B         = instruction ==? CV_DOTSP_B;
    assign is_CV_DOTSP_H         = instruction ==? CV_DOTSP_H;
    assign is_CV_DOTSP_SC_B      = instruction ==? CV_DOTSP_SC_B;
    assign is_CV_DOTSP_SC_H      = instruction ==? CV_DOTSP_SC_H;
    assign is_CV_DOTSP_SCI_B     = instruction ==? CV_DOTSP_SCI_B;
    assign is_CV_DOTSP_SCI_H     = instruction ==? CV_DOTSP_SCI_H;
    assign is_CV_DOTUP_B         = instruction ==? CV_DOTUP_B;
    assign is_CV_DOTUP_H         = instruction ==? CV_DOTUP_H;
    assign is_CV_DOTUP_SC_B      = instruction ==? CV_DOTUP_SC_B;
    assign is_CV_DOTUP_SC_H      = instruction ==? CV_DOTUP_SC_H;
    assign is_CV_DOTUP_SCI_B     = instruction ==? CV_DOTUP_SCI_B;
    assign is_CV_DOTUP_SCI_H     = instruction ==? CV_DOTUP_SCI_H;
    assign is_CV_DOTUSP_B        = instruction ==? CV_DOTUSP_B;
    assign is_CV_DOTUSP_H        = instruction ==? CV_DOTUSP_H;
    assign is_CV_DOTUSP_SC_B     = instruction ==? CV_DOTUSP_SC_B;
    assign is_CV_DOTUSP_SC_H     = instruction ==? CV_DOTUSP_SC_H;
    assign is_CV_DOTUSP_SCI_B    = instruction ==? CV_DOTUSP_SCI_B;
    assign is_CV_DOTUSP_SCI_H    = instruction ==? CV_DOTUSP_SCI_H;
    assign is_CV_END             = instruction ==? CV_END;
    assign is_CV_ENDI            = instruction ==? CV_ENDI;
    assign is_CV_EXTBS           = instruction ==? CV_EXTBS;
    assign is_CV_EXTBZ           = instruction ==? CV_EXTBZ;
    assign is_CV_EXTHS           = instruction ==? CV_EXTHS;
    assign is_CV_EXTHZ           = instruction ==? CV_EXTHZ;
    assign is_CV_EXTRACT         = instruction ==? CV_EXTRACT;
    assign is_CV_EXTRACT_B       = instruction ==? CV_EXTRACT_B;
    assign is_CV_EXTRACT_H       = instruction ==? CV_EXTRACT_H;
    assign is_CV_EXTRACTR        = instruction ==? CV_EXTRACTR;
    assign is_CV_EXTRACTU        = instruction ==? CV_EXTRACTU;
    assign is_CV_EXTRACTU_B      = instruction ==? CV_EXTRACTU_B;
    assign is_CV_EXTRACTU_H      = instruction ==? CV_EXTRACTU_H;
    assign is_CV_EXTRACTUR       = instruction ==? CV_EXTRACTUR;
    assign is_CV_FF1             = instruction ==? CV_FF1;
    assign is_CV_FL1             = instruction ==? CV_FL1;
    assign is_CV_INSERT          = instruction ==? CV_INSERT;
    assign is_CV_INSERT_B        = instruction ==? CV_INSERT_B;
    assign is_CV_INSERT_H        = instruction ==? CV_INSERT_H;
    assign is_CV_INSERTR         = instruction ==? CV_INSERTR;
    assign is_CV_LB              = instruction ==? CV_LB;
    assign is_CV_LBU             = instruction ==? CV_LBU;
    assign is_CV_LH              = instruction ==? CV_LH;
    assign is_CV_LHU             = instruction ==? CV_LHU;
    assign is_CV_LW              = instruction ==? CV_LW;
    assign is_CV_MAC             = instruction ==? CV_MAC;
    assign is_CV_MACHHSN         = instruction ==? CV_MACHHSN;
    assign is_CV_MACHHSRN        = instruction ==? CV_MACHHSRN;
    assign is_CV_MACHHUN         = instruction ==? CV_MACHHUN;
    assign is_CV_MACHHURN        = instruction ==? CV_MACHHURN;
    assign is_CV_MACSN           = instruction ==? CV_MACSN;
    assign is_CV_MACSRN          = instruction ==? CV_MACSRN;
    assign is_CV_MACUN           = instruction ==? CV_MACUN;
    assign is_CV_MACURN          = instruction ==? CV_MACURN;
    assign is_CV_MAX             = instruction ==? CV_MAX;
    assign is_CV_MAX_B           = instruction ==? CV_MAX_B;
    assign is_CV_MAX_H           = instruction ==? CV_MAX_H;
    assign is_CV_MAX_SC_B        = instruction ==? CV_MAX_SC_B;
    assign is_CV_MAX_SC_H        = instruction ==? CV_MAX_SC_H;
    assign is_CV_MAX_SCI_B       = instruction ==? CV_MAX_SCI_B;
    assign is_CV_MAX_SCI_H       = instruction ==? CV_MAX_SCI_H;
    assign is_CV_MAXU            = instruction ==? CV_MAXU;
    assign is_CV_MAXU_B          = instruction ==? CV_MAXU_B;
    assign is_CV_MAXU_H          = instruction ==? CV_MAXU_H;
    assign is_CV_MAXU_SC_B       = instruction ==? CV_MAXU_SC_B;
    assign is_CV_MAXU_SC_H       = instruction ==? CV_MAXU_SC_H;
    assign is_CV_MAXU_SCI_B      = instruction ==? CV_MAXU_SCI_B;
    assign is_CV_MAXU_SCI_H      = instruction ==? CV_MAXU_SCI_H;
    assign is_CV_MIN             = instruction ==? CV_MIN;
    assign is_CV_MIN_B           = instruction ==? CV_MIN_B;
    assign is_CV_MIN_H           = instruction ==? CV_MIN_H;
    assign is_CV_MIN_SC_B        = instruction ==? CV_MIN_SC_B;
    assign is_CV_MIN_SC_H        = instruction ==? CV_MIN_SC_H;
    assign is_CV_MIN_SCI_B       = instruction ==? CV_MIN_SCI_B;
    assign is_CV_MIN_SCI_H       = instruction ==? CV_MIN_SCI_H;
    assign is_CV_MINU            = instruction ==? CV_MINU;
    assign is_CV_MINU_B          = instruction ==? CV_MINU_B;
    assign is_CV_MINU_H          = instruction ==? CV_MINU_H;
    assign is_CV_MINU_SC_B       = instruction ==? CV_MINU_SC_B;
    assign is_CV_MINU_SC_H       = instruction ==? CV_MINU_SC_H;
    assign is_CV_MINU_SCI_B      = instruction ==? CV_MINU_SCI_B;
    assign is_CV_MINU_SCI_H      = instruction ==? CV_MINU_SCI_H;
    assign is_CV_MSU             = instruction ==? CV_MSU;
    assign is_CV_MULHHSN         = instruction ==? CV_MULHHSN;
    assign is_CV_MULHHSRN        = instruction ==? CV_MULHHSRN;
    assign is_CV_MULHHUN         = instruction ==? CV_MULHHUN;
    assign is_CV_MULHHURN        = instruction ==? CV_MULHHURN;
    assign is_CV_MULSN           = instruction ==? CV_MULSN;
    assign is_CV_MULSRN          = instruction ==? CV_MULSRN;
    assign is_CV_MULUN           = instruction ==? CV_MULUN;
    assign is_CV_MULURN          = instruction ==? CV_MULURN;
    assign is_CV_OR_B            = instruction ==? CV_OR_B;
    assign is_CV_OR_H            = instruction ==? CV_OR_H;
    assign is_CV_OR_SC_B         = instruction ==? CV_OR_SC_B;
    assign is_CV_OR_SC_H         = instruction ==? CV_OR_SC_H;
    assign is_CV_OR_SCI_B        = instruction ==? CV_OR_SCI_B;
    assign is_CV_OR_SCI_H        = instruction ==? CV_OR_SCI_H;
    assign is_CV_PACK            = instruction ==? CV_PACK;
    assign is_CV_PACK_H          = instruction ==? CV_PACK_H;
    assign is_CV_PACKHI_B        = instruction ==? CV_PACKHI_B;
    assign is_CV_PACKLO_B        = instruction ==? CV_PACKLO_B;
    assign is_CV_PI_LB           = instruction ==? CV_PI_LB;
    assign is_CV_PI_LBI          = instruction ==? CV_PI_LBI;
    assign is_CV_PI_LBU          = instruction ==? CV_PI_LBU;
    assign is_CV_PI_LBUI         = instruction ==? CV_PI_LBUI;
    assign is_CV_PI_LH           = instruction ==? CV_PI_LH;
    assign is_CV_PI_LHI          = instruction ==? CV_PI_LHI;
    assign is_CV_PI_LHU          = instruction ==? CV_PI_LHU;
    assign is_CV_PI_LHUI         = instruction ==? CV_PI_LHUI;
    assign is_CV_PI_LW           = instruction ==? CV_PI_LW;
    assign is_CV_PI_LWI          = instruction ==? CV_PI_LWI;
    assign is_CV_PI_SB           = instruction ==? CV_PI_SB;
    assign is_CV_PI_SBI          = instruction ==? CV_PI_SBI;
    assign is_CV_PI_SH           = instruction ==? CV_PI_SH;
    assign is_CV_PI_SHI          = instruction ==? CV_PI_SHI;
    assign is_CV_PI_SW           = instruction ==? CV_PI_SW;
    assign is_CV_PI_SWI          = instruction ==? CV_PI_SWI;
    assign is_CV_ROR             = instruction ==? CV_ROR;
    assign is_CV_SB              = instruction ==? CV_SB;
    assign is_CV_SDOTSP_B        = instruction ==? CV_SDOTSP_B;
    assign is_CV_SDOTSP_H        = instruction ==? CV_SDOTSP_H;
    assign is_CV_SDOTSP_SC_B     = instruction ==? CV_SDOTSP_SC_B;
    assign is_CV_SDOTSP_SC_H     = instruction ==? CV_SDOTSP_SC_H;
    assign is_CV_SDOTSP_SCI_B    = instruction ==? CV_SDOTSP_SCI_B;
    assign is_CV_SDOTSP_SCI_H    = instruction ==? CV_SDOTSP_SCI_H;
    assign is_CV_SDOTUP_B        = instruction ==? CV_SDOTUP_B;
    assign is_CV_SDOTUP_H        = instruction ==? CV_SDOTUP_H;
    assign is_CV_SDOTUP_SC_B     = instruction ==? CV_SDOTUP_SC_B;
    assign is_CV_SDOTUP_SC_H     = instruction ==? CV_SDOTUP_SC_H;
    assign is_CV_SDOTUP_SCI_B    = instruction ==? CV_SDOTUP_SCI_B;
    assign is_CV_SDOTUP_SCI_H    = instruction ==? CV_SDOTUP_SCI_H;
    assign is_CV_SDOTUSP_B       = instruction ==? CV_SDOTUSP_B;
    assign is_CV_SDOTUSP_H       = instruction ==? CV_SDOTUSP_H;
    assign is_CV_SDOTUSP_SC_B    = instruction ==? CV_SDOTUSP_SC_B;
    assign is_CV_SDOTUSP_SC_H    = instruction ==? CV_SDOTUSP_SC_H;
    assign is_CV_SDOTUSP_SCI_B   = instruction ==? CV_SDOTUSP_SCI_B;
    assign is_CV_SDOTUSP_SCI_H   = instruction ==? CV_SDOTUSP_SCI_H;
    assign is_CV_SETUP           = instruction ==? CV_SETUP;
    assign is_CV_SETUPI          = instruction ==? CV_SETUPI;
    assign is_CV_SH              = instruction ==? CV_SH;
    assign is_CV_SHUFFLE2_B      = instruction ==? CV_SHUFFLE2_B;
    assign is_CV_SHUFFLE2_H      = instruction ==? CV_SHUFFLE2_H;
    assign is_CV_SHUFFLEI0_SCI_B = instruction ==? CV_SHUFFLEI0_SCI_B;
    assign is_CV_SHUFFLEI1_SCI_B = instruction ==? CV_SHUFFLEI1_SCI_B;
    assign is_CV_SHUFFLEI2_SCI_B = instruction ==? CV_SHUFFLEI2_SCI_B;
    assign is_CV_SHUFFLEI3_SCI_B = instruction ==? CV_SHUFFLEI3_SCI_B;
    assign is_CV_SHUFFLE_B       = instruction ==? CV_SHUFFLE_B;
    assign is_CV_SHUFFLE_H       = instruction ==? CV_SHUFFLE_H;
    assign is_CV_SHUFFLE_SCI_H   = instruction ==? CV_SHUFFLE_SCI_H;
    assign is_CV_SLE             = instruction ==? CV_SLE;
    assign is_CV_SLEU            = instruction ==? CV_SLEU;
    assign is_CV_SLL_B           = instruction ==? CV_SLL_B;
    assign is_CV_SLL_H           = instruction ==? CV_SLL_H;
    assign is_CV_SLL_SC_B        = instruction ==? CV_SLL_SC_B;
    assign is_CV_SLL_SC_H        = instruction ==? CV_SLL_SC_H;
    assign is_CV_SLL_SCI_B       = instruction ==? CV_SLL_SCI_B;
    assign is_CV_SLL_SCI_H       = instruction ==? CV_SLL_SCI_H;
    assign is_CV_SRA_B           = instruction ==? CV_SRA_B;
    assign is_CV_SRA_H           = instruction ==? CV_SRA_H;
    assign is_CV_SRA_SC_B        = instruction ==? CV_SRA_SC_B;
    assign is_CV_SRA_SC_H        = instruction ==? CV_SRA_SC_H;
    assign is_CV_SRA_SCI_B       = instruction ==? CV_SRA_SCI_B;
    assign is_CV_SRA_SCI_H       = instruction ==? CV_SRA_SCI_H;
    assign is_CV_SRL_B           = instruction ==? CV_SRL_B;
    assign is_CV_SRL_H           = instruction ==? CV_SRL_H;
    assign is_CV_SRL_SC_B        = instruction ==? CV_SRL_SC_B;
    assign is_CV_SRL_SC_H        = instruction ==? CV_SRL_SC_H;
    assign is_CV_SRL_SCI_B       = instruction ==? CV_SRL_SCI_B;
    assign is_CV_SRL_SCI_H       = instruction ==? CV_SRL_SCI_H;
    assign is_CV_START           = instruction ==? CV_START;
    assign is_CV_STARTI          = instruction ==? CV_STARTI;
    assign is_CV_SUBN            = instruction ==? CV_SUBN;
    assign is_CV_SUBNR           = instruction ==? CV_SUBNR;
    assign is_CV_SUBRN           = instruction ==? CV_SUBRN;
    assign is_CV_SUBRNR          = instruction ==? CV_SUBRNR;
    assign is_CV_SUB_B           = instruction ==? CV_SUB_B;
    assign is_CV_SUB_DIV2        = instruction ==? CV_SUB_DIV2;
    assign is_CV_SUB_DIV4        = instruction ==? CV_SUB_DIV4;
    assign is_CV_SUB_DIV8        = instruction ==? CV_SUB_DIV8;
    assign is_CV_SUB_H           = instruction ==? CV_SUB_H;
    assign is_CV_SUB_SC_B        = instruction ==? CV_SUB_SC_B;
    assign is_CV_SUB_SC_H        = instruction ==? CV_SUB_SC_H;
    assign is_CV_SUB_SCI_B       = instruction ==? CV_SUB_SCI_B;
    assign is_CV_SUB_SCI_H       = instruction ==? CV_SUB_SCI_H;
    assign is_CV_SUBROTMJ        = instruction ==? CV_SUBROTMJ;
    assign is_CV_SUBROTMJ_DIV2   = instruction ==? CV_SUBROTMJ_DIV2;
    assign is_CV_SUBROTMJ_DIV4   = instruction ==? CV_SUBROTMJ_DIV4;
    assign is_CV_SUBROTMJ_DIV8   = instruction ==? CV_SUBROTMJ_DIV8;
    assign is_CV_SUBUN           = instruction ==? CV_SUBUN;
    assign is_CV_SUBUNR          = instruction ==? CV_SUBUNR;
    assign is_CV_SUBURN          = instruction ==? CV_SUBURN;
    assign is_CV_SUBURNR         = instruction ==? CV_SUBURNR;
    assign is_CV_SW              = instruction ==? CV_SW;
    assign is_CV_XOR_B           = instruction ==? CV_XOR_B;
    assign is_CV_XOR_H           = instruction ==? CV_XOR_H;
    assign is_CV_XOR_SC_B        = instruction ==? CV_XOR_SC_B;
    assign is_CV_XOR_SC_H        = instruction ==? CV_XOR_SC_H;
    assign is_CV_XOR_SCI_B       = instruction ==? CV_XOR_SCI_B;
    assign is_CV_XOR_SCI_H       = instruction ==? CV_XOR_SCI_H;
    assign is_DIV                = instruction ==? DIV;
    assign is_DIVU               = instruction ==? DIVU;
    assign is_EBREAK             = instruction ==? EBREAK;
    assign is_ECALL              = instruction ==? ECALL;
    assign is_FADD_S             = instruction ==? FADD_S;
    assign is_FCLASS_S           = instruction ==? FCLASS_S;
    assign is_FCVT_S_W           = instruction ==? FCVT_S_W;
    assign is_FCVT_S_WU          = instruction ==? FCVT_S_WU;
    assign is_FCVT_W_S           = instruction ==? FCVT_W_S;
    assign is_FCVT_WU_S          = instruction ==? FCVT_WU_S;
    assign is_FDIV_S             = instruction ==? FDIV_S;
    assign is_FENCE              = instruction ==? FENCE;
    assign is_FEQ_S              = instruction ==? FEQ_S;
    assign is_FLE_S              = instruction ==? FLE_S;
    assign is_FLT_S              = instruction ==? FLT_S;
    assign is_FLW                = instruction ==? FLW;
    assign is_FMADD_S            = instruction ==? FMADD_S;
    assign is_FMAX_S             = instruction ==? FMAX_S;
    assign is_FMIN_S             = instruction ==? FMIN_S;
    assign is_FMSUB_S            = instruction ==? FMSUB_S;
    assign is_FMUL_S             = instruction ==? FMUL_S;
    assign is_FMV_W_X            = instruction ==? FMV_W_X;
    assign is_FMV_X_W            = instruction ==? FMV_X_W;
    assign is_FNMADD_S           = instruction ==? FNMADD_S;
    assign is_FNMSUB_S           = instruction ==? FNMSUB_S;
    assign is_FSGNJ_S            = instruction ==? FSGNJ_S;
    assign is_FSGNJN_S           = instruction ==? FSGNJN_S;
    assign is_FSGNJX_S           = instruction ==? FSGNJX_S;
    assign is_FSQRT_S            = instruction ==? FSQRT_S;
    assign is_FSUB_S             = instruction ==? FSUB_S;
    assign is_FSW                = instruction ==? FSW;
    assign is_JAL                = instruction ==? JAL;
    assign is_JALR               = instruction ==? JALR;
    assign is_LB                 = instruction ==? LB;
    assign is_LBU                = instruction ==? LBU;
    assign is_LH                 = instruction ==? LH;
    assign is_LHU                = instruction ==? LHU;
    assign is_LR_W               = instruction ==? LR_W;
    assign is_LUI                = instruction ==? LUI;
    assign is_LW                 = instruction ==? LW;
    assign is_MUL                = instruction ==? MUL;
    assign is_MULH               = instruction ==? MULH;
    assign is_MULHSU             = instruction ==? MULHSU;
    assign is_MULHU              = instruction ==? MULHU;
    assign is_OR                 = instruction ==? OR;
    assign is_ORI                = instruction ==? ORI;
    assign is_REM                = instruction ==? REM;
    assign is_REMU               = instruction ==? REMU;
    assign is_SB                 = instruction ==? SB;
    assign is_SC_W               = instruction ==? SC_W;
    assign is_SH                 = instruction ==? SH;
    assign is_SLL                = instruction ==? SLL;
    assign is_SLLI               = instruction ==? SLLI;
    assign is_SLT                = instruction ==? SLT;
    assign is_SLTI               = instruction ==? SLTI;
    assign is_SLTIU              = instruction ==? SLTIU;
    assign is_SLTU               = instruction ==? SLTU;
    assign is_SRA                = instruction ==? SRA;
    assign is_SRAI               = instruction ==? SRAI;
    assign is_SRL                = instruction ==? SRL;
    assign is_SRLI               = instruction ==? SRLI;
    assign is_SUB                = instruction ==? SUB;
    assign is_SW                 = instruction ==? SW;
    assign is_XOR                = instruction ==? XOR;
    assign is_XORI               = instruction ==? XORI;

    /* rv_instruction instruction type enum  */
    always_comb begin: instruction_type_decoder
        casez (instruction)
        ADD               : rv_instruction = RV_ADD;
        ADDI              : rv_instruction = RV_ADDI;
        AMOADD_W          : rv_instruction = RV_AMOADD_W;
        AMOAND_W          : rv_instruction = RV_AMOAND_W;
        AMOMAX_W          : rv_instruction = RV_AMOMAX_W;
        AMOMAXU_W         : rv_instruction = RV_AMOMAXU_W;
        AMOMIN_W          : rv_instruction = RV_AMOMIN_W;
        AMOMINU_W         : rv_instruction = RV_AMOMINU_W;
        AMOOR_W           : rv_instruction = RV_AMOOR_W;
        AMOSWAP_W         : rv_instruction = RV_AMOSWAP_W;
        AMOXOR_W          : rv_instruction = RV_AMOXOR_W;
        AND               : rv_instruction = RV_AND;
        ANDI              : rv_instruction = RV_ANDI;
        AUIPC             : rv_instruction = RV_AUIPC;
        BEQ               : rv_instruction = RV_BEQ;
        BGE               : rv_instruction = RV_BGE;
        BGEU              : rv_instruction = RV_BGEU;
        BLT               : rv_instruction = RV_BLT;
        BLTU              : rv_instruction = RV_BLTU;
        BNE               : rv_instruction = RV_BNE;
        C_ADD             : rv_instruction = RV_C_ADD;
        C_ADDI            : rv_instruction = RV_C_ADDI;
        C_ADDI16SP        : rv_instruction = RV_C_ADDI16SP;
        C_ADDI4SPN        : rv_instruction = RV_C_ADDI4SPN;
        C_AND             : rv_instruction = RV_C_AND;
        C_ANDI            : rv_instruction = RV_C_ANDI;
        C_BEQZ            : rv_instruction = RV_C_BEQZ;
        C_BNEZ            : rv_instruction = RV_C_BNEZ;
        C_EBREAK          : rv_instruction = RV_C_EBREAK;
        C_FLW             : rv_instruction = RV_C_FLW;
        C_FLWSP           : rv_instruction = RV_C_FLWSP;
        C_FSW             : rv_instruction = RV_C_FSW;
        C_FSWSP           : rv_instruction = RV_C_FSWSP;
        C_J               : rv_instruction = RV_C_J;
        C_JAL             : rv_instruction = RV_C_JAL;
        C_JALR            : rv_instruction = RV_C_JALR;
        C_JR              : rv_instruction = RV_C_JR;
        C_LI              : rv_instruction = RV_C_LI;
        C_LUI             : rv_instruction = RV_C_LUI;
        C_LW              : rv_instruction = RV_C_LW;
        C_LWSP            : rv_instruction = RV_C_LWSP;
        C_MV              : rv_instruction = RV_C_MV;
        C_NOP             : rv_instruction = RV_C_NOP;
        C_OR              : rv_instruction = RV_C_OR;
        C_SLLI            : rv_instruction = RV_C_SLLI;
        C_SRAI            : rv_instruction = RV_C_SRAI;
        C_SRLI            : rv_instruction = RV_C_SRLI;
        C_SUB             : rv_instruction = RV_C_SUB;
        C_SW              : rv_instruction = RV_C_SW;
        C_SWSP            : rv_instruction = RV_C_SWSP;
        C_XOR             : rv_instruction = RV_C_XOR;
        CSRRC             : rv_instruction = RV_CSRRC;
        CSRRCI            : rv_instruction = RV_CSRRCI;
        CSRRS             : rv_instruction = RV_CSRRS;
        CSRRSI            : rv_instruction = RV_CSRRSI;
        CSRRW             : rv_instruction = RV_CSRRW;
        CSRRWI            : rv_instruction = RV_CSRRWI;
        CV_ABS            : rv_instruction = RV_CV_ABS;
        CV_ABS_B          : rv_instruction = RV_CV_ABS_B;
        CV_ABS_H          : rv_instruction = RV_CV_ABS_H;
        CV_ADDN           : rv_instruction = RV_CV_ADDN;
        CV_ADDNR          : rv_instruction = RV_CV_ADDNR;
        CV_ADDRN          : rv_instruction = RV_CV_ADDRN;
        CV_ADDRNR         : rv_instruction = RV_CV_ADDRNR;
        CV_ADD_B          : rv_instruction = RV_CV_ADD_B;
        CV_ADD_DIV2       : rv_instruction = RV_CV_ADD_DIV2;
        CV_ADD_DIV4       : rv_instruction = RV_CV_ADD_DIV4;
        CV_ADD_DIV8       : rv_instruction = RV_CV_ADD_DIV8;
        CV_ADD_H          : rv_instruction = RV_CV_ADD_H;
        CV_ADD_SC_B       : rv_instruction = RV_CV_ADD_SC_B;
        CV_ADD_SC_H       : rv_instruction = RV_CV_ADD_SC_H;
        CV_ADD_SCI_B      : rv_instruction = RV_CV_ADD_SCI_B;
        CV_ADD_SCI_H      : rv_instruction = RV_CV_ADD_SCI_H;
        CV_ADDUN          : rv_instruction = RV_CV_ADDUN;
        CV_ADDUNR         : rv_instruction = RV_CV_ADDUNR;
        CV_ADDURN         : rv_instruction = RV_CV_ADDURN;
        CV_ADDURNR        : rv_instruction = RV_CV_ADDURNR;
        CV_AND_B          : rv_instruction = RV_CV_AND_B;
        CV_AND_H          : rv_instruction = RV_CV_AND_H;
        CV_AND_SC_B       : rv_instruction = RV_CV_AND_SC_B;
        CV_AND_SC_H       : rv_instruction = RV_CV_AND_SC_H;
        CV_AND_SCI_B      : rv_instruction = RV_CV_AND_SCI_B;
        CV_AND_SCI_H      : rv_instruction = RV_CV_AND_SCI_H;
        CV_AVG_B          : rv_instruction = RV_CV_AVG_B;
        CV_AVG_H          : rv_instruction = RV_CV_AVG_H;
        CV_AVG_SC_B       : rv_instruction = RV_CV_AVG_SC_B;
        CV_AVG_SC_H       : rv_instruction = RV_CV_AVG_SC_H;
        CV_AVG_SCI_B      : rv_instruction = RV_CV_AVG_SCI_B;
        CV_AVG_SCI_H      : rv_instruction = RV_CV_AVG_SCI_H;
        CV_AVGU_B         : rv_instruction = RV_CV_AVGU_B;
        CV_AVGU_H         : rv_instruction = RV_CV_AVGU_H;
        CV_AVGU_SC_B      : rv_instruction = RV_CV_AVGU_SC_B;
        CV_AVGU_SC_H      : rv_instruction = RV_CV_AVGU_SC_H;
        CV_AVGU_SCI_B     : rv_instruction = RV_CV_AVGU_SCI_B;
        CV_AVGU_SCI_H     : rv_instruction = RV_CV_AVGU_SCI_H;
        CV_BCLR           : rv_instruction = RV_CV_BCLR;
        CV_BCLRR          : rv_instruction = RV_CV_BCLRR;
        CV_BEQIMM         : rv_instruction = RV_CV_BEQIMM;
        CV_BITREV         : rv_instruction = RV_CV_BITREV;
        CV_BNEIMM         : rv_instruction = RV_CV_BNEIMM;
        CV_BSET           : rv_instruction = RV_CV_BSET;
        CV_BSETR          : rv_instruction = RV_CV_BSETR;
        CV_CLB            : rv_instruction = RV_CV_CLB;
        CV_CLIP           : rv_instruction = RV_CV_CLIP;
        CV_CLIPR          : rv_instruction = RV_CV_CLIPR;
        CV_CLIPU          : rv_instruction = RV_CV_CLIPU;
        CV_CLIPUR         : rv_instruction = RV_CV_CLIPUR;
        CV_CMPEQ_B        : rv_instruction = RV_CV_CMPEQ_B;
        CV_CMPEQ_H        : rv_instruction = RV_CV_CMPEQ_H;
        CV_CMPEQ_SC_B     : rv_instruction = RV_CV_CMPEQ_SC_B;
        CV_CMPEQ_SC_H     : rv_instruction = RV_CV_CMPEQ_SC_H;
        CV_CMPEQ_SCI_B    : rv_instruction = RV_CV_CMPEQ_SCI_B;
        CV_CMPEQ_SCI_H    : rv_instruction = RV_CV_CMPEQ_SCI_H;
        CV_CMPGE_B        : rv_instruction = RV_CV_CMPGE_B;
        CV_CMPGE_H        : rv_instruction = RV_CV_CMPGE_H;
        CV_CMPGE_SC_B     : rv_instruction = RV_CV_CMPGE_SC_B;
        CV_CMPGE_SC_H     : rv_instruction = RV_CV_CMPGE_SC_H;
        CV_CMPGE_SCI_B    : rv_instruction = RV_CV_CMPGE_SCI_B;
        CV_CMPGE_SCI_H    : rv_instruction = RV_CV_CMPGE_SCI_H;
        CV_CMPGEU_B       : rv_instruction = RV_CV_CMPGEU_B;
        CV_CMPGEU_H       : rv_instruction = RV_CV_CMPGEU_H;
        CV_CMPGEU_SC_B    : rv_instruction = RV_CV_CMPGEU_SC_B;
        CV_CMPGEU_SC_H    : rv_instruction = RV_CV_CMPGEU_SC_H;
        CV_CMPGEU_SCI_B   : rv_instruction = RV_CV_CMPGEU_SCI_B;
        CV_CMPGEU_SCI_H   : rv_instruction = RV_CV_CMPGEU_SCI_H;
        CV_CMPGT_B        : rv_instruction = RV_CV_CMPGT_B;
        CV_CMPGT_H        : rv_instruction = RV_CV_CMPGT_H;
        CV_CMPGT_SC_B     : rv_instruction = RV_CV_CMPGT_SC_B;
        CV_CMPGT_SC_H     : rv_instruction = RV_CV_CMPGT_SC_H;
        CV_CMPGT_SCI_B    : rv_instruction = RV_CV_CMPGT_SCI_B;
        CV_CMPGT_SCI_H    : rv_instruction = RV_CV_CMPGT_SCI_H;
        CV_CMPGTU_B       : rv_instruction = RV_CV_CMPGTU_B;
        CV_CMPGTU_H       : rv_instruction = RV_CV_CMPGTU_H;
        CV_CMPGTU_SC_B    : rv_instruction = RV_CV_CMPGTU_SC_B;
        CV_CMPGTU_SC_H    : rv_instruction = RV_CV_CMPGTU_SC_H;
        CV_CMPGTU_SCI_B   : rv_instruction = RV_CV_CMPGTU_SCI_B;
        CV_CMPGTU_SCI_H   : rv_instruction = RV_CV_CMPGTU_SCI_H;
        CV_CMPLE_B        : rv_instruction = RV_CV_CMPLE_B;
        CV_CMPLE_H        : rv_instruction = RV_CV_CMPLE_H;
        CV_CMPLE_SC_B     : rv_instruction = RV_CV_CMPLE_SC_B;
        CV_CMPLE_SC_H     : rv_instruction = RV_CV_CMPLE_SC_H;
        CV_CMPLE_SCI_B    : rv_instruction = RV_CV_CMPLE_SCI_B;
        CV_CMPLE_SCI_H    : rv_instruction = RV_CV_CMPLE_SCI_H;
        CV_CMPLEU_B       : rv_instruction = RV_CV_CMPLEU_B;
        CV_CMPLEU_H       : rv_instruction = RV_CV_CMPLEU_H;
        CV_CMPLEU_SC_B    : rv_instruction = RV_CV_CMPLEU_SC_B;
        CV_CMPLEU_SC_H    : rv_instruction = RV_CV_CMPLEU_SC_H;
        CV_CMPLEU_SCI_B   : rv_instruction = RV_CV_CMPLEU_SCI_B;
        CV_CMPLEU_SCI_H   : rv_instruction = RV_CV_CMPLEU_SCI_H;
        CV_CMPLT_B        : rv_instruction = RV_CV_CMPLT_B;
        CV_CMPLT_H        : rv_instruction = RV_CV_CMPLT_H;
        CV_CMPLT_SC_B     : rv_instruction = RV_CV_CMPLT_SC_B;
        CV_CMPLT_SC_H     : rv_instruction = RV_CV_CMPLT_SC_H;
        CV_CMPLT_SCI_B    : rv_instruction = RV_CV_CMPLT_SCI_B;
        CV_CMPLT_SCI_H    : rv_instruction = RV_CV_CMPLT_SCI_H;
        CV_CMPLTU_B       : rv_instruction = RV_CV_CMPLTU_B;
        CV_CMPLTU_H       : rv_instruction = RV_CV_CMPLTU_H;
        CV_CMPLTU_SC_B    : rv_instruction = RV_CV_CMPLTU_SC_B;
        CV_CMPLTU_SC_H    : rv_instruction = RV_CV_CMPLTU_SC_H;
        CV_CMPLTU_SCI_B   : rv_instruction = RV_CV_CMPLTU_SCI_B;
        CV_CMPLTU_SCI_H   : rv_instruction = RV_CV_CMPLTU_SCI_H;
        CV_CMPNE_B        : rv_instruction = RV_CV_CMPNE_B;
        CV_CMPNE_H        : rv_instruction = RV_CV_CMPNE_H;
        CV_CMPNE_SC_B     : rv_instruction = RV_CV_CMPNE_SC_B;
        CV_CMPNE_SC_H     : rv_instruction = RV_CV_CMPNE_SC_H;
        CV_CMPNE_SCI_B    : rv_instruction = RV_CV_CMPNE_SCI_B;
        CV_CMPNE_SCI_H    : rv_instruction = RV_CV_CMPNE_SCI_H;
        CV_CNT            : rv_instruction = RV_CV_CNT;
        CV_COUNT          : rv_instruction = RV_CV_COUNT;
        CV_COUNTI         : rv_instruction = RV_CV_COUNTI;
        CV_CPLXCONJ       : rv_instruction = RV_CV_CPLXCONJ;
        CV_CPLXMUL_I      : rv_instruction = RV_CV_CPLXMUL_I;
        CV_CPLXMUL_I_DIV2 : rv_instruction = RV_CV_CPLXMUL_I_DIV2;
        CV_CPLXMUL_I_DIV4 : rv_instruction = RV_CV_CPLXMUL_I_DIV4;
        CV_CPLXMUL_I_DIV8 : rv_instruction = RV_CV_CPLXMUL_I_DIV8;
        CV_CPLXMUL_R      : rv_instruction = RV_CV_CPLXMUL_R;
        CV_CPLXMUL_R_DIV2 : rv_instruction = RV_CV_CPLXMUL_R_DIV2;
        CV_CPLXMUL_R_DIV4 : rv_instruction = RV_CV_CPLXMUL_R_DIV4;
        CV_CPLXMUL_R_DIV8 : rv_instruction = RV_CV_CPLXMUL_R_DIV8;
        CV_DOTSP_B        : rv_instruction = RV_CV_DOTSP_B;
        CV_DOTSP_H        : rv_instruction = RV_CV_DOTSP_H;
        CV_DOTSP_SC_B     : rv_instruction = RV_CV_DOTSP_SC_B;
        CV_DOTSP_SC_H     : rv_instruction = RV_CV_DOTSP_SC_H;
        CV_DOTSP_SCI_B    : rv_instruction = RV_CV_DOTSP_SCI_B;
        CV_DOTSP_SCI_H    : rv_instruction = RV_CV_DOTSP_SCI_H;
        CV_DOTUP_B        : rv_instruction = RV_CV_DOTUP_B;
        CV_DOTUP_H        : rv_instruction = RV_CV_DOTUP_H;
        CV_DOTUP_SC_B     : rv_instruction = RV_CV_DOTUP_SC_B;
        CV_DOTUP_SC_H     : rv_instruction = RV_CV_DOTUP_SC_H;
        CV_DOTUP_SCI_B    : rv_instruction = RV_CV_DOTUP_SCI_B;
        CV_DOTUP_SCI_H    : rv_instruction = RV_CV_DOTUP_SCI_H;
        CV_DOTUSP_B       : rv_instruction = RV_CV_DOTUSP_B;
        CV_DOTUSP_H       : rv_instruction = RV_CV_DOTUSP_H;
        CV_DOTUSP_SC_B    : rv_instruction = RV_CV_DOTUSP_SC_B;
        CV_DOTUSP_SC_H    : rv_instruction = RV_CV_DOTUSP_SC_H;
        CV_DOTUSP_SCI_B   : rv_instruction = RV_CV_DOTUSP_SCI_B;
        CV_DOTUSP_SCI_H   : rv_instruction = RV_CV_DOTUSP_SCI_H;
        CV_END            : rv_instruction = RV_CV_END;
        CV_ENDI           : rv_instruction = RV_CV_ENDI;
        CV_EXTBS          : rv_instruction = RV_CV_EXTBS;
        CV_EXTBZ          : rv_instruction = RV_CV_EXTBZ;
        CV_EXTHS          : rv_instruction = RV_CV_EXTHS;
        CV_EXTHZ          : rv_instruction = RV_CV_EXTHZ;
        CV_EXTRACT        : rv_instruction = RV_CV_EXTRACT;
        CV_EXTRACT_B      : rv_instruction = RV_CV_EXTRACT_B;
        CV_EXTRACT_H      : rv_instruction = RV_CV_EXTRACT_H;
        CV_EXTRACTR       : rv_instruction = RV_CV_EXTRACTR;
        CV_EXTRACTU       : rv_instruction = RV_CV_EXTRACTU;
        CV_EXTRACTU_B     : rv_instruction = RV_CV_EXTRACTU_B;
        CV_EXTRACTU_H     : rv_instruction = RV_CV_EXTRACTU_H;
        CV_EXTRACTUR      : rv_instruction = RV_CV_EXTRACTUR;
        CV_FF1            : rv_instruction = RV_CV_FF1;
        CV_FL1            : rv_instruction = RV_CV_FL1;
        CV_INSERT         : rv_instruction = RV_CV_INSERT;
        CV_INSERT_B       : rv_instruction = RV_CV_INSERT_B;
        CV_INSERT_H       : rv_instruction = RV_CV_INSERT_H;
        CV_INSERTR        : rv_instruction = RV_CV_INSERTR;
        CV_LB             : rv_instruction = RV_CV_LB;
        CV_LBU            : rv_instruction = RV_CV_LBU;
        CV_LH             : rv_instruction = RV_CV_LH;
        CV_LHU            : rv_instruction = RV_CV_LHU;
        CV_LW             : rv_instruction = RV_CV_LW;
        CV_MAC            : rv_instruction = RV_CV_MAC;
        CV_MACHHSN        : rv_instruction = RV_CV_MACHHSN;
        CV_MACHHSRN       : rv_instruction = RV_CV_MACHHSRN;
        CV_MACHHUN        : rv_instruction = RV_CV_MACHHUN;
        CV_MACHHURN       : rv_instruction = RV_CV_MACHHURN;
        CV_MACSN          : rv_instruction = RV_CV_MACSN;
        CV_MACSRN         : rv_instruction = RV_CV_MACSRN;
        CV_MACUN          : rv_instruction = RV_CV_MACUN;
        CV_MACURN         : rv_instruction = RV_CV_MACURN;
        CV_MAX            : rv_instruction = RV_CV_MAX;
        CV_MAX_B          : rv_instruction = RV_CV_MAX_B;
        CV_MAX_H          : rv_instruction = RV_CV_MAX_H;
        CV_MAX_SC_B       : rv_instruction = RV_CV_MAX_SC_B;
        CV_MAX_SC_H       : rv_instruction = RV_CV_MAX_SC_H;
        CV_MAX_SCI_B      : rv_instruction = RV_CV_MAX_SCI_B;
        CV_MAX_SCI_H      : rv_instruction = RV_CV_MAX_SCI_H;
        CV_MAXU           : rv_instruction = RV_CV_MAXU;
        CV_MAXU_B         : rv_instruction = RV_CV_MAXU_B;
        CV_MAXU_H         : rv_instruction = RV_CV_MAXU_H;
        CV_MAXU_SC_B      : rv_instruction = RV_CV_MAXU_SC_B;
        CV_MAXU_SC_H      : rv_instruction = RV_CV_MAXU_SC_H;
        CV_MAXU_SCI_B     : rv_instruction = RV_CV_MAXU_SCI_B;
        CV_MAXU_SCI_H     : rv_instruction = RV_CV_MAXU_SCI_H;
        CV_MIN            : rv_instruction = RV_CV_MIN;
        CV_MIN_B          : rv_instruction = RV_CV_MIN_B;
        CV_MIN_H          : rv_instruction = RV_CV_MIN_H;
        CV_MIN_SC_B       : rv_instruction = RV_CV_MIN_SC_B;
        CV_MIN_SC_H       : rv_instruction = RV_CV_MIN_SC_H;
        CV_MIN_SCI_B      : rv_instruction = RV_CV_MIN_SCI_B;
        CV_MIN_SCI_H      : rv_instruction = RV_CV_MIN_SCI_H;
        CV_MINU           : rv_instruction = RV_CV_MINU;
        CV_MINU_B         : rv_instruction = RV_CV_MINU_B;
        CV_MINU_H         : rv_instruction = RV_CV_MINU_H;
        CV_MINU_SC_B      : rv_instruction = RV_CV_MINU_SC_B;
        CV_MINU_SC_H      : rv_instruction = RV_CV_MINU_SC_H;
        CV_MINU_SCI_B     : rv_instruction = RV_CV_MINU_SCI_B;
        CV_MINU_SCI_H     : rv_instruction = RV_CV_MINU_SCI_H;
        CV_MSU            : rv_instruction = RV_CV_MSU;
        CV_MULHHSN        : rv_instruction = RV_CV_MULHHSN;
        CV_MULHHSRN       : rv_instruction = RV_CV_MULHHSRN;
        CV_MULHHUN        : rv_instruction = RV_CV_MULHHUN;
        CV_MULHHURN       : rv_instruction = RV_CV_MULHHURN;
        CV_MULSN          : rv_instruction = RV_CV_MULSN;
        CV_MULSRN         : rv_instruction = RV_CV_MULSRN;
        CV_MULUN          : rv_instruction = RV_CV_MULUN;
        CV_MULURN         : rv_instruction = RV_CV_MULURN;
        CV_OR_B           : rv_instruction = RV_CV_OR_B;
        CV_OR_H           : rv_instruction = RV_CV_OR_H;
        CV_OR_SC_B        : rv_instruction = RV_CV_OR_SC_B;
        CV_OR_SC_H        : rv_instruction = RV_CV_OR_SC_H;
        CV_OR_SCI_B       : rv_instruction = RV_CV_OR_SCI_B;
        CV_OR_SCI_H       : rv_instruction = RV_CV_OR_SCI_H;
        CV_PACK           : rv_instruction = RV_CV_PACK;
        CV_PACK_H         : rv_instruction = RV_CV_PACK_H;
        CV_PACKHI_B       : rv_instruction = RV_CV_PACKHI_B;
        CV_PACKLO_B       : rv_instruction = RV_CV_PACKLO_B;
        CV_PI_LB          : rv_instruction = RV_CV_PI_LB;
        CV_PI_LBI         : rv_instruction = RV_CV_PI_LBI;
        CV_PI_LBU         : rv_instruction = RV_CV_PI_LBU;
        CV_PI_LBUI        : rv_instruction = RV_CV_PI_LBUI;
        CV_PI_LH          : rv_instruction = RV_CV_PI_LH;
        CV_PI_LHI         : rv_instruction = RV_CV_PI_LHI;
        CV_PI_LHU         : rv_instruction = RV_CV_PI_LHU;
        CV_PI_LHUI        : rv_instruction = RV_CV_PI_LHUI;
        CV_PI_LW          : rv_instruction = RV_CV_PI_LW;
        CV_PI_LWI         : rv_instruction = RV_CV_PI_LWI;
        CV_PI_SB          : rv_instruction = RV_CV_PI_SB;
        CV_PI_SBI         : rv_instruction = RV_CV_PI_SBI;
        CV_PI_SH          : rv_instruction = RV_CV_PI_SH;
        CV_PI_SHI         : rv_instruction = RV_CV_PI_SHI;
        CV_PI_SW          : rv_instruction = RV_CV_PI_SW;
        CV_PI_SWI         : rv_instruction = RV_CV_PI_SWI;
        CV_ROR            : rv_instruction = RV_CV_ROR;
        CV_SB             : rv_instruction = RV_CV_SB;
        CV_SDOTSP_B       : rv_instruction = RV_CV_SDOTSP_B;
        CV_SDOTSP_H       : rv_instruction = RV_CV_SDOTSP_H;
        CV_SDOTSP_SC_B    : rv_instruction = RV_CV_SDOTSP_SC_B;
        CV_SDOTSP_SC_H    : rv_instruction = RV_CV_SDOTSP_SC_H;
        CV_SDOTSP_SCI_B   : rv_instruction = RV_CV_SDOTSP_SCI_B;
        CV_SDOTSP_SCI_H   : rv_instruction = RV_CV_SDOTSP_SCI_H;
        CV_SDOTUP_B       : rv_instruction = RV_CV_SDOTUP_B;
        CV_SDOTUP_H       : rv_instruction = RV_CV_SDOTUP_H;
        CV_SDOTUP_SC_B    : rv_instruction = RV_CV_SDOTUP_SC_B;
        CV_SDOTUP_SC_H    : rv_instruction = RV_CV_SDOTUP_SC_H;
        CV_SDOTUP_SCI_B   : rv_instruction = RV_CV_SDOTUP_SCI_B;
        CV_SDOTUP_SCI_H   : rv_instruction = RV_CV_SDOTUP_SCI_H;
        CV_SDOTUSP_B      : rv_instruction = RV_CV_SDOTUSP_B;
        CV_SDOTUSP_H      : rv_instruction = RV_CV_SDOTUSP_H;
        CV_SDOTUSP_SC_B   : rv_instruction = RV_CV_SDOTUSP_SC_B;
        CV_SDOTUSP_SC_H   : rv_instruction = RV_CV_SDOTUSP_SC_H;
        CV_SDOTUSP_SCI_B  : rv_instruction = RV_CV_SDOTUSP_SCI_B;
        CV_SDOTUSP_SCI_H  : rv_instruction = RV_CV_SDOTUSP_SCI_H;
        CV_SETUP          : rv_instruction = RV_CV_SETUP;
        CV_SETUPI         : rv_instruction = RV_CV_SETUPI;
        CV_SH             : rv_instruction = RV_CV_SH;
        CV_SHUFFLE2_B     : rv_instruction = RV_CV_SHUFFLE2_B;
        CV_SHUFFLE2_H     : rv_instruction = RV_CV_SHUFFLE2_H;
        CV_SHUFFLEI0_SCI_B: rv_instruction = RV_CV_SHUFFLEI0_SCI_B;
        CV_SHUFFLEI1_SCI_B: rv_instruction = RV_CV_SHUFFLEI1_SCI_B;
        CV_SHUFFLEI2_SCI_B: rv_instruction = RV_CV_SHUFFLEI2_SCI_B;
        CV_SHUFFLEI3_SCI_B: rv_instruction = RV_CV_SHUFFLEI3_SCI_B;
        CV_SHUFFLE_B      : rv_instruction = RV_CV_SHUFFLE_B;
        CV_SHUFFLE_H      : rv_instruction = RV_CV_SHUFFLE_H;
        CV_SHUFFLE_SCI_H  : rv_instruction = RV_CV_SHUFFLE_SCI_H;
        CV_SLE            : rv_instruction = RV_CV_SLE;
        CV_SLEU           : rv_instruction = RV_CV_SLEU;
        CV_SLL_B          : rv_instruction = RV_CV_SLL_B;
        CV_SLL_H          : rv_instruction = RV_CV_SLL_H;
        CV_SLL_SC_B       : rv_instruction = RV_CV_SLL_SC_B;
        CV_SLL_SC_H       : rv_instruction = RV_CV_SLL_SC_H;
        CV_SLL_SCI_B      : rv_instruction = RV_CV_SLL_SCI_B;
        CV_SLL_SCI_H      : rv_instruction = RV_CV_SLL_SCI_H;
        CV_SRA_B          : rv_instruction = RV_CV_SRA_B;
        CV_SRA_H          : rv_instruction = RV_CV_SRA_H;
        CV_SRA_SC_B       : rv_instruction = RV_CV_SRA_SC_B;
        CV_SRA_SC_H       : rv_instruction = RV_CV_SRA_SC_H;
        CV_SRA_SCI_B      : rv_instruction = RV_CV_SRA_SCI_B;
        CV_SRA_SCI_H      : rv_instruction = RV_CV_SRA_SCI_H;
        CV_SRL_B          : rv_instruction = RV_CV_SRL_B;
        CV_SRL_H          : rv_instruction = RV_CV_SRL_H;
        CV_SRL_SC_B       : rv_instruction = RV_CV_SRL_SC_B;
        CV_SRL_SC_H       : rv_instruction = RV_CV_SRL_SC_H;
        CV_SRL_SCI_B      : rv_instruction = RV_CV_SRL_SCI_B;
        CV_SRL_SCI_H      : rv_instruction = RV_CV_SRL_SCI_H;
        CV_START          : rv_instruction = RV_CV_START;
        CV_STARTI         : rv_instruction = RV_CV_STARTI;
        CV_SUBN           : rv_instruction = RV_CV_SUBN;
        CV_SUBNR          : rv_instruction = RV_CV_SUBNR;
        CV_SUBRN          : rv_instruction = RV_CV_SUBRN;
        CV_SUBRNR         : rv_instruction = RV_CV_SUBRNR;
        CV_SUB_B          : rv_instruction = RV_CV_SUB_B;
        CV_SUB_DIV2       : rv_instruction = RV_CV_SUB_DIV2;
        CV_SUB_DIV4       : rv_instruction = RV_CV_SUB_DIV4;
        CV_SUB_DIV8       : rv_instruction = RV_CV_SUB_DIV8;
        CV_SUB_H          : rv_instruction = RV_CV_SUB_H;
        CV_SUB_SC_B       : rv_instruction = RV_CV_SUB_SC_B;
        CV_SUB_SC_H       : rv_instruction = RV_CV_SUB_SC_H;
        CV_SUB_SCI_B      : rv_instruction = RV_CV_SUB_SCI_B;
        CV_SUB_SCI_H      : rv_instruction = RV_CV_SUB_SCI_H;
        CV_SUBROTMJ       : rv_instruction = RV_CV_SUBROTMJ;
        CV_SUBROTMJ_DIV2  : rv_instruction = RV_CV_SUBROTMJ_DIV2;
        CV_SUBROTMJ_DIV4  : rv_instruction = RV_CV_SUBROTMJ_DIV4;
        CV_SUBROTMJ_DIV8  : rv_instruction = RV_CV_SUBROTMJ_DIV8;
        CV_SUBUN          : rv_instruction = RV_CV_SUBUN;
        CV_SUBUNR         : rv_instruction = RV_CV_SUBUNR;
        CV_SUBURN         : rv_instruction = RV_CV_SUBURN;
        CV_SUBURNR        : rv_instruction = RV_CV_SUBURNR;
        CV_SW             : rv_instruction = RV_CV_SW;
        CV_XOR_B          : rv_instruction = RV_CV_XOR_B;
        CV_XOR_H          : rv_instruction = RV_CV_XOR_H;
        CV_XOR_SC_B       : rv_instruction = RV_CV_XOR_SC_B;
        CV_XOR_SC_H       : rv_instruction = RV_CV_XOR_SC_H;
        CV_XOR_SCI_B      : rv_instruction = RV_CV_XOR_SCI_B;
        CV_XOR_SCI_H      : rv_instruction = RV_CV_XOR_SCI_H;
        DIV               : rv_instruction = RV_DIV;
        DIVU              : rv_instruction = RV_DIVU;
        EBREAK            : rv_instruction = RV_EBREAK;
        ECALL             : rv_instruction = RV_ECALL;
        FADD_S            : rv_instruction = RV_FADD_S;
        FCLASS_S          : rv_instruction = RV_FCLASS_S;
        FCVT_S_W          : rv_instruction = RV_FCVT_S_W;
        FCVT_S_WU         : rv_instruction = RV_FCVT_S_WU;
        FCVT_W_S          : rv_instruction = RV_FCVT_W_S;
        FCVT_WU_S         : rv_instruction = RV_FCVT_WU_S;
        FDIV_S            : rv_instruction = RV_FDIV_S;
        FENCE             : rv_instruction = RV_FENCE;
        FEQ_S             : rv_instruction = RV_FEQ_S;
        FLE_S             : rv_instruction = RV_FLE_S;
        FLT_S             : rv_instruction = RV_FLT_S;
        FLW               : rv_instruction = RV_FLW;
        FMADD_S           : rv_instruction = RV_FMADD_S;
        FMAX_S            : rv_instruction = RV_FMAX_S;
        FMIN_S            : rv_instruction = RV_FMIN_S;
        FMSUB_S           : rv_instruction = RV_FMSUB_S;
        FMUL_S            : rv_instruction = RV_FMUL_S;
        FMV_W_X           : rv_instruction = RV_FMV_W_X;
        FMV_X_W           : rv_instruction = RV_FMV_X_W;
        FNMADD_S          : rv_instruction = RV_FNMADD_S;
        FNMSUB_S          : rv_instruction = RV_FNMSUB_S;
        FSGNJ_S           : rv_instruction = RV_FSGNJ_S;
        FSGNJN_S          : rv_instruction = RV_FSGNJN_S;
        FSGNJX_S          : rv_instruction = RV_FSGNJX_S;
        FSQRT_S           : rv_instruction = RV_FSQRT_S;
        FSUB_S            : rv_instruction = RV_FSUB_S;
        FSW               : rv_instruction = RV_FSW;
        JAL               : rv_instruction = RV_JAL;
        JALR              : rv_instruction = RV_JALR;
        LB                : rv_instruction = RV_LB;
        LBU               : rv_instruction = RV_LBU;
        LH                : rv_instruction = RV_LH;
        LHU               : rv_instruction = RV_LHU;
        LR_W              : rv_instruction = RV_LR_W;
        LUI               : rv_instruction = RV_LUI;
        LW                : rv_instruction = RV_LW;
        MUL               : rv_instruction = RV_MUL;
        MULH              : rv_instruction = RV_MULH;
        MULHSU            : rv_instruction = RV_MULHSU;
        MULHU             : rv_instruction = RV_MULHU;
        OR                : rv_instruction = RV_OR;
        ORI               : rv_instruction = RV_ORI;
        REM               : rv_instruction = RV_REM;
        REMU              : rv_instruction = RV_REMU;
        SB                : rv_instruction = RV_SB;
        SC_W              : rv_instruction = RV_SC_W;
        SH                : rv_instruction = RV_SH;
        SLL               : rv_instruction = RV_SLL;
        SLLI              : rv_instruction = RV_SLLI;
        SLT               : rv_instruction = RV_SLT;
        SLTI              : rv_instruction = RV_SLTI;
        SLTIU             : rv_instruction = RV_SLTIU;
        SLTU              : rv_instruction = RV_SLTU;
        SRA               : rv_instruction = RV_SRA;
        SRAI              : rv_instruction = RV_SRAI;
        SRL               : rv_instruction = RV_SRL;
        SRLI              : rv_instruction = RV_SRLI;
        SUB               : rv_instruction = RV_SUB;
        SW                : rv_instruction = RV_SW;
        XOR               : rv_instruction = RV_XOR;
        XORI              : rv_instruction = RV_XORI;
        default           : rv_instruction = RV_UNKNOWN;
        endcase
    end
endmodule
