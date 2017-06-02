function MNA_handler_v2()
    global MNA;
    global MNA_size;
    global compNames;
    MNA = zeros(MNA_size,MNA_size);  
    
    for i = (1:size(compNames,2))
        switch(compNames{i}(1))
            case 'R'
                resistorValueMNA(i);
            case 'L'
                inductorValueMNA(i);
            case 'C'
                capacitorValueMNA(i);
            case 'V'
                voltageSourceValueMNA(i);
            case 'S'
                switchValueMNA(i);
        end
    end
    
end

function resistorValueMNA(index)
    global Nodes
    global MNA;
    global comDat2;
    value = value_handler(comDat2{index}('val'));
    val = 1.0/value;
    n1 = Nodes{index}(1);
    n2 = Nodes{index}(2);
    if(n1>0)MNA(n1,n1)=MNA(n1,n1)+val; end
    if(n2>0)MNA(n2,n2)=MNA(n2,n2)+val; end
    if(n1>0 && n2>0)
        MNA(n1,n2)= MNA(n1,n2)-val;
        MNA(n2,n1)= MNA(n2,n1)-val;
    end
end

function inductorValueMNA(index)    
    global timeStep;
    global Nodes;
    global MNA;
    global comDat2;
    global compnent_current_sources;
    global compNames;
    value = value_handler(comDat2{index}('val'));
    val = timeStep/(2.0*value);
    n1 = Nodes{index}(1);
    n2 = Nodes{index}(2);
    if(n1>0)MNA(n1,n1)=MNA(n1,n1)+val; end
    if(n2>0)MNA(n2,n2)=MNA(n2,n2)+val; end
    if(n1>0 && n2>0)
        MNA(n1,n2)= MNA(n1,n2)-val;
        MNA(n2,n1)= MNA(n2,n1)-val;
    end
    
    %dommel model current source handling
    obj = containers.Map();
    obj('comp_index')=index;
    obj('I')=0;
    obj('pos_node')=n1;
    obj('neg_node')=n2;
    obj('imp')=timeStep/(value);
    obj('model_rhs')=1.0;
    obj('comp_name')=char(compNames{index});
    obj('comp_val')=value;
    compnent_current_sources{size(compnent_current_sources,2)+1}=obj;
    
end

function capacitorValueMNA(index)    
    global timeStep;
    global Nodes;
    global MNA;
    global comDat2;
    global compnent_current_sources;
    global compNames;
    value = value_handler(comDat2{index}('val'));
    val = (2*value)/timeStep;
    n1 = Nodes{index}(1);
    n2 = Nodes{index}(2);
    if(n1>0)MNA(n1,n1)=MNA(n1,n1)+val; end
    if(n2>0)MNA(n2,n2)=MNA(n2,n2)+val; end
    if(n1>0 && n2>0)
        MNA(n1,n2)= MNA(n1,n2)-val;
        MNA(n2,n1)= MNA(n2,n1)-val;
    end
    
    obj = containers.Map();
    obj('comp_index')=index;
    obj('I')=0.0;
    obj('pos_node')=n1;
    obj('neg_node')=n2;
    obj('imp')=(4.0*value)/timeStep;
    obj('model_rhs')=-1.0; %negative value for reverse current
    obj('comp_name')=char(compNames{index});
    obj('comp_val')=value;
    compnent_current_sources{size(compnent_current_sources,2)+1}=obj;
end

function voltageSourceValueMNA(index)
    global timeStep;
    global Nodes;
    global passive;
    global MNA;
    global comDat2;
    global voltage_source_currents;
    n1 = Nodes{index}(1);
    n2 = Nodes{index}(2);
    comp_ind = passive+comDat2{index}('ind');
    if(n1>0)MNA(n1,comp_ind)= 1; MNA(comp_ind,n1)= 1; end
    if(n2>0)MNA(n2,comp_ind)=-1; MNA(comp_ind,n2)=-1; end
    
    obj=containers.Map();
    obj('comp_index')=index;
    obj('source_index')=comDat2{index}('ind');
    obj('pos_node')=n1;
    obj('neg_node')=n2;
    
    if(comDat2{index}('type')==1)%constant value
            obj('type')     = 1;
            obj('V')       =value_handler(comDat2{index}('val'));
    else
        if(comDat2{index}('type')==2)%PULSE
            obj('type')     = 2;
            obj('V')        =value_handler(comDat2{index}('V1'));
            obj('V1')       =value_handler(comDat2{index}('V1'));
            obj('V2')       =value_handler(comDat2{index}('V2'));
            obj('Tdelay')   =value_handler(comDat2{index}('Tdelay'));
            obj('Trise')    =value_handler(comDat2{index}('Trise'));
            obj('Tfall')    =value_handler(comDat2{index}('Tfall'));
            obj('Ton')      =value_handler(comDat2{index}('Ton'));
            obj('period')   =value_handler(comDat2{index}('period'));
            obj('period_lim')=obj('period')/timeStep;
            obj('on_lim')   =obj('Ton')/timeStep;
            obj('lim_counter')=1;
            
        end
    end
    
    obj('I')=0.0;
    
    voltage_source_currents{size(voltage_source_currents,2)+1} = obj;
end

function switchValueMNA(index)
%     global timeStep;
%     global Nodes;
%     global passive;
%     global MNA;
%     global comDat2;
end



