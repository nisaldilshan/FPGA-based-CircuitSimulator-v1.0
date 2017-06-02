function value= value_handler(val_str)

    global suffices_sym;
    global suffices_val; 
    result = isstrprop(val_str,'alpha'); % where the letters are
    if(sum(result)>0)
        %disp('found');
        %val_str
        suffix_ind = find(result,1); % start index of the suffix name
        actual = {upper(val_str(suffix_ind:end))};%take the string containing suffix name 
        suffix = suffices_val(find(strcmp(actual,suffices_sym)));
        value = str2double(val_str(1:suffix_ind-1))*suffix;
        
    else
        %disp('ok');
        value = str2double(val_str);
    end
end