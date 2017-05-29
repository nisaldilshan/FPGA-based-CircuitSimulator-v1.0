close all;
clc;
%converting L and C components to parrallel resistor  and current source

T = 1/10000; %sampling time
tsw = 1/100; % switching frequency
D = .5; % duty ratio

L = 50/1000;
C = 50/1000000;
R = 10;

A = [   T/(2*L)      ,  -T/(2*L)                  ,   1   ;...
        -T/(2*L)     ,  ((T/2*L)+ (2*C)/T +1/R)   ,   0   ;...
        1            ,  0                         ,   0    ];

%A_b = inv(A); 

%switch open at t=0
v_1 = 0;
v_2 = 0;
I_E = 0;

I_L = 0;
I_C = 0;
E_val = 10;


N = 25;              %switchings
sampling = tsw/T;    %sampling per switching period
on_time = sampling*D;        %switch close time

v1_vect = [];
v2_vect = [];
Ie_vect = [];

for i = (1:N)
    for j = (1:sampling)
        
        if(j<on_time) % switching
            E = 0;
        else
            E = E_val;
        end
        
        I_L = I_L  + (v_1-v_2)*T/L;
        I_C = -I_C + 4*v_2*C/T;
        
        %diode
        
        
        z = [-I_L  ;  I_L+I_C  ; E];
        
        temp = A \ z;
        v_1 = temp(1);
        v_2 = temp(2);
        I_E = temp(3);
        v1_vect = [v1_vect v_1];
        v2_vect = [v2_vect v_2];  
        Ie_vect = [Ie_vect I_L];
        
        
    
    end
end
x = [v1_vect; v2_vect; Ie_vect];

%plot(x(1,1:length(v1_vect)));
%title('v_1');

figure ;
plot(x(2,1:length(v1_vect)),'r','LineWidth',1);
title('v_2 - MATLAB simulation');

%figure ;
%plot(x(3,1:length(v1_vect)));
%title('I_L');




