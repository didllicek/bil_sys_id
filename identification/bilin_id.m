function [new_sys_spec,failed]=bilin_id(id_meth_params,Yp,U)


    %create structure for new I/O equivalent bilinear system
    new_sys_spec=struct;
    new_sys_spec.r=id_meth_params.r;
    new_sys_spec.m=id_meth_params.m;
    
    %check if the 
    failed=check_the_id_meth_settings(id_meth_params);
    if(failed)
        disp('identification failed!')
        disp('incorrect setting of method params')
     return
    end    

    
    %linear_approximation(sys_spec.x0,Yp,id_meth_params)
    

    %use measuered outputs for generation of hankel matrix
    [H1,h1_up]=generateHankelMatrix(Yp,id_meth_params.alpha,id_meth_params.beta,id_meth_params.m,1);
    
    
    % run individual steps of the identification method 
    
    [new_sys_spec.Ac,new_sys_spec.C,new_sys_spec.n,x_1,x_l0,U1_up,A,failed]=first_step(H1,h1_up,id_meth_params);
    if(failed)
        disp('identification failed!')
        disp('incorrect setting of method params')
        return
    end  
   
    [all_Ai_d,all_bi_d,X] = second_step(Yp,A,U1_up,x_l0,id_meth_params,new_sys_spec.n);
    
    [new_sys_spec.x0,new_sys_spec.D]=third_step(Yp,all_Ai_d,all_bi_d,x_1,U,new_sys_spec.C,id_meth_params,X);
    
    [new_sys_spec.Ncs,new_sys_spec.Bc]=fourth_step(all_Ai_d,all_bi_d, new_sys_spec.Ac, id_meth_params, new_sys_spec.n);
end
