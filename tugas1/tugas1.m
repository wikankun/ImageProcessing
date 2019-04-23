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

% Last Modified by GUIDE v2.5 23-Apr-2019 08:32:58

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

% Membuka window file selector untuk memilih gambar bertipe .jpg, .png dan
% .bmp
[filename pathname] = uigetfile({'*.jpg;*.png;*.bmp';},'File Selector');
% Membuat image menjadi variabel global
global image;
image = strcat(pathname, filename);
% Membuat map menjadi variabel global
global map;
map = imread(image);
% Menampilkan gambar di axes1
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

% Menghapus gambar dari axes1
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
newmap = varR * R + varG * G + varB * B;
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(newmap);


% --- Executes on button press in tambahbutton.
function tambahbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tambahbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Menambahkan nilai masing-masing pixel sebanyak 10
map(:,:,:) = map(:,:,:) + 10;
% Menampilkan gambar di axes1
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
% Menampilkan gambar di axes1
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
% Menampilkan gambar di axes1
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
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(map);


% --- Executes on button press in zoominbutton.
function zoominbutton_Callback(hObject, eventdata, handles)
% hObject    handle to zoominbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Membuat array kosong
row = 2*size(map,1);
column = 2*size(map,2);
newmap = zeros(row, column, 3);
m = 1; n = 1;
% Melakukan iterasi pada gambar
for i = 1:size(map,1)
    for j = 1:size(map,2)
        % Mengambil nilai dari gambar
        newmap(m,n,:) = map(i,j,:);
        newmap(m,n+1,:) = map(i,j,:);
        newmap(m+1,n,:) = map(i,j,:);
        newmap(m+1,n+1,:) = map(i,j,:);
        n = n+2;
    end
    m = m+2;
    n = 1;    
end
% Menampilkan gambar pada window baru
figure, imshow(uint8(newmap));
% guidata(hObject,handles);


% --- Executes on button press in zoomoutbutton.
function zoomoutbutton_Callback(hObject, eventdata, handles)
% hObject    handle to zoomoutbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Membuat array kosong
newmap = zeros(round(size(map,1)/2), round(size(map,2)/2), 3);
% Melakukan iterasi pada gambar
m = 1; n = 1;
for i = 1:size(newmap,1)
    for j = 1:size(newmap,2)
        % Mengambil nilai dari gambar
        newmap(i,j,:) = map(m,n,:);
        n = round(n+2);
    end
    m = round(m+2);
    n = 1;
end
% Menampilkan gambar pada window baru
figure, imshow(uint8(newmap));
% guidata(hObject,handles);


function posx1_Callback(hObject, eventdata, handles)
% hObject    handle to posx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posx1 as text
%        str2double(get(hObject,'String')) returns contents of posx1 as a double


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

x1 = str2double(get(handles.posx1, 'String'));
x2 = str2double(get(handles.posx2, 'String'));
y1 = str2double(get(handles.posy1, 'String'));
y2 = str2double(get(handles.posy2, 'String'));

newmap = map(x1:x2, y1:y2, :);
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(newmap);


% --- Executes on button press in histogrambutton.
function histogrambutton_Callback(hObject, eventdata, handles)
% hObject    handle to histogrambutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Melakukan perhitungan terhadap R, G, dan B
R = map(:,:,1);
G = map(:,:,2);
B = map(:,:,3);
% Membuat histogram dari R, G, dan B
axes(handles.axes2);
histR = histogram(R);
axes(handles.axes3);
histG = histogram(G);
axes(handles.axes4);
histB = histogram(B);


% --- Executes on button press in histeqbutton.
function histeqbutton_Callback(hObject, eventdata, handles)
% hObject    handle to histeqbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global image dan global map
% global image;
% I = imread(image);
global map;
I = map;

% Mengambil ukuran dari gambar
[r,c,x] = size(I); 
% Membuat sebuah variabel blank
blank = uint8(zeros(r,c,x));
% Jumlah pixel
n = r*c*x;
% Inisialisasi
f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
out = zeros(256,1);
cum = zeros(256,1);

% Update nilai pdf
for i = 1:r
    for j = 1:c
        for k = 1:x;
            value = I(i,j,k);
            f(value+1) = f(value+1)+1;
            pdf(value+1) = f(value+1)/n;
        end
    end
end

% Mencari cdf
sum = 0;
L = 255;

for i = 1:size(pdf);
    sum = sum + f(i);
    cum(i) = sum;
    cdf(i) = cum(i)/n;
    out(i) = round(cdf(i)*L);
end

for i = 1:r;
    for j = 1:c;
        for k = 1:x;
            blank(i,j,k) = out(I(i,j,k)+1);
        end
    end
end

axes(handles.axes1);
imshow(blank);

map = blank;

% Melakukan perhitungan terhadap R, G, dan B
R = blank(:,:,1);
G = blank(:,:,2);
B = blank(:,:,3);
% Membuat histogram dari R, G, dan B
axes(handles.axes2);
histR = histogram(R);
axes(handles.axes3);
histG = histogram(G);
axes(handles.axes4);
histB = histogram(B);


% --- Executes on button press in blurbutton.
function blurbutton_Callback(hObject, eventdata, handles)
% hObject    handle to blurbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Mengambil ukuran dari gambar
[r,c,x] = size(map);
% Membuat variabel newmap
newmap = double(map);

% Kernel Blur Gaussian
y = [1/16 1/8 1/16;
    1/8 1/4 1/8;
    1/16 1/8 1/16];

% Algoritma penerapan kernel
for i = 2 : r - 2
    for j = 2 : c - 2
        result = newmap(i-1,j-1,:)*y(1,1,:) + newmap(i,j-1,:)*y(2,1,:)...
            + newmap(i+1,j-1,:)*y(3,1,:) + newmap(i-1,j,:)*y(1,2,:)...
            + newmap(i,j,:)*y(2,2,:) + newmap(i+1,j,:)*y(3,2,:)...
            + newmap(i-1,j+1,:)*y(1,3,:) + newmap(i,j+1,:)*y(2,3,:)...
            + newmap(i+1,j+1,:)*y(3,3,:);
        newmap(i-1,j-1,:) = result;
    end
end

% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(uint8(newmap));


% --- Executes on button press in sharpbutton.
function sharpbutton_Callback(hObject, eventdata, handles)
% hObject    handle to sharpbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Mengambil ukuran dari gambar
[r,c,x] = size(map);
% Membuat variabel newmap
newmap = double(map);

% Kernel Sharpen
y = [0 -1 0;
    -1 5 -1;
    0 -1 0];

% Algoritma penerapan kernel
for i = 2 : r - 2
    for j = 2 : c - 2
        result = newmap(i-1,j-1,:)*y(1,1,:) + newmap(i,j-1,:)*y(2,1,:)...
            + newmap(i+1,j-1,:)*y(3,1,:) + newmap(i-1,j,:)*y(1,2,:)...
            + newmap(i,j,:)*y(2,2,:) + newmap(i+1,j,:)*y(3,2,:)...
            + newmap(i-1,j+1,:)*y(1,3,:) + newmap(i,j+1,:)*y(2,3,:)...
            + newmap(i+1,j+1,:)*y(3,3,:);
        newmap(i-1,j-1,:) = result;
    end
end

% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(uint8(newmap));


% --- Executes on button press in edgebutton.
function edgebutton_Callback(hObject, eventdata, handles)
% hObject    handle to edgebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Mengambil ukuran dari gambar
[r,c,x] = size(map);
% Membuat variabel newmap
newmap = double(map);

% Kernel detect edge
y = [1 1 1;
    1 -8 1;
    1 1 1];

% Algoritma penerapan kernel
for i = 2 : r - 2
    for j = 2 : c - 2
        result = newmap(i-1,j-1,:)*y(1,1,:) + newmap(i,j-1,:)*y(2,1,:)...
            + newmap(i+1,j-1,:)*y(3,1,:) + newmap(i-1,j,:)*y(1,2,:)...
            + newmap(i,j,:)*y(2,2,:) + newmap(i+1,j,:)*y(3,2,:)...
            + newmap(i-1,j+1,:)*y(1,3,:) + newmap(i,j+1,:)*y(2,3,:)...
            + newmap(i+1,j+1,:)*y(3,3,:);
        newmap(i-1,j-1,:) = result;
    end
end

% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(uint8(newmap));



function tresholdr_Callback(hObject, eventdata, handles)
% hObject    handle to tresholdr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tresholdr as text
%        str2double(get(hObject,'String')) returns contents of tresholdr as a double


% --- Executes during object creation, after setting all properties.
function tresholdr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tresholdr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function tresholdg_Callback(hObject, eventdata, handles)
% hObject    handle to tresholdg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tresholdg as text
%        str2double(get(hObject,'String')) returns contents of tresholdg as a double


% --- Executes during object creation, after setting all properties.
function tresholdg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tresholdg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tresholdb_Callback(hObject, eventdata, handles)
% hObject    handle to tresholdb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tresholdb as text
%        str2double(get(hObject,'String')) returns contents of tresholdb as a double


% --- Executes during object creation, after setting all properties.
function tresholdb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tresholdb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function seedx_Callback(hObject, eventdata, handles)
% hObject    handle to seedx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seedx as text
%        str2double(get(hObject,'String')) returns contents of seedx as a double


% --- Executes during object creation, after setting all properties.
function seedx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seedx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seedy_Callback(hObject, eventdata, handles)
% hObject    handle to seedy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seedy as text
%        str2double(get(hObject,'String')) returns contents of seedy as a double


% --- Executes during object creation, after setting all properties.
function seedy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seedy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seedtreshold_Callback(hObject, eventdata, handles)
% hObject    handle to seedtreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seedtreshold as text
%        str2double(get(hObject,'String')) returns contents of seedtreshold as a double


% --- Executes during object creation, after setting all properties.
function seedtreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seedtreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in thresholdbutton.
function thresholdbutton_Callback(hObject, eventdata, handles)
% hObject    handle to thresholdbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;

% Mengambil nilai Threshold R G B
r = str2double(get(handles.tresholdr, 'String'));
g = str2double(get(handles.tresholdg, 'String'));
b = str2double(get(handles.tresholdb, 'String'));

% Membuat newmap kosong
newmap = uint8(zeros(size(map)));
[r, c, x] = size(map);

for i = 1 : r
    for j = 1 : c
        if ((map(i,j,1) >= r) && (map(i,j,2) >= g) && (map(i,j,3) >= b))
            newmap(i,j,:) = map(i,j,:);
        end
    end
end

% Menampilkan gambar pada window baru
newmap = uint8(newmap);
figure,imshow(newmap);



% --- Executes on button press in seedbutton.
function seedbutton_Callback(hObject, eventdata, handles)
% hObject    handle to seedbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Mengambil nilai x dan y dan nilai threshold
x = str2double(get(handles.seedx,'String'));
y = str2double(get(handles.seedy,'String'));
threshold = str2double(get(handles.seedtreshold,'String'));



% --- Executes on button press in erosibutton.
function erosibutton_Callback(hObject, eventdata, handles)
% hObject    handle to erosibutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Membuat gambar bw dari map
x = im2bw(map);
% membuat gambar komplemen dari x
bwmap = imcomplement(x);
[r, c]=size(bwmap);
newmap = double(bwmap);

% Operasi penipisan
% Untuk setiap pixel yang bernilai 1 di bwmap dan bernilai 0 di newmap akan
% diubah nilainya menjadi 2 di newmap (agar terdeteksi sebagai selain 0
% dan 1)
for i=2 : r-2
    for j=2 : c-2
        if bwmap(i,j)==1
            if newmap(i,j-1)==0 || newmap(i,j+1)==0 || newmap(i-1,j)==0 || newmap(i+1,j)==0
                newmap(i,j)=2;
            end
        end
    end
end

newnewmap = zeros(r,c);
% Untuk setiap pixel yang bernilai 1 di newmap, akan disalin ke newnewmap
for i=1 : r
    for j=1 : c
        if newmap(i,j)==1
            newnewmap(i,j)=1;
        end
    end
end

% Menampilkan gambar pada window baru
figure;
subplot(1,2,1), subimage(bwmap), title('Citra Biner');
subplot(1,2,2), subimage(newnewmap), title('Hasil Erosi');



% --- Executes on button press in dilasibutton.
function dilasibutton_Callback(hObject, eventdata, handles)
% hObject    handle to dilasibutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Memanggil variabel global map
global map;
% Membuat gambar bw dari map
x = im2bw(map);
% membuat gambar komplemen dari x
bwmap = imcomplement(x);
[r, c] = size(bwmap);
newmap = bwmap;

% Operasi penebalan
for i=2 : r-2
    for j=2 : c-2
        if bwmap(i,j) == 1
            newmap(i,j-1) = 1;
            newmap(i,j)   = 1;
            newmap(i,j+1) = 1;
            newmap(i-1,j) = 1;
            newmap(i+1,j) = 1;
        end
    end
end

% Menampilkan gambar pada window baru
figure;
subplot(1,2,1), subimage(bwmap), title('Citra Biner');
subplot(1,2,2), subimage(newmap), title('Hasil Dilasi');