function varargout = tugas1(varargin)
% TUGAS1 MATLAB code for tugas1.fig
%      TUGAS1, by itself, creates a new TUGAS1 or raises the existing
%      singleton*.
%
%      H = TUGAS1 returns the handle to a new TUGAS1 or the handle to
%      the existing singleton*.
%
%      TUGAS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS1.M with the given input arguments.
%
%      TUGAS1('Property','Value',...) creates a new TUGAS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tugas1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tugas1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tugas1

% Last Modified by GUIDE v2.5 19-Feb-2019 08:44:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tugas1_OpeningFcn, ...
                   'gui_OutputFcn',  @tugas1_OutputFcn, ...
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


% --- Executes just before tugas1 is made visible.
function tugas1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tugas1 (see VARARGIN)

% Choose default command line output for tugas1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tugas1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Menghilangkan grid pada window
axis off;


% --- Outputs from this function are returned to the command line.
function varargout = tugas1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in inputimage.
function inputimage_Callback(hObject, eventdata, handles)
% hObject    handle to inputimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Membuka window file selector untuk memilih gambar bertipe .jpg dan .png
[filename pathname] = uigetfile({'*.jpg;*.png;*.bmp';},'File Selector');
% Membuat image menjadi variabel global
global image;
image = strcat(pathname, filename);
% Membuat map menjadi variabel global
global map;
map = imread(image);
% Menampilkan image di axes1
axes(handles.axes1);
imshow(image);
% Menampilkan direktori file
set(handles.edit1,'string',image);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearimage.
function clearimage_Callback(hObject, eventdata, handles)
% hObject    handle to clearimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Menghapus image dari axes1
cla(handles.axes1,'reset');
axis off;


% --- Executes on button press in grayscalebutton.
function grayscalebutton_Callback(hObject, eventdata, handles)
% hObject    handle to grayscalebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Melakukan perhitungan terhadap R, G, dan B
R = map(:,:,1);
G = map(:,:,2);
B = map(:,:,3);
sumR = sum(R(:));
sumG = sum(G(:));
sumB = sum(B(:));
sumTotal = sum([sumR, sumG, sumB]);
varR = sumR/sumTotal;
varG = sumG/sumTotal;
varB = sumB/sumTotal;
% Membuat grayscale
newimage = varR * R + varG * G + varB * B;
% Menampilkan image di axes1
axes(handles.axes1);
imshow(newimage);


% --- Executes on button press in tambahbutton.
function tambahbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tambahbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Menambahkan nilai masing-masing pixel sebanyak 10
map(:,:,:) = map(:,:,:) + 10;
% Menampilkan image di axes1
axes(handles.axes1);
imshow(map);

% --- Executes on button press in kalibutton.
function kalibutton_Callback(hObject, eventdata, handles)
% hObject    handle to kalibutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Mengalikan nilai masing-masing pixel sebanyak 1.5
map(:,:,:) = map(:,:,:) * 1.5;
% Menampilkan image di axes1
axes(handles.axes1);
imshow(map);


% --- Executes on button press in kurangbutton.
function kurangbutton_Callback(hObject, eventdata, handles)
% hObject    handle to kurangbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Mengurangi nilai masing-masing pixel sebanyak 10
map(:,:,:) = map(:,:,:) - 10;
% Menampilkan image di axes1
axes(handles.axes1);
imshow(map);


% --- Executes on button press in bagibutton.
function bagibutton_Callback(hObject, eventdata, handles)
% hObject    handle to bagibutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Membagi nilai masing-masing pixel sebanyak 1.5
map(:,:,:) = map(:,:,:) / 1.5;
% Menampilkan image di axes1
axes(handles.axes1);
imshow(map);


% --- Executes on button press in zoominbutton.
function zoominbutton_Callback(hObject, eventdata, handles)
% hObject    handle to zoominbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;

% Menampilkan image di axes1
axes(handles.axes1);
imshow(Y);


% --- Executes on button press in zoomoutbutton.
function zoomoutbutton_Callback(hObject, eventdata, handles)
% hObject    handle to zoomoutbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;

% Menampilkan image di axes1
axes(handles.axes1);
imshow(map);



function posx1_Callback(hObject, eventdata, handles)
% hObject    handle to posx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posx1 as text
%        str2double(get(hObject,'String')) returns contents of posx1 as a double
global x1;
x1 = str2double(get(handles.posx1, 'String'));


% --- Executes during object creation, after setting all properties.
function posx1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posx2_Callback(hObject, eventdata, handles)
% hObject    handle to posx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posx2 as text
%        str2double(get(hObject,'String')) returns contents of posx2 as a double
global x2;
x2 = str2double(get(handles.posx2, 'String'));


% --- Executes during object creation, after setting all properties.
function posx2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posy1_Callback(hObject, eventdata, handles)
% hObject    handle to posy1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posy1 as text
%        str2double(get(hObject,'String')) returns contents of posy1 as a double
global y1;
y1 = str2double(get(handles.posy1, 'String'));


% --- Executes during object creation, after setting all properties.
function posy1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posy1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posy2_Callback(hObject, eventdata, handles)
% hObject    handle to posy2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posy2 as text
%        str2double(get(hObject,'String')) returns contents of posy2 as a double
global y2;
y2 = str2double(get(handles.posy2, 'String'));


% --- Executes during object creation, after setting all properties.
function posy2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posy2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cropbutton.
function cropbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cropbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Memanggil variabel global map, dan x1,x2,y1,y1
global map;
global x1; global x2; global y1, global y2;

newmap = map(x1:x2, y1:y2, :);
% Menampilkan image di axes1
axes(handles.axes1);
imshow(newmap);