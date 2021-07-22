function write_sys(dir,suffix,sys_spec)
   
    
    %initial condition    
    out=sprintf(strcat(dir,'\\x0%s.txt'),suffix);    
    dlmwrite(out,sys_spec.x0,'delimiter',' ','precision',3);
    % state matrix
    out=sprintf(strcat(dir,'\\Ac%s.txt'),suffix);  
    dlmwrite(out,sys_spec.Ac,'delimiter',' ','precision',3);
    % input matrix
    out=sprintf(strcat(dir,'\\Bc%s.txt'),suffix);    
    dlmwrite(out,sys_spec.Bc,'delimiter',' ','precision',3);
    % output matrix
    out=sprintf(strcat(dir,'\\C%s.txt'),suffix);    
    dlmwrite(out,sys_spec.C,'delimiter',' ','precision',3);
    % transmission matrix
    out=sprintf(strcat(dir,'\\D%s.txt'),suffix);    
    dlmwrite(out,sys_spec.D,'delimiter',' ','precision',3);
    
    for i=1:sys_spec.r
        out=sprintf(strcat(dir,'\\Nc%d%s.txt'),i,suffix);    
        dlmwrite(out,sys_spec.Ncs(:,:,i),'delimiter',' ','precision',3);
    end
end
