// Module Name : display_controller
// Description : Controls display outputs

module display_controller(

    input  [9:0]  current_stock,
    input  [15:0] total_entry,
    input  [15:0] total_exit,

    input low_stock,
    input out_of_stock,
    input warehouse_full,

    output reg [3:0] status_code,
    output reg [9:0] display_stock,
    output reg [15:0] display_entry,
    output reg [15:0] display_exit

);

//-----------------------------------------------------
// Status Code
//
// 0000 = Normal
// 0001 = Low Stock
// 0010 = Out of Stock
// 0011 = Warehouse Full
//-----------------------------------------------------

always @(*)
begin

    // Pass data to display outputs
    display_stock = current_stock;
    display_entry = total_entry;
    display_exit  = total_exit;

    // Determine status
    if(out_of_stock)
        status_code = 4'b0010;

    else if(warehouse_full)
        status_code = 4'b0011;

    else if(low_stock)
        status_code = 4'b0001;

    else
        status_code = 4'b0000;

end

endmodule