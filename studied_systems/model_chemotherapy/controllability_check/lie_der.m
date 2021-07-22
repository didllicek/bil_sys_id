function U = lie_der(X, Y, variables)
    U = jacobian(Y, variables)*X;
end

