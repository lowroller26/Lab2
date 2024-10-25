#include "obj_dir/Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"


int main(int argc, char **argv, char **env){
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);
    //init Vsinegen verilog instance
    Vsinegen* sinegen = new Vsinegen;
    //init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    sinegen->trace (tfp, 99);
    tfp->open ("sinegen.vcd");

    // init Vbuddy 
    if (vbdOpen()!=1) return(-1);
    vbdHeader("Lab 2 Sine wave");
    
    //initialize simulation inputs
    sinegen->clk = 1;
    sinegen->rst = 0;
    sinegen->en = 1;
    sinegen->incr = 1;

    //run simulation for many clock cycles
    for(i = 0; i<10000000000; i++){

        //dump variables into VCD file + toggle clock
        for(clk = 0; clk < 2; clk++){
            tfp->dump (2*i+clk);  //unit is in ps
            sinegen->clk = !sinegen->clk;
            sinegen->eval ();
        }

        // ++++ Send count value to Vbuddy
        vbdCycle(i+1);

        // either simulation finished, or 'q' is pressed
        if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) {exit(0);} // ... exit if finish OR 'q' pressed
    }

    vbdClose();
    tfp->close();
    exit(0);
}