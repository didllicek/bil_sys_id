function c = compare(dir,sys_spec,new_sys_spec,id_meth_params,u,suffix)
    
   %% generate outputs for given u(t)     
    [tp_or,y_original,inp]=generate_output_continuous(sys_spec,id_meth_params.delta_t,id_meth_params.l0,id_meth_params.W,u);
    [tp_new,y_id,~]=generate_output_continuous(new_sys_spec,id_meth_params.delta_t,id_meth_params.l0,id_meth_params.W,u);
    
    %% print input for given u(t)
            set(gca, 'Fontsize', 16);
      figure('visible','off','DefaultAxesFontSize',18);
     plot(tp_or,inp','LineWidth',2,'DisplayName',suffix);
     xlabel('t');
     ylabel('u(t)');
     name=sprintf('\\inputCont_%s',suffix);
     saveas(gca, fullfile(dir, name),'png');     
    
    %% compare output for original and identified system
     set(gca, 'Fontsize', 16);
    figure('visible','off','DefaultAxesFontSize',18);
    hold on
        for i=1:id_meth_params.m
            txt_or = sprintf('yo%d ',i);       
            h=plot(tp_or,y_original(:,i),'-','LineWidth',2,'DisplayName',txt_or);
            txt_id = sprintf('yi%d ',i);
            plot(tp_new,y_id(:,i),'+','LineWidth',2,'DisplayName',txt_id,'Color',h.Color)
        end
     hold off;
     xlabel('t');
     ylabel('y(t)');
     legend show;
     name=sprintf('\\comparison_%s',suffix);
     saveas(gca, fullfile(dir, name),'png'); 
     
     c=norm(y_original-y_id)/length(y_original); 
     
     

end

