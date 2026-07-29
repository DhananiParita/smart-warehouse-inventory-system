// Module Name : entry_controller
// Description : Generates a one-clock entry pulse


module entry_controller(

    input clk,
    input reset,

    input entry_btn,

    output reg entry_pulse

);

reg previous_state;

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        previous_state <= 1'b0;
        entry_pulse    <= 1'b0;
    end

    else
    begin

        // Generate pulse only on rising edge
        if(entry_btn && !previous_state)
            entry_pulse <= 1'b1;
        else
            entry_pulse <= 1'b0;

        previous_state <= entry_btn;

    end

end

endmodule