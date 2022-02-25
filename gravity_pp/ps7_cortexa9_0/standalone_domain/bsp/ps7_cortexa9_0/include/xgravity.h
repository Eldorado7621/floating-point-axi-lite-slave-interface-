// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XGRAVITY_H
#define XGRAVITY_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xgravity_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Crtls_BaseAddress;
} XGravity_Config;
#endif

typedef struct {
    u64 Crtls_BaseAddress;
    u32 IsReady;
} XGravity;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XGravity_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XGravity_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XGravity_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XGravity_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XGravity_Initialize(XGravity *InstancePtr, u16 DeviceId);
XGravity_Config* XGravity_LookupConfig(u16 DeviceId);
int XGravity_CfgInitialize(XGravity *InstancePtr, XGravity_Config *ConfigPtr);
#else
int XGravity_Initialize(XGravity *InstancePtr, const char* InstanceName);
int XGravity_Release(XGravity *InstancePtr);
#endif

void XGravity_Start(XGravity *InstancePtr);
u32 XGravity_IsDone(XGravity *InstancePtr);
u32 XGravity_IsIdle(XGravity *InstancePtr);
u32 XGravity_IsReady(XGravity *InstancePtr);
void XGravity_EnableAutoRestart(XGravity *InstancePtr);
void XGravity_DisableAutoRestart(XGravity *InstancePtr);
u32 XGravity_Get_return(XGravity *InstancePtr);

void XGravity_Set_m1(XGravity *InstancePtr, u32 Data);
u32 XGravity_Get_m1(XGravity *InstancePtr);
void XGravity_Set_m2(XGravity *InstancePtr, u32 Data);
u32 XGravity_Get_m2(XGravity *InstancePtr);
void XGravity_Set_distc(XGravity *InstancePtr, u32 Data);
u32 XGravity_Get_distc(XGravity *InstancePtr);

void XGravity_InterruptGlobalEnable(XGravity *InstancePtr);
void XGravity_InterruptGlobalDisable(XGravity *InstancePtr);
void XGravity_InterruptEnable(XGravity *InstancePtr, u32 Mask);
void XGravity_InterruptDisable(XGravity *InstancePtr, u32 Mask);
void XGravity_InterruptClear(XGravity *InstancePtr, u32 Mask);
u32 XGravity_InterruptGetEnabled(XGravity *InstancePtr);
u32 XGravity_InterruptGetStatus(XGravity *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
