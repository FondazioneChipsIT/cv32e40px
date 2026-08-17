/* SPDX-License-Identifier: BSD-3-Clause */
module vector_decoder
    import vector_pkg::*;
(
    input logic [31:0] instruction,
    output logic is_VAADD_VV,
    output logic is_VAADD_VX,
    output logic is_VAADDU_VV,
    output logic is_VAADDU_VX,
    output logic is_VADC_VIM,
    output logic is_VADC_VVM,
    output logic is_VADC_VXM,
    output logic is_VADD_VI,
    output logic is_VADD_VV,
    output logic is_VADD_VX,
    output logic is_VAND_VI,
    output logic is_VAND_VV,
    output logic is_VAND_VX,
    output logic is_VASUB_VV,
    output logic is_VASUB_VX,
    output logic is_VASUBU_VV,
    output logic is_VASUBU_VX,
    output logic is_VCOMPRESS_VM,
    output logic is_VCPOP_M,
    output logic is_VDIV_VV,
    output logic is_VDIV_VX,
    output logic is_VDIVU_VV,
    output logic is_VDIVU_VX,
    output logic is_VFADD_VF,
    output logic is_VFADD_VV,
    output logic is_VFCLASS_V,
    output logic is_VFCVT_F_X_V,
    output logic is_VFCVT_F_XU_V,
    output logic is_VFCVT_RTZ_X_F_V,
    output logic is_VFCVT_RTZ_XU_F_V,
    output logic is_VFCVT_X_F_V,
    output logic is_VFCVT_XU_F_V,
    output logic is_VFDIV_VF,
    output logic is_VFDIV_VV,
    output logic is_VFIRST_M,
    output logic is_VFMACC_VF,
    output logic is_VFMACC_VV,
    output logic is_VFMADD_VF,
    output logic is_VFMADD_VV,
    output logic is_VFMAX_VF,
    output logic is_VFMAX_VV,
    output logic is_VFMERGE_VFM,
    output logic is_VFMIN_VF,
    output logic is_VFMIN_VV,
    output logic is_VFMSAC_VF,
    output logic is_VFMSAC_VV,
    output logic is_VFMSUB_VF,
    output logic is_VFMSUB_VV,
    output logic is_VFMUL_VF,
    output logic is_VFMUL_VV,
    output logic is_VFMV_F_S,
    output logic is_VFMV_S_F,
    output logic is_VFMV_V_F,
    output logic is_VFNCVT_F_F_W,
    output logic is_VFNCVT_F_X_W,
    output logic is_VFNCVT_F_XU_W,
    output logic is_VFNCVT_ROD_F_F_W,
    output logic is_VFNCVT_RTZ_X_F_W,
    output logic is_VFNCVT_RTZ_XU_F_W,
    output logic is_VFNCVT_X_F_W,
    output logic is_VFNCVT_XU_F_W,
    output logic is_VFNMACC_VF,
    output logic is_VFNMACC_VV,
    output logic is_VFNMADD_VF,
    output logic is_VFNMADD_VV,
    output logic is_VFNMSAC_VF,
    output logic is_VFNMSAC_VV,
    output logic is_VFNMSUB_VF,
    output logic is_VFNMSUB_VV,
    output logic is_VFRDIV_VF,
    output logic is_VFREC7_V,
    output logic is_VFREDMAX_VS,
    output logic is_VFREDMIN_VS,
    output logic is_VFREDOSUM_VS,
    output logic is_VFREDUSUM_VS,
    output logic is_VFRSQRT7_V,
    output logic is_VFRSUB_VF,
    output logic is_VFSGNJ_VF,
    output logic is_VFSGNJ_VV,
    output logic is_VFSGNJN_VF,
    output logic is_VFSGNJN_VV,
    output logic is_VFSGNJX_VF,
    output logic is_VFSGNJX_VV,
    output logic is_VFSLIDE1DOWN_VF,
    output logic is_VFSLIDE1UP_VF,
    output logic is_VFSQRT_V,
    output logic is_VFSUB_VF,
    output logic is_VFSUB_VV,
    output logic is_VFWADD_VF,
    output logic is_VFWADD_VV,
    output logic is_VFWADD_WF,
    output logic is_VFWADD_WV,
    output logic is_VFWCVT_F_F_V,
    output logic is_VFWCVT_F_X_V,
    output logic is_VFWCVT_F_XU_V,
    output logic is_VFWCVT_RTZ_X_F_V,
    output logic is_VFWCVT_RTZ_XU_F_V,
    output logic is_VFWCVT_X_F_V,
    output logic is_VFWCVT_XU_F_V,
    output logic is_VFWMACC_VF,
    output logic is_VFWMACC_VV,
    output logic is_VFWMSAC_VF,
    output logic is_VFWMSAC_VV,
    output logic is_VFWMUL_VF,
    output logic is_VFWMUL_VV,
    output logic is_VFWNMACC_VF,
    output logic is_VFWNMACC_VV,
    output logic is_VFWNMSAC_VF,
    output logic is_VFWNMSAC_VV,
    output logic is_VFWREDOSUM_VS,
    output logic is_VFWREDUSUM_VS,
    output logic is_VFWSUB_VF,
    output logic is_VFWSUB_VV,
    output logic is_VFWSUB_WF,
    output logic is_VFWSUB_WV,
    output logic is_VID_V,
    output logic is_VIOTA_M,
    output logic is_VL1RE16_V,
    output logic is_VL1RE32_V,
    output logic is_VL1RE64_V,
    output logic is_VL1RE8_V,
    output logic is_VL2RE16_V,
    output logic is_VL2RE32_V,
    output logic is_VL2RE64_V,
    output logic is_VL2RE8_V,
    output logic is_VL4RE16_V,
    output logic is_VL4RE32_V,
    output logic is_VL4RE64_V,
    output logic is_VL4RE8_V,
    output logic is_VL8RE16_V,
    output logic is_VL8RE32_V,
    output logic is_VL8RE64_V,
    output logic is_VL8RE8_V,
    output logic is_VLE16_V,
    output logic is_VLE16FF_V,
    output logic is_VLE32_V,
    output logic is_VLE32FF_V,
    output logic is_VLE64_V,
    output logic is_VLE64FF_V,
    output logic is_VLE8_V,
    output logic is_VLE8FF_V,
    output logic is_VLM_V,
    output logic is_VLOXEI16_V,
    output logic is_VLOXEI32_V,
    output logic is_VLOXEI64_V,
    output logic is_VLOXEI8_V,
    output logic is_VLSE16_V,
    output logic is_VLSE32_V,
    output logic is_VLSE64_V,
    output logic is_VLSE8_V,
    output logic is_VLUXEI16_V,
    output logic is_VLUXEI32_V,
    output logic is_VLUXEI64_V,
    output logic is_VLUXEI8_V,
    output logic is_VMACC_VV,
    output logic is_VMACC_VX,
    output logic is_VMADC_VI,
    output logic is_VMADC_VIM,
    output logic is_VMADC_VV,
    output logic is_VMADC_VVM,
    output logic is_VMADC_VX,
    output logic is_VMADC_VXM,
    output logic is_VMADD_VV,
    output logic is_VMADD_VX,
    output logic is_VMAND_MM,
    output logic is_VMANDN_MM,
    output logic is_VMAX_VV,
    output logic is_VMAX_VX,
    output logic is_VMAXU_VV,
    output logic is_VMAXU_VX,
    output logic is_VMERGE_VIM,
    output logic is_VMERGE_VVM,
    output logic is_VMERGE_VXM,
    output logic is_VMFEQ_VF,
    output logic is_VMFEQ_VV,
    output logic is_VMFGE_VF,
    output logic is_VMFGT_VF,
    output logic is_VMFLE_VF,
    output logic is_VMFLE_VV,
    output logic is_VMFLT_VF,
    output logic is_VMFLT_VV,
    output logic is_VMFNE_VF,
    output logic is_VMFNE_VV,
    output logic is_VMIN_VV,
    output logic is_VMIN_VX,
    output logic is_VMINU_VV,
    output logic is_VMINU_VX,
    output logic is_VMNAND_MM,
    output logic is_VMNOR_MM,
    output logic is_VMOR_MM,
    output logic is_VMORN_MM,
    output logic is_VMSBC_VV,
    output logic is_VMSBC_VVM,
    output logic is_VMSBC_VX,
    output logic is_VMSBC_VXM,
    output logic is_VMSBF_M,
    output logic is_VMSEQ_VI,
    output logic is_VMSEQ_VV,
    output logic is_VMSEQ_VX,
    output logic is_VMSGT_VI,
    output logic is_VMSGT_VX,
    output logic is_VMSGTU_VI,
    output logic is_VMSGTU_VX,
    output logic is_VMSIF_M,
    output logic is_VMSLE_VI,
    output logic is_VMSLE_VV,
    output logic is_VMSLE_VX,
    output logic is_VMSLEU_VI,
    output logic is_VMSLEU_VV,
    output logic is_VMSLEU_VX,
    output logic is_VMSLT_VV,
    output logic is_VMSLT_VX,
    output logic is_VMSLTU_VV,
    output logic is_VMSLTU_VX,
    output logic is_VMSNE_VI,
    output logic is_VMSNE_VV,
    output logic is_VMSNE_VX,
    output logic is_VMSOF_M,
    output logic is_VMUL_VV,
    output logic is_VMUL_VX,
    output logic is_VMULH_VV,
    output logic is_VMULH_VX,
    output logic is_VMULHSU_VV,
    output logic is_VMULHSU_VX,
    output logic is_VMULHU_VV,
    output logic is_VMULHU_VX,
    output logic is_VMV1R_V,
    output logic is_VMV2R_V,
    output logic is_VMV4R_V,
    output logic is_VMV8R_V,
    output logic is_VMV_S_X,
    output logic is_VMV_V_I,
    output logic is_VMV_V_V,
    output logic is_VMV_V_X,
    output logic is_VMV_X_S,
    output logic is_VMXNOR_MM,
    output logic is_VMXOR_MM,
    output logic is_VNCLIP_WI,
    output logic is_VNCLIP_WV,
    output logic is_VNCLIP_WX,
    output logic is_VNCLIPU_WI,
    output logic is_VNCLIPU_WV,
    output logic is_VNCLIPU_WX,
    output logic is_VNMSAC_VV,
    output logic is_VNMSAC_VX,
    output logic is_VNMSUB_VV,
    output logic is_VNMSUB_VX,
    output logic is_VNSRA_WI,
    output logic is_VNSRA_WV,
    output logic is_VNSRA_WX,
    output logic is_VNSRL_WI,
    output logic is_VNSRL_WV,
    output logic is_VNSRL_WX,
    output logic is_VOR_VI,
    output logic is_VOR_VV,
    output logic is_VOR_VX,
    output logic is_VREDAND_VS,
    output logic is_VREDMAX_VS,
    output logic is_VREDMAXU_VS,
    output logic is_VREDMIN_VS,
    output logic is_VREDMINU_VS,
    output logic is_VREDOR_VS,
    output logic is_VREDSUM_VS,
    output logic is_VREDXOR_VS,
    output logic is_VREM_VV,
    output logic is_VREM_VX,
    output logic is_VREMU_VV,
    output logic is_VREMU_VX,
    output logic is_VRGATHER_VI,
    output logic is_VRGATHER_VV,
    output logic is_VRGATHER_VX,
    output logic is_VRGATHEREI16_VV,
    output logic is_VRSUB_VI,
    output logic is_VRSUB_VX,
    output logic is_VS1R_V,
    output logic is_VS2R_V,
    output logic is_VS4R_V,
    output logic is_VS8R_V,
    output logic is_VSADD_VI,
    output logic is_VSADD_VV,
    output logic is_VSADD_VX,
    output logic is_VSADDU_VI,
    output logic is_VSADDU_VV,
    output logic is_VSADDU_VX,
    output logic is_VSBC_VVM,
    output logic is_VSBC_VXM,
    output logic is_VSE16_V,
    output logic is_VSE32_V,
    output logic is_VSE64_V,
    output logic is_VSE8_V,
    output logic is_VSETIVLI,
    output logic is_VSETVL,
    output logic is_VSETVLI,
    output logic is_VSEXT_VF2,
    output logic is_VSEXT_VF4,
    output logic is_VSEXT_VF8,
    output logic is_VSLIDE1DOWN_VX,
    output logic is_VSLIDE1UP_VX,
    output logic is_VSLIDEDOWN_VI,
    output logic is_VSLIDEDOWN_VX,
    output logic is_VSLIDEUP_VI,
    output logic is_VSLIDEUP_VX,
    output logic is_VSLL_VI,
    output logic is_VSLL_VV,
    output logic is_VSLL_VX,
    output logic is_VSM_V,
    output logic is_VSMUL_VV,
    output logic is_VSMUL_VX,
    output logic is_VSOXEI16_V,
    output logic is_VSOXEI32_V,
    output logic is_VSOXEI64_V,
    output logic is_VSOXEI8_V,
    output logic is_VSRA_VI,
    output logic is_VSRA_VV,
    output logic is_VSRA_VX,
    output logic is_VSRL_VI,
    output logic is_VSRL_VV,
    output logic is_VSRL_VX,
    output logic is_VSSE16_V,
    output logic is_VSSE32_V,
    output logic is_VSSE64_V,
    output logic is_VSSE8_V,
    output logic is_VSSRA_VI,
    output logic is_VSSRA_VV,
    output logic is_VSSRA_VX,
    output logic is_VSSRL_VI,
    output logic is_VSSRL_VV,
    output logic is_VSSRL_VX,
    output logic is_VSSUB_VV,
    output logic is_VSSUB_VX,
    output logic is_VSSUBU_VV,
    output logic is_VSSUBU_VX,
    output logic is_VSUB_VV,
    output logic is_VSUB_VX,
    output logic is_VSUXEI16_V,
    output logic is_VSUXEI32_V,
    output logic is_VSUXEI64_V,
    output logic is_VSUXEI8_V,
    output logic is_VWADD_VV,
    output logic is_VWADD_VX,
    output logic is_VWADD_WV,
    output logic is_VWADD_WX,
    output logic is_VWADDU_VV,
    output logic is_VWADDU_VX,
    output logic is_VWADDU_WV,
    output logic is_VWADDU_WX,
    output logic is_VWMACC_VV,
    output logic is_VWMACC_VX,
    output logic is_VWMACCSU_VV,
    output logic is_VWMACCSU_VX,
    output logic is_VWMACCU_VV,
    output logic is_VWMACCU_VX,
    output logic is_VWMACCUS_VX,
    output logic is_VWMUL_VV,
    output logic is_VWMUL_VX,
    output logic is_VWMULSU_VV,
    output logic is_VWMULSU_VX,
    output logic is_VWMULU_VV,
    output logic is_VWMULU_VX,
    output logic is_VWREDSUM_VS,
    output logic is_VWREDSUMU_VS,
    output logic is_VWSUB_VV,
    output logic is_VWSUB_VX,
    output logic is_VWSUB_WV,
    output logic is_VWSUB_WX,
    output logic is_VWSUBU_VV,
    output logic is_VWSUBU_VX,
    output logic is_VWSUBU_WV,
    output logic is_VWSUBU_WX,
    output logic is_VXOR_VI,
    output logic is_VXOR_VV,
    output logic is_VXOR_VX,
    output logic is_VZEXT_VF2,
    output logic is_VZEXT_VF4,
    output logic is_VZEXT_VF8,
    output riscv_v_instr_e rv_instruction
);

    /* is_X instruction flags  */
    assign is_VAADD_VV           = instruction ==? VAADD_VV;
    assign is_VAADD_VX           = instruction ==? VAADD_VX;
    assign is_VAADDU_VV          = instruction ==? VAADDU_VV;
    assign is_VAADDU_VX          = instruction ==? VAADDU_VX;
    assign is_VADC_VIM           = instruction ==? VADC_VIM;
    assign is_VADC_VVM           = instruction ==? VADC_VVM;
    assign is_VADC_VXM           = instruction ==? VADC_VXM;
    assign is_VADD_VI            = instruction ==? VADD_VI;
    assign is_VADD_VV            = instruction ==? VADD_VV;
    assign is_VADD_VX            = instruction ==? VADD_VX;
    assign is_VAND_VI            = instruction ==? VAND_VI;
    assign is_VAND_VV            = instruction ==? VAND_VV;
    assign is_VAND_VX            = instruction ==? VAND_VX;
    assign is_VASUB_VV           = instruction ==? VASUB_VV;
    assign is_VASUB_VX           = instruction ==? VASUB_VX;
    assign is_VASUBU_VV          = instruction ==? VASUBU_VV;
    assign is_VASUBU_VX          = instruction ==? VASUBU_VX;
    assign is_VCOMPRESS_VM       = instruction ==? VCOMPRESS_VM;
    assign is_VCPOP_M            = instruction ==? VCPOP_M;
    assign is_VDIV_VV            = instruction ==? VDIV_VV;
    assign is_VDIV_VX            = instruction ==? VDIV_VX;
    assign is_VDIVU_VV           = instruction ==? VDIVU_VV;
    assign is_VDIVU_VX           = instruction ==? VDIVU_VX;
    assign is_VFADD_VF           = instruction ==? VFADD_VF;
    assign is_VFADD_VV           = instruction ==? VFADD_VV;
    assign is_VFCLASS_V          = instruction ==? VFCLASS_V;
    assign is_VFCVT_F_X_V        = instruction ==? VFCVT_F_X_V;
    assign is_VFCVT_F_XU_V       = instruction ==? VFCVT_F_XU_V;
    assign is_VFCVT_RTZ_X_F_V    = instruction ==? VFCVT_RTZ_X_F_V;
    assign is_VFCVT_RTZ_XU_F_V   = instruction ==? VFCVT_RTZ_XU_F_V;
    assign is_VFCVT_X_F_V        = instruction ==? VFCVT_X_F_V;
    assign is_VFCVT_XU_F_V       = instruction ==? VFCVT_XU_F_V;
    assign is_VFDIV_VF           = instruction ==? VFDIV_VF;
    assign is_VFDIV_VV           = instruction ==? VFDIV_VV;
    assign is_VFIRST_M           = instruction ==? VFIRST_M;
    assign is_VFMACC_VF          = instruction ==? VFMACC_VF;
    assign is_VFMACC_VV          = instruction ==? VFMACC_VV;
    assign is_VFMADD_VF          = instruction ==? VFMADD_VF;
    assign is_VFMADD_VV          = instruction ==? VFMADD_VV;
    assign is_VFMAX_VF           = instruction ==? VFMAX_VF;
    assign is_VFMAX_VV           = instruction ==? VFMAX_VV;
    assign is_VFMERGE_VFM        = instruction ==? VFMERGE_VFM;
    assign is_VFMIN_VF           = instruction ==? VFMIN_VF;
    assign is_VFMIN_VV           = instruction ==? VFMIN_VV;
    assign is_VFMSAC_VF          = instruction ==? VFMSAC_VF;
    assign is_VFMSAC_VV          = instruction ==? VFMSAC_VV;
    assign is_VFMSUB_VF          = instruction ==? VFMSUB_VF;
    assign is_VFMSUB_VV          = instruction ==? VFMSUB_VV;
    assign is_VFMUL_VF           = instruction ==? VFMUL_VF;
    assign is_VFMUL_VV           = instruction ==? VFMUL_VV;
    assign is_VFMV_F_S           = instruction ==? VFMV_F_S;
    assign is_VFMV_S_F           = instruction ==? VFMV_S_F;
    assign is_VFMV_V_F           = instruction ==? VFMV_V_F;
    assign is_VFNCVT_F_F_W       = instruction ==? VFNCVT_F_F_W;
    assign is_VFNCVT_F_X_W       = instruction ==? VFNCVT_F_X_W;
    assign is_VFNCVT_F_XU_W      = instruction ==? VFNCVT_F_XU_W;
    assign is_VFNCVT_ROD_F_F_W   = instruction ==? VFNCVT_ROD_F_F_W;
    assign is_VFNCVT_RTZ_X_F_W   = instruction ==? VFNCVT_RTZ_X_F_W;
    assign is_VFNCVT_RTZ_XU_F_W  = instruction ==? VFNCVT_RTZ_XU_F_W;
    assign is_VFNCVT_X_F_W       = instruction ==? VFNCVT_X_F_W;
    assign is_VFNCVT_XU_F_W      = instruction ==? VFNCVT_XU_F_W;
    assign is_VFNMACC_VF         = instruction ==? VFNMACC_VF;
    assign is_VFNMACC_VV         = instruction ==? VFNMACC_VV;
    assign is_VFNMADD_VF         = instruction ==? VFNMADD_VF;
    assign is_VFNMADD_VV         = instruction ==? VFNMADD_VV;
    assign is_VFNMSAC_VF         = instruction ==? VFNMSAC_VF;
    assign is_VFNMSAC_VV         = instruction ==? VFNMSAC_VV;
    assign is_VFNMSUB_VF         = instruction ==? VFNMSUB_VF;
    assign is_VFNMSUB_VV         = instruction ==? VFNMSUB_VV;
    assign is_VFRDIV_VF          = instruction ==? VFRDIV_VF;
    assign is_VFREC7_V           = instruction ==? VFREC7_V;
    assign is_VFREDMAX_VS        = instruction ==? VFREDMAX_VS;
    assign is_VFREDMIN_VS        = instruction ==? VFREDMIN_VS;
    assign is_VFREDOSUM_VS       = instruction ==? VFREDOSUM_VS;
    assign is_VFREDUSUM_VS       = instruction ==? VFREDUSUM_VS;
    assign is_VFRSQRT7_V         = instruction ==? VFRSQRT7_V;
    assign is_VFRSUB_VF          = instruction ==? VFRSUB_VF;
    assign is_VFSGNJ_VF          = instruction ==? VFSGNJ_VF;
    assign is_VFSGNJ_VV          = instruction ==? VFSGNJ_VV;
    assign is_VFSGNJN_VF         = instruction ==? VFSGNJN_VF;
    assign is_VFSGNJN_VV         = instruction ==? VFSGNJN_VV;
    assign is_VFSGNJX_VF         = instruction ==? VFSGNJX_VF;
    assign is_VFSGNJX_VV         = instruction ==? VFSGNJX_VV;
    assign is_VFSLIDE1DOWN_VF    = instruction ==? VFSLIDE1DOWN_VF;
    assign is_VFSLIDE1UP_VF      = instruction ==? VFSLIDE1UP_VF;
    assign is_VFSQRT_V           = instruction ==? VFSQRT_V;
    assign is_VFSUB_VF           = instruction ==? VFSUB_VF;
    assign is_VFSUB_VV           = instruction ==? VFSUB_VV;
    assign is_VFWADD_VF          = instruction ==? VFWADD_VF;
    assign is_VFWADD_VV          = instruction ==? VFWADD_VV;
    assign is_VFWADD_WF          = instruction ==? VFWADD_WF;
    assign is_VFWADD_WV          = instruction ==? VFWADD_WV;
    assign is_VFWCVT_F_F_V       = instruction ==? VFWCVT_F_F_V;
    assign is_VFWCVT_F_X_V       = instruction ==? VFWCVT_F_X_V;
    assign is_VFWCVT_F_XU_V      = instruction ==? VFWCVT_F_XU_V;
    assign is_VFWCVT_RTZ_X_F_V   = instruction ==? VFWCVT_RTZ_X_F_V;
    assign is_VFWCVT_RTZ_XU_F_V  = instruction ==? VFWCVT_RTZ_XU_F_V;
    assign is_VFWCVT_X_F_V       = instruction ==? VFWCVT_X_F_V;
    assign is_VFWCVT_XU_F_V      = instruction ==? VFWCVT_XU_F_V;
    assign is_VFWMACC_VF         = instruction ==? VFWMACC_VF;
    assign is_VFWMACC_VV         = instruction ==? VFWMACC_VV;
    assign is_VFWMSAC_VF         = instruction ==? VFWMSAC_VF;
    assign is_VFWMSAC_VV         = instruction ==? VFWMSAC_VV;
    assign is_VFWMUL_VF          = instruction ==? VFWMUL_VF;
    assign is_VFWMUL_VV          = instruction ==? VFWMUL_VV;
    assign is_VFWNMACC_VF        = instruction ==? VFWNMACC_VF;
    assign is_VFWNMACC_VV        = instruction ==? VFWNMACC_VV;
    assign is_VFWNMSAC_VF        = instruction ==? VFWNMSAC_VF;
    assign is_VFWNMSAC_VV        = instruction ==? VFWNMSAC_VV;
    assign is_VFWREDOSUM_VS      = instruction ==? VFWREDOSUM_VS;
    assign is_VFWREDUSUM_VS      = instruction ==? VFWREDUSUM_VS;
    assign is_VFWSUB_VF          = instruction ==? VFWSUB_VF;
    assign is_VFWSUB_VV          = instruction ==? VFWSUB_VV;
    assign is_VFWSUB_WF          = instruction ==? VFWSUB_WF;
    assign is_VFWSUB_WV          = instruction ==? VFWSUB_WV;
    assign is_VID_V              = instruction ==? VID_V;
    assign is_VIOTA_M            = instruction ==? VIOTA_M;
    assign is_VL1RE16_V          = instruction ==? VL1RE16_V;
    assign is_VL1RE32_V          = instruction ==? VL1RE32_V;
    assign is_VL1RE64_V          = instruction ==? VL1RE64_V;
    assign is_VL1RE8_V           = instruction ==? VL1RE8_V;
    assign is_VL2RE16_V          = instruction ==? VL2RE16_V;
    assign is_VL2RE32_V          = instruction ==? VL2RE32_V;
    assign is_VL2RE64_V          = instruction ==? VL2RE64_V;
    assign is_VL2RE8_V           = instruction ==? VL2RE8_V;
    assign is_VL4RE16_V          = instruction ==? VL4RE16_V;
    assign is_VL4RE32_V          = instruction ==? VL4RE32_V;
    assign is_VL4RE64_V          = instruction ==? VL4RE64_V;
    assign is_VL4RE8_V           = instruction ==? VL4RE8_V;
    assign is_VL8RE16_V          = instruction ==? VL8RE16_V;
    assign is_VL8RE32_V          = instruction ==? VL8RE32_V;
    assign is_VL8RE64_V          = instruction ==? VL8RE64_V;
    assign is_VL8RE8_V           = instruction ==? VL8RE8_V;
    assign is_VLE16_V            = instruction ==? VLE16_V;
    assign is_VLE16FF_V          = instruction ==? VLE16FF_V;
    assign is_VLE32_V            = instruction ==? VLE32_V;
    assign is_VLE32FF_V          = instruction ==? VLE32FF_V;
    assign is_VLE64_V            = instruction ==? VLE64_V;
    assign is_VLE64FF_V          = instruction ==? VLE64FF_V;
    assign is_VLE8_V             = instruction ==? VLE8_V;
    assign is_VLE8FF_V           = instruction ==? VLE8FF_V;
    assign is_VLM_V              = instruction ==? VLM_V;
    assign is_VLOXEI16_V         = instruction ==? VLOXEI16_V;
    assign is_VLOXEI32_V         = instruction ==? VLOXEI32_V;
    assign is_VLOXEI64_V         = instruction ==? VLOXEI64_V;
    assign is_VLOXEI8_V          = instruction ==? VLOXEI8_V;
    assign is_VLSE16_V           = instruction ==? VLSE16_V;
    assign is_VLSE32_V           = instruction ==? VLSE32_V;
    assign is_VLSE64_V           = instruction ==? VLSE64_V;
    assign is_VLSE8_V            = instruction ==? VLSE8_V;
    assign is_VLUXEI16_V         = instruction ==? VLUXEI16_V;
    assign is_VLUXEI32_V         = instruction ==? VLUXEI32_V;
    assign is_VLUXEI64_V         = instruction ==? VLUXEI64_V;
    assign is_VLUXEI8_V          = instruction ==? VLUXEI8_V;
    assign is_VMACC_VV           = instruction ==? VMACC_VV;
    assign is_VMACC_VX           = instruction ==? VMACC_VX;
    assign is_VMADC_VI           = instruction ==? VMADC_VI;
    assign is_VMADC_VIM          = instruction ==? VMADC_VIM;
    assign is_VMADC_VV           = instruction ==? VMADC_VV;
    assign is_VMADC_VVM          = instruction ==? VMADC_VVM;
    assign is_VMADC_VX           = instruction ==? VMADC_VX;
    assign is_VMADC_VXM          = instruction ==? VMADC_VXM;
    assign is_VMADD_VV           = instruction ==? VMADD_VV;
    assign is_VMADD_VX           = instruction ==? VMADD_VX;
    assign is_VMAND_MM           = instruction ==? VMAND_MM;
    assign is_VMANDN_MM          = instruction ==? VMANDN_MM;
    assign is_VMAX_VV            = instruction ==? VMAX_VV;
    assign is_VMAX_VX            = instruction ==? VMAX_VX;
    assign is_VMAXU_VV           = instruction ==? VMAXU_VV;
    assign is_VMAXU_VX           = instruction ==? VMAXU_VX;
    assign is_VMERGE_VIM         = instruction ==? VMERGE_VIM;
    assign is_VMERGE_VVM         = instruction ==? VMERGE_VVM;
    assign is_VMERGE_VXM         = instruction ==? VMERGE_VXM;
    assign is_VMFEQ_VF           = instruction ==? VMFEQ_VF;
    assign is_VMFEQ_VV           = instruction ==? VMFEQ_VV;
    assign is_VMFGE_VF           = instruction ==? VMFGE_VF;
    assign is_VMFGT_VF           = instruction ==? VMFGT_VF;
    assign is_VMFLE_VF           = instruction ==? VMFLE_VF;
    assign is_VMFLE_VV           = instruction ==? VMFLE_VV;
    assign is_VMFLT_VF           = instruction ==? VMFLT_VF;
    assign is_VMFLT_VV           = instruction ==? VMFLT_VV;
    assign is_VMFNE_VF           = instruction ==? VMFNE_VF;
    assign is_VMFNE_VV           = instruction ==? VMFNE_VV;
    assign is_VMIN_VV            = instruction ==? VMIN_VV;
    assign is_VMIN_VX            = instruction ==? VMIN_VX;
    assign is_VMINU_VV           = instruction ==? VMINU_VV;
    assign is_VMINU_VX           = instruction ==? VMINU_VX;
    assign is_VMNAND_MM          = instruction ==? VMNAND_MM;
    assign is_VMNOR_MM           = instruction ==? VMNOR_MM;
    assign is_VMOR_MM            = instruction ==? VMOR_MM;
    assign is_VMORN_MM           = instruction ==? VMORN_MM;
    assign is_VMSBC_VV           = instruction ==? VMSBC_VV;
    assign is_VMSBC_VVM          = instruction ==? VMSBC_VVM;
    assign is_VMSBC_VX           = instruction ==? VMSBC_VX;
    assign is_VMSBC_VXM          = instruction ==? VMSBC_VXM;
    assign is_VMSBF_M            = instruction ==? VMSBF_M;
    assign is_VMSEQ_VI           = instruction ==? VMSEQ_VI;
    assign is_VMSEQ_VV           = instruction ==? VMSEQ_VV;
    assign is_VMSEQ_VX           = instruction ==? VMSEQ_VX;
    assign is_VMSGT_VI           = instruction ==? VMSGT_VI;
    assign is_VMSGT_VX           = instruction ==? VMSGT_VX;
    assign is_VMSGTU_VI          = instruction ==? VMSGTU_VI;
    assign is_VMSGTU_VX          = instruction ==? VMSGTU_VX;
    assign is_VMSIF_M            = instruction ==? VMSIF_M;
    assign is_VMSLE_VI           = instruction ==? VMSLE_VI;
    assign is_VMSLE_VV           = instruction ==? VMSLE_VV;
    assign is_VMSLE_VX           = instruction ==? VMSLE_VX;
    assign is_VMSLEU_VI          = instruction ==? VMSLEU_VI;
    assign is_VMSLEU_VV          = instruction ==? VMSLEU_VV;
    assign is_VMSLEU_VX          = instruction ==? VMSLEU_VX;
    assign is_VMSLT_VV           = instruction ==? VMSLT_VV;
    assign is_VMSLT_VX           = instruction ==? VMSLT_VX;
    assign is_VMSLTU_VV          = instruction ==? VMSLTU_VV;
    assign is_VMSLTU_VX          = instruction ==? VMSLTU_VX;
    assign is_VMSNE_VI           = instruction ==? VMSNE_VI;
    assign is_VMSNE_VV           = instruction ==? VMSNE_VV;
    assign is_VMSNE_VX           = instruction ==? VMSNE_VX;
    assign is_VMSOF_M            = instruction ==? VMSOF_M;
    assign is_VMUL_VV            = instruction ==? VMUL_VV;
    assign is_VMUL_VX            = instruction ==? VMUL_VX;
    assign is_VMULH_VV           = instruction ==? VMULH_VV;
    assign is_VMULH_VX           = instruction ==? VMULH_VX;
    assign is_VMULHSU_VV         = instruction ==? VMULHSU_VV;
    assign is_VMULHSU_VX         = instruction ==? VMULHSU_VX;
    assign is_VMULHU_VV          = instruction ==? VMULHU_VV;
    assign is_VMULHU_VX          = instruction ==? VMULHU_VX;
    assign is_VMV1R_V            = instruction ==? VMV1R_V;
    assign is_VMV2R_V            = instruction ==? VMV2R_V;
    assign is_VMV4R_V            = instruction ==? VMV4R_V;
    assign is_VMV8R_V            = instruction ==? VMV8R_V;
    assign is_VMV_S_X            = instruction ==? VMV_S_X;
    assign is_VMV_V_I            = instruction ==? VMV_V_I;
    assign is_VMV_V_V            = instruction ==? VMV_V_V;
    assign is_VMV_V_X            = instruction ==? VMV_V_X;
    assign is_VMV_X_S            = instruction ==? VMV_X_S;
    assign is_VMXNOR_MM          = instruction ==? VMXNOR_MM;
    assign is_VMXOR_MM           = instruction ==? VMXOR_MM;
    assign is_VNCLIP_WI          = instruction ==? VNCLIP_WI;
    assign is_VNCLIP_WV          = instruction ==? VNCLIP_WV;
    assign is_VNCLIP_WX          = instruction ==? VNCLIP_WX;
    assign is_VNCLIPU_WI         = instruction ==? VNCLIPU_WI;
    assign is_VNCLIPU_WV         = instruction ==? VNCLIPU_WV;
    assign is_VNCLIPU_WX         = instruction ==? VNCLIPU_WX;
    assign is_VNMSAC_VV          = instruction ==? VNMSAC_VV;
    assign is_VNMSAC_VX          = instruction ==? VNMSAC_VX;
    assign is_VNMSUB_VV          = instruction ==? VNMSUB_VV;
    assign is_VNMSUB_VX          = instruction ==? VNMSUB_VX;
    assign is_VNSRA_WI           = instruction ==? VNSRA_WI;
    assign is_VNSRA_WV           = instruction ==? VNSRA_WV;
    assign is_VNSRA_WX           = instruction ==? VNSRA_WX;
    assign is_VNSRL_WI           = instruction ==? VNSRL_WI;
    assign is_VNSRL_WV           = instruction ==? VNSRL_WV;
    assign is_VNSRL_WX           = instruction ==? VNSRL_WX;
    assign is_VOR_VI             = instruction ==? VOR_VI;
    assign is_VOR_VV             = instruction ==? VOR_VV;
    assign is_VOR_VX             = instruction ==? VOR_VX;
    assign is_VREDAND_VS         = instruction ==? VREDAND_VS;
    assign is_VREDMAX_VS         = instruction ==? VREDMAX_VS;
    assign is_VREDMAXU_VS        = instruction ==? VREDMAXU_VS;
    assign is_VREDMIN_VS         = instruction ==? VREDMIN_VS;
    assign is_VREDMINU_VS        = instruction ==? VREDMINU_VS;
    assign is_VREDOR_VS          = instruction ==? VREDOR_VS;
    assign is_VREDSUM_VS         = instruction ==? VREDSUM_VS;
    assign is_VREDXOR_VS         = instruction ==? VREDXOR_VS;
    assign is_VREM_VV            = instruction ==? VREM_VV;
    assign is_VREM_VX            = instruction ==? VREM_VX;
    assign is_VREMU_VV           = instruction ==? VREMU_VV;
    assign is_VREMU_VX           = instruction ==? VREMU_VX;
    assign is_VRGATHER_VI        = instruction ==? VRGATHER_VI;
    assign is_VRGATHER_VV        = instruction ==? VRGATHER_VV;
    assign is_VRGATHER_VX        = instruction ==? VRGATHER_VX;
    assign is_VRGATHEREI16_VV    = instruction ==? VRGATHEREI16_VV;
    assign is_VRSUB_VI           = instruction ==? VRSUB_VI;
    assign is_VRSUB_VX           = instruction ==? VRSUB_VX;
    assign is_VS1R_V             = instruction ==? VS1R_V;
    assign is_VS2R_V             = instruction ==? VS2R_V;
    assign is_VS4R_V             = instruction ==? VS4R_V;
    assign is_VS8R_V             = instruction ==? VS8R_V;
    assign is_VSADD_VI           = instruction ==? VSADD_VI;
    assign is_VSADD_VV           = instruction ==? VSADD_VV;
    assign is_VSADD_VX           = instruction ==? VSADD_VX;
    assign is_VSADDU_VI          = instruction ==? VSADDU_VI;
    assign is_VSADDU_VV          = instruction ==? VSADDU_VV;
    assign is_VSADDU_VX          = instruction ==? VSADDU_VX;
    assign is_VSBC_VVM           = instruction ==? VSBC_VVM;
    assign is_VSBC_VXM           = instruction ==? VSBC_VXM;
    assign is_VSE16_V            = instruction ==? VSE16_V;
    assign is_VSE32_V            = instruction ==? VSE32_V;
    assign is_VSE64_V            = instruction ==? VSE64_V;
    assign is_VSE8_V             = instruction ==? VSE8_V;
    assign is_VSETIVLI           = instruction ==? VSETIVLI;
    assign is_VSETVL             = instruction ==? VSETVL;
    assign is_VSETVLI            = instruction ==? VSETVLI;
    assign is_VSEXT_VF2          = instruction ==? VSEXT_VF2;
    assign is_VSEXT_VF4          = instruction ==? VSEXT_VF4;
    assign is_VSEXT_VF8          = instruction ==? VSEXT_VF8;
    assign is_VSLIDE1DOWN_VX     = instruction ==? VSLIDE1DOWN_VX;
    assign is_VSLIDE1UP_VX       = instruction ==? VSLIDE1UP_VX;
    assign is_VSLIDEDOWN_VI      = instruction ==? VSLIDEDOWN_VI;
    assign is_VSLIDEDOWN_VX      = instruction ==? VSLIDEDOWN_VX;
    assign is_VSLIDEUP_VI        = instruction ==? VSLIDEUP_VI;
    assign is_VSLIDEUP_VX        = instruction ==? VSLIDEUP_VX;
    assign is_VSLL_VI            = instruction ==? VSLL_VI;
    assign is_VSLL_VV            = instruction ==? VSLL_VV;
    assign is_VSLL_VX            = instruction ==? VSLL_VX;
    assign is_VSM_V              = instruction ==? VSM_V;
    assign is_VSMUL_VV           = instruction ==? VSMUL_VV;
    assign is_VSMUL_VX           = instruction ==? VSMUL_VX;
    assign is_VSOXEI16_V         = instruction ==? VSOXEI16_V;
    assign is_VSOXEI32_V         = instruction ==? VSOXEI32_V;
    assign is_VSOXEI64_V         = instruction ==? VSOXEI64_V;
    assign is_VSOXEI8_V          = instruction ==? VSOXEI8_V;
    assign is_VSRA_VI            = instruction ==? VSRA_VI;
    assign is_VSRA_VV            = instruction ==? VSRA_VV;
    assign is_VSRA_VX            = instruction ==? VSRA_VX;
    assign is_VSRL_VI            = instruction ==? VSRL_VI;
    assign is_VSRL_VV            = instruction ==? VSRL_VV;
    assign is_VSRL_VX            = instruction ==? VSRL_VX;
    assign is_VSSE16_V           = instruction ==? VSSE16_V;
    assign is_VSSE32_V           = instruction ==? VSSE32_V;
    assign is_VSSE64_V           = instruction ==? VSSE64_V;
    assign is_VSSE8_V            = instruction ==? VSSE8_V;
    assign is_VSSRA_VI           = instruction ==? VSSRA_VI;
    assign is_VSSRA_VV           = instruction ==? VSSRA_VV;
    assign is_VSSRA_VX           = instruction ==? VSSRA_VX;
    assign is_VSSRL_VI           = instruction ==? VSSRL_VI;
    assign is_VSSRL_VV           = instruction ==? VSSRL_VV;
    assign is_VSSRL_VX           = instruction ==? VSSRL_VX;
    assign is_VSSUB_VV           = instruction ==? VSSUB_VV;
    assign is_VSSUB_VX           = instruction ==? VSSUB_VX;
    assign is_VSSUBU_VV          = instruction ==? VSSUBU_VV;
    assign is_VSSUBU_VX          = instruction ==? VSSUBU_VX;
    assign is_VSUB_VV            = instruction ==? VSUB_VV;
    assign is_VSUB_VX            = instruction ==? VSUB_VX;
    assign is_VSUXEI16_V         = instruction ==? VSUXEI16_V;
    assign is_VSUXEI32_V         = instruction ==? VSUXEI32_V;
    assign is_VSUXEI64_V         = instruction ==? VSUXEI64_V;
    assign is_VSUXEI8_V          = instruction ==? VSUXEI8_V;
    assign is_VWADD_VV           = instruction ==? VWADD_VV;
    assign is_VWADD_VX           = instruction ==? VWADD_VX;
    assign is_VWADD_WV           = instruction ==? VWADD_WV;
    assign is_VWADD_WX           = instruction ==? VWADD_WX;
    assign is_VWADDU_VV          = instruction ==? VWADDU_VV;
    assign is_VWADDU_VX          = instruction ==? VWADDU_VX;
    assign is_VWADDU_WV          = instruction ==? VWADDU_WV;
    assign is_VWADDU_WX          = instruction ==? VWADDU_WX;
    assign is_VWMACC_VV          = instruction ==? VWMACC_VV;
    assign is_VWMACC_VX          = instruction ==? VWMACC_VX;
    assign is_VWMACCSU_VV        = instruction ==? VWMACCSU_VV;
    assign is_VWMACCSU_VX        = instruction ==? VWMACCSU_VX;
    assign is_VWMACCU_VV         = instruction ==? VWMACCU_VV;
    assign is_VWMACCU_VX         = instruction ==? VWMACCU_VX;
    assign is_VWMACCUS_VX        = instruction ==? VWMACCUS_VX;
    assign is_VWMUL_VV           = instruction ==? VWMUL_VV;
    assign is_VWMUL_VX           = instruction ==? VWMUL_VX;
    assign is_VWMULSU_VV         = instruction ==? VWMULSU_VV;
    assign is_VWMULSU_VX         = instruction ==? VWMULSU_VX;
    assign is_VWMULU_VV          = instruction ==? VWMULU_VV;
    assign is_VWMULU_VX          = instruction ==? VWMULU_VX;
    assign is_VWREDSUM_VS        = instruction ==? VWREDSUM_VS;
    assign is_VWREDSUMU_VS       = instruction ==? VWREDSUMU_VS;
    assign is_VWSUB_VV           = instruction ==? VWSUB_VV;
    assign is_VWSUB_VX           = instruction ==? VWSUB_VX;
    assign is_VWSUB_WV           = instruction ==? VWSUB_WV;
    assign is_VWSUB_WX           = instruction ==? VWSUB_WX;
    assign is_VWSUBU_VV          = instruction ==? VWSUBU_VV;
    assign is_VWSUBU_VX          = instruction ==? VWSUBU_VX;
    assign is_VWSUBU_WV          = instruction ==? VWSUBU_WV;
    assign is_VWSUBU_WX          = instruction ==? VWSUBU_WX;
    assign is_VXOR_VI            = instruction ==? VXOR_VI;
    assign is_VXOR_VV            = instruction ==? VXOR_VV;
    assign is_VXOR_VX            = instruction ==? VXOR_VX;
    assign is_VZEXT_VF2          = instruction ==? VZEXT_VF2;
    assign is_VZEXT_VF4          = instruction ==? VZEXT_VF4;
    assign is_VZEXT_VF8          = instruction ==? VZEXT_VF8;

    /* rv_instruction instruction type enum  */
    always_comb begin: instruction_type_decoder
        casez (instruction)
        VAADD_VV          : rv_instruction = RV_VAADD_VV;
        VAADD_VX          : rv_instruction = RV_VAADD_VX;
        VAADDU_VV         : rv_instruction = RV_VAADDU_VV;
        VAADDU_VX         : rv_instruction = RV_VAADDU_VX;
        VADC_VIM          : rv_instruction = RV_VADC_VIM;
        VADC_VVM          : rv_instruction = RV_VADC_VVM;
        VADC_VXM          : rv_instruction = RV_VADC_VXM;
        VADD_VI           : rv_instruction = RV_VADD_VI;
        VADD_VV           : rv_instruction = RV_VADD_VV;
        VADD_VX           : rv_instruction = RV_VADD_VX;
        VAND_VI           : rv_instruction = RV_VAND_VI;
        VAND_VV           : rv_instruction = RV_VAND_VV;
        VAND_VX           : rv_instruction = RV_VAND_VX;
        VASUB_VV          : rv_instruction = RV_VASUB_VV;
        VASUB_VX          : rv_instruction = RV_VASUB_VX;
        VASUBU_VV         : rv_instruction = RV_VASUBU_VV;
        VASUBU_VX         : rv_instruction = RV_VASUBU_VX;
        VCOMPRESS_VM      : rv_instruction = RV_VCOMPRESS_VM;
        VCPOP_M           : rv_instruction = RV_VCPOP_M;
        VDIV_VV           : rv_instruction = RV_VDIV_VV;
        VDIV_VX           : rv_instruction = RV_VDIV_VX;
        VDIVU_VV          : rv_instruction = RV_VDIVU_VV;
        VDIVU_VX          : rv_instruction = RV_VDIVU_VX;
        VFADD_VF          : rv_instruction = RV_VFADD_VF;
        VFADD_VV          : rv_instruction = RV_VFADD_VV;
        VFCLASS_V         : rv_instruction = RV_VFCLASS_V;
        VFCVT_F_X_V       : rv_instruction = RV_VFCVT_F_X_V;
        VFCVT_F_XU_V      : rv_instruction = RV_VFCVT_F_XU_V;
        VFCVT_RTZ_X_F_V   : rv_instruction = RV_VFCVT_RTZ_X_F_V;
        VFCVT_RTZ_XU_F_V  : rv_instruction = RV_VFCVT_RTZ_XU_F_V;
        VFCVT_X_F_V       : rv_instruction = RV_VFCVT_X_F_V;
        VFCVT_XU_F_V      : rv_instruction = RV_VFCVT_XU_F_V;
        VFDIV_VF          : rv_instruction = RV_VFDIV_VF;
        VFDIV_VV          : rv_instruction = RV_VFDIV_VV;
        VFIRST_M          : rv_instruction = RV_VFIRST_M;
        VFMACC_VF         : rv_instruction = RV_VFMACC_VF;
        VFMACC_VV         : rv_instruction = RV_VFMACC_VV;
        VFMADD_VF         : rv_instruction = RV_VFMADD_VF;
        VFMADD_VV         : rv_instruction = RV_VFMADD_VV;
        VFMAX_VF          : rv_instruction = RV_VFMAX_VF;
        VFMAX_VV          : rv_instruction = RV_VFMAX_VV;
        VFMERGE_VFM       : rv_instruction = RV_VFMERGE_VFM;
        VFMIN_VF          : rv_instruction = RV_VFMIN_VF;
        VFMIN_VV          : rv_instruction = RV_VFMIN_VV;
        VFMSAC_VF         : rv_instruction = RV_VFMSAC_VF;
        VFMSAC_VV         : rv_instruction = RV_VFMSAC_VV;
        VFMSUB_VF         : rv_instruction = RV_VFMSUB_VF;
        VFMSUB_VV         : rv_instruction = RV_VFMSUB_VV;
        VFMUL_VF          : rv_instruction = RV_VFMUL_VF;
        VFMUL_VV          : rv_instruction = RV_VFMUL_VV;
        VFMV_F_S          : rv_instruction = RV_VFMV_F_S;
        VFMV_S_F          : rv_instruction = RV_VFMV_S_F;
        VFMV_V_F          : rv_instruction = RV_VFMV_V_F;
        VFNCVT_F_F_W      : rv_instruction = RV_VFNCVT_F_F_W;
        VFNCVT_F_X_W      : rv_instruction = RV_VFNCVT_F_X_W;
        VFNCVT_F_XU_W     : rv_instruction = RV_VFNCVT_F_XU_W;
        VFNCVT_ROD_F_F_W  : rv_instruction = RV_VFNCVT_ROD_F_F_W;
        VFNCVT_RTZ_X_F_W  : rv_instruction = RV_VFNCVT_RTZ_X_F_W;
        VFNCVT_RTZ_XU_F_W : rv_instruction = RV_VFNCVT_RTZ_XU_F_W;
        VFNCVT_X_F_W      : rv_instruction = RV_VFNCVT_X_F_W;
        VFNCVT_XU_F_W     : rv_instruction = RV_VFNCVT_XU_F_W;
        VFNMACC_VF        : rv_instruction = RV_VFNMACC_VF;
        VFNMACC_VV        : rv_instruction = RV_VFNMACC_VV;
        VFNMADD_VF        : rv_instruction = RV_VFNMADD_VF;
        VFNMADD_VV        : rv_instruction = RV_VFNMADD_VV;
        VFNMSAC_VF        : rv_instruction = RV_VFNMSAC_VF;
        VFNMSAC_VV        : rv_instruction = RV_VFNMSAC_VV;
        VFNMSUB_VF        : rv_instruction = RV_VFNMSUB_VF;
        VFNMSUB_VV        : rv_instruction = RV_VFNMSUB_VV;
        VFRDIV_VF         : rv_instruction = RV_VFRDIV_VF;
        VFREC7_V          : rv_instruction = RV_VFREC7_V;
        VFREDMAX_VS       : rv_instruction = RV_VFREDMAX_VS;
        VFREDMIN_VS       : rv_instruction = RV_VFREDMIN_VS;
        VFREDOSUM_VS      : rv_instruction = RV_VFREDOSUM_VS;
        VFREDUSUM_VS      : rv_instruction = RV_VFREDUSUM_VS;
        VFRSQRT7_V        : rv_instruction = RV_VFRSQRT7_V;
        VFRSUB_VF         : rv_instruction = RV_VFRSUB_VF;
        VFSGNJ_VF         : rv_instruction = RV_VFSGNJ_VF;
        VFSGNJ_VV         : rv_instruction = RV_VFSGNJ_VV;
        VFSGNJN_VF        : rv_instruction = RV_VFSGNJN_VF;
        VFSGNJN_VV        : rv_instruction = RV_VFSGNJN_VV;
        VFSGNJX_VF        : rv_instruction = RV_VFSGNJX_VF;
        VFSGNJX_VV        : rv_instruction = RV_VFSGNJX_VV;
        VFSLIDE1DOWN_VF   : rv_instruction = RV_VFSLIDE1DOWN_VF;
        VFSLIDE1UP_VF     : rv_instruction = RV_VFSLIDE1UP_VF;
        VFSQRT_V          : rv_instruction = RV_VFSQRT_V;
        VFSUB_VF          : rv_instruction = RV_VFSUB_VF;
        VFSUB_VV          : rv_instruction = RV_VFSUB_VV;
        VFWADD_VF         : rv_instruction = RV_VFWADD_VF;
        VFWADD_VV         : rv_instruction = RV_VFWADD_VV;
        VFWADD_WF         : rv_instruction = RV_VFWADD_WF;
        VFWADD_WV         : rv_instruction = RV_VFWADD_WV;
        VFWCVT_F_F_V      : rv_instruction = RV_VFWCVT_F_F_V;
        VFWCVT_F_X_V      : rv_instruction = RV_VFWCVT_F_X_V;
        VFWCVT_F_XU_V     : rv_instruction = RV_VFWCVT_F_XU_V;
        VFWCVT_RTZ_X_F_V  : rv_instruction = RV_VFWCVT_RTZ_X_F_V;
        VFWCVT_RTZ_XU_F_V : rv_instruction = RV_VFWCVT_RTZ_XU_F_V;
        VFWCVT_X_F_V      : rv_instruction = RV_VFWCVT_X_F_V;
        VFWCVT_XU_F_V     : rv_instruction = RV_VFWCVT_XU_F_V;
        VFWMACC_VF        : rv_instruction = RV_VFWMACC_VF;
        VFWMACC_VV        : rv_instruction = RV_VFWMACC_VV;
        VFWMSAC_VF        : rv_instruction = RV_VFWMSAC_VF;
        VFWMSAC_VV        : rv_instruction = RV_VFWMSAC_VV;
        VFWMUL_VF         : rv_instruction = RV_VFWMUL_VF;
        VFWMUL_VV         : rv_instruction = RV_VFWMUL_VV;
        VFWNMACC_VF       : rv_instruction = RV_VFWNMACC_VF;
        VFWNMACC_VV       : rv_instruction = RV_VFWNMACC_VV;
        VFWNMSAC_VF       : rv_instruction = RV_VFWNMSAC_VF;
        VFWNMSAC_VV       : rv_instruction = RV_VFWNMSAC_VV;
        VFWREDOSUM_VS     : rv_instruction = RV_VFWREDOSUM_VS;
        VFWREDUSUM_VS     : rv_instruction = RV_VFWREDUSUM_VS;
        VFWSUB_VF         : rv_instruction = RV_VFWSUB_VF;
        VFWSUB_VV         : rv_instruction = RV_VFWSUB_VV;
        VFWSUB_WF         : rv_instruction = RV_VFWSUB_WF;
        VFWSUB_WV         : rv_instruction = RV_VFWSUB_WV;
        VID_V             : rv_instruction = RV_VID_V;
        VIOTA_M           : rv_instruction = RV_VIOTA_M;
        VL1RE16_V         : rv_instruction = RV_VL1RE16_V;
        VL1RE32_V         : rv_instruction = RV_VL1RE32_V;
        VL1RE64_V         : rv_instruction = RV_VL1RE64_V;
        VL1RE8_V          : rv_instruction = RV_VL1RE8_V;
        VL2RE16_V         : rv_instruction = RV_VL2RE16_V;
        VL2RE32_V         : rv_instruction = RV_VL2RE32_V;
        VL2RE64_V         : rv_instruction = RV_VL2RE64_V;
        VL2RE8_V          : rv_instruction = RV_VL2RE8_V;
        VL4RE16_V         : rv_instruction = RV_VL4RE16_V;
        VL4RE32_V         : rv_instruction = RV_VL4RE32_V;
        VL4RE64_V         : rv_instruction = RV_VL4RE64_V;
        VL4RE8_V          : rv_instruction = RV_VL4RE8_V;
        VL8RE16_V         : rv_instruction = RV_VL8RE16_V;
        VL8RE32_V         : rv_instruction = RV_VL8RE32_V;
        VL8RE64_V         : rv_instruction = RV_VL8RE64_V;
        VL8RE8_V          : rv_instruction = RV_VL8RE8_V;
        VLE16_V           : rv_instruction = RV_VLE16_V;
        VLE16FF_V         : rv_instruction = RV_VLE16FF_V;
        VLE32_V           : rv_instruction = RV_VLE32_V;
        VLE32FF_V         : rv_instruction = RV_VLE32FF_V;
        VLE64_V           : rv_instruction = RV_VLE64_V;
        VLE64FF_V         : rv_instruction = RV_VLE64FF_V;
        VLE8_V            : rv_instruction = RV_VLE8_V;
        VLE8FF_V          : rv_instruction = RV_VLE8FF_V;
        VLM_V             : rv_instruction = RV_VLM_V;
        VLOXEI16_V        : rv_instruction = RV_VLOXEI16_V;
        VLOXEI32_V        : rv_instruction = RV_VLOXEI32_V;
        VLOXEI64_V        : rv_instruction = RV_VLOXEI64_V;
        VLOXEI8_V         : rv_instruction = RV_VLOXEI8_V;
        VLSE16_V          : rv_instruction = RV_VLSE16_V;
        VLSE32_V          : rv_instruction = RV_VLSE32_V;
        VLSE64_V          : rv_instruction = RV_VLSE64_V;
        VLSE8_V           : rv_instruction = RV_VLSE8_V;
        VLUXEI16_V        : rv_instruction = RV_VLUXEI16_V;
        VLUXEI32_V        : rv_instruction = RV_VLUXEI32_V;
        VLUXEI64_V        : rv_instruction = RV_VLUXEI64_V;
        VLUXEI8_V         : rv_instruction = RV_VLUXEI8_V;
        VMACC_VV          : rv_instruction = RV_VMACC_VV;
        VMACC_VX          : rv_instruction = RV_VMACC_VX;
        VMADC_VI          : rv_instruction = RV_VMADC_VI;
        VMADC_VIM         : rv_instruction = RV_VMADC_VIM;
        VMADC_VV          : rv_instruction = RV_VMADC_VV;
        VMADC_VVM         : rv_instruction = RV_VMADC_VVM;
        VMADC_VX          : rv_instruction = RV_VMADC_VX;
        VMADC_VXM         : rv_instruction = RV_VMADC_VXM;
        VMADD_VV          : rv_instruction = RV_VMADD_VV;
        VMADD_VX          : rv_instruction = RV_VMADD_VX;
        VMAND_MM          : rv_instruction = RV_VMAND_MM;
        VMANDN_MM         : rv_instruction = RV_VMANDN_MM;
        VMAX_VV           : rv_instruction = RV_VMAX_VV;
        VMAX_VX           : rv_instruction = RV_VMAX_VX;
        VMAXU_VV          : rv_instruction = RV_VMAXU_VV;
        VMAXU_VX          : rv_instruction = RV_VMAXU_VX;
        VMERGE_VIM        : rv_instruction = RV_VMERGE_VIM;
        VMERGE_VVM        : rv_instruction = RV_VMERGE_VVM;
        VMERGE_VXM        : rv_instruction = RV_VMERGE_VXM;
        VMFEQ_VF          : rv_instruction = RV_VMFEQ_VF;
        VMFEQ_VV          : rv_instruction = RV_VMFEQ_VV;
        VMFGE_VF          : rv_instruction = RV_VMFGE_VF;
        VMFGT_VF          : rv_instruction = RV_VMFGT_VF;
        VMFLE_VF          : rv_instruction = RV_VMFLE_VF;
        VMFLE_VV          : rv_instruction = RV_VMFLE_VV;
        VMFLT_VF          : rv_instruction = RV_VMFLT_VF;
        VMFLT_VV          : rv_instruction = RV_VMFLT_VV;
        VMFNE_VF          : rv_instruction = RV_VMFNE_VF;
        VMFNE_VV          : rv_instruction = RV_VMFNE_VV;
        VMIN_VV           : rv_instruction = RV_VMIN_VV;
        VMIN_VX           : rv_instruction = RV_VMIN_VX;
        VMINU_VV          : rv_instruction = RV_VMINU_VV;
        VMINU_VX          : rv_instruction = RV_VMINU_VX;
        VMNAND_MM         : rv_instruction = RV_VMNAND_MM;
        VMNOR_MM          : rv_instruction = RV_VMNOR_MM;
        VMOR_MM           : rv_instruction = RV_VMOR_MM;
        VMORN_MM          : rv_instruction = RV_VMORN_MM;
        VMSBC_VV          : rv_instruction = RV_VMSBC_VV;
        VMSBC_VVM         : rv_instruction = RV_VMSBC_VVM;
        VMSBC_VX          : rv_instruction = RV_VMSBC_VX;
        VMSBC_VXM         : rv_instruction = RV_VMSBC_VXM;
        VMSBF_M           : rv_instruction = RV_VMSBF_M;
        VMSEQ_VI          : rv_instruction = RV_VMSEQ_VI;
        VMSEQ_VV          : rv_instruction = RV_VMSEQ_VV;
        VMSEQ_VX          : rv_instruction = RV_VMSEQ_VX;
        VMSGT_VI          : rv_instruction = RV_VMSGT_VI;
        VMSGT_VX          : rv_instruction = RV_VMSGT_VX;
        VMSGTU_VI         : rv_instruction = RV_VMSGTU_VI;
        VMSGTU_VX         : rv_instruction = RV_VMSGTU_VX;
        VMSIF_M           : rv_instruction = RV_VMSIF_M;
        VMSLE_VI          : rv_instruction = RV_VMSLE_VI;
        VMSLE_VV          : rv_instruction = RV_VMSLE_VV;
        VMSLE_VX          : rv_instruction = RV_VMSLE_VX;
        VMSLEU_VI         : rv_instruction = RV_VMSLEU_VI;
        VMSLEU_VV         : rv_instruction = RV_VMSLEU_VV;
        VMSLEU_VX         : rv_instruction = RV_VMSLEU_VX;
        VMSLT_VV          : rv_instruction = RV_VMSLT_VV;
        VMSLT_VX          : rv_instruction = RV_VMSLT_VX;
        VMSLTU_VV         : rv_instruction = RV_VMSLTU_VV;
        VMSLTU_VX         : rv_instruction = RV_VMSLTU_VX;
        VMSNE_VI          : rv_instruction = RV_VMSNE_VI;
        VMSNE_VV          : rv_instruction = RV_VMSNE_VV;
        VMSNE_VX          : rv_instruction = RV_VMSNE_VX;
        VMSOF_M           : rv_instruction = RV_VMSOF_M;
        VMUL_VV           : rv_instruction = RV_VMUL_VV;
        VMUL_VX           : rv_instruction = RV_VMUL_VX;
        VMULH_VV          : rv_instruction = RV_VMULH_VV;
        VMULH_VX          : rv_instruction = RV_VMULH_VX;
        VMULHSU_VV        : rv_instruction = RV_VMULHSU_VV;
        VMULHSU_VX        : rv_instruction = RV_VMULHSU_VX;
        VMULHU_VV         : rv_instruction = RV_VMULHU_VV;
        VMULHU_VX         : rv_instruction = RV_VMULHU_VX;
        VMV1R_V           : rv_instruction = RV_VMV1R_V;
        VMV2R_V           : rv_instruction = RV_VMV2R_V;
        VMV4R_V           : rv_instruction = RV_VMV4R_V;
        VMV8R_V           : rv_instruction = RV_VMV8R_V;
        VMV_S_X           : rv_instruction = RV_VMV_S_X;
        VMV_V_I           : rv_instruction = RV_VMV_V_I;
        VMV_V_V           : rv_instruction = RV_VMV_V_V;
        VMV_V_X           : rv_instruction = RV_VMV_V_X;
        VMV_X_S           : rv_instruction = RV_VMV_X_S;
        VMXNOR_MM         : rv_instruction = RV_VMXNOR_MM;
        VMXOR_MM          : rv_instruction = RV_VMXOR_MM;
        VNCLIP_WI         : rv_instruction = RV_VNCLIP_WI;
        VNCLIP_WV         : rv_instruction = RV_VNCLIP_WV;
        VNCLIP_WX         : rv_instruction = RV_VNCLIP_WX;
        VNCLIPU_WI        : rv_instruction = RV_VNCLIPU_WI;
        VNCLIPU_WV        : rv_instruction = RV_VNCLIPU_WV;
        VNCLIPU_WX        : rv_instruction = RV_VNCLIPU_WX;
        VNMSAC_VV         : rv_instruction = RV_VNMSAC_VV;
        VNMSAC_VX         : rv_instruction = RV_VNMSAC_VX;
        VNMSUB_VV         : rv_instruction = RV_VNMSUB_VV;
        VNMSUB_VX         : rv_instruction = RV_VNMSUB_VX;
        VNSRA_WI          : rv_instruction = RV_VNSRA_WI;
        VNSRA_WV          : rv_instruction = RV_VNSRA_WV;
        VNSRA_WX          : rv_instruction = RV_VNSRA_WX;
        VNSRL_WI          : rv_instruction = RV_VNSRL_WI;
        VNSRL_WV          : rv_instruction = RV_VNSRL_WV;
        VNSRL_WX          : rv_instruction = RV_VNSRL_WX;
        VOR_VI            : rv_instruction = RV_VOR_VI;
        VOR_VV            : rv_instruction = RV_VOR_VV;
        VOR_VX            : rv_instruction = RV_VOR_VX;
        VREDAND_VS        : rv_instruction = RV_VREDAND_VS;
        VREDMAX_VS        : rv_instruction = RV_VREDMAX_VS;
        VREDMAXU_VS       : rv_instruction = RV_VREDMAXU_VS;
        VREDMIN_VS        : rv_instruction = RV_VREDMIN_VS;
        VREDMINU_VS       : rv_instruction = RV_VREDMINU_VS;
        VREDOR_VS         : rv_instruction = RV_VREDOR_VS;
        VREDSUM_VS        : rv_instruction = RV_VREDSUM_VS;
        VREDXOR_VS        : rv_instruction = RV_VREDXOR_VS;
        VREM_VV           : rv_instruction = RV_VREM_VV;
        VREM_VX           : rv_instruction = RV_VREM_VX;
        VREMU_VV          : rv_instruction = RV_VREMU_VV;
        VREMU_VX          : rv_instruction = RV_VREMU_VX;
        VRGATHER_VI       : rv_instruction = RV_VRGATHER_VI;
        VRGATHER_VV       : rv_instruction = RV_VRGATHER_VV;
        VRGATHER_VX       : rv_instruction = RV_VRGATHER_VX;
        VRGATHEREI16_VV   : rv_instruction = RV_VRGATHEREI16_VV;
        VRSUB_VI          : rv_instruction = RV_VRSUB_VI;
        VRSUB_VX          : rv_instruction = RV_VRSUB_VX;
        VS1R_V            : rv_instruction = RV_VS1R_V;
        VS2R_V            : rv_instruction = RV_VS2R_V;
        VS4R_V            : rv_instruction = RV_VS4R_V;
        VS8R_V            : rv_instruction = RV_VS8R_V;
        VSADD_VI          : rv_instruction = RV_VSADD_VI;
        VSADD_VV          : rv_instruction = RV_VSADD_VV;
        VSADD_VX          : rv_instruction = RV_VSADD_VX;
        VSADDU_VI         : rv_instruction = RV_VSADDU_VI;
        VSADDU_VV         : rv_instruction = RV_VSADDU_VV;
        VSADDU_VX         : rv_instruction = RV_VSADDU_VX;
        VSBC_VVM          : rv_instruction = RV_VSBC_VVM;
        VSBC_VXM          : rv_instruction = RV_VSBC_VXM;
        VSE16_V           : rv_instruction = RV_VSE16_V;
        VSE32_V           : rv_instruction = RV_VSE32_V;
        VSE64_V           : rv_instruction = RV_VSE64_V;
        VSE8_V            : rv_instruction = RV_VSE8_V;
        VSETIVLI          : rv_instruction = RV_VSETIVLI;
        VSETVL            : rv_instruction = RV_VSETVL;
        VSETVLI           : rv_instruction = RV_VSETVLI;
        VSEXT_VF2         : rv_instruction = RV_VSEXT_VF2;
        VSEXT_VF4         : rv_instruction = RV_VSEXT_VF4;
        VSEXT_VF8         : rv_instruction = RV_VSEXT_VF8;
        VSLIDE1DOWN_VX    : rv_instruction = RV_VSLIDE1DOWN_VX;
        VSLIDE1UP_VX      : rv_instruction = RV_VSLIDE1UP_VX;
        VSLIDEDOWN_VI     : rv_instruction = RV_VSLIDEDOWN_VI;
        VSLIDEDOWN_VX     : rv_instruction = RV_VSLIDEDOWN_VX;
        VSLIDEUP_VI       : rv_instruction = RV_VSLIDEUP_VI;
        VSLIDEUP_VX       : rv_instruction = RV_VSLIDEUP_VX;
        VSLL_VI           : rv_instruction = RV_VSLL_VI;
        VSLL_VV           : rv_instruction = RV_VSLL_VV;
        VSLL_VX           : rv_instruction = RV_VSLL_VX;
        VSM_V             : rv_instruction = RV_VSM_V;
        VSMUL_VV          : rv_instruction = RV_VSMUL_VV;
        VSMUL_VX          : rv_instruction = RV_VSMUL_VX;
        VSOXEI16_V        : rv_instruction = RV_VSOXEI16_V;
        VSOXEI32_V        : rv_instruction = RV_VSOXEI32_V;
        VSOXEI64_V        : rv_instruction = RV_VSOXEI64_V;
        VSOXEI8_V         : rv_instruction = RV_VSOXEI8_V;
        VSRA_VI           : rv_instruction = RV_VSRA_VI;
        VSRA_VV           : rv_instruction = RV_VSRA_VV;
        VSRA_VX           : rv_instruction = RV_VSRA_VX;
        VSRL_VI           : rv_instruction = RV_VSRL_VI;
        VSRL_VV           : rv_instruction = RV_VSRL_VV;
        VSRL_VX           : rv_instruction = RV_VSRL_VX;
        VSSE16_V          : rv_instruction = RV_VSSE16_V;
        VSSE32_V          : rv_instruction = RV_VSSE32_V;
        VSSE64_V          : rv_instruction = RV_VSSE64_V;
        VSSE8_V           : rv_instruction = RV_VSSE8_V;
        VSSRA_VI          : rv_instruction = RV_VSSRA_VI;
        VSSRA_VV          : rv_instruction = RV_VSSRA_VV;
        VSSRA_VX          : rv_instruction = RV_VSSRA_VX;
        VSSRL_VI          : rv_instruction = RV_VSSRL_VI;
        VSSRL_VV          : rv_instruction = RV_VSSRL_VV;
        VSSRL_VX          : rv_instruction = RV_VSSRL_VX;
        VSSUB_VV          : rv_instruction = RV_VSSUB_VV;
        VSSUB_VX          : rv_instruction = RV_VSSUB_VX;
        VSSUBU_VV         : rv_instruction = RV_VSSUBU_VV;
        VSSUBU_VX         : rv_instruction = RV_VSSUBU_VX;
        VSUB_VV           : rv_instruction = RV_VSUB_VV;
        VSUB_VX           : rv_instruction = RV_VSUB_VX;
        VSUXEI16_V        : rv_instruction = RV_VSUXEI16_V;
        VSUXEI32_V        : rv_instruction = RV_VSUXEI32_V;
        VSUXEI64_V        : rv_instruction = RV_VSUXEI64_V;
        VSUXEI8_V         : rv_instruction = RV_VSUXEI8_V;
        VWADD_VV          : rv_instruction = RV_VWADD_VV;
        VWADD_VX          : rv_instruction = RV_VWADD_VX;
        VWADD_WV          : rv_instruction = RV_VWADD_WV;
        VWADD_WX          : rv_instruction = RV_VWADD_WX;
        VWADDU_VV         : rv_instruction = RV_VWADDU_VV;
        VWADDU_VX         : rv_instruction = RV_VWADDU_VX;
        VWADDU_WV         : rv_instruction = RV_VWADDU_WV;
        VWADDU_WX         : rv_instruction = RV_VWADDU_WX;
        VWMACC_VV         : rv_instruction = RV_VWMACC_VV;
        VWMACC_VX         : rv_instruction = RV_VWMACC_VX;
        VWMACCSU_VV       : rv_instruction = RV_VWMACCSU_VV;
        VWMACCSU_VX       : rv_instruction = RV_VWMACCSU_VX;
        VWMACCU_VV        : rv_instruction = RV_VWMACCU_VV;
        VWMACCU_VX        : rv_instruction = RV_VWMACCU_VX;
        VWMACCUS_VX       : rv_instruction = RV_VWMACCUS_VX;
        VWMUL_VV          : rv_instruction = RV_VWMUL_VV;
        VWMUL_VX          : rv_instruction = RV_VWMUL_VX;
        VWMULSU_VV        : rv_instruction = RV_VWMULSU_VV;
        VWMULSU_VX        : rv_instruction = RV_VWMULSU_VX;
        VWMULU_VV         : rv_instruction = RV_VWMULU_VV;
        VWMULU_VX         : rv_instruction = RV_VWMULU_VX;
        VWREDSUM_VS       : rv_instruction = RV_VWREDSUM_VS;
        VWREDSUMU_VS      : rv_instruction = RV_VWREDSUMU_VS;
        VWSUB_VV          : rv_instruction = RV_VWSUB_VV;
        VWSUB_VX          : rv_instruction = RV_VWSUB_VX;
        VWSUB_WV          : rv_instruction = RV_VWSUB_WV;
        VWSUB_WX          : rv_instruction = RV_VWSUB_WX;
        VWSUBU_VV         : rv_instruction = RV_VWSUBU_VV;
        VWSUBU_VX         : rv_instruction = RV_VWSUBU_VX;
        VWSUBU_WV         : rv_instruction = RV_VWSUBU_WV;
        VWSUBU_WX         : rv_instruction = RV_VWSUBU_WX;
        VXOR_VI           : rv_instruction = RV_VXOR_VI;
        VXOR_VV           : rv_instruction = RV_VXOR_VV;
        VXOR_VX           : rv_instruction = RV_VXOR_VX;
        VZEXT_VF2         : rv_instruction = RV_VZEXT_VF2;
        VZEXT_VF4         : rv_instruction = RV_VZEXT_VF4;
        VZEXT_VF8         : rv_instruction = RV_VZEXT_VF8;
        default           : rv_instruction = RV_UNKNOWN;
        endcase
    end
endmodule
