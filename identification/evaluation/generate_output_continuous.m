function [tp,y,inp] = generate_output_continuous(sys_spec,delta_t,l0,W,u)
    %% genetare response to continuous--time input
    x0=sys_spec.x0;
    options=odeset('RelTol',1e-10,'MaxStep',delta_t/10);
    %lambda=0.001;
    %options = odeset('Jacobian',-lambda,'Stats','on');
    %u=ones(sys_spec.r,1)*W(:,1)';
    t_span=(0:(delta_t/10):(3*delta_t*l0));
    [tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,u(tp,delta_t,W),sys_spec),t_span,x0,options);
    %[tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,u,sys_spec),t_span,x0,options);
    y=[];inp=[];
    for i=1:length(xp)
        y=[y;(sys_spec.C*xp(i,:)'+sys_spec.D*u(tp(i),delta_t,W))'];
        inp=[inp,u(tp(i),delta_t,W)];
    %   y=[y;(sys_spec.C*xp(i,:)'+sys_spec.D*u)'];
    end
end

