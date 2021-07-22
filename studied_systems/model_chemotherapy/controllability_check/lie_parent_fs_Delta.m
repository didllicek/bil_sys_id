function lds = lie_parent_fs_Delta(tau,Delta,vars )
    lds=[];
    lenght_tau = size(tau, 2);
    lenght_delta = size(Delta, 2);
    for j=1:lenght_tau
        for i=1:lenght_delta
            lds=[lds,lie_parent(tau(:,j),Delta(:,i),vars)];
        end
    end
end

