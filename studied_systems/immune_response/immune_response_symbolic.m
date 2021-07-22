syms alpha tau1 tau2 alpha1 alpha2 x1

A=[-alpha-1/tau1 0 0;alpha -1/tau2 0;alpha1 alpha2 0]
N= [2*alpha 0 0; -alpha 0 0; 0 0 0]
%C=[1 0 0]
C=[0 0 1]
Ob=[C;C*A;C*N;C*A^2;C*N^2;C*A*N;C*N*A]
rank(Ob)
%b=[x1 0 0]'
%simplify(A*N)
%simplify(N*A)
%simplify(N*N)
%simplify(A*A)
