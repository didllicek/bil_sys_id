function H1 = generateHankelMatrixLinear(y,alpha,beta,m,k)
    H1=[];
    for i=k*m+1:m:beta*m+1
        hki=y(i:(i+alpha*m-1),:);        
        H1=[H1,hki];
    end
end

