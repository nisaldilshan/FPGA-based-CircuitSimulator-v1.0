%converting L and C components to parrallel resistor  and currnet source
close all
clear all

T = 1/10000; %sampling time
tsw = 1/100; % switching frequency
D = .5; % duty ratio

L = 50*1e-3;
C = 50*1e-6;
R = 10;

A = [   T/(2*L)      ,  -T/(2*L)                  ,   1   ;...
        -T/(2*L)     ,  (T/(2*L)+ (2*C)/T +1/R)   ,   0   ;...
        1            ,  0                         ,   0    ];

A_b = inv(A); 

%switch open at t=0
v_1 = 0;
v_2 = 0;
I_E = 0;

I_L = 0;
I_C = 0;
E_val = 10;


N = 10;              %switchings
sampling = tsw/T;    %sampling per switching period
on_time = sampling*D;        %switch close time

v1_vect2 = [];
v2_vect2 = [];
IL_vect2 = [];
Ie_vect2 = [];
Id_vect2 = [];
ind1 = T/L;
cap1= (4*C)/T;
temp =zeros(3,1);
for i = (1:N)
    for j = (1:sampling)
        
        if(j<on_time) % switching
            E = E_val;
        else
            E = -0.8;%because of  diode
        end
        
        I_L = I_L  + (v_1-v_2)*T/L;
        %I_L = I_L  + (temp(1)-temp(2))*ind1;
        I_C = -I_C + 4*v_2*C/T;
        %I_C = -I_C + temp(2)*cap1;
        
        temp = A\[-I_L  ;  I_L + I_C  ; E];
        v_1 = temp(1);
        v_2 = temp(2);
        I_E = temp(3);
        v1_vect2 = [v1_vect2; v_1];
        v2_vect2 = [v2_vect2; v_2];         
        IL_vect2 = [IL_vect2; I_L];
        
        if(v_1>=0) % because of the diode
            I_E=I_L;
            I_d = 0;
        else
            I_d = I_L;
            I_E = 0;
        end
        Id_vect2 = [Id_vect2; I_d];
        Ie_vect2 = [Ie_vect2; I_E];
    end
end

figure1=figure;
time = (0:T:(N*sampling-1)*T);
subplot(3,2,1)
plot(time,v2_vect2)
title('buck convertor output')
xlabel('time(s)')
ylabel('voltage(V)')
%saveas(figure1,'v2_voltage.jpg');

%figure2=figure; 
subplot(3,2,2)
plot(time,v1_vect2)
title('v_1')
xlabel('time(s)')
ylabel('voltage(V)')
%saveas(figure2,'v1_voltage.jpg');

%figure3=figure; 
subplot(3,2,3)
plot(time,IL_vect2)
title('I_L')
xlabel('time(s)')
ylabel('current(A)')
%saveas(figure3,'inductor_current.jpg');

%figure4=figure; 
subplot(3,2,4)
plot(time,Ie_vect2)
title('buck convertor DC source current')
xlabel('time(s)')
ylabel('current(A)')
%saveas(figure4,'DC_source_current.jpg');

%figure5=figure; 
subplot(3,2,5)
plot(time,Id_vect2)
title('buck converter diode current')
xlabel('time(s)')
ylabel('current(A)')
%saveas(figure5,'diode_current.jpg');

