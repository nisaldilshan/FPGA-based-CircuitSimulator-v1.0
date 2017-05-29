%converting L and C components to parrallel resistor  and current source
clear all;
%close all;

T = 1/10000; %sampling time
tsw = 1/100; % switching frequency
D = 0.5; % duty ratio

L = 50*1e-3;
C = 50*1e-6;
R = 10;
Rd = 0.568;
Rs_on = 1/100000000000;
Rs_off = 10000000;
Rs = 0;
Ed = 0;

%switch open at t=0
v_1 = 0;
v_2 = 0;
v_3 = 0;
v_4 = 0;
I_E = 0;

I_L = 0;
I_C = 0;
E_val = 10;

N = 10;              %switchings
sampling = tsw/T;    %sampling per switching period
on_time = sampling*D;        %switch close time

v1_vect2 = [];
v2_vect2 = [];
v3_vect2 = [];
v4_vect2 = [];
IE_vect2 = [];
IEd_vect2 = [];

IL_vect2 = [];

%ind1 = T/L;
%cap1= (4*C)/T;
%temp =zeros(3,1);
for i = (1:N)
    for j = (1:sampling)
        
        if(j<on_time) % switching
            %E = E_val;
            Rs =Rs_on;
        else
            %E = -0.8;
            Rs =Rs_off;
        end
        
        %diode model modifications
        v_diff_diode = 0-v_2;
        if(v_diff_diode>0.8) %j>on_time
            Ed = 0.8;
            Rd = 0.568;
        else
            Ed = 0;   %-(v_1-0);
            Rd = 999999999;
        end
        
        
        I_L = I_L  + (v_2-v_4)*T/L;
        I_C = -I_C + 4*v_4*C/T;
        
        A = [   1/Rs   ,   -1/Rs                 ,          0       ,            0              ,     1    ,     0     ;...
            
                -1/Rs  ,  1/Rd + 1/Rs + (2*C)/T  ,      -1/Rd       ,        -T/(2*L)           ,     0    ,     0     ;...
                
                0      ,   -1/Rd                 ,       1/Rd       ,            0              ,     0    ,     -1    ;...
                
                0      ,   -T/(2*L)              ,         0        ,  (2*C)/T + T/(2*L) + 1/R  ,     0    ,     0     ;...
                
                1      ,    0                    ,         0        ,            0              ,     0    ,     0     ;...
                
                0      ,    0                    ,         -1       ,            0              ,     0    ,     0     ];
               
        
        z = [ 0 ; -I_L ;  0  ;  I_L + I_C  ;  E_val  ;  Ed ];
        
        X = A\z;
        
        v_1  = X(1);
        v_2  = X(2);
        v_3  = X(3);
        v_4  = X(4);
        I_E  = X(5);
        I_Ed = X(6);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% new addition
        if(v_diff_diode<0)
           I_E=-I_L;
           I_Ed=0;
           v_3=v_2;
        else
           I_Ed=I_L;
           I_E=0;
           
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        v1_vect2  = [v1_vect2 ; v_1];
        v2_vect2  = [v2_vect2 ; v_2];         
        v3_vect2  = [v3_vect2 ; v_3];
        v4_vect2  = [v4_vect2 ; v_4];
        IE_vect2  = [IE_vect2 ; I_E];
        IEd_vect2 = [IEd_vect2; I_Ed];        
        
        IL_vect2 = [IL_vect2; I_L];
    end
end

figure1=figure;
time = (0:T:(N*sampling-1)*T);
subplot(3,3,1)
plot(time,v1_vect2)
title('v_1')
xlabel('time(s)')
ylabel('voltage(V)')
%saveas(figure1,'v2_voltage.jpg');

%figure2=figure; 
subplot(3,3,2)
plot(time,v2_vect2)
title('v_2')
xlabel('time(s)')
ylabel('voltage(V)')
%saveas(figure2,'v1_voltage.jpg');

%figure3=figure; 
subplot(3,3,3)
plot(time,v3_vect2)
title('v_3')
xlabel('time(s)')
ylabel('voltage(V)')
%saveas(figure3,'inductor_current.jpg');

%figure3=figure; 
subplot(3,3,4)
plot(time,v4_vect2)
title('v_4')
xlabel('time(s)')
ylabel('voltage(V)')
%saveas(figure3,'inductor_current.jpg');

%figure4=figure; 
subplot(3,3,5)
plot(time,IE_vect2)
title('I_E')
xlabel('time(s)')
ylabel('current(A)')
%saveas(figure4,'DC_source_current.jpg');

%figure5=figure; 
subplot(3,3,6)
plot(time,IEd_vect2)
title('I_Ed')
xlabel('time(s)')
ylabel('current(A)')
%saveas(figure5,'diode_current.jpg');

%figure6=figure; 
subplot(3,3,7)
plot(time,IL_vect2)
title('I_L')
xlabel('time(s)')
ylabel('current(A)')
%saveas(figure6,'diode_current.jpg');

