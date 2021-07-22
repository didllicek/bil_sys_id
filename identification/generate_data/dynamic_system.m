function dxdt=dynamic_system(t,x,u,sys_spec)
%% system equation of bilinear continuous--time system
 % used for the integration
    dxdt=sys_spec.Ac*x+sys_spec.Bc*u;
    for i=1:sys_spec.r
        dxdt=dxdt+sys_spec.Ncs(:,:,i)*x*u(i);
    end
end
