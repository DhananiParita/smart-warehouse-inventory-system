// Module Name : exit_controller
// Description : Generates a one-clock exit pulse


module exit_controller(

    input clk,
    input reset,

    input exit_btn,

    output reg exit_pulse

);

reg previous_state;

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        previous_state <= 1'b0;
        exit_pulse     <= 1'b0;
    end

    else
    begin

        // Generate pulse only on rising edge
        if(exit_btn && !previous_state)
            exit_pulse <= 1'b1;
        else
            exit_pulse <= 1'b0;

        previous_state <= exit_btn;

    end

end

endmodule