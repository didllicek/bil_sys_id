function [ x_0, D ] = third_step(y,all_Ai_d,all_bi_d,x_1,U,C,id_meth_params,X)
    %% estimation of transmission matrx D and initial condition x0
    D=[];
    D2=[];
    D1=[y(1:id_meth_params.m)];
    x_0=all_Ai_d(:,:,1)\(x_1-all_bi_d(:,:,1));
    X=[x_0,X];
    id_meth_params.p;
    np=(id_meth_params.s*(id_meth_params.p+1)-1);
    for i=(id_meth_params.m*(id_meth_params.l0+1)+1):id_meth_params.m*(id_meth_params.l+1):(id_meth_params.m*(id_meth_params.l0+1)+1)+np*id_meth_params.m*(id_meth_params.l+1)
         D1=[D1, y(i:i+id_meth_params.m-1)];    
    end    
    for i=1:length(X)
        D2=[D2,D1(:,i)-C*X(:,i)]; 
    end    
    D=D2/U;

end

