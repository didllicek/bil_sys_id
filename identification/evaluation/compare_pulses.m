 function c_pulses=compare_pulses(dir,y,y_id,ys,ys_id,tps,tps_id,id_meth_params,plotting,suffix)
       c_pulses=norm(y-y_id)/length(y);
       y=y';
       y_id=y_id';
%      if strcmp(suffix,'bilinear')
%          c_pulses=norm(y-y_id)/length(y);
%          y=y';
%          y_id=y_id';
%      else
%          y=y';
%          y_id=y_id';
%          y-y_id
%          c_pulses=norm(y-y_id)/length(y);
%      end
    
%% plotting

    %plot every output separately    
%     if(plotting==1)
%        for i=1:id_meth_params.m  
%             figure('visible','off');            
%             
%             txt = ['points_o',num2str(i)];
%             txt1 = ['y_o',num2str(i)];
%             h=plot(tps,ys(:,i),'LineWidth',2,'DisplayName',txt1);
%             plot(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),y(i,:),'*','DisplayName',txt,'Color',h.Color);
%             
%             txt = ['points_i',num2str(i)];
%             txt1 = ['y_i',num2str(i)];
%             h=plot(tps_id,ys_id(:,i),'LineWidth',2,'DisplayName',txt1);
%             plot(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),y_id(i,:),'o','DisplayName',txt,'Color',h.Color);
%             
%             
%             
%             xlabel('t');
%             ylabel('y(t)');
%             legend show;
%             name=sprintf('\\output%d%s',i,suffix);
%             saveas(gca, fullfile(dir,name),'png');
%         end
%     end
%     
    %% plot all outputs to one figure
    
    if(plotting==2)
        set(gca, 'Fontsize', 16);
        figure('visible','off','DefaultAxesFontSize',18);
        
        hold on
        for i=1:id_meth_params.m
            txt = sprintf('yo%d ',i);
            h=plot(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),y(:,i),'+','DisplayName',txt);          
            txt = sprintf('yi%d ',i);
            plot(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),y_id(:,i),'o','DisplayName',txt,'Color',h.Color);
        end
        hold off;
        xlabel('t');
        ylabel('y(t)');
         
      
        legend boxoff; 
        legend  show;
        
        name=sprintf('\\output_points_%s',suffix);
        saveas(gca, fullfile(dir, name),'png');
    end
    
    
    if(plotting==2)
         set(gca, 'Fontsize', 16);
         figure('visible','off','DefaultAxesFontSize',18);
        hold on
        for i=1:id_meth_params.m
            %txt='lala' 
            txt1 = sprintf('yo%d ',i);
            h=plot(tps,ys(:,i),'-','DisplayName',txt1,'LineWidth',2);         
            %h=plot(0:id_meth_params.delta_t:id_meth_params.delta_t*(id_meth_params.points-1),y_id(:,i),'o','DisplayName',txt);          
            txt1 = sprintf('yi%d ',i);
            plot(tps_id,ys_id(:,i),'+','DisplayName',txt1,'MarkerSize',6,'Color',h.Color);
   
        end
        hold off;
        xlabel('t');
        ylabel('y(t)');
         
      
        legend boxoff; 
        legend  show;
        
        name=sprintf('\\output_all_%s',suffix);
        saveas(gca, fullfile(dir, name),'png');
    end


end

