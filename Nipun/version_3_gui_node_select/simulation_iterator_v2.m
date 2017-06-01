function simulation_iterator()
    global MNA_inv;
    global MNA;
    global X;
    global Z;
    global voltage_source_currents;
    global compnent_current_sources;
    global passive;
    global voltage_sources;
%     global v1_vect,global v2_vect;
%     global IL_vect;
    global timeStep;
    global simtime;
%     global I_C,global I_L,global C,global L,global E;
    global Node_Vals;
    global SelectedNodes;
    simSteps = simtime/timeStep;

    for iter = (1:simSteps)%number of iterations
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %update dommel model currents
        for i = (1:size(compnent_current_sources,2))%number of passive elements connected nodes 
                %class(compnent_current_sources{i}('imp'))
                v1=0;
                v2=0;
                n1=compnent_current_sources{i}('pos_node');
                n2=compnent_current_sources{i}('neg_node');
                if(n1>0)v1=X(n1); end
                if(n2>0)v2=X(n2); end
                
                imp = compnent_current_sources{i}('imp');
                dir = compnent_current_sources{i}('model_rhs');
                I =  compnent_current_sources{i}('I');  %handles direction of I
                
                %vol_diff = (v1-v2);
                %current = (v1-v2)*imp;
                %I_mod=I*dir;
                
                name=char(compnent_current_sources{i}('comp_name'));
                name=name(1:end-2);
                temp = I*dir+(v1-v2)*imp;
                compnent_current_sources{i}('I')=temp;
                
                %only L and C
%                 if(name(1)=='L')
%                    I_L =  temp;
%                    
%                 else
%                    I_C =  temp; 
%                 end       

        end
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5 
%         v1=0.0;
%         v2=0.0;
%         n1=compnent_current_sources{2}('pos_node');
%         n2=compnent_current_sources{2}('neg_node');
%         if(n1>0)v1=X(n1); end
%         if(n2>0)v2=X(n2); end
%         
%         I_L= compnent_current_sources{2}('I');
%         I_L = I_L*compnent_current_sources{2}('model_rhs')  + (v1-v2)*compnent_current_sources{2}('imp');
%         compnent_current_sources{2}('I')=I_L;
%         
%         v1=0;
%         v2=0;
%         n1=compnent_current_sources{1}('pos_node');
%         n2=compnent_current_sources{1}('neg_node');
%         if(n1>0)v1=X(n1); end
%         if(n2>0)v2=X(n2); end
%         
%         I_C= compnent_current_sources{1}('I');
%         I_C = I_C*compnent_current_sources{1}('model_rhs') + (v1-v2)*compnent_current_sources{1}('imp');
%         compnent_current_sources{1}('I')=I_C;
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %making Z matrix

        %node current handling
        %inward currents positive
        for i = (1:passive)
            temp=0;            
            for j = (1:size(compnent_current_sources,2))%number of passive elements connected nodes            
                if(compnent_current_sources{j}('pos_node')==i)
                    temp = temp-compnent_current_sources{j}('I')*compnent_current_sources{j}('model_rhs');
                else
                    if(compnent_current_sources{j}('neg_node')==i)
                        temp = temp+compnent_current_sources{j}('I')*compnent_current_sources{j}('model_rhs');
                    end
                end
            end
            Z(i)=temp;
        end
        
        %modify value of  switching sources
        for i = (1:voltage_sources)
            
            if(voltage_source_currents{i}('type') == 2)%pulse
                temp = voltage_source_currents{i}('lim_counter');
                
                if(temp>voltage_source_currents{i}('on_lim'))
                    voltage_source_currents{i}('V') = voltage_source_currents{i}('V1');
                else
                    voltage_source_currents{i}('V') = voltage_source_currents{i}('V2');
                end
                
                if(temp==voltage_source_currents{i}('period_lim'))
                    voltage_source_currents{i}('lim_counter')=1;
                else
                    voltage_source_currents{i}('lim_counter')=temp+1;
                end           
            end
        end
        
        %volatge source value insertion
        for i = (1:voltage_sources)
            temp=0.0;
            for j = (1:size(voltage_source_currents,2))%number of passive elements connected nodes            
                if(voltage_source_currents{j}('source_index')==i)
                    temp=voltage_source_currents{j}('V');
                end
            end
            %temp
            Z(passive+i)=temp;
        end
        
        
        
       %Z = [-I_L; I_L+I_C;voltage_source_currents{1}('V')];
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %handling X matrix
        X=MNA\Z;
%         v1_vect=[v1_vect;X(1)];
%         v2_vect=[v2_vect;X(2)];
%         IL_vect = [IL_vect; I_L];
        Node_Vals = [Node_Vals , X(SelectedNodes)];
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
    end
end