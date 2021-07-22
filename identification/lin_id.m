function new_sys_spec=lin_id(id_meth_params,Y_fr,Y,forces)
%% procedure for linear identification

    %new I/O equivalent linear system
    new_sys_spec=struct;
    new_sys_spec.r=id_meth_params.r;
    new_sys_spec.m=id_meth_params.m;
    
%% first step of the procedure   
    [H1,~]=generateHankelMatrix(Y_fr,id_meth_params.alpha,id_meth_params.beta,id_meth_params.m,0);	
    [U,S,V] = svd(H1);
    
    n=0;
    suma=0;
    
    
    while ((suma/sum(S(:)))<(1-id_meth_params.precision))
        n=n+1;
        suma=suma+S(n,n);
    end   
    
    new_sys_spec.n=n;
   
    
    U1=U(1:(id_meth_params.alpha*id_meth_params.m),1:n);
    rank(U1);
    S1=S(1:n,1:n);
    V1=V(1:(id_meth_params.beta),1:n);
    
    % identification of matrix C
    new_sys_spec.C=U1(1:id_meth_params.m,:);
    
    % matrix B1_dashed -  used in second part
    S1V1T=S1*V1';
    new_sys_spec.x0=S1V1T(:,1);
    
   % identification of matrix Ac
   U1_up=U1(1:(id_meth_params.alpha-1)*id_meth_params.m,:);
   rank(U1_up);
   U1_down=U1((id_meth_params.m+1):id_meth_params.alpha*id_meth_params.m,:);
   rank(U1_down);
   Ad=U1_up\U1_down;
   
   new_sys_spec.Ac=logm(Ad)/id_meth_params.delta_t;
  
   
%% second step of identification  

    Y_p=[];
    for i=1:id_meth_params.r
        Y_p(:,i)=(Y(:,i)-Y_fr)/forces(i); 
        new_sys_spec.D(:,i)=Y_p(1:id_meth_params.m,i);
        new_sys_spec.Ncs(:,:,i)=zeros(new_sys_spec.n,new_sys_spec.n);
    end
    Y_p;
    H2=generateHankelMatrixLinear(Y_p,id_meth_params.alpha,id_meth_params.beta,id_meth_params.m,1);  
        U1;
        H2;
        Co=U1\H2;
        Bd=Co(:,1:id_meth_params.r);
    
    % transformation of discrete--time matrix to continuos--time matrix 
    new_sys_spec.Bc=(new_sys_spec.Ac\(Ad-eye(new_sys_spec.n)))\Bd;     
end