// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        bit 5 - enable ap_local_deadlock interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (COR/TOW)
//        bit 1 - ap_ready (COR/TOW)
//        bit 5 - ap_local_deadlock (COR/TOW)
//        others - reserved
// 0x10 : Data signal of ap_return
//        bit 31~0 - ap_return[31:0] (Read)
// 0x18 : Data signal of m1
//        bit 31~0 - m1[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of m2
//        bit 31~0 - m2[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of distc
//        bit 31~0 - distc[31:0] (Read/Write)
// 0x2c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CRTLS_ADDR_AP_CTRL    0x00
#define CRTLS_ADDR_GIE        0x04
#define CRTLS_ADDR_IER        0x08
#define CRTLS_ADDR_ISR        0x0c
#define CRTLS_ADDR_AP_RETURN  0x10
#define CRTLS_BITS_AP_RETURN  32
#define CRTLS_ADDR_M1_DATA    0x18
#define CRTLS_BITS_M1_DATA    32
#define CRTLS_ADDR_M2_DATA    0x20
#define CRTLS_BITS_M2_DATA    32
#define CRTLS_ADDR_DISTC_DATA 0x28
#define CRTLS_BITS_DISTC_DATA 32
