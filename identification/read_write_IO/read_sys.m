function sys_spec = read_sys(dir)
    %read the specification of studied system    
    sys_spec=struct;  
    
    %initial condition
    fid=fopen(strcat(dir,'\system_specification\init_condition.txt'),'r');
    sys_spec.x0=fscanf(fid,'%f\n');
    fclose(fid);   
     
    % state matrix
    sys_spec.Ac=dlmread(strcat(dir,'\system_specification\Ac.txt')); 
    % input matrix
    sys_spec.Bc=dlmread(strcat(dir,'\system_specification\Bc.txt')); 
    % output matrix
    sys_spec.C=dlmread(strcat(dir,'\system_specification\C.txt')); 
    % transmission matrix
    sys_spec.D=dlmread(strcat(dir,'\system_specification\D.txt'));
    
    %n number of state variables- unknown during identification
    %r number of inputs - known for identification
    %m number of inputs - known for identification
    nxr=size(sys_spec.Bc);
    mxn=size(sys_spec.C);
    sys_spec.n=nxr(1);    
    sys_spec.r=nxr(2);
    sys_spec.m=mxn(1); 
    
    %bilinear matrices
    
    %sys_spec.Ncs=cell(1,sys_spec.r);
    sys_spec.Ncs=zeros(sys_spec.n,sys_spec.n,sys_spec.r);
    for i=1:sys_spec.r
        %sys_spec.Ncs{i}=dlmread(strcat(dir,'\system_specification\Nc',int2str(i),'.txt'));
        sys_spec.Ncs(:,:,i)=dlmread(strcat(dir,'\system_specification\Nc',int2str(i),'.txt'));
    end
end
