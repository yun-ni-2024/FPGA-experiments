`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 22:45:46
// Design Name: 
// Module Name: CLA4
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


module CLA4(
    input [3:0] x, y,
    input cin,
    output [3:0] f,
    output cout
    );
    wire [4:1] p, g;
    wire [4:0] c;
    assign c[0] = cin;
    FA fa0(x[0], y[0], c[0], f[0], p[1], g[1]);
    FA fa1(x[1], y[1], c[1], f[1], p[2], g[2]);
    FA fa2(x[2], y[2], c[2], f[2], p[3], g[3]);
    FA fa3(x[3], y[3], c[3], f[3], p[4], g[4]);
    CLU4 clu(p, g, c[0], c[4:1]);
    assign cout = c[4];
endmodule
