`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/19 11:19:12
// Design Name: 
// Module Name: multi_8y
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


module multi_8y(
    input clk, //时钟
    input rst_n, //复位信号，低有效
    input [7:0] x, //被乘数
    input [7:0] y, //乘数
    input in_valid, //=1有效时，乘法器开始工作
    output [15:0] p, //乘积
    output out_valid //=1有效时，表示乘法器结束工作
    );
    reg [3:0] cnt;
    always @ (posedge clk) begin
        if (!rst_n) cnt <= 7;
        //else if (rst_n) cnt <= 8;
        else if (in_valid && cnt != 0) cnt <= cnt - 1;
    end
    
    reg [6:0] rx, ry, rp;
    wire c;
    
    always @ (posedge clk) begin
        //if (!rst_n) {rp, ry, rx} <= 0;
        if (!rst_n) {rp, ry, rx} <= {7'b0, y[6:0], x[6:0]};
        else if (in_valid && cnt != 0) {rp, ry} <= {c, rp + (ry[0] ? rx : 0), ry} >> 1;
    end
    
    assign out_valid = (cnt == 0);
    assign p = {x[0] ^ y[0], rp, ry};
endmodule
