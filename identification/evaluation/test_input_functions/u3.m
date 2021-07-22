function comp_inp= u3(t,delta_t,W )
    comp_inp=(1+sin(t/delta_t)).*W(:,1)/2;
end

