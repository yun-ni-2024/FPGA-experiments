`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/25 15:55:33
// Design Name: 
// Module Name: BranchControl
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


module BranchControl(
    input zero, result0,
    input [2:0] Branch,
    output reg NxtASrc, NxtBSrc
    );
    
    always @ (*) begin
        case (Branch)
            3'b000: begin NxtASrc = 0; NxtBSrc = 0; end //����תָ��
            3'b001: begin NxtASrc = 0; NxtBSrc = 1; end //jal: ��������תPCĿ��
            3'b010: begin NxtASrc = 1; NxtBSrc = 1; end //jalr: ��������ת�Ĵ���Ŀ��
            3'b100: begin NxtASrc = 0; NxtBSrc = zero; end //beq: ������֧������
            3'b101: begin NxtASrc = 0; NxtBSrc = !zero; end //bne: ������֧��������
            3'b110: begin NxtASrc = 0; NxtBSrc = result0; end //blt, bltu: ������֧��С��
            3'b111: begin NxtASrc = 0; NxtBSrc = zero | (!result0); end //bge, bgeu: ������֧�����ڵ���
            default: begin NxtASrc = 0; NxtBSrc = 0; end
        endcase
    end
    
endmodule
