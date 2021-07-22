function trans_sys_spec=transformation(new_sys_spec,sys_spec)
    
    %% generate matrix for transformation of identified matrices
    %Q_vawe=[new_sys_spec.C];
    %Q=[sys_spec.C];
    %for i=2:new_sys_spec.n
    %    Q_vawe=[Q_vawe;new_sys_spec.C*new_sys_spec.Ac^(new_sys_spec.n-1)];
    %    Q=[Q;sys_spec.C*sys_spec.Ac^(new_sys_spec.n-1)];
    %end
    %disp('tansformation - rank of observability matrices')     
    phi=obsv(sys_spec.Ac,sys_spec.C)\obsv(new_sys_spec.Ac,new_sys_spec.C);
    %phi=Q\Q_vawe
    %pause
    
    %% transformation of identified system
    x0_at=phi*new_sys_spec.x0;
    Ac_at=(phi*new_sys_spec.Ac)/phi;
    Bc_at=phi*new_sys_spec.Bc;
    C_at=new_sys_spec.C/phi;
    D_at=new_sys_spec.D;
    Ncs_at=zeros(sys_spec.n,sys_spec.n,sys_spec.r);
    
    for i=1:sys_spec.r
        Nci=new_sys_spec.Ncs(:,:,i);
        Ncs_at(:,:,i)=(phi*Nci)/phi;
       (phi*Nci)/phi;
    end
    
    %% return transformed system
    trans_sys_spec=struct;
    trans_sys_spec.Ac=Ac_at;
    trans_sys_spec.Bc=Bc_at;
    trans_sys_spec.C=C_at;
    trans_sys_spec.D=D_at;
    trans_sys_spec.Ncs=Ncs_at;
    trans_sys_spec.x0=x0_at;   
    [trans_sys_spec.n, trans_sys_spec.r]=size(Bc_at);
    [trans_sys_spec.m, ~]=size(C_at);      
end