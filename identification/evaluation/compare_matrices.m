function [ c_matrix_norms,eigs_or,eigs_new] = compare_matrices(dir,sys_spec, new_sys_spec)
    %% compare norms for differences between 
     %transformed matrices of identified system and matrices of original
     %system
     %diferences between identified and original eigenvalues of system and bilinear
     %matrices
    
    c_matrix_norms=zeros(1,4+sys_spec.r);
    eigs_or=[eig(sys_spec.Ac)];
    eigs_new=[eig(new_sys_spec.Ac)];
     for i=1:sys_spec.r
         eigs_or=[eigs_or,eig(sys_spec.Ncs(:,:,i))];
         eigs_new=[eigs_new,eig(new_sys_spec.Ncs(:,:,i))];         
     end 
    
    %generation of transformation matrix and transformation only if correct
    %dimension of system was determined
    if sys_spec.n==new_sys_spec.n
        sys_spec_trans=transformation(new_sys_spec,sys_spec); 
        c_matrix_norms(1)=norm(sys_spec_trans.Ac-sys_spec.Ac);%/(sys_spec.n*sys_spec.n);
        c_matrix_norms(2)=norm(sys_spec_trans.Bc-sys_spec.Bc);%/(sys_spec.n*sys_spec.r);
        c_matrix_norms(3)=norm(sys_spec_trans.C-sys_spec.C);%/(sys_spec.m*sys_spec.n);
        c_matrix_norms(4)=norm(sys_spec_trans.D-sys_spec.D);%/(sys_spec.r*sys_spec.m); 
        for i=1:sys_spec.r
            c_matrix_norms(4+i)=norm(sys_spec_trans.Ncs(:,:,i)-sys_spec.Ncs(:,:,i));%/(sys_spec.n*sys_spec.n);
        end  
        write_sys(dir,'_transformed',sys_spec_trans)  
    end
end