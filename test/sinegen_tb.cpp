#include "vbuddy.cpp"


int main(int argc, char **argv, char **env){
    int i;
    int clk;

   
    if (vbdOpen()!=1) return(-1);
    vbdHeader("Lab 2 Sine wave");
    
   
    //run simulation for many clock cycles
    for(i = 0; i<10000000000; i++){

        // ++++ Send count value to Vbuddy
        vbdCycle(i+1);

        // either simulation finished, or 'q' is pressed
        
    }

    vbdClose();
    exit(0);
}