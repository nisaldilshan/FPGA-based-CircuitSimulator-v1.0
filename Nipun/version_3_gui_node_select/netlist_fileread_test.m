clear all
close all
global simtime;
simtime =0;

global suffices_sym,global suffices_val,global suffices;
suffices_sym = {'F';'P';'N';'U';'M';'K';'MEG';'G';'T';'MIL'};
suffices_val = [1e-15;1e-12;1e-9;1e-6;1e-3;1e3;1e6;1e9;1e12;25.4e-6];

global voltage_source_types;
voltage_source_types = {'PULSE','SINE'};

global timeStep;
timeStep = 1e-5;


global compNames,global compTypes;
global comDat,global comDat2,global Nodes;
global models, global model_reference;
compNames={};
compTypes={};
comDat = {};
comDat2 = {};
Nodes = {};
models ={};
model_reference = {};

global passive,global voltage_sources, global MNA_size,global switches;
passive =0;
voltage_sources =0;
switches =0;
MNA_size=0;

global MNA;
global MNA_inv;
global X;
X=[];
global Z;
Z=[];

global compnent_current_sources;
compnent_current_sources={};

global voltage_source_currents;
voltage_source_currents={};

% global v1_vect,global v2_vect,global IL_vect;
% v1_vect=[]; v2_vect=[];
% IL_vect=[];

% global I_C,global I_L,global C,global L,global E;
% I_L=0;
% I_C=0;
% C=50*1e-6;
% L=50*1e-3;
% E=10;

global Node_Vals;
Node_Vals = [];


filename = uigetfile({'*.*'},'File Selector');
[fid,msg ]= fopen(filename);

if(~isa(fid,'double') || fid<0)% file errors are not fully handled
    disp(msg)
else
    
    %get line by line input
    line_num = 1;
    tline = fgetl(fid);
    while ischar(tline)
        %disp(tline)
        
        tline = fgetl(fid);
        if(~isa(fid,'double')  && (tline(1)=='*'))continue; end %avoid commments
        
        if(tline(1)== -1) break; end %avoid EOF
        
        component_handler_v2(tline,line_num);
        line_num = line_num+1;
    end

    fclose(fid); %close file id
    
    MNA_size = passive+voltage_sources;
    X= zeros(MNA_size,1);
    Z= zeros(MNA_size,1);
    MNA_handler_v2();

    gui = node_select_for_simulation;
    waitfor(gui);
    clear('gui');
    
    MNA_inv= inv(MNA);
    simulation_iterator_v2();
    
    if(size(SelectedNodes,1)==1)
        figure
        plot(Node_Vals);
        str = ['Node ',num2str(SelectedNodes)];
        title(str);
    else
        for i = (1:size(SelectedNodes,1))
            figure
            plot(Node_Vals(SelectedNodes(i),:));
            str = ['Node ',num2str(i)];
            title(str);
        end
    end
%     
%     plot(v1_vect);
%     title('v_1');
%     figure
%     plot(v2_vect);
%     title('v_2');
%     figure
%     plot(IL_vect);
%     title('I_L');
end
