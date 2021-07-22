function dxdt=polynomial(t,x,params,u)
	[kp1,km1,k2]=params;
	dxdt=zeros(4,1);
	dxdt(1)=-kp1*x(1)*x(2)+km1*x(4)+u;
	dxdt(2)=-kp1*x(1)*x(2)+km1*x(4);
	dxdt(3)=k2*x(4);
	dxdt(4)=kp1*x(1)*x(2)-km1*x(4)-k2*x(4);
end




