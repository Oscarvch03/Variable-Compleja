

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

% Last Modified by GUIDE v2.5 04-Mar-2020 18:50:27


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

% --- Executes on button press in GraficarPuntosProy.
function GraficarPuntosProy_Callback(hObject, eventdata, handles)
cla
[a,b,c] = sphere(50);

axes(handles.axes1)
plot(NaN,NaN)
xlabel('Eje Real')
ylabel('Eje Imaginario')
xlim([-10, 10])
ylim([-10, 10])
axes(handles.axes2)
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
% plot3(NaN, NaN, NaN)
plot3(a, b, c, 'c')
% hObject    handle to GraficarPuntosProy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
n = str2num(get(handles.num_puntos, "String"));
[x, y] = ginput(n);
% p1 = [x(1) y(1)];
% p2 = [x(2) y(2)];
% [X, Y] = line2points(p1,p2);
% plot(X, Y);
% xlim([0 1])
% ylim([0 1])
U = [];
V = [];

% COLABORACION CON SANTIAGO LOPEZ
for i=1:length(x)-1
    p1 = [x(i) y(i)];
    p2 = [x(i+1) y(i+1)];
    [X, Y] = line2points(p1,p2);
%     plot(X,Y, 'k')
%     hold on
    U(length(U)+1) = NaN;
    V(length(V)+1) = NaN;
    U = horzcat(U, X);
    V = horzcat(V, Y);
end
axes(handles.axes1)
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
% hObject    handle to GraficarPuntosProy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
axes(handles.axes1)
xlabel('Eje Real')
ylabel('Eje Imaginario')
axes(handles.axes2)
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')

f = str2num(get(handles.num_figura, "String"));

if(f == 1)
    r = 0.5;
    r2 = 0.1;
    xc = 0;
    yc = 0;
    theta = linspace(0,2*pi, 400);
    X = [];
    Y = [];
    for i = 1:5
        % genero u circulo
        x = r*cos(theta) + xc;
        y = r*sin(theta) + yc;

        % sobre el anterior circulo hago mas circulos
        for j = 1:20:length(x)
            x1 = r2*cos(theta) + x(j);
            y1 = r2*sin(theta) + y(j);
            X(length(X)+1) = NaN;
            Y(length(Y)+1) = NaN;
            X = horzcat(X, x1);
            Y = horzcat(Y, y1);
        end    
        r = r + 0.2;
    end

    r = 2;
    r2 = 0.5;
    xc = 0;
    yc = 0;
    x = r*cos(theta) + xc;
    y = r*sin(theta) + yc;

    for k = 1:25:length(x)
        x1 = r2*cos(theta) + x(k);
        y1 = r2*sin(theta) + y(k);

        X(length(X)+1) = NaN;
        Y(length(Y)+1) = NaN;

        X = horzcat(X, x1);
        Y = horzcat(Y, y1);
    end

    %

    Z = complex(X, Y);

    X1 = 2.*real(Z)./((abs(Z).^2)+1);
    X2 = 2.*imag(Z)./((abs(Z).^2)+1);
    X3 = ((abs(Z).^2)-1)./((abs(Z).^2)+1);

    axes(handles.axes1)
    plot(X, Y, 'r')
    xlabel('Eje Real')
    ylabel('Eje Imaginario')
    xlim([min(X), max(X)])
    ylim([min(Y), max(Y)])
    axes(handles.axes2)
    [a,b,c] = sphere(50);
    colormap winter
    mesh(a, b, c)
    xlabel('Coordenada X1')
    ylabel('Coordenada X2')
    zlabel('Coordenada X3')
    xlim([-1 1])
    ylim([-1 1])
    zlim([-1 1])
    hold on
    plot3(X1, X2, X3, 'r')
    axis equal
elseif(f == 2)
    theta = linspace(0,30*pi, 1200);
    a = 0.2;

    X = [];
    Y = [];

    x = a.*theta.*cos(theta);
    y = a.*theta.*sin(theta);

    X = horzcat(X, x);
    Y = horzcat(Y, y);

    % Para dibujar poligonos
    n = 5;
    r = 0.08;
    tita = (0:(4*pi/n):4*pi) + pi/2;
    for i = 1:5:length(x)
        if(i > 20*5)
            r = r;
        elseif(20*3 < i <= 20*5)
            r = r;   
        end

        x1 = r.*cos(tita) + x(i);
        y1 = r.*sin(tita) + y(i);
        X(length(X)+1) = NaN;
        Y(length(Y)+1) = NaN;
        X = horzcat(X, x1);
        Y = horzcat(Y, y1);
    end

    %

    Z = complex(X, Y);

    X1 = 2.*real(Z)./((abs(Z).^2)+1);
    X2 = 2.*imag(Z)./((abs(Z).^2)+1);
    X3 = ((abs(Z).^2)-1)./((abs(Z).^2)+1);

    axes(handles.axes1)
    
    plot(X, Y, 'r')
    xlabel('Eje Real')
    ylabel('Eje Imaginario')
    axes(handles.axes2)
    
    [a,b,c] = sphere(50);
    colormap winter
    plot3(a, b, c,'c')
    xlabel('Coordenada X1')
    ylabel('Coordenada X2')
    zlabel('Coordenada X3')
    hold on
    plot3(X1, X2, X3, 'r')
    axis equal

elseif(f == 3)
    theta = linspace(-6,6, 1000);

    X = [];
    Y = [];

    x = 2.5 .* (sin(-5 .* theta).^2) .* 2.^(cos(cos(4.28.*2.3.*theta)));
    y = 2.5 .* sin(sin(-5.*theta)) .* (cos(4.28 .* 2.3 .* theta) .^2);

    X = horzcat(X, x);
    Y = horzcat(Y, y);

    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;

    x1 = -1 .* x;
    X = horzcat(X, x1);
    Y = horzcat(Y, y);

    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;

    X = horzcat(X, y);
    Y = horzcat(Y, x1);

    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;

    X = horzcat(X, y);
    Y = horzcat(Y, x);


    ymax = max(y);
    for i = 1:length(y)
        if(y(i) == ymax)
            xymax = x(i);
            break;
        end
    end

    r = 0.3;
    x1 = r*cos(theta) + xymax;
    y1 = r*sin(theta) + ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) + xymax;
    y1 = r*sin(theta) + ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.3;
    x1 = r*cos(theta) - xymax;
    y1 = r*sin(theta) - ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) - xymax;
    y1 = r*sin(theta) - ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.3;
    x1 = r*cos(theta) + xymax;
    y1 = r*sin(theta) - ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) + xymax;
    y1 = r*sin(theta) - ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.3;
    x1 = r*cos(theta) - xymax;
    y1 = r*sin(theta) + ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) - xymax;
    y1 = r*sin(theta) + ymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    %

    r = 0.3;
    x1 = r*cos(theta) + ymax;
    y1 = r*sin(theta) + xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) + ymax;
    y1 = r*sin(theta) + xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.3;
    x1 = r*cos(theta) - ymax;
    y1 = r*sin(theta) - xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) - ymax;
    y1 = r*sin(theta) - xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.3;
    x1 = r*cos(theta) + ymax;
    y1 = r*sin(theta) - xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) + ymax;
    y1 = r*sin(theta) - xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.3;
    x1 = r*cos(theta) - ymax;
    y1 = r*sin(theta) + xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    r = 0.5;
    x1 = r*cos(theta) - ymax;
    y1 = r*sin(theta) + xymax;
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);

    %

    Z = complex(X, Y);

    X1 = 2.*real(Z)./((abs(Z).^2)+1);
    X2 = 2.*imag(Z)./((abs(Z).^2)+1);
    X3 = ((abs(Z).^2)-1)./((abs(Z).^2)+1);

    axes(handles.axes1)
    
    plot(X, Y, 'r')
    xlabel('Eje Real')
    ylabel('Eje Imaginario')
    axes(handles.axes2)
    
    [a,b,c] = sphere(50);
    colormap winter
    plot3(a, b, c,'c')
    xlabel('Coordenada X1')
    ylabel('Coordenada X2')
    zlabel('Coordenada X3')
    hold on
    plot3(X1, X2, X3, 'r')
    axis equal
elseif(f == 4)
    theta = linspace(-6.2,6.2, 1000);

    X = [];
    Y = [];

    x = 10.*sin(2.78.*theta).*round(sqrt(cos(cos(8.2.*theta))));
    y = 9.*(cos(2.78.*theta).^2).*sin(sin(8.2.*theta));

    X = horzcat(X, x);
    Y = horzcat(Y, y);

    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;

    X = horzcat(X, x);
    Y = horzcat(Y, y + 4);

    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;

    X = horzcat(X, -1.*y+1.5);
    Y = horzcat(Y, x+2);

    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;

    X = horzcat(X, -1.*y-1.5);
    Y = horzcat(Y, x+2);

    %

    Z = complex(X, Y);

    X1 = 2.*real(Z)./((abs(Z).^2)+1);
    X2 = 2.*imag(Z)./((abs(Z).^2)+1);
    X3 = ((abs(Z).^2)-1)./((abs(Z).^2)+1);

    axes(handles.axes1)
    
    plot(X, Y, 'r')
    xlabel('Eje Real')
    ylabel('Eje Imaginario')
    axes(handles.axes2)
    
    [a,b,c] = sphere(50);
    colormap winter
    plot3(a, b, c,'c')
    xlabel('Coordenada X1')
    ylabel('Coordenada X2')
    zlabel('Coordenada X3')
    hold on
    plot3(X1, X2, X3, 'r')
    axis equal
end
