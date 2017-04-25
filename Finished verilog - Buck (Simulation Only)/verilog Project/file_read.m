clear all;

file_d=fopen('decimal.txt','rb');
file_i=fopen('integer.txt','rb');
dec = fscanf(file_d,'%i');
int = fscanf(file_i,'%i');
dec= dec/65536;
num = int + dec;
figure;
plot(num);
title('v_2 - Verilog simulation');