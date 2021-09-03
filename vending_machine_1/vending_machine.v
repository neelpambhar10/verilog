`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:18 08/26/2021 
// Design Name: 
// Module Name:    vanding_machine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vending_machine(
	
	input  	i_fifty,
	input	   	i_hundred , 	
	input    	i_clk,
	
	input  	i_maza,
	input  	i_fanta ,
	input  	i_cola,

	output reg	o_collect  ,
	output reg 	o_twenty_coin,
	output reg 	o_fifty_coin,
	output reg	o_ten_coin,
	
	output reg	o_maza ,// 20
	output reg	o_fanta , // 30
	output reg	o_cola //  50
	
	
    );
	 
	 reg [7:0] o_r_coin ;
	 reg [2:0]  next_state = 0;
	 
	 parameter HUNDRED = 100;
	 parameter FIFTY = 50;
	 parameter COLA = 50;
	 parameter FANTA = 30;
	 parameter MAZA =20;
	 parameter  INIT_STATE = 0;
	 parameter 	R_COIN_STATE = 1;
	 parameter  OUT_COIN_STATE = 2 ;
	
	
	


always @( posedge i_clk )
	begin
		case ( next_state )
		INIT_STATE : 
			begin 
				if (i_hundred )
					begin
						if ( i_cola )
						begin
							o_r_coin = HUNDRED - COLA;
							
						end
						if ( i_maza )
						begin
							o_r_coin = HUNDRED - MAZA ;
							
						end
						if ( i_fanta )
						begin
							o_r_coin = HUNDRED - FANTA ;
							
						end
					end // end i_hundred = 1
				if (i_fifty)
					begin
						if ( i_cola )
						begin
							o_r_coin = FIFTY - COLA;
							
						end
						if ( i_maza )
						begin
							o_r_coin = FIFTY - MAZA ;
							
						end
						if ( i_fanta )
						begin
							o_r_coin = FIFTY - FANTA ;
							
						end

					end // i_fifty = 1 
					next_state <= R_COIN_STATE ;
				end // init_State 
				
				
				
			R_COIN_STATE :
				begin
					if ( o_r_coin == 30)
					begin 
						o_ten_coin = 1;
						o_twenty_coin  = 1;
					end 
					
					if( o_r_coin == 20)
					begin
						o_twenty_coin =1 ;
					end 
					
					if (o_r_coin == 80)
					begin 
						o_ten_coin = 1;
						o_twenty_coin  = 1;		
						o_fifty_coin = 1;
					end 
					
					next_state  <= OUT_COIN_STATE ;
					
				end// r_coin state
				
				
				
				
			
				OUT_COIN_STATE : begin 
				
				
					if ( i_maza == 1 )
						o_maza <= 1;
						o_cola <= 0;
						o_fanta <= 0 ;
						o_collect = 1;
						
						
						
					if ( i_cola == 1 )
						o_maza <= 0;
						o_cola <= 1;
						o_fanta <= 0 ;
						o_collect = 1;
						
						
						
					if (i_fanta == 1)
						o_maza <= 0;
						o_cola <= 0;
						o_fanta <= 1 ;
						o_collect = 1;
						
						
				end
				default:
				begin
					next_state <= INIT_STATE;
				end 
		endcase 	
end 		

 

endmodule

	 
	 

	 
	






