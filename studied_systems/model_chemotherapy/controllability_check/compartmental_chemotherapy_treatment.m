syms x1 x2 x3 k1 k2 k3
assume(x1,'real');assume(x2,'real');assume(x3,'real');
assume(k1,'real');assume(k2,'real');assume(k3,'real');

x=[x1,x2,x3]';

disp('povodny system v pozadovanom tvare')
f=[-k1*x1+2*k3*x3,k1*x1-k2*x2,k2*x2-k3*x3]'
g1=[-2*k3*x3,0,0]'
g2=[0,k2*x2,-k2*x2]'

h=x1+x2+x3
Lfh=lie_der(f,h,x)
Lg1h=lie_der(g1,h,x)
Lg2h=lie_der(g2,h,x)
LfLfh=lie_der(f,Lfh,x)
Lg1Lfh=lie_der(g1,Lfh,x)
Lg2Lfh=lie_der(g2,Lfh,x)

A_obs=[h,Lfh,Lg1h,Lg2h]


jacobian(h,x)
jacobian(Lfh,x)
jacobian(Lg1h,x)
jacobian(Lg2h,x)
jacobian(LfLfh,x)
jacobian(Lg1Lfh,x)
jacobian(Lg2Lfh,x)

Delta0=[g1,g2]
rank(Delta0)
Delta1=[Delta0,lie_parent_fs_Delta([f,g1,g2],Delta0,x)]
rank(Delta1)
Delta2=[Delta1,lie_parent_fs_Delta([f,g1,g2],Delta1,x)]
rank(Delta2)
Delta3=[Delta2,lie_parent_fs_Delta([f,g1,g2],Delta2,x)]
rank(Delta3)


lie_parent(f,g1,x)
lie_parent(f,g2,x)
lie_parent(g1,g2,x)
C=[1,1,1]
NK=[0,0,-2*k3;0,0,0;0,0,0]
NB=[0,0,0;0,k2,0;0,-k2,0]
Ac=[-k1,0,2*k3;k1,-k2,0;0,k2,-k3]
[(NK*Ac-Ac*NK)*x,NK*x,NB*x]
[(NK*NB-NB*NK)*x,NK*x,NB*x]
[(NB*Ac-Ac*NB)*x,NK*x,NB*x]
disp('determinanty')
det([(NK*Ac-Ac*NK)*x,NK*x,NB*x])
det([(NK*NB-NB*NK)*x,NK*x,NB*x])
det([(NB*Ac-Ac*NB)*x,NK*x,NB*x])

rank([(NK*Ac-Ac*NK)*x,NK*x,NB*x])

rank([C;C*Ac;C*NB;C*NK;C*Ac^2])
[C;C*Ac;C*NB;C*NK;C*Ac^2;C*NK^2;C*NB^2;C*Ac]


