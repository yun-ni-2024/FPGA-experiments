`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 16:00:46
// Design Name: 
// Module Name: FA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA(
    input x, y, cin,
    output f, cout, p, g
    );
    assign f = x ^ y ^ cin;
    assign cout = (x & y) | (x & cin) | (y & cin);
    assign p = x | y;
    assign g = x & y;
endmodule
