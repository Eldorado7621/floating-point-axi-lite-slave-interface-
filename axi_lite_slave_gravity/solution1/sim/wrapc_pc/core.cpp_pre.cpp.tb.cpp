// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/core.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/core.cpp"

float gravity (float m1, float m2, float distc)
{
#pragma HLS INTERFACE s_axilite port=return bundle=CRTLS
#pragma HLS INTERFACE s_axilite port=m2 bundle=CRTLS
#pragma HLS INTERFACE s_axilite port=m1 bundle=CRTLS
#pragma HLS INTERFACE s_axilite port=distc bundle=CRTLS

        float force=0;
        float distSquare=0;

        if(distc==0)
        {
            distSquare=0.000001f;
        }
        else distSquare=(distc*distc);
        force=10.0f*(m1*m2)/distSquare;
        return force;
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
float apatb_gravity_ir(float, float, float);
#ifdef __cplusplus
extern "C"
#endif
float gravity_hw_stub(float m1, float m2, float distc){
float _ret = gravity(m1, m2, distc);
return _ret;
}
#ifdef __cplusplus
extern "C"
#endif
float apatb_gravity_sw(float m1, float m2, float distc){
float _ret = apatb_gravity_ir(m1, m2, distc);
return _ret;
}
#endif
# 19 "/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/core.cpp"

