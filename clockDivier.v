// TEC - LAB 8  //
// Wprowadzenie //

// -> dzielnik czestotliwosci
// -> migacz LED

module lab8(clk, reset, newCLK, HEX2);

    // deklaracje parametrow
    parameter m = 25;
    parameter n = 8;
    localparam [2:0] s1=3'd0, s2=3'd2, s3=3'd3, s4=3'd4, s5=3'd5;

    // porty
    input clk, reset;
    output newCLK;
    output reg [6:0] HEX2;

    // zmienne
    reg [m-1:0] dzielnik;
    reg [2:0] state_reg, state_next;

    // wolny zegar
    assign newCLK = dzielnik[m-1];

    // dzielnik sterowany "szybkim" zegarem
    // systemowym 50 MHz - po dzielniku ok. 1 Hz
    // reset aktywny poziomem niskim 0
    always@(posedge clk or negedge reset) begin
        if(!reset)
            begin
                dzielnik <= 0;
            end
        else
            begin
                dzielnik <= dzielnik + 1'b1;
            end
    end

    //--------------------------------------------------------------------------------------
    // AUTOMAT
    // licznik sterowany "wolnym" zegarem ok. 1 Hz
    // reset aktywny poziomem niskim 0

    // rejestr automatu
    always@(posedge newCLK or negedge reset)
        if(!reset)
            state_reg <= s1;
        else
            state_reg <= state_next;

    // przejscia automatu
    always@* begin
        HEX2 = ~7'h00;
        case(state_reg)
            s1: begin
                state_next = s2;
                HEX2 = ~7'h00;
                end

            s2: begin
                state_next = s3;
                HEX2 = ~7'h01;
                end

            s3: begin
                state_next = s4;
                HEX2 = ~7'h02;
                end

            s4: begin
                state_next = s5;
                HEX2 = ~7'h40;
                end

            s5: begin
                state_next = s1;
                HEX2 = ~7'h20;
                end

            default: begin
                state_next = s1;
                end
        endcase
    end
endmodule