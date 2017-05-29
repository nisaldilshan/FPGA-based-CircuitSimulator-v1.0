clear all;

file_d=fopen('decimal.txt','rb');
file_i=fopen('integer.txt','rb');
dec = fscanf(file_d,'%i');
int = fscanf(file_i,'%i');
dec= dec/65536;
num = int + dec;
num2 = num(1:length(num)/2);
figure;
plot(num2,'r','LineWidth',1);
title('v_2 - Verilog simulation');