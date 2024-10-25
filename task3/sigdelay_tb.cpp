#include "vbuddy.cpp"     // include vbuddy code
#define MAX_SIM_CYC 1000000
#define ADDRESS_WIDTH 9
#define RAM_SZ pow(2,ADDRESS_WIDTH)

int main(int argc, char **argv, char **env) {
  int simcyc;     // simulation clock count
  int tick;       // each clk cycle has two ticks for two edges

 
  // init Vbuddy
  if (vbdOpen()!=1) return(-1);
  vbdHeader("L2T3:Delay");
  //vbdSetMode(1);        // Flag mode set to one-shot


  
  // intialize variables for analogue output
  // run simulation for MAX_SIM_CYC clock cycles
  for (simcyc=0; simcyc<MAX_SIM_CYC; simcyc++) {
    // dump variables into VCD file and toggle clock
 
    // plot RAM input/output, send sample to DAC buffer, and print cycle count
    //vbdPlot(int (top->delayed_signal), 0, 255);
    vbdCycle(simcyc);

    // either simulation finished, or 'q' is pressed
   
  }

  vbdClose();     // ++++
  printf("Exiting\n");
  exit(0);
}
