function lp = lie_parent(f, g, vars) 
 lp = jacobian(g, vars)*f-jacobian(f,vars)*g;
end

