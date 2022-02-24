// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xgravity.h"

extern XGravity_Config XGravity_ConfigTable[];

XGravity_Config *XGravity_LookupConfig(u16 DeviceId) {
	XGravity_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XGRAVITY_NUM_INSTANCES; Index++) {
		if (XGravity_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XGravity_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XGravity_Initialize(XGravity *InstancePtr, u16 DeviceId) {
	XGravity_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XGravity_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XGravity_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

