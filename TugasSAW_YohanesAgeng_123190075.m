function varargout = TugasSAW_YohanesAgeng_123190075(varargin)
% TUGASSAW_YOHANESAGENG_123190075 MATLAB code for TugasSAW_YohanesAgeng_123190075.fig
%      TUGASSAW_YOHANESAGENG_123190075, by itself, creates a new TUGASSAW_YOHANESAGENG_123190075 or raises the existing
%      singleton*.
%
%      H = TUGASSAW_YOHANESAGENG_123190075 returns the handle to a new TUGASSAW_YOHANESAGENG_123190075 or the handle to
%      the existing singleton*.
%
%      TUGASSAW_YOHANESAGENG_123190075('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGASSAW_YOHANESAGENG_123190075.M with the given input arguments.
%
%      TUGASSAW_YOHANESAGENG_123190075('Property','Value',...) creates a new TUGASSAW_YOHANESAGENG_123190075 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TugasSAW_YohanesAgeng_123190075_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TugasSAW_YohanesAgeng_123190075_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TugasSAW_YohanesAgeng_123190075

% Last Modified by GUIDE v2.5 24-Jun-2021 00:08:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TugasSAW_YohanesAgeng_123190075_OpeningFcn, ...
                   'gui_OutputFcn',  @TugasSAW_YohanesAgeng_123190075_OutputFcn, ...
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


% --- Executes just before TugasSAW_YohanesAgeng_123190075 is made visible.
function TugasSAW_YohanesAgeng_123190075_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TugasSAW_YohanesAgeng_123190075 (see VARARGIN)

% Choose default command line output for TugasSAW_YohanesAgeng_123190075
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TugasSAW_YohanesAgeng_123190075 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TugasSAW_YohanesAgeng_123190075_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tombol_hitung.
function tombol_hitung_Callback(hObject, eventdata, handles)
% hObject    handle to tombol_hitung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=[ 2,3,2,2,1,2;
    2,2,3,4,2,3;
    1,1,2,1,2,2;
    4,3,1,2,3,2;
    3,2,2,2,1,2];
set(handles.tb_kriteria,'Data',x);
k=[1,0,0,1,1,0];%nilai atribut, dimana 0= atribut cost &1= atribut benefit
w = handles.bobot;
kontrakan = {'Kontrakan ConCat' 'Kontrakan Transmart' 'Kontrakan Babarsari' 'Kontrakan JIH' 'Kontrakan Candi Gebang'};
[m,n]=size (x);
R=zeros (m,n);
Y=zeros (m,n);
for j=1:n
 if k(j)==1 %statement untuk kriteria dengan atribut keuntungan
    R(:,j)=x(:,j)./max(x(:,j));
 else
    R(:,j)=min(x(:,j))./x(:,j);
 end
end
%proses perangkingan
for i=1:m
    V(i)= sum(w.*R(i,:));
end
[rank,rowRank] = sort(V,'descend');
[cons,rowCons] = max(V);
set(handles.tb_hasil,'Data',V);
set(handles.tb_pemilihan,'Data',kontrakan(rowRank));
set(handles.kesimpulan, 'String', "Pilihan Kontrakan Terbaik : ");
set(handles.kesimpulan2, 'String', kontrakan(rowCons));


% --- Executes on button press in tampil_jarak.
function tampil_jarak_Callback(hObject, eventdata, handles)
% hObject    handle to tampil_jarak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image_jarak);
imshow(imread('gambar_jarak.png'));


% --- Executes on button press in tombol_simpan.
function tombol_simpan_Callback(hObject, eventdata, handles)
% hObject    handle to tombol_simpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bobotHandle = [
    handles.kt_lingkungan, 
    handles.kt_kondisi,
    handles.kt_harga,
    handles.kt_jumlahkamar,
    handles.kt_keamanan,
    handles.kt_jarak
    ];
for i=1:size(bobotHandle)
    handles.bobot(i) = str2double(get(bobotHandle(i),'String'));
end
guidata(hObject, handles);



function kt_lingkungan_Callback(hObject, eventdata, handles)
% hObject    handle to kt_lingkungan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kt_lingkungan as text
%        str2double(get(hObject,'String')) returns contents of kt_lingkungan as a double


% --- Executes during object creation, after setting all properties.
function kt_lingkungan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kt_lingkungan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kt_kondisi_Callback(hObject, eventdata, handles)
% hObject    handle to kt_kondisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kt_kondisi as text
%        str2double(get(hObject,'String')) returns contents of kt_kondisi as a double


% --- Executes during object creation, after setting all properties.
function kt_kondisi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kt_kondisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kt_harga_Callback(hObject, eventdata, handles)
% hObject    handle to kt_harga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kt_harga as text
%        str2double(get(hObject,'String')) returns contents of kt_harga as a double


% --- Executes during object creation, after setting all properties.
function kt_harga_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kt_harga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kt_jumlahkamar_Callback(hObject, eventdata, handles)
% hObject    handle to kt_jumlahkamar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kt_jumlahkamar as text
%        str2double(get(hObject,'String')) returns contents of kt_jumlahkamar as a double


% --- Executes during object creation, after setting all properties.
function kt_jumlahkamar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kt_jumlahkamar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kt_keamanan_Callback(hObject, eventdata, handles)
% hObject    handle to kt_keamanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kt_keamanan as text
%        str2double(get(hObject,'String')) returns contents of kt_keamanan as a double


% --- Executes during object creation, after setting all properties.
function kt_keamanan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kt_keamanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kt_jarak_Callback(hObject, eventdata, handles)
% hObject    handle to kt_jarak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kt_jarak as text
%        str2double(get(hObject,'String')) returns contents of kt_jarak as a double


% --- Executes during object creation, after setting all properties.
function kt_jarak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kt_jarak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tampil_keamanan.
function tampil_keamanan_Callback(hObject, eventdata, handles)
% hObject    handle to tampil_keamanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image_keamanan);
imshow(imread('gambar_keamanaan.png'));


% --- Executes on button press in tampil_jumlah.
function tampil_jumlah_Callback(hObject, eventdata, handles)
% hObject    handle to tampil_jumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image_kamar);
imshow(imread('gambar_jumlahkamar.png'));


% --- Executes on button press in tampil_harga.
function tampil_harga_Callback(hObject, eventdata, handles)
% hObject    handle to tampil_harga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image_harga);
imshow(imread('gambar_harga.png'))


% --- Executes on button press in tampil_kondisikontrakan.
function tampil_kondisikontrakan_Callback(hObject, eventdata, handles)
% hObject    handle to tampil_kondisikontrakan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image_kondisi);
imshow(imread('gambar_kondisi.png'))



% --- Executes on button press in tampil_lingkungan.
function tampil_lingkungan_Callback(hObject, eventdata, handles)
% hObject    handle to tampil_lingkungan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image_lingkungan);
imshow(imread('gambar_lingkungan.png'))


% --- Executes during object creation, after setting all properties.
function kesimpulan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kesimpulan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
