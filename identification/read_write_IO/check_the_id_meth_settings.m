function failed=check_the_id_meth_settings(id_meth_params)
failed=0;
    if (id_meth_params.s<id_meth_params.r)
        disp('choose bigger number of pulses - s')
        failed=1;
    end
    
    if (rank(id_meth_params.W)<id_meth_params.r)
        disp('inappropriatly chosen pulses')
        disp('rank of input matrix W should be >= r')
        failed=1;
    end

    if(id_meth_params.l0<(id_meth_params.alpha+id_meth_params.beta-1))
        disp('the length of free decay l0 must be larger than (alpha+beta-1)')
        failed=1;
    end

    if(id_meth_params.l<(id_meth_params.alpha-1))
        disp('the length of free decay  l must be larger than (alpha-1)')
        failed=1;
    end
end

