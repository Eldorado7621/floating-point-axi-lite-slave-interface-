
#include <stdio.h>
#include <xparameters.h>
#include <math.h>
#include "platform.h"
#include <xgravity.h>
#include "xil_printf.h"

double goldRef[]={2000000000,2000,500,222,125,80,55.556,40.816,31.250,24.691};

float u32_to_float(unsigned int val)
{
	union{
		float val_float;
		unsigned char bytes[4];
	}data;
	data.bytes[3]=(val>>(8*3))& 0xff;
	data.bytes[2]=(val>>(8*2))& 0xff;
	data.bytes[1]=(val>>(8*1))& 0xff;
	data.bytes[0]=(val>>(8*0))& 0xff;
	return data.val_float;

}
unsigned int float_to_u32(float val)
{
	unsigned int result;
	union float_byted{
		float v;
		unsigned char bytes[4];
	}data;
	data.v=val;

	result=(data.bytes[3]<< 24)+(data.bytes[2]<<16)+(data.bytes[1]<<8)+(data.bytes[0]);
	return result;

}

float gravity (float m1, float m2, float distc)
{
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

int main()
{
    init_platform();

    //initialize the gravity IP core
    int status;
    XGravity doGravity;
    XGravity_Config *doGravity_cfg;

    doGravity_cfg=XGravity_LookupConfig(XPAR_GRAVITY_0_DEVICE_ID);
    if(!doGravity_cfg)
    {
    	 printf("error loading config files\n");
    }
    status=XGravity_CfgInitialize(&doGravity,doGravity_cfg);
    if(status!=XST_SUCCESS)
    {
        	 printf("error initializing doGravity \n\r");
      }
    //XGravity_Initialize(&doGravity,XPAR_GRAVITY_0_DEVICE_ID);
    printf("Testing gravity (SW) \n");
    float errorAcc=0;

    for(int idx=0; idx<10;idx++)
    {
        float force=gravity(10,20,idx);

        float errorCalc=fabsf(force-goldRef[idx]);
        errorAcc+=errorCalc;

        printf("%d)Force: %f Ref: %f Diff %f\n",(idx+1),force,goldRef[idx],errorCalc);
    }

    printf("No errors occurred average error g(SW): %f\n",errorAcc/10.0f);

    printf("Testing gravity (HW)\n");
    errorAcc=0;
    //setting the parameters on
    for(int idx=0; idx<10;idx++)
    {
    	XGravity_Set_m1(&doGravity,float_to_u32(10.0f));
    	XGravity_Set_m2(&doGravity,float_to_u32(20.0f));
    	XGravity_Set_distc(&doGravity,float_to_u32(idx));

    	//start the IP Core
    	XGravity_Start(&doGravity);

    	//wait until it is done
    	while(!XGravity_IsDone(&doGravity));

    	float force_hw=0;
		force_hw=u32_to_float(XGravity_Get_return(&doGravity));
    	//calculate the error
        float errorCalc=fabsf(force_hw-goldRef[idx]);
        errorAcc+=errorCalc;
        printf("%d)Force: %f Ref: %f Diff %f\n",(idx+1),force_hw,goldRef[idx],errorCalc);
    }
    printf("No errors occurred average error (HW): %f\n",errorAcc/10.0f);
    cleanup_platform();


    return 0;
}
