%converting L and C components to parrallel resistor  and currnet source

T = 1/100000; %sampling time
%tsw = 1/100; % switching frequency
D = .5; % duty ratio

L = 5*10e-3;
C = 100*10e-6;
R = 10;

A = [   0    , -1/L  ;
    
        1/C  ,-1/(R*C) ];
    
    
 I= [   1  ,  0  ;
    
        0  , 1  ];
    

X = [   0  ;
    
        0  ];    
    
    
B = [   D/L  ;

         0  ]; 
    
   U = [ 10]; 
    
%A_b = inv(A); 

%switch open at t=0



N = 10000;              %switchings
        %switch close time

v1_vect = [];
v2_vect = [];

for i = (1:N)
   
        X = (T*A + I)*X + B*U*T;
      
      
        v_1 = X(1);
        v_2 = X(2);
        v1_vect = [v1_vect v_1];
        v2_vect = [v2_vect v_2];         
    
   
end


plot(v2_vect)
title('v_2')

figure 
plot(v1_vect)
title('v_1')





