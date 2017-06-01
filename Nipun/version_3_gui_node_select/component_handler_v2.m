function component_handler_v2(data_str,index)

    data_arr = char(strsplit(data_str,{'(',')',' '}));
    %class(data_str(1))
    switch(upper(data_arr(1,1)))
        case 'R' 
            resistorElement(data_arr,index);         
        case 'L' 
            inductorElement(data_arr,index);
        case 'C' 
            capacitorElement(data_arr,index);
        case 'V'
            voltageSourceElement(data_arr,index);
        case 'S'
            switchElement(data_arr,index);
        case '.'
            cmd = strtrim(data_arr(1,2:end));
            if(strcmp(cmd,'tran'))
                global simtime
                simtime = value_handler(strtrim(data_arr(2,:)));
            else
                if(strcmp(cmd,'model'))
                    model_extractor(data_arr);
                end
            end
            
    end
    
end

function resistorElement(data_arr,index) 
    %data_arr = char(strsplit(data_arr));
    global compNames;
    compNames{size(compNames,2)+1} = data_arr(1,:);
    global compTypes;
    compTypes{size(compTypes,2)+1} = 0; % for resistors
    NodeFinder(2,data_arr);
    %detailHandler(4,data_arr);
    %detailHandler2(4,data_arr);
    detailHandler_advanced(4,data_arr,index);
    %global passive;
    %passive = passive+1;
    
end 

function inductorElement(data_arr,index)
    %data_arr = char(strsplit(data_arr));
    global compNames;
    compNames{size(compNames,2)+1} = data_arr(1,:);
    global compTypes;
    compTypes{size(compTypes,2)+1} = 1; % for inductors
    NodeFinder(2,data_arr);
    %detailHandler(4,data_arr);
    %detailHandler2(4,data_arr);
    detailHandler_advanced(4,data_arr,index);
    %global passive;
    %passive = passive+1;
    
end

function capacitorElement(data_arr,index)
    %data_arr = char(strsplit(data_arr));
    global compNames;
    compNames{size(compNames,2)+1} = data_arr(1,:);
    global compTypes;
    compTypes{size(compTypes,2)+1} = 2; % for capacitors
    NodeFinder(2,data_arr);
    %detailHandler(4,data_arr);
    %detailHandler2(4,data_arr);
    detailHandler_advanced(4,data_arr,index);
    %global passive;
    %passive = passive+1;
end

function voltageSourceElement(data_arr,index)
    %data_arr
    global voltage_sources;
    voltage_sources=voltage_sources+1;
    
    global compNames;
    compNames{size(compNames,2)+1} = data_arr(1,:);
    global compTypes;
    compTypes{size(compTypes,2)+1} = 3; % for voltage sources
    NodeFinder(2,data_arr);
    %edit to handle pulse, const
    %voltageDetailHandler(4,data_arr);
    voltageDetailHandler2(4,data_arr,index);
end

function switchElement(data_arr,index)
    %data_arr
    global switches
    switches = switches +1;
    
    global compNames;
    compNames{size(compNames,2)+1} = data_arr(1,:);
    
    global compTypes;
    compTypes{size(compTypes,2)+1} = 4; % for switches
    
    NodeFinder(4,data_arr);
    detailHandler_advanced(6,data_arr,index);
end

function model_extractor(data_arr)
    global models;
    obj = containers.Map();
    model_name = strtrim(data_arr(2,:));
    obj('model_name') =  strtrim(data_arr(2,:));
    obj('model_type') =  strtrim(data_arr(3,:));
    parameter_names = {};
    parameter_values = {};
    for i=(4:size(data_arr,1)-1) 
        details = strtrim(strsplit(data_arr(i,:),'='));
        parameter_names = [parameter_names;details(1)];
        parameter_values = [parameter_values;details(2)];
    end
    obj_new = containers.Map(parameter_names,parameter_values);
    obj = [obj;obj_new];    
    models{size(models,2)+1}=obj;
end

function NodeFinder(num,data_arr)
    global passive;
    temp=[];
    for i=(2:num+1)
        temp_val=0;
        if(data_arr(i,1)=='N')
            temp_val=str2num(data_arr(i,(2:end)));            
        else
            temp_val=str2num(data_arr(i));
        end
        
        temp=[temp; temp_val]; 
        if(temp_val>passive)
            passive=temp_val;
        end
    end
    global Nodes;
    if(size(Nodes,1)==0)
        Nodes = {temp};
    else
        Nodes{size(Nodes,2)+1}=temp;
    end
    
    
end

%depricated by detailHandler2
% function detailHandler(start,data_arr)
%     global comDat;
%     %isnumeric(data_arr(start:end,:))
%     if(size(comDat,2)==0)
%         comDat = {data_arr(start:end,:)};
%     else
%         comDat{size(comDat,2)+1}=data_arr(start:end,:);
%     end
% 
% end

function detailHandler2(start,data_arr)
    global comDat2;
    obj = containers.Map();
    obj('val')= strtrim(data_arr(start,:));
    
    comDat2{size(comDat2,2)+1}=obj;
    
end

function detailHandler_advanced(start,data_arr,index)
    global comDat2;
    obj = containers.Map();
    if(isletter(data_arr(start,1)))
        global model_reference;
        model_name= strtrim(data_arr(start,:));
        obj('model_name')=model_name;
        
        obj_new = containers.Map();
        obj_new('model_name')=model_name;
        obj_new('comp_index')=index;        
        model_reference{size(model_reference,2)+1}=obj_new;
    else
        obj('val')= strtrim(data_arr(start,:));
    end
    
    comDat2{size(comDat2,2)+1}=obj;
    
end

%depricated by voltageDetailHandler2
% function voltageDetailHandler(start,data_arr)
%     global comDat;
%     %data_arr(1,:)
%     ind = isstrprop(data_arr(1,:),'digit');%what are the digits
%     value_ind = find(ind,1); %start index of number in name
%     val = str2num(data_arr(1,(value_ind:end)));
%     %isnumeric(data_arr(start:end,:))
%     if(size(comDat,2)==0)
%         comDat = {[data_arr(start:end,:),val]};
%     else
%         comDat{size(comDat,2)+1}={[data_arr(start:end,:),val]};
%     end
% 
% end

function voltageDetailHandler2(start,data_arr,index)%need more functionality for PULSE like sources
    global comDat2;
    
    obj = containers.Map();  
    if(sum(isstrprop(data_arr(start,1:end),'digit'),2)>0)
        obj('type') = 1;
        obj('val')  = strtrim(data_arr(start,:));
    else
      %other source types 
      if(strcmp(upper(data_arr(start,:)),'PULSE'))
          %disp('found');
          obj('type')   = 2;
          obj('V1')     = strtrim(data_arr(start+1,:));
          obj('V2')     = strtrim(data_arr(start+2,:));
          obj('Tdelay') = strtrim(data_arr(start+3,:));
          obj('Trise')  = strtrim(data_arr(start+4,:));
          obj('Tfall')  = strtrim(data_arr(start+5,:));
          obj('Ton')    = strtrim(data_arr(start+6,:));
          obj('period') = strtrim(data_arr(start+7,:));
      else
          %disp('not found');
      end
    end
    %handle the number of source ,ex:- V1,V2
    ind = isstrprop(data_arr(1,:),'digit');%what are the digits
    value_ind = find(ind,1); %start index of number in name
    val = str2num(data_arr(1,(value_ind:end)));
    obj('ind') = val;
    
    comDat2{size(comDat2,2)+1}=obj;

end

