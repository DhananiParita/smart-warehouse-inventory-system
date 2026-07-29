`timescale 1ns/1ps

// Testbench : Warehouse Inventory System


module tb_warehouse;

//-----------------------------------------------------
// Inputs
//-----------------------------------------------------

reg clk;
reg reset;
reg entry_btn;
reg exit_btn;

//-----------------------------------------------------
// Outputs
//-----------------------------------------------------

wire [9:0] current_stock;
wire [15:0] total_entry;
wire [15:0] total_exit;

wire low_stock;
wire out_of_stock;
wire warehouse_full;

wire [3:0] status_code;
wire [9:0] display_stock;
wire [15:0] display_entry;
wire [15:0] display_exit;

//-----------------------------------------------------
// Instantiate DUT
//-----------------------------------------------------

warehouse_top DUT(

    .clk(clk),
    .reset(reset),

    .entry_btn(entry_btn),
    .exit_btn(exit_btn),

    .current_stock(current_stock),
    .total_entry(total_entry),
    .total_exit(total_exit),

    .low_stock(low_stock),
    .out_of_stock(out_of_stock),
    .warehouse_full(warehouse_full),

    .status_code(status_code),
    .display_stock(display_stock),
    .display_entry(display_entry),
    .display_exit(display_exit)

);

//-----------------------------------------------------
// Clock Generation
//-----------------------------------------------------

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

//-----------------------------------------------------
// Test Sequence
//-----------------------------------------------------

initial
begin

    // Initialize
    reset = 1;
    entry_btn = 0;
    exit_btn = 0;

    #20;

    reset = 0;

    //-------------------------
    // Product Entry
    //-------------------------

    #20;
    entry_btn = 1;
    #10;
    entry_btn = 0;

    #20;
    entry_btn = 1;
    #10;
    entry_btn = 0;

    #20;
    entry_btn = 1;
    #10;
    entry_btn = 0;

    //-------------------------
    // Product Exit
    //-------------------------

    #30;
    exit_btn = 1;
    #10;
    exit_btn = 0;

    #30;
    exit_btn = 1;
    #10;
    exit_btn = 0;

    //-------------------------
    // Finish Simulation
    //-------------------------

    #100;

    $stop;

end

endmodule