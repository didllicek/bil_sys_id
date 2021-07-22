function  [all_Ai_d,all_bi_d,X] = second_step(y,A,U1_up,x_l0,id_meth_params,n)
%% estimate the matrices Ai_d and bi_d of corresponding discrete--time linear systems
    all_Ai_d=zeros(n,n,id_meth_params.s);
    all_bi_d=zeros(n,1,id_meth_params.s);
    Y1=[];
    X1=[x_l0;1];
    X=[];
    k=id_meth_params.l0+2;
    m=id_meth_params.m;
    for j=1:id_meth_params.s
        for i=k*m+1:m*(id_meth_params.l+1):k*m+id_meth_params.p*(id_meth_params.l+1)*m+1
            hki=y(i:(i+(id_meth_params.alpha-1)*m-1));
            X1=[X1,[A^(id_meth_params.l)*(U1_up\hki);1]];
            Y1=[Y1,(U1_up\hki)];
        end
        if(j<=id_meth_params.s)
            x_to_next_cycle=X1(:,end);
        end
        X1=X1(:,1:end-1);
        X=[X,X1(1:end-1,:)];   
        %Aib_d=Y1*X1'/(X1*X1'); 
        Aib_d=Y1/X1;
        Ai_d=Aib_d(:,1:end-1);
        bi_d=Aib_d(:,end);
        all_Ai_d(:,:,j)= Ai_d;
        all_bi_d(:,:,j)= bi_d;
        X1=x_to_next_cycle;
        Y1=[];
        k=(i-1+(id_meth_params.l+1)*m)/m;
    end       
end