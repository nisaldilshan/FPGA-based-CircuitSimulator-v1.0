function simulation_iterator()
    %global MNA_inv;
    global MNA;
    global MNA_current;
    global X;
    global Z;
    global voltage_source_currents;
    global compnent_current_sources;
    global switch_components;
    global diode_components;
    global passive;
    global inter_nodes;
    global voltage_sources;
    global switches;
    global diodes;
    global timeStep;
    global simtime;
    global Node_Vals;
    global SelectedNodes;    
    simSteps = simtime/timeStep;
    

    for iter = (1:simSteps)%number of iterations
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %handlin switch states
        MNA_current = MNA;
        for i = (1:switches)
            v_control_pos=0;
            v_control_neg=0;

            vc_n1 = switch_components{i}('control_v+');
            vc_n2 = switch_components{i}('control_v-');
            
            pc_n1 = switch_components{i}('path+');
            pc_n2 = switch_components{i}('path-');
            
            if(vc_n1>0)v_control_pos=X(vc_n1);end
            if(vc_n2>0)v_control_neg=X(vc_n2);end
    
            thresh = switch_components{i}('Vt');
            if(thresh<(v_control_pos-v_control_neg) )
                 temp = switch_components{i}('Gon');
%                     if(pc_n1>0)MNA_current(pc_n1,pc_n1)=MNA_current(pc_n1,pc_n1)+temp;end
%                     if(pc_n2>0)MNA_current(pc_n2,pc_n2)=MNA_current(pc_n2,pc_n2)+temp;end
%                     if(pc_n1>0 && pc_n2>0)
%                         MNA_current(pc_n1,pc_n2)=MNA_current(pc_n1,pc_n2)-temp;
%                         MNA_current(pc_n2,pc_n1)=MNA_current(pc_n2,pc_n1)-temp;
%                     end

            else

                temp = switch_components{i}('Goff');
%                 if(pc_n1>0)MNA_current(pc_n1,pc_n1)=MNA_current(pc_n1,pc_n1)+temp;end
%                 if(pc_n2>0)MNA_current(pc_n2,pc_n2)=MNA_current(pc_n2,pc_n2)+temp;end
%                 if(pc_n1>0 && pc_n2>0)
%                     MNA_current(pc_n1,pc_n2)=MNA_current(pc_n1,pc_n2)-temp;
%                     MNA_current(pc_n2,pc_n1)=MNA_current(pc_n2,pc_n1)-temp;
%                 end

            end
            if(pc_n1>0)MNA_current(pc_n1,pc_n1)=MNA_current(pc_n1,pc_n1)+temp;end
            if(pc_n2>0)MNA_current(pc_n2,pc_n2)=MNA_current(pc_n2,pc_n2)+temp;end
            if(pc_n1>0 && pc_n2>0)
                MNA_current(pc_n1,pc_n2)=MNA_current(pc_n1,pc_n2)-temp;
                MNA_current(pc_n2,pc_n1)=MNA_current(pc_n2,pc_n1)-temp;
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %diode handling
        for i = (1:diodes)
            v_control_pos=0;
            v_control_neg=0;
            n1 = diode_components{i}('Terminal_1');
            n2 = diode_components{i}('Terminal_2');
            n3 = diode_components{i}('Terminal_3');
            
            if(n1>0)v_control_pos=X(n1);end
            if(n3>0)v_control_neg=X(n3);end
            
            if(diode_components{i}('Vd')<=(v_control_pos-v_control_neg))
                tempG = diode_components{i}('Gon');
                tempV = diode_components{i}('Vd');
            else
                tempG = diode_components{i}('Goff');
                tempV = 0;
            end
            
            
            Z(passive+inter_nodes+diode_components{i}('source_index'))=tempV;%forward voltage drop
            
            if(n2>0)MNA_current(n2,n2)=MNA_current(n2,n2)+tempG;end
            if(n3>0)MNA_current(n3,n3)=MNA_current(n3,n3)+tempG;end
            if(n2>0 && n3>0)
                MNA_current(n2,n3)=MNA_current(n2,n3)-tempG;
                MNA_current(n3,n2)=MNA_current(n3,n2)-tempG;
            end
            
        end
        
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

                temp = I*dir+(v1-v2)*imp;
                compnent_current_sources{i}('I')=temp;
        end
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
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %volatge source value insertion
        for i = (1:voltage_sources)
            temp=0.0;
            for j = (1:size(voltage_source_currents,2))%number of passive elements connected nodes            
                if(voltage_source_currents{j}('source_index')==i)
                    temp=voltage_source_currents{j}('V');
                end
            end
            %temp
            Z(passive+inter_nodes+i)=temp;
        end       
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %handling X matrix
        X=MNA_current\Z;
        %X(SelectedNodes)
        Node_Vals = [Node_Vals , X(SelectedNodes)];
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
    end
end