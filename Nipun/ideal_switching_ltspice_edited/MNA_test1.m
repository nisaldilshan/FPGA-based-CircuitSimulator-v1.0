%converting L and C components to parrallel resistor  and currnet source
close all

T = 1/10000; %sampling time
tsw = 1/100; % switching frequency
D = .5; % duty ratio

L = 50*1e-3;
C = 50*1e-6;
R = 10;

A = [   T/(2*L)      ,  -T/(2*L)                  ,   1   ;...
        -T/(2*L)     ,  ((T/2*L)+ (2*C)/T +1/R)   ,   0   ;...
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

v1_vect = [];
v2_vect = [];
IL_vect = [];
Ie_vect = [];

for i = (1:N)
    for j = (1:sampling)
        
        if(j<on_time) % switching
            E = E_val;
        else
            E = -0.8;%because of ideal diode
        end
        
        I_L = I_L  + (v_1-v_2)*T/L;
        I_C = -I_C + 4*v_2*C/T;
        
        temp = A \ [-I_L  ;  I_L + I_C  ; E];
        v_1 = temp(1);
        v_2 = temp(2);
        I_e = temp(3);
        v1_vect = [v1_vect v_1];
        v2_vect = [v2_vect v_2];         
        IL_vect = [IL_vect I_L];
        Ie_vect = [Ie_vect I_e];
    end
end

figure
plot(v2_vect)
title('v_2')

figure 
plot(v1_vect)
title('v_1')

figure 
plot(IL_vect)
title('I_L')

figure 
plot(Ie_vect)
title('I_e')

