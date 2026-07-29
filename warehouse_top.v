// Project : Smart Warehouse Inventory Monitoring System
// Top Module : warehouse_top


module warehouse_top(

    input clk,
    input reset,

    input entry_btn,
    input exit_btn,

    output [9:0] current_stock,
    output [15:0] total_entry,
    output [15:0] total_exit,

    output low_stock,
    output out_of_stock,
    output warehouse_full,

    output [3:0] status_code,
    output [9:0] display_stock,
    output [15:0] display_entry,
    output [15:0] display_exit

);

//-----------------------------------------------------
// Internal Signals
//-----------------------------------------------------

wire entry_pulse;
wire exit_pulse;

//-----------------------------------------------------
// Entry Controller
//-----------------------------------------------------

entry_controller EC(

    .clk(clk),
    .reset(reset),
    .entry_btn(entry_btn),
    .entry_pulse(entry_pulse)

);

//-----------------------------------------------------
// Exit Controller
//-----------------------------------------------------

exit_controller XC(

    .clk(clk),
    .reset(reset),
    .exit_btn(exit_btn),
    .exit_pulse(exit_pulse)

);

//-----------------------------------------------------
// Inventory Counter
//-----------------------------------------------------

inventory_counter IC(

    .clk(clk),
    .reset(reset),

    .entry_pulse(entry_pulse),
    .exit_pulse(exit_pulse),

    .current_stock(current_stock),
    .total_entry(total_entry),
    .total_exit(total_exit)

);

//-----------------------------------------------------
// Alert Controller
//-----------------------------------------------------

alert_controller AC(

    .current_stock(current_stock),

    .low_stock(low_stock),
    .out_of_stock(out_of_stock),
    .warehouse_full(warehouse_full)

);

//-----------------------------------------------------
// Display Controller
//-----------------------------------------------------

display_controller DC(

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

endmodule