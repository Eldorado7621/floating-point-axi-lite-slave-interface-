#include <stdio.h>
#include <math.h>
#include "test_core.h"

int main()
{
    printf("Testing gravity");
    float errorAcc=0;

    for(int idx=0; idx<10;idx++)
    {
        float force=gravity(10,20,idx);

        float errorCalc=fabsf(force-goldRef[idx]);
        errorAcc+=errorCalc;

        printf("%d)Force: %f Ref: %f Diff%f\n",force,goldRef[idx],errorAcc)

        if(errorCalc>1)
        {
            printf("Error too big abort\n");
            return 1;
        }
    }

    printf("No errors occured average error: %f\n",errorAcc/10.0f)
    return 0;
}