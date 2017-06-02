function varargout = node_select_for_simulation(varargin)
% NODE_SELECT_FOR_SIMULATION MATLAB code for node_select_for_simulation.fig
%      NODE_SELECT_FOR_SIMULATION, by itself, creates a new NODE_SELECT_FOR_SIMULATION or raises the existing
%      singleton*.
%
%      H = NODE_SELECT_FOR_SIMULATION returns the handle to a new NODE_SELECT_FOR_SIMULATION or the handle to
%      the existing singleton*.
%
%      NODE_SELECT_FOR_SIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NODE_SELECT_FOR_SIMULATION.M with the given input arguments.
%
%      NODE_SELECT_FOR_SIMULATION('Property','Value',...) creates a new NODE_SELECT_FOR_SIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before node_select_for_simulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to node_select_for_simulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help node_select_for_simulation

% Last Modified by GUIDE v2.5 31-May-2017 19:35:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @node_select_for_simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @node_select_for_simulation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before node_select_for_simulation is made visible.
function node_select_for_simulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to node_select_for_simulation (see VARARGIN)

% Choose default command line output for node_select_for_simulation
handles.output = hObject;

% Update handles structure
TotalNodes = evalin('base','passive');
nodeArray = zeros(TotalNodes,1);
for i = (1:TotalNodes)
    nodeArray(i,1) = i;
end
global nodeStrArray;
nodeStrArray = num2str(nodeArray);
set(handles.NodeList,'string',nodeStrArray);

global SelectedNodes;
SelectedNodes = [];

guidata(hObject, handles);

% UIWAIT makes node_select_for_simulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = node_select_for_simulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in NodeList.
function NodeList_Callback(hObject, eventdata, handles)
% hObject    handle to NodeList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NodeList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NodeList
global nodeStrArray,global SelectedNodes;
index_selected = get(handles.NodeList,'Value');
nodeVal = str2double(nodeStrArray(index_selected,:));
if((size(SelectedNodes,1)>0) || ~ismember(nodeVal,SelectedNodes))
    SelectedNodes = [SelectedNodes; nodeVal];
    SelectedNodes= sort(SelectedNodes);
    SelectedNodesStr = num2str(SelectedNodes);
    set(handles.SelectedNodeList,'string',SelectedNodesStr);
end


% --- Executes during object creation, after setting all properties.
function NodeList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NodeList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SelectedNodeList.
function SelectedNodeList_Callback(hObject, eventdata, handles)
% hObject    handle to SelectedNodeList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectedNodeList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectedNodeList
global SelectedNodes;
index_selected = get(handles.SelectedNodeList,'Value');
SelectedNodes(index_selected)=[];
SelectedNodesStr = num2str(SelectedNodes);
set(handles.SelectedNodeList,'string',SelectedNodesStr);


% --- Executes during object creation, after setting all properties.
function SelectedNodeList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectedNodeList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartSim.
function StartSim_Callback(hObject, eventdata, handles)
% hObject    handle to StartSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SelectedNodes;
assignin('base','SelectedNodes',SelectedNodes);
close(handles.figure1);
