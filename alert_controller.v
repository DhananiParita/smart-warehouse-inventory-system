// Module Name : alert_controller
// Description : Generates warehouse alert signals


module alert_controller(

    input [9:0] current_stock,

    output reg low_stock,
    output reg out_of_stock,
    output reg warehouse_full

);

parameter MAX_CAPACITY = 1000;
parameter LOW_STOCK_LEVEL = 100;

always @(*)
begin

    // Default Values
    low_stock      = 1'b0;
    out_of_stock   = 1'b0;
    warehouse_full = 1'b0;

    // Out of Stock
    if(current_stock == 0)
    begin
        out_of_stock = 1'b1;
    end

    // Warehouse Full
    else if(current_stock >= MAX_CAPACITY)
    begin
        warehouse_full = 1'b1;
    end

    // Low Stock
    else if(current_stock <= LOW_STOCK_LEVEL)
    begin
        low_stock = 1'b1;
    end

end

endmodule