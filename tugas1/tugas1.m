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

% Last Modified by GUIDE v2.5 21-May-2019 16:22:30

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
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in inputimage.
function inputimage_Callback(hObject, eventdata, handles)
% Membuka window file selector untuk memilih gambar bertipe .jpg, .png dan
% .bmp
[filename pathname] = uigetfile({'*.jpg;*.png;*.bmp';},'File Selector');
% Membuat image menjadi variabel global
global image;
image = strcat(pathname, filename);
% Membuat img menjadi variabel global
global img;
img = imread(image);
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(image);
% Menampilkan direktori file
set(handles.edit1,'string',image);


function edit1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearimage.
function clearimage_Callback(hObject, eventdata, handles)
% Menghapus gambar dari axes1
cla(handles.axes1,'reset');
axis off;


% --- Executes on button press in grayscalebutton.
function grayscalebutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Melakukan perhitungan terhadap R, G, dan B
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
sumR = sum(R(:));
sumG = sum(G(:));
sumB = sum(B(:));
sumTotal = sum([sumR, sumG, sumB]);
varR = sumR/sumTotal;
varG = sumG/sumTotal;
varB = sumB/sumTotal;
% Membuat grayscale
newimg = varR * R + varG * G + varB * B;
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(newimg);


% --- Executes on button press in tambahbutton.
function tambahbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Menambahkan nilai masing-masing pixel sebanyak 10
img(:,:,:) = img(:,:,:) + 10;
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(img);

% --- Executes on button press in kalibutton.
function kalibutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Mengalikan nilai masing-masing pixel sebanyak 1.5
img(:,:,:) = img(:,:,:) * 1.5;
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(img);


% --- Executes on button press in kurangbutton.
function kurangbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Mengurangi nilai masing-masing pixel sebanyak 10
img(:,:,:) = img(:,:,:) - 10;
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(img);


% --- Executes on button press in bagibutton.
function bagibutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Membagi nilai masing-masing pixel sebanyak 1.5
img(:,:,:) = img(:,:,:) / 1.5;
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(img);


% --- Executes on button press in zoominbutton.
function zoominbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Membuat array kosong
row = 2*size(img,1);
column = 2*size(img,2);
newimg = zeros(row, column, 3);
m = 1; n = 1;
% Melakukan iterasi pada gambar
for i = 1:size(img,1)
    for j = 1:size(img,2)
        % Mengambil nilai dari gambar
        newimg(m,n,:) = img(i,j,:);
        newimg(m,n+1,:) = img(i,j,:);
        newimg(m+1,n,:) = img(i,j,:);
        newimg(m+1,n+1,:) = img(i,j,:);
        n = n+2;
    end
    m = m+2;
    n = 1;    
end
% Menampilkan gambar pada window baru
figure, imshow(uint8(newimg));
% guidata(hObject,handles);


% --- Executes on button press in zoomoutbutton.
function zoomoutbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Membuat array kosong
newimg = zeros(round(size(img,1)/2), round(size(img,2)/2), 3);
% Melakukan iterasi pada gambar
m = 1; n = 1;
for i = 1:size(newimg,1)
    for j = 1:size(newimg,2)
        % Mengambil nilai dari gambar
        newimg(i,j,:) = img(m,n,:);
        n = round(n+2);
    end
    m = round(m+2);
    n = 1;
end
% Menampilkan gambar pada window baru
figure, imshow(uint8(newimg));
% guidata(hObject,handles);


function posx1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of posx1 as text
%        str2double(get(hObject,'String')) returns contents of posx1 as a double


% --- Executes during object creation, after setting all properties.
function posx1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posx2_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of posx2 as text
%        str2double(get(hObject,'String')) returns contents of posx2 as a double


% --- Executes during object creation, after setting all properties.
function posx2_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posy1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of posy1 as text
%        str2double(get(hObject,'String')) returns contents of posy1 as a double


% --- Executes during object creation, after setting all properties.
function posy1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posy2_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of posy2 as text
%        str2double(get(hObject,'String')) returns contents of posy2 as a double


% --- Executes during object creation, after setting all properties.
function posy2_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cropbutton.
function cropbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img, dan x1,x2,y1,y1
global img;
global x1; global x2; global y1, global y2;

x1 = str2double(get(handles.posx1, 'String'));
x2 = str2double(get(handles.posx2, 'String'));
y1 = str2double(get(handles.posy1, 'String'));
y2 = str2double(get(handles.posy2, 'String'));

newimg = img(x1:x2, y1:y2, :);
% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(newimg);


% --- Executes on button press in histogrambutton.
function histogrambutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Melakukan perhitungan terhadap R, G, dan B
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
% Membuat histogram dari R, G, dan B
axes(handles.axes2);
histR = histogram(R);
axes(handles.axes3);
histG = histogram(G);
axes(handles.axes4);
histB = histogram(B);


% --- Executes on button press in histeqbutton.
function histeqbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global image dan global img
% global image;
% I = imread(image);
global img;
I = img;

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

img = blank;

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
% Memanggil variabel global img
global img;
% Mengambil ukuran dari gambar
[r,c,x] = size(img);
% Membuat variabel newimg
newimg = double(img);

% Kernel Blur Gaussian
y = [1/16 1/8 1/16;
    1/8 1/4 1/8;
    1/16 1/8 1/16];

% Algoritma penerapan kernel
for i = 2 : r - 2
    for j = 2 : c - 2
        result = newimg(i-1,j-1,:)*y(1,1,:) + newimg(i,j-1,:)*y(2,1,:)...
            + newimg(i+1,j-1,:)*y(3,1,:) + newimg(i-1,j,:)*y(1,2,:)...
            + newimg(i,j,:)*y(2,2,:) + newimg(i+1,j,:)*y(3,2,:)...
            + newimg(i-1,j+1,:)*y(1,3,:) + newimg(i,j+1,:)*y(2,3,:)...
            + newimg(i+1,j+1,:)*y(3,3,:);
        newimg(i-1,j-1,:) = result;
    end
end

% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(uint8(newimg));


% --- Executes on button press in sharpbutton.
function sharpbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Mengambil ukuran dari gambar
[r,c,x] = size(img);
% Membuat variabel newimg
newimg = double(img);

% Kernel Sharpen
y = [0 -1 0;
    -1 5 -1;
    0 -1 0];

% Algoritma penerapan kernel
for i = 2 : r - 2
    for j = 2 : c - 2
        result = newimg(i-1,j-1,:)*y(1,1,:) + newimg(i,j-1,:)*y(2,1,:)...
            + newimg(i+1,j-1,:)*y(3,1,:) + newimg(i-1,j,:)*y(1,2,:)...
            + newimg(i,j,:)*y(2,2,:) + newimg(i+1,j,:)*y(3,2,:)...
            + newimg(i-1,j+1,:)*y(1,3,:) + newimg(i,j+1,:)*y(2,3,:)...
            + newimg(i+1,j+1,:)*y(3,3,:);
        newimg(i-1,j-1,:) = result;
    end
end

% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(uint8(newimg));


% --- Executes on button press in edgebutton.
function edgebutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Mengambil ukuran dari gambar
[r,c,x] = size(img);
% Membuat variabel newimg
newimg = double(img);

% Kernel detect edge
y = [1 1 1;
    1 -8 1;
    1 1 1];

% Algoritma penerapan kernel
for i = 2 : r - 2
    for j = 2 : c - 2
        result = newimg(i-1,j-1,:)*y(1,1,:) + newimg(i,j-1,:)*y(2,1,:)...
            + newimg(i+1,j-1,:)*y(3,1,:) + newimg(i-1,j,:)*y(1,2,:)...
            + newimg(i,j,:)*y(2,2,:) + newimg(i+1,j,:)*y(3,2,:)...
            + newimg(i-1,j+1,:)*y(1,3,:) + newimg(i,j+1,:)*y(2,3,:)...
            + newimg(i+1,j+1,:)*y(3,3,:);
        newimg(i-1,j-1,:) = result;
    end
end

% Menampilkan gambar di axes1
axes(handles.axes1);
imshow(uint8(newimg));



function tresholdr_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of tresholdr as text
%        str2double(get(hObject,'String')) returns contents of tresholdr as a double


% --- Executes during object creation, after setting all properties.
function tresholdr_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function tresholdg_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of tresholdg as text
%        str2double(get(hObject,'String')) returns contents of tresholdg as a double


% --- Executes during object creation, after setting all properties.
function tresholdg_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tresholdb_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of tresholdb as text
%        str2double(get(hObject,'String')) returns contents of tresholdb as a double


% --- Executes during object creation, after setting all properties.
function tresholdb_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function seedx_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of seedx as text
%        str2double(get(hObject,'String')) returns contents of seedx as a double


% --- Executes during object creation, after setting all properties.
function seedx_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seedy_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of seedy as text
%        str2double(get(hObject,'String')) returns contents of seedy as a double


% --- Executes during object creation, after setting all properties.
function seedy_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seedtreshold_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of seedtreshold as text
%        str2double(get(hObject,'String')) returns contents of seedtreshold as a double


% --- Executes during object creation, after setting all properties.
function seedtreshold_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in thresholdbutton.
function thresholdbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;

% Mengambil nilai Threshold R G B
r = str2double(get(handles.tresholdr, 'String'));
g = str2double(get(handles.tresholdg, 'String'));
b = str2double(get(handles.tresholdb, 'String'));

% Membuat newimg kosong
newimg = uint8(zeros(size(img)));
[r, c, x] = size(img);

for i = 1 : r
    for j = 1 : c
        if ((img(i,j,1) >= r) && (img(i,j,2) >= g) && (img(i,j,3) >= b))
            newimg(i,j,:) = img(i,j,:);
        end
    end
end

% Menampilkan gambar pada window baru
newimg = uint8(newimg);
figure,imshow(newimg);



% --- Executes on button press in seedbutton.
function seedbutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Mengambil nilai x dan y dan nilai threshold
x = str2double(get(handles.seedx,'String'));
y = str2double(get(handles.seedy,'String'));
threshold = str2double(get(handles.seedtreshold,'String'));



% --- Executes on button press in erosibutton.
function erosibutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Membuat gambar bw dari img
x = im2bw(img);
% membuat gambar komplemen dari x
bwimg = imcomplement(x);
[r, c]=size(bwimg);
newimg = double(bwimg);

% Operasi penipisan
% Untuk setiap pixel yang bernilai 1 di bwimg dan bernilai 0 di newimg akan
% diubah nilainya menjadi 2 di newimg (agar terdeteksi sebagai selain 0
% dan 1)
for i = 2 : r-2
    for j = 2 : c-2
        if bwimg(i,j)==1
            if newimg(i,j-1)==0 || newimg(i,j+1)==0 || newimg(i-1,j)==0 || newimg(i+1,j)==0
                newimg(i,j)=2;
            end
        end
    end
end

newnewimg = zeros(r,c);
% Untuk setiap pixel yang bernilai 1 di newimg, akan disalin ke newnewimg
for i=1 : r
    for j=1 : c
        if newimg(i,j)==1
            newnewimg(i,j)=1;
        end
    end
end

% Menampilkan gambar pada window baru
figure;
subplot(1,2,1), subimage(bwimg), title('Citra Biner');
subplot(1,2,2), subimage(newnewimg), title('Hasil Erosi');



% --- Executes on button press in dilasibutton.
function dilasibutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Membuat gambar bw dari img
x = im2bw(img);
% membuat gambar komplemen dari x
bwimg = imcomplement(x);
[r, c] = size(bwimg);
newimg = bwimg;

% Operasi penebalan
for i = 2 : r-2
    for j = 2 : c-2
        if bwimg(i,j) == 1
            newimg(i,j-1) = 1;
            newimg(i,j)   = 1;
            newimg(i,j+1) = 1;
            newimg(i-1,j) = 1;
            newimg(i+1,j) = 1;
        end
    end
end

% Menampilkan gambar pada window baru
figure;
subplot(1,2,1), subimage(bwimg), title('Citra Biner');
subplot(1,2,2), subimage(newimg), title('Hasil Dilasi');


% --- Executes on button press in kompresibutton.
function kompresibutton_Callback(hObject, eventdata, handles)
% Memanggil variabel global img
global img;
% Mengambil ukuran dari gambar
[r,c,x] = size(img);

% Melakukan kompresi dengan menghilangkan info yang penting
for i = 1 : r
    for j = 1 : c
        % Membagi pixel ini dengan 2
        newimg(i,j,:) = floor(img(i,j,:) / 2);
    end
end

% Menampilkan gambar pada window baru
figure,imshow(newimg);