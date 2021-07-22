function [y,ys,tps] = generate_output_data(input,id_meth_params,sys_spec)

%% numerical solution of the studied system for given inputs
 % integration for piece--wise continuos inputs
    %numerical integration - using Runge-Kutta of 4th order
            
x0=sys_spec.x0;
t=0:id_meth_params.delta_t:(id_meth_params.points*id_meth_params.delta_t);
y=zeros(sys_spec.m,id_meth_params.points);
%options=odeset('RelTol',1e-10,'MaxStep',id_meth_params.delta_t/100);
options=odeset('RelTol',1e-10,'MaxStep',id_meth_params.delta_t/10);
%options=odeset('RelTol',1e-10,'MaxStep',id_meth_params.delta_t);
%options=odeset('AbsTol',1e-15);
%lambda=0.001;
%options = odeset('Jacobian',lambda);
 xs=[];
 tps=[];
 ys=[];
for i=1:id_meth_params.points
    u=input(:,i);
    t_span=[t(i),t(i+1)];
    [tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,u,sys_spec),t_span,x0,options);
    xs=[xs;xp];
    tps=[tps;tp];
    
    for j=1:length(xp)
        ys=[ys;(sys_spec.C*xp(j,:)'+sys_spec.D*u)'];
    end
    length(xs);
    length(tps);
    length(ys);    
    y(1:sys_spec.m,i)=((sys_spec.C)*x0+sys_spec.D*u)';
    x0=xp(end,:)';
end
end