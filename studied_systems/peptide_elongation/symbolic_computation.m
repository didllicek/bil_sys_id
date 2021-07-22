syms kp1 km1 kp2 km2 k3 k4 k5 k6 k7 
Ac=[0 km1 0 0 k7 k6;
    0 -km1-kp2 km2 0 0 0;
    0 kp2 -km2 -k3 0 0;
    0 0 k3 -k4 0 0;
    0  0 0 k4 -k5-k7 0;
    0 0 0 0 k5 -k6]

Nc1=[-kp1 0 0 0 0 0;
     0 kp1 0 0 0 0;
     0 0 0 0 0 0;
     0 0 0 0 0 0;
     0 0 0 0 0 0;
     0 0 0 0 0 0]
C=eye(6)
Bc=zeros(6,1)



