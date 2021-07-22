function write_norms(dir,suffix,c_outputs_norms,c_matrix_norms, eigs_or, eigs_new)
   %% write computed norms to results 
    out=sprintf(strcat(dir,'\\c_output_norms%s.txt'),suffix);    
    dlmwrite(out,c_outputs_norms,'delimiter',' ','precision',3);
    
    out=sprintf(strcat(dir,'\\c_matrix_norms%s.txt'),suffix);    
    dlmwrite(out,c_matrix_norms,'delimiter',' ','precision',3);
    
    out=sprintf(strcat(dir,'\\eigs_or%s.txt'),suffix);    
    dlmwrite(out,eigs_or,'delimiter',' ','precision',3);
    
    out=sprintf(strcat(dir,'\\eigs_new%s.txt'),suffix);    
    dlmwrite(out,eigs_new,'delimiter',' ','precision',3);
