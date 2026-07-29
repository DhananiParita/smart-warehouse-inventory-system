// Module Name : inventory_counter
// Description : Maintains warehouse inventory count


module inventory_counter(

    input clk,
    input reset,

    input entry_pulse,
    input exit_pulse,

    output reg [9:0] current_stock,
    output reg [15:0] total_entry,
    output reg [15:0] total_exit

);

parameter MAX_CAPACITY = 1000;
parameter INITIAL_STOCK = 500;

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin

        current_stock <= INITIAL_STOCK;
        total_entry   <= 16'd0;
        total_exit    <= 16'd0;

    end

    else
    begin

        // Product Entry
        if(entry_pulse && current_stock < MAX_CAPACITY)
        begin
            current_stock <= current_stock + 1;
            total_entry   <= total_entry + 1;
        end

        // Product Exit
        else if(exit_pulse && current_stock > 0)
        begin
            current_stock <= current_stock - 1;
            total_exit    <= total_exit + 1;
        end

    end

end

endmodule