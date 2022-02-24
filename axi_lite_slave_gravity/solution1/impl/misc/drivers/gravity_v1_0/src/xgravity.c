// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xgravity.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XGravity_CfgInitialize(XGravity *InstancePtr, XGravity_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Crtls_BaseAddress = ConfigPtr->Crtls_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XGravity_Start(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_CTRL) & 0x80;
    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XGravity_IsDone(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XGravity_IsIdle(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XGravity_IsReady(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XGravity_EnableAutoRestart(XGravity *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_CTRL, 0x80);
}

void XGravity_DisableAutoRestart(XGravity *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_CTRL, 0);
}

u32 XGravity_Get_return(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_AP_RETURN);
    return Data;
}
void XGravity_Set_m1(XGravity *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_M1_DATA, Data);
}

u32 XGravity_Get_m1(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_M1_DATA);
    return Data;
}

void XGravity_Set_m2(XGravity *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_M2_DATA, Data);
}

u32 XGravity_Get_m2(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_M2_DATA);
    return Data;
}

void XGravity_Set_distc(XGravity *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_DISTC_DATA, Data);
}

u32 XGravity_Get_distc(XGravity *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_DISTC_DATA);
    return Data;
}

void XGravity_InterruptGlobalEnable(XGravity *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_GIE, 1);
}

void XGravity_InterruptGlobalDisable(XGravity *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_GIE, 0);
}

void XGravity_InterruptEnable(XGravity *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_IER);
    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_IER, Register | Mask);
}

void XGravity_InterruptDisable(XGravity *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_IER);
    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_IER, Register & (~Mask));
}

void XGravity_InterruptClear(XGravity *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGravity_WriteReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_ISR, Mask);
}

u32 XGravity_InterruptGetEnabled(XGravity *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_IER);
}

u32 XGravity_InterruptGetStatus(XGravity *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XGravity_ReadReg(InstancePtr->Crtls_BaseAddress, XGRAVITY_CRTLS_ADDR_ISR);
}

