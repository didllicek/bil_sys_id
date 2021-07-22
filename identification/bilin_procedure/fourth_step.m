function [ Ncs,Bc ] = fourth_step( all_Ai_d, all_bi_d, Ac, id_meth_params,n)
    %% estimation of bilinear matrices Nci
    A=[];
    Ncs=zeros(n,n,id_meth_params.r);
    for i=1:id_meth_params.s
        eig(all_Ai_d(:,:,i));
        A=[A,logm(all_Ai_d(:,:,i))/id_meth_params.delta_t-Ac];        
    end
    W=kron(id_meth_params.W,eye(n));
    Nc=A/W;
    sumNcs=zeros(n,n);
    for i=1:id_meth_params.r
        Ncs(:,:,i)=Nc(:,(i-1)*n+1:i*n);
    end     
    %% estimation of input matrix Bc
    B=zeros(n,id_meth_params.s);   
    for i=1:id_meth_params.s
        coef=eye(n)*(id_meth_params.delta_t); 
            for j=2:100       
                coef=coef+((Ac+Nc*kron(id_meth_params.W(:,i),eye(n)))^(j-1)*(id_meth_params.delta_t)^j)/factorial(j);
            end
            coef;
           bci=((Ac+Nc*kron(id_meth_params.W(:,i),eye(n)))\(all_Ai_d(:,:,i)-eye(n)))\all_bi_d(:,:,i);
           %(all_Ai_d(:,:,i)-eye(n))\((Ac+sumNcs)*all_bi_d(:,:,i))
        %bci=(coef\all_bi_d(:,:,i))
        B(:,i)=bci;
    end    
    Bc=B/id_meth_params.W;  
end

