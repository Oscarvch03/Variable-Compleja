%%% INTERFAZ GRAFICA PLANO COMPLEJO // PROYECCION ESTEREOGRAFICA

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

% Last Modified by GUIDE v2.5 05-Mar-2020 11:58:50


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
axes(handles.axes1)
xlabel('Eje Real')
ylabel('Eje Imaginario')
xlim([-10, 10])
ylim([-10, 10])
axes(handles.axes2)
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
xlim([-1, 1])
ylim([-1, 1])
zlim([-1, 1])
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
%%% Caja para especificar el # de la figura que se desea graficar y proyectar

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


% --- Executes on button press in GraficarPuntosProy.
function GraficarPuntosProy_Callback(hObject, eventdata, handles)
%%% Funcion que grafica y proyecta los n puntos seleccionados en el plano
%%% complejo

% hObject    handle to GraficarPuntosProy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[a,b,c] = sphere(50);
axes(handles.axes1)
cla
plot(NaN,NaN)
xlabel('Eje Real')
ylabel('Eje Imaginario')
xlim([-10, 10])
ylim([-10, 10])
axes(handles.axes2)
cla
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
plot3(a, b, c, 'c')
clc
n = str2num(get(handles.num_puntos, "String"));
[x, y] = ginput(n);
U = [];
V = [];

for i=1:length(x)-1
    p1 = [x(i) y(i)];
    p2 = [x(i+1) y(i+1)];
    [X, Y] = line2points(p1,p2);
    U(length(U)+1) = NaN;
    V(length(V)+1) = NaN;
    U = horzcat(U, X);
    V = horzcat(V, Y);
end
axes(handles.axes1)
cla
plot(U, V, 'r')
xlabel('Eje Real')
ylabel('Eje Imaginario')
xlim([-10, 10])
ylim([-10, 10])

%

Z = complex(U, V);

X1 = 2.*real(Z)./((abs(Z).^2)+1);
X2 = 2.*imag(Z)./((abs(Z).^2)+1);
X3 = ((abs(Z).^2)-1)./((abs(Z).^2)+1);

axes(handles.axes2)

hold on
plot3(X1, X2, X3, 'r')
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])



function num_puntos_Callback(hObject, eventdata, handles)
%%% Caja para especificar el # de funtos a graficar y proyectar

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


% --- Executes on button press in GraficarPuntosProy.
function GraficarFigura_Callback(hObject, eventdata, handles)
%%% Boton que se encarga de graficar la figura deseada (1-4)

% hObject    handle to GraficarPuntosProy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla
xlabel('Eje Real')
ylabel('Eje Imaginario')
axes(handles.axes2)
cla
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')

f = str2num(get(handles.num_figura, "String"));

if(f == 1)
    figure1(handles);
elseif(f == 2)
    figure2(handles);
elseif(f == 3)
    figure3(handles);
elseif(f == 4)
    figure4(handles);
end


% --- Executes on button press in Empezar.
function Empezar_Callback(hObject, eventdata, handles)
%%% Funcion que me permite seleccionar todos los puntos que desee
%%% graficar y proyectar
%%% Si doy clic izquierdo me guarda el punto para graficarlo y 
%%% proyectarlo
%%% Si doy clic derecho, guarda el ultimo punto seleccionado y ahora
%%% puedo seleccionar puntos para otra figura
%%% Si doy clic fuera del Plano Complejo dejo de seleccionar puntos,
%%% y proyecto todos los que ya seleccione

% hObject    handle to Empezar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[a,b,c] = sphere(50);
axes(handles.axes1)
cla
plot(NaN, NaN)
xlabel('Eje Real')
ylabel('Eje Imaginario')
xlim([-10, 10])
ylim([-10, 10])
axes(handles.axes2)
cla
plot3(a, b, c, 'c')
hold on
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
X = [];
Y = [];
i = 1;
while(true)
    [x, y, button] = ginput(1);
    if(button == 3)
        X(i) = NaN;
        Y(i) = NaN;
    else
        if(-10<x && x<10 && -10<y && y<10)
        X(i) = x;
        Y(i) = y;
        else
            Z = complex(X, Y);
            X1 = 2.*real(Z)./((abs(Z).^2)+1);
            X2 = 2.*imag(Z)./((abs(Z).^2)+1);
            X3 = ((abs(Z).^2)-1)./((abs(Z).^2)+1);
            axes(handles.axes2)
            plot3(X1, X2, X3, 'r')
            xlim([-1 1])
            ylim([-1 1])
            zlim([-1 1])
            break;
        end
        if(i ~= 1)
            p1 = [X(i-1), Y(i-1)];
            p2 = [X(i), Y(i)];
            [U, V] = line2points(p1,p2);
            axes(handles.axes1)
            hold on
            plot(U, V, 'r');
            xlabel('Eje Real')
            ylabel('Eje Imaginario')
            xlim([-10, 10])
            ylim([-10, 10])
        end
    end
    i = i+1;
end
