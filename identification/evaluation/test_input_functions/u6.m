function comp_inp= u6(t,delta_t,W )
    comp_inp=30*exp(-t*3/delta_t).*W(:,1);
end

