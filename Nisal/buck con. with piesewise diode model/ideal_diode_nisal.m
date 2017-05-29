clear all;
close all;

%simulation details
T_sam = 1/10000;
T_switch = 1/100;

Rd = 0.568;
Vfw = 0.8;
G_rs = 1.0/Rd;
v_diff_diode=0;

%power 
E_supply_value=10;
E = 0;

%load
R_load = 10;
G_load = 1.0/R_load;

N = 20;        %switchings
switch_time = T_switch/T_sam;
duty_ratio = 0.5;
on_limit = duty_ratio*switch_time;

v1_vect = [];
v2_vect = [];
v3_vect = [];
I_diode_vect = [];

v1=0;
v2=0;
v3=0;
I_Ed=0.0;
Ed = 0;

for i = (1:N)
    for j = (1:switch_time)
        if(j<on_limit)
            E=E_supply_value;
        else
            E=0;
        end
        
        %diode model modifications
        v_diff_diode = v1-v3;
        if(v_diff_diode>0)
            Ed = Vfw;
        else
            Ed = v1-v3;
        end
        
        if(v_diff_diode<0)   
            G_rs=0;
        else
            G_rs = 1/Rd;
        end
        
        A = [ 0     ,       0,            0,      1,  1;...
              0     ,    G_rs,        -G_rs,      0,  -1;...
              0     ,   -G_rs,  G_rs+G_load,      0,   0;...
              1     ,       0,            0,      0,   0;...
              1     ,      -1,            0,      0,   0]; 
          
          
        Z = [0; 0; 0; E; Ed];
        
        X = A\Z;
        
        v1 = X(1);
        v2 = X(2);
        v3 = X(3);
        I_E = X(4);
        I_Ed = X(5);
        
        %diode
        if(v_diff_diode<0.0)
           I_Ed=0;
        end
           
        v1_vect = [v1_vect; v1];
        v2_vect = [v2_vect; v2];
        v3_vect = [v3_vect; v3];
        I_diode_vect = [I_diode_vect; I_Ed];
    end
end
subplot(2,2,1)
plot(v1_vect)
title('v1')

%figure
subplot(2,2,2)
plot(v2_vect)
title('v2')

%figure
subplot(2,2,3)
plot(v3_vect)
title('v3')

%figure
subplot(2,2,4)
plot(I_diode_vect)
title('I_diode')
