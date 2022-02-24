set SynModuleInfo {
  {SRCNAME gravity MODELNAME gravity RTLNAME gravity IS_TOP 1
    SUBMODULES {
      {MODELNAME gravity_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME gravity_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME gravity_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME gravity_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME gravity_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME gravity_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME gravity_CRTLS_s_axi RTLNAME gravity_CRTLS_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
