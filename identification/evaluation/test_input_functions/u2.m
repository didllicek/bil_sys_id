function comp_inp= u2(t,delta_t,W )
    comp_inp=(1+sin(t/delta_t)).*W(:,1)/10;
end

