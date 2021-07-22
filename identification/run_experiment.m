function run_experiment(dir,u1,u2)
    dir_bilin=[dir,'\\results_bilin']
    dir_lin=[dir,'\\results_lin']
    if exist(dir_bilin,'dir') 
        rmdir(dir_bilin,'s')
    end
    if exist( dir_lin,'dir') 
        rmdir(dir_lin,'s')
    end
        
    mkdir(dir,'results_bilin');

    mkdir(dir,'results_lin');

    
    %% read matrices describing dynamic system and specification for the identification
    c_pulses=[];c_cont1=1e10;c_cont2=1e10;c_matrix_norms=[];
    sys_spec=read_sys(dir);

    id_meth_params=read_id_meth_params(dir);
    
    
    % we now number of measured inputs and outputs
    id_meth_params.r=sys_spec.r;
    id_meth_params.m=sys_spec.m;
    
    % print system matrix of corresponding discre--time system
    A_d=expm(sys_spec.Ac*id_meth_params.delta_t);
    rank(A_d);
    rank(sys_spec.C*A_d);
    obsv(A_d,sys_spec.C);
    obsv(sys_spec.Ac,sys_spec.C);
    
    rank(obsv(sys_spec.Ac,sys_spec.C));
    %pause
   
    
    %% recommended parameters l0 and delta_t 
     % considering eigenvalues of system matrix
    if isreal(eig(sys_spec.Ac))
         disp('here')
        lambdas=abs(eig(sys_spec.Ac));
        idx=lambdas>0;
        lambdas_nonzero=lambdas(idx);
        tf=1/min(lambdas_nonzero);
        delta_t=1/4/max(lambdas_nonzero)
        l0=tf/delta_t
        if(id_meth_params.delta_t>delta_t)
            disp('Delta_t might be too large!')
        end
        if(l0> id_meth_params.l0)
            disp('Length l0 might be too small!')
        end
    end
   
    %% comapre eigenvalues of original bilinear system
     % and corresponding linear system for given constant input
    disp('Eigenvalues Ac')
    eig(sys_spec.Ac)
    ANu=sys_spec.Ac;
    for i=1:sys_spec.r
        ANu=ANu+sys_spec.Ncs(:,:,i)*id_meth_params.W(i,1);
    end
    disp('Eigenvalues Ac+sum(Nci*ui)')
    eig(ANu) 
    
    %% bilinear identification experiment
    dir=dir_bilin;
    %generate input/output data for the given system
    [U,input] = generate_input_data(dir,id_meth_params,1,'bilin');
    [y,ys,tps]=generate_output_data(input,id_meth_params,sys_spec);
    Yp=reshape(y,[sys_spec.m*id_meth_params.points,1]);
    
    %identification of bilinear system
    [new_sys_spec,failed]=bilin_id(id_meth_params,Yp,U);
    if(failed)
        return
    end
    write_sys(dir,'_identified',new_sys_spec)
    
    %% bilinear experiment evaluation
    
    %generate response of identified system to input used for identification    
    [y_id,ys_id,tps_id]=generate_output_data(input,id_meth_params,new_sys_spec); 
    
    c_pulses=compare_pulses(dir,y,y_id,ys,ys_id,tps,tps_id,id_meth_params,2,'bilinear');
    c_cont1 = compare(dir,sys_spec,new_sys_spec,id_meth_params,u1,'u1');
    c_cont2 = compare(dir,sys_spec,new_sys_spec,id_meth_params,u2,'u2');  
    
    
    c_outputs_norms=[c_pulses,c_cont1,c_cont2];
    
    % only identified system has the same dimension as orifginal one!  
 
     [c_matrix_norms,eigs_or,eigs_new] = compare_matrices(dir,sys_spec, new_sys_spec);   
  
    
     write_norms(dir,'_bilinear',c_outputs_norms,c_matrix_norms,eigs_or,eigs_new);
    

    
    %% Markov Parameters of identified and original system
    new_sys_spec.C*new_sys_spec.Bc;
    new_sys_spec.C*new_sys_spec.Ac*new_sys_spec.Bc;
    new_sys_spec.C*(new_sys_spec.Ac^2)*new_sys_spec.Bc;
    
    sys_spec.C*sys_spec.Bc;
    sys_spec.C*sys_spec.Ac*sys_spec.Bc;
    sys_spec.C*(sys_spec.Ac^2)*sys_spec.Bc;
    
    
    %% linear identification experiment   
    dir=dir_lin;
    %generate input/output data for the given system
    [forces,input] = generate_input_data(dir,id_meth_params,2,'lin');
    [y_free,~,~]=generate_output_data(input(:,:,1),id_meth_params,sys_spec);
    Y_free=reshape(y_free,[sys_spec.m*id_meth_params.points,1]);
    Y_p=[];
    
    %yp=zeros(:,1:id_meth_params.m,1:id_meth_params.r);
    %ysp=zeros(:,1:id_meth_params.m,1:id_meth_params.r);
    %tpsp=zeros(:,1,1:id_meth_params.r);    
    %ysp=[]; ysp_id=[];
    %tpsp=[]; tpsp_id=[];
    
    
    for i=1:id_meth_params.r
        [y,ys,tps]=generate_output_data(input(:,:,1+i),id_meth_params,sys_spec);
        yp{i}=y;
        ysp{i}=ys;
        tpsp{i}=tps;
        y=reshape(y,[sys_spec.m*id_meth_params.points,1]);
        Y_p=[Y_p,y];
    end;
    lin_sys_spec=lin_id(id_meth_params,Y_free,Y_p,forces);
    write_sys(dir,'_identified_linear',lin_sys_spec)
    
    %% linear experiment evaluation
    c_pulses=[];
    %generate response of identified system to input used for identification 
    for i=1:id_meth_params.r
        [y,ys,tps]=generate_output_data(input(:,:,1+i),id_meth_params,lin_sys_spec);
        name=sprintf('linear_u%d',i);
        c_pulses=[c_pulses,compare_pulses(dir,yp{i},y,ysp{i},ys,tpsp{i},tps,id_meth_params,2,name)];
        %y=reshape(y,[sys_spec.m*id_meth_params.points,1]);
        %Y_p_id=[Y_p_id,y];
    end   
    
    c_cont1 = compare(dir,sys_spec,lin_sys_spec,id_meth_params,u1,'u1_lin');
    c_cont2 = compare(dir,sys_spec,lin_sys_spec,id_meth_params,u2,'u2_lin');
    
    c_outputs_norms=[c_pulses,c_cont1, c_cont2];
    
    % only identified system has the same dimension as orifginal one!  
    [c_matrix_norms, eigs_or,eigs_new] = compare_matrices(dir,sys_spec, lin_sys_spec);    
    write_norms(dir,'_linear',c_outputs_norms,c_matrix_norms,eigs_or,eigs_new);  
   
end

