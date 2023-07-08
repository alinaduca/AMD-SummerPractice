module DecInputKey (
	input Clk,
	input Reset,
	input ValidCmd,
	input InputKey,

	output Active,
	output Mode);

	localparam IDLE = 4'b0001;
    localparam S1   = 4'b0010;
    localparam S2   = 4'b0100;
    localparam S3   = 4'b1000;
	localparam S4   = 4'b1001;

	reg ActiveCpy, ModeCpy;

	assign Active = ActiveCpy;
	assign Mode = ModeCpy;
	reg [3:0] state;
	
	always @(posedge Clk, posedge Reset) begin
		if (Reset) begin
			state=IDLE;
			ActiveCpy=0;
			ModeCpy=0;
		end else begin
			if(ValidCmd) begin
				case (state)
					IDLE: begin
					if(InputKey)
						state <= S1;
					end
					S1: begin
					if(!InputKey) begin
						state <= S2;

					end else begin
						state <= IDLE;
					end
					end
					S2: begin
					if (InputKey) begin
						state <= S3;						
					end else begin
						state <= IDLE;
					end
					end
					S3: begin
					if (!InputKey) begin
						state <= S4;
					end else begin
						state <= IDLE;
					end
					end
					S4: begin
						if(InputKey) begin
							ActiveCpy <= 1;
							ModeCpy <= 1;
						end
						else begin
							ActiveCpy <= 1;
							ModeCpy <= 0;
						end
					end
				endcase
			end
		end
	end
endmodule