function id_meth_params = read_id_meth_params(dir)

    %reading the following paramters for used identification
    %p - number of pulses applied for each W(:,i)
    %delta_t - sampling time
    %alpha - parameter to create a Hankel matrix in specific size
    %beta - parameter to create a Hankel matrix in specific size
    %l0 - the length of the first free decay
    %l - the length of free decays in the second step of the method
    %r - number of inputs - known from the experiment desing
    %m - number of outputs - known from the experiment design
    
    fid=fopen(strcat(dir,'/id_meth_specification/id_meth_params.txt'),'r');   
    PVRead=textscan(fid,'%s %f','delimiter','=','EmptyValue',nan);
    fclose(fid);    
    id_meth_params=cell2struct(num2cell(PVRead{2}),PVRead{1},1); 
    id_meth_params.W=dlmread(strcat(dir,'/id_meth_specification/W.txt')); 
    
    %calculate number of sampling points
    id_meth_params.points=1+id_meth_params.l0+id_meth_params.s*(id_meth_params.p+1)*(id_meth_params.l+1);
end

