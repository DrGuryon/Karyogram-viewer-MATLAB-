function varargout = karyogram(varargin)
%KARYOGRAM M-file for karyogram.fig
%      KARYOGRAM, by itself, creates a new KARYOGRAM or raises the existing
%      singleton*.
%
%      H = KARYOGRAM returns the handle to a new KARYOGRAM or the handle to
%      the existing singleton*.
%
%      KARYOGRAM('Property','Value',...) creates a new KARYOGRAM using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to karyogram_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      KARYOGRAM('CALLBACK') and KARYOGRAM('CALLBACK',hObject,...) call the
%      local function named CALLBACK in KARYOGRAM.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help karyogram

% Last Modified by GUIDE v2.5 25-Oct-2015 10:28:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @karyogram_OpeningFcn, ...
                   'gui_OutputFcn',  @karyogram_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before karyogram is made visible.
function karyogram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for karyogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes karyogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = karyogram_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Nacist_menu_Callback(hObject, eventdata, handles)
% hObject    handle to Nacist_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dirname = uigetdir('C:\');
if exist('dirname') && sum(dirname)>0
    addpath(dirname);
    handles.DirName = dirname;
    obr = dir(dirname);
    nazvy = {'1a','1b','2a','2b','3a','3b','4a','4b','5a','5b','6a','6b','7a','7b','8a','8b','9a'...
             '9b','10a','10b','11a','11b','12a','12b','13a','13b','14a','14b','15a','15b','16a'...
             '16b','17a','17b', '18a','18b','19a','19b','20a','20b','21a','21b','22a','22b','23a','23b'};
    id = obr(3).name;
    id = id(1:find(id==' '));
if length({obr.name})<48
    errordlg('Sada nen� kompletn� nebo jste vybral(a) �patnou slo�ku!','Chyba!');
else
    chyba = 0;
    for i = 1:46 
        nazev=sprintf('%s%s.bmp',id,nazvy{i});
        if exist(nazev)==0
            chyba=1;
        end
    end
    if chyba==1
    errordlg('N�zvy n�kter�ch sn�mk� neodpov�daj� vzoru: ''<��slo sady> <1a... 23b>''. Pros�m, p�ejmenujte je!','Chyba!');
    else
        for i = 1:46
        s=sprintf('axes(handles.axes%d)',i); 
        eval(s)
        imshow(sprintf('%s%s.bmp',id,nazvy{i}));
        title(nazvy{i})
        end
    end
end
end
guidata(hObject,handles)

% --------------------------------------------------------------------
function Ulozit_Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Ulozit_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = findall(0,'Name','karyogram');
frameData = getframe(hFigure);
[X,Map]=frame2im(frameData);
[FileName, PathName] = uiputfile({'*.jpg';'*.bmp'}, 'Save As'); %# <-- dot
if exist('FileName') && sum(FileName)>0
Name = fullfile(PathName,FileName);  %# <--- reverse the order of arguments
imwrite(X, Name);
msgbox('Z�znam byl �sp�n� ulo�en','Ulo�eno')
end

% --------------------------------------------------------------------
function Resetovat_Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Resetovat_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dirname = handles.DirName;
obr = dir(dirname);
    nazvy = {'1a','1b','2a','2b','3a','3b','4a','4b','5a','5b','6a','6b','7a','7b','8a','8b','9a'...
             '9b','10a','10b','11a','11b','12a','12b','13a','13b','14a','14b','15a','15b','16a'...
             '16b','17a','17b', '18a','18b','19a','19b','20a','20b','21a','21b','22a','22b','23a','23b'};
    id = obr(3).name;
    id = id(1:find(id==' '));
for i = 1:46
        s=sprintf('axes(handles.axes%d)',i); 
        eval(s)
        imshow(sprintf('%s%s.bmp',id,nazvy{i}));
        title(nazvy{i})
        end

% --------------------------------------------------------------------
function Nacist_tool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Nacist_tool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dirname = uigetdir('C:\');
if exist('dirname') && sum(dirname)>0
    addpath(dirname);
    handles.DirName = dirname;
    obr = dir(dirname);
    nazvy = {'1a','1b','2a','2b','3a','3b','4a','4b','5a','5b','6a','6b','7a','7b','8a','8b','9a'...
             '9b','10a','10b','11a','11b','12a','12b','13a','13b','14a','14b','15a','15b','16a'...
             '16b','17a','17b', '18a','18b','19a','19b','20a','20b','21a','21b','22a','22b','23a','23b'};
    id = obr(3).name;
    id = id(1:find(id==' '));
if length({obr.name})<48
    errordlg('Sada nen� kompletn� nebo jste vybral(a) �patnou slo�ku!','Chyba!');
else
    chyba = 0;
    for i = 1:46 
        nazev=sprintf('%s%s.bmp',id,nazvy{i});
        if exist(nazev)==0
            chyba=1;
        end
    end
    if chyba==1
    errordlg('N�zvy n�kter�ch sn�mk� neodpov�daj� vzoru: ''<��slo sady> <1a... 23b>''. Pros�m, p�ejmenujte je!','Chyba!');
    else
        for i = 1:46
        s=sprintf('axes(handles.axes%d)',i); 
        eval(s)
        imshow(sprintf('%s%s.bmp',id,nazvy{i}));
        title(nazvy{i})
        end
    end
end
end
guidata(hObject,handles)

% --------------------------------------------------------------------
function Ulozit_tool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Ulozit_tool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = findall(0,'Name','karyogram');
frameData = getframe(hFigure);
[X,Map]=frame2im(frameData);
[FileName, PathName] = uiputfile({'*.jpg';'*.bmp'}, 'Save As'); %# <-- dot
if exist('FileName') && sum(FileName)>0
Name = fullfile(PathName,FileName);  %# <--- reverse the order of arguments
imwrite(X, Name);
msgbox('Z�znam byl �sp�n� ulo�en','Ulo�eno');
end


% --------------------------------------------------------------------
function Reset_tool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Reset_tool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dirname = handles.DirName;
obr = dir(dirname);
    nazvy = {'1a','1b','2a','2b','3a','3b','4a','4b','5a','5b','6a','6b','7a','7b','8a','8b','9a'...
             '9b','10a','10b','11a','11b','12a','12b','13a','13b','14a','14b','15a','15b','16a'...
             '16b','17a','17b', '18a','18b','19a','19b','20a','20b','21a','21b','22a','22b','23a','23b'};
    id = obr(3).name;
    id = id(1:find(id==' '));
for i = 1:46
        s=sprintf('axes(handles.axes%d)',i); 
        eval(s)
        imshow(sprintf('%s%s.bmp',id,nazvy{i}));
        title(nazvy{i})
        end

% --------------------------------------------------------------------
function Oznacit_tool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Oznacit_tool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ginput(1);
axes(gca)
info=getimage(gca);
[x y z] = size(info);
line(1:y,linspace(x,x,y),'Color','red','LineWidth',5)
line(1:y,linspace(1,1,y),'Color','red','LineWidth',5)
line(linspace(1,1,x),1:x,'Color','red','LineWidth',5)
line(linspace(y,y,x),1:x,'Color','red','LineWidth',5)