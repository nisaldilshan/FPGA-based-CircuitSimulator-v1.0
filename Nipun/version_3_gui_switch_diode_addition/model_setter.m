function model_setter()    
    global model_reference;
    global models;
    global comDat2;
    
    for i = (1:size(model_reference,2))%only consider component that need models
        %disp('checkin models')
        name  = model_reference{i}('model_name');
        index = model_reference{i}('comp_index'); 
        %obj = containers.Map();
        for j = (1:size(models,2))
            if(strcmp(name,models{j}('model_name')))
                %disp('found')
                obj = models{j};
                break;
            end
        end 
        
        remove(obj,{'model_name'});
        comDat2{index} = [comDat2{index};obj];
    end
    %need to read file for particular component type to get model details
end
