function [U,input] = generate_input_data(dir,id_meth_params,plotting,sys_type)

    %from the given specification of input in id_meth_params,
    %generate the input used for output generations - input
    
    %% generate the vector characterizing input used further in the
    %identification - U
    
    if(strcmp(sys_type,'bilin'))
        input=zeros(id_meth_params.r,id_meth_params.points);
        j=1;
        U=[];
        for i=1:id_meth_params.s
            if(j==1)
                input(:,j)=id_meth_params.W(:,i);
                U=[U,id_meth_params.W(:,i)];
                j=j+id_meth_params.l0+1;
            end
            for k=1:id_meth_params.p+1
                input(:,j)=id_meth_params.W(:,i);
                U=[U,id_meth_params.W(:,i)];
                j=j+id_meth_params.l+1;
            end
        end 
    end

    if(strcmp(sys_type,'lin'))
         U=zeros(id_meth_params.r);
         input=zeros(id_meth_params.r,id_meth_params.points,id_meth_params.r+1);
         for(i=1:id_meth_params.r)
             input(i,1,i+1)=id_meth_params.W(i,i);
             U(i)=id_meth_params.W(i,i);
         end
    end
    
    %% plot every input separately
    
    if(plotting==1)
       for i=1:id_meth_params.r
            set(gca, 'Fontsize', 16);
            figure('visible','off','DefaultAxesFontSize',18);
            txt = ['u',num2str(i)];
            if(strcmp(sys_type,'lin'))
                stairs(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),[input(:,:,i+1)]','LineWidth',2,'DisplayName',txt);
            end
            if(strcmp(sys_type,'bilin'))   
                stairs(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),input(i,:),'LineWidth',2,'DisplayName',txt);
            end
            xlabel('t');
            ylabel('u(t)');
            legend show;
            name=sprintf('\\input%d',i);
            saveas(gca, fullfile(dir,name),'png');
        end
    end
    
    %% plot all inputs to one figure
    
    if(plotting==2)
         set(gca, 'Fontsize', 16);
         figure('visible','off','DefaultAxesFontSize',18);
        hold on
        for i=1:id_meth_params.r
            txt = ['u',num2str(i)];
            if(strcmp(sys_type,'lin'))
                stairs([0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1)],[input(:,:,i+1)]','LineWidth',2,'DisplayName',txt);
            end
            if(strcmp(sys_type,'bilin'))   
                stairs(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),input(i,:),'LineWidth',2,'DisplayName',txt);
            end
        end
        hold off
        xlabel('t')
        ylabel('u(t)')
        legend show
        name=sprintf('\\input_%s',sys_type);
        saveas(gca, fullfile(dir,name),'png');
    end

end

