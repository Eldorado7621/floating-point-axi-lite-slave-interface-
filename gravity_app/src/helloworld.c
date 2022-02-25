
#include <stdio.h>
#include <xparameters.h>
#include "platform.h"
#include <xgravity.h>
#include "xil_printf.h"

double goldRef[]={2000000000,2000,500,222,125,80,55.556,40.816,31.250,24.691};

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
    	 printf("error loading config files\n\r");
    }
    status XGravity_CfgInitialize(&doGravity,*doGravity_cfg);s
    if(status!=XST_SUCCESS)
    {
        	 printf("error initializing doGravoty \n\r");
      }
    //XGravity_Initialize(&doGravity,XPAR_GRAVITY_0_DEVICE_ID);
    printf("Testing gravity (SW) \n");
    float errorAcc=0;

    for(int idx=0; idx<10;idx++)
    {
        float force=gravity(10,20,idx);

        float errorCalc=fabsf(force-goldRef[idx]);
        errorAcc+=errorCalc;

        printf("%d)Force: %f Ref: %f Diff %f\n",force,goldRef[idx],errorCalc);


    }

    printf("No errors occured average error (SW): %f\n",errorAcc/10.0f);
    return 0;
}
