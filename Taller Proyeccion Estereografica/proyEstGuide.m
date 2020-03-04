

function varargout = proyEstGuide(varargin)
% PROYESTGUIDE MATLAB code for proyEstGuide.fig
%      PROYESTGUIDE, by itself, creates a new PROYESTGUIDE or raises the existing
%      singleton*.
%
%      H = PROYESTGUIDE returns the handle to a new PROYESTGUIDE or the handle to
%      the existing singleton*.
%
%      PROYESTGUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYESTGUIDE.M with the given input arguments.
%
%      PROYESTGUIDE('Property','Value',...) creates a new PROYESTGUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proyEstGuide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proyEstGuide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proyEstGuide

% Last Modified by GUIDE v2.5 03-Mar-2020 20:59:20


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proyEstGuide_OpeningFcn, ...
                   'gui_OutputFcn',  @proyEstGuide_OutputFcn, ...
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

%%%%%%%%%%%%%%%%%%





% End initialization code - DO NOT EDIT


% --- Executes just before proyEstGuide is made visible.
function proyEstGuide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proyEstGuide (see VARARGIN)

% Choose default command line output for proyEstGuide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proyEstGuide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proyEstGuide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function num_figura_Callback(hObject, eventdata, handles)
% hObject    handle to num_figura (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_figura as text
%        str2double(get(hObject,'String')) returns contents of num_figura as a double


% --- Executes during object creation, after setting all properties.
function num_figura_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_figura (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%

%

% --- Executes on button press in GrafPuntos.
function GrafPuntos_Callback(hObject, eventdata, handles)
clear on
% hObject    handle to GrafPuntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
n = str2num(get(handles.num_puntos, "String"))
[x, y] = ginput(n);
% p1 = [x(1) y(1)];
% p2 = [x(2) y(2)];
% [X, Y] = line2points(p1,p2);
% plot(X, Y);
% xlim([0 1])
% ylim([0 1])
% U = [];
% V = [];

% COLABORACION CON SANTIAGO LOPEZ
for i=1:length(x)-1
    p1 = [x(i) y(i)];
    p2 = [x(i+1) y(i+1)];
    [X, Y] = line2points(p1,p2);
    plot(X,Y, 'k')
    hold on
%     U = horzcat(U, X);
%     V = horzcat(V, Y);
end
% plot(U, V)
xlim([0 1])
ylim([0 1])




% --- Executes on button press in Proy_Puntos.
function Proy_Puntos_Callback(hObject, eventdata, handles)
% hObject    handle to Proy_Puntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function num_puntos_Callback(hObject, eventdata, handles)
% hObject    handle to num_puntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_puntos as text
%        str2double(get(hObject,'String')) returns contents of num_puntos as a double


% --- Executes during object creation, after setting all properties.
function num_puntos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_puntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
