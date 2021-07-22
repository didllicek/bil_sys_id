function [H1,h1_up] = generateHankelMatrix(y,alpha,beta,m,k)
    H1=zeros(alpha*m,beta);
    idx=1;
    for i=k*m+1:m:beta*m+1
        if (idx==1)
            h1_up=y(i:(i+(alpha-1)*m-1));
        end
        hki=y(i:(i+alpha*m-1));        
        H1(:,idx)=hki;%(1+i*(m-1):i*m,i)=hki;
        idx=idx+1;
    end
end
