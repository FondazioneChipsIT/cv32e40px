// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// Wrapper for a fpnew
// Contributor: Davide Schiavone <davide@openhwgroup.org>

module cv32e40px_fp_wrapper
  import cv32e40px_apu_core_pkg::*;
#(
    parameter FPU_ADDMUL_LAT = 0, // Floating-Point ADDition/MULtiplication computing lane pipeline registers number
    parameter FPU_OTHERS_LAT = 0  // Floating-Point COMParison/CONVersion computing lanes pipeline registers number
) (
    // Clock and Reset
    input logic clk_i,
    input logic rst_ni,

    // APU Side: Master port
    input  logic apu_req_i,
    output logic apu_gnt_o,

    // request channel
    input logic [   APU_NARGS_CPU-1:0][31:0] apu_operands_i,
    input logic [     APU_WOP_CPU-1:0]       apu_op_i,
    input logic [APU_NDSFLAGS_CPU-1:0]       apu_flags_i,

    // response channel
    output logic                        apu_rvalid_o,
    output logic [                31:0] apu_rdata_o,
    output logic [APU_NUSFLAGS_CPU-1:0] apu_rflags_o
);


  import cv32e40px_pkg::*;
  import fpnew_pkg::*;

  logic [        fpnew_pkg::OP_BITS-1:0] fpu_op;
  logic                                  fpu_op_mod;
  logic                                  fpu_vec_op;

  logic [ fpnew_pkg::FP_FORMAT_BITS-1:0] fpu_dst_fmt;
  logic [ fpnew_pkg::FP_FORMAT_BITS-1:0] fpu_src_fmt;
  logic [fpnew_pkg::INT_FORMAT_BITS-1:0] fpu_int_fmt;
  logic [                      C_RM-1:0] fp_rnd_mode;



  // assign apu_rID_o = '0;

  // The core encodes the operation with its own, narrower enum:
  // cv32e40px_fpu_pkg::OP_BITS is 4 (FMADD..CPKCD), while this FPnew adds the
  // DOTP group and uses 5. APU_WOP_CPU is 6, sized for the core's {vec_op,
  // op_mod, op[3:0]}, so unpacking it straight into a 5-bit fpu_op made a 7-bit
  // target of a 6-bit source: every field shifted by one. op_mod landed in the
  // op's MSB and vec_op in op_mod, so every operation that sets the modifier was
  // sent as a different instruction - fmsub.s (FMADD + mod) arrived as EXVSUM,
  // an op from a group this configuration does not instantiate, which accepted
  // the request and never answered it. The core then waited on the APU forever.
  //
  // Unpack with the core's width and widen afterwards. The first fifteen
  // operations of the two enums are declared in the same order, so this is a
  // plain zero-extension; the DOTP operations beyond them have no encoding in
  // CV32E40Px and are simply not reachable from here.
  logic [cv32e40px_fpu_pkg::OP_BITS-1:0] fpu_op_core;

  assign {fpu_vec_op, fpu_op_mod, fpu_op_core}                = apu_op_i;
  assign fpu_op                                               = fpnew_pkg::OP_BITS'(fpu_op_core);

  assign {fpu_int_fmt, fpu_src_fmt, fpu_dst_fmt, fp_rnd_mode} = apu_flags_i;



  // -----------
  // FPU Config
  // -----------
  // Features (enabled formats, vectors etc.)
  // MAGIA: cvfpu pulp-v0.1.3 carries six FP formats (FP8alt) and five operation
  // groups (SDOTP), so both the format masks and the per-opgroup arrays are one
  // element wider than in the fpnew release this file was written against. The
  // shape below matches the CV32E40P wrapper MAGIA already builds against the
  // same cvfpu revision.
  localparam fpnew_pkg::fpu_features_t FPU_FEATURES = '{
    Width:         C_FLEN,
    EnableVectors: C_XFVEC,
    EnableNanBox:  1'b0,
    FpFmtMask:     {C_RVF, C_RVD, C_XF16, C_XF8, C_XF16ALT, C_XF8ALT},
    IntFmtMask:    {C_XFVEC && (C_XF8 || C_XF8ALT), C_XFVEC && (C_XF16 || C_XF16ALT), 1'b1, 1'b0}
  };

  // Implementation (number of registers etc)
  localparam fpnew_pkg::fpu_implementation_t FPU_IMPLEMENTATION = '{
    PipeRegs:  '{// FP32, FP64, FP16, FP8, FP16alt, FP8alt
                  '{FPU_ADDMUL_LAT, C_LAT_FP64, C_LAT_FP16, C_LAT_FP8, C_LAT_FP16ALT, C_LAT_FP8_ALT
                  }, // ADDMUL
                  '{default: C_LAT_DIVSQRT}, // DIVSQRT
                  '{default: C_LAT_NONCOMP}, // NONCOMP
                  '{default: C_LAT_CONV},    // CONV
                  '{default: C_LAT_DOTP}},   // SDOTP
    UnitTypes: '{'{default: fpnew_pkg::MERGED},   // ADDMUL
                  '{default: fpnew_pkg::MERGED},   // DIVSQRT
                  '{default: fpnew_pkg::PARALLEL}, // NONCOMP
                  '{default: fpnew_pkg::MERGED},   // CONV
                  '{default: fpnew_pkg::DISABLED}},// SDOTP
    PipeConfig: fpnew_pkg::AFTER
  };

  //---------------
  // FPU instance
  //---------------

  fpnew_top #(
      .Features      (FPU_FEATURES),
      .Implementation(FPU_IMPLEMENTATION),
      .TagType       (logic)
  ) i_fpnew_bulk (
      .clk_i         (clk_i),
      .rst_ni        (rst_ni),
      .hart_id_i     ('0),
      .operands_i    (apu_operands_i),
      .rnd_mode_i    (fpnew_pkg::roundmode_e'(fp_rnd_mode)),
      .op_i          (fpnew_pkg::operation_e'(fpu_op)),
      .op_mod_i      (fpu_op_mod),
      .src_fmt_i     (fpnew_pkg::fp_format_e'(fpu_src_fmt)),
      .dst_fmt_i     (fpnew_pkg::fp_format_e'(fpu_dst_fmt)),
      .int_fmt_i     (fpnew_pkg::int_format_e'(fpu_int_fmt)),
      .vectorial_op_i(fpu_vec_op),
      .tag_i         (1'b0),
      .simd_mask_i   ('0),
      .in_valid_i    (apu_req_i),
      .in_ready_o    (apu_gnt_o),
      .flush_i       (1'b0),
      .result_o      (apu_rdata_o),
      .status_o      (apu_rflags_o),
      .tag_o         (  /* unused */),
      .out_valid_o   (apu_rvalid_o),
      .out_ready_i   (1'b1),
      .busy_o        (  /* unused */)
  );



endmodule  // cv32e40px_fp_wrapper

