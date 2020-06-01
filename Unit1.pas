unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.Win.ADODB, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  System.Win.ScktComp, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, IniFiles,
  Vcl.Menus, ShellAPI;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridComputers: TDBGrid;
    DBGridLogs: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSourceComputer: TDataSource;
    DataSourceLogs: TDataSource;
    PanelComputers: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    EditMAC: TEdit;
    EditNumber: TEdit;
    EditLocation: TEdit;
    LabelMAC: TLabel;
    LabelNumber: TLabel;
    LabelLocation: TLabel;
    ButtonAddStrings: TButton;
    EditMAC2: TEdit;
    EditNumber2: TEdit;
    EditLocation2: TEdit;
    LabelMAC2: TLabel;
    LabelNumber2: TLabel;
    LabelLocation2: TLabel;
    ButtonChange: TButton;
    LabelID2: TLabel;
    DBLookupComboBoxID2: TDBLookupComboBox;
    DBLookupComboBoxID3: TDBLookupComboBox;
    ButtonDelete: TButton;
    EditIP: TEdit;
    LabelIP: TLabel;
    EditIP2: TEdit;
    LabelIP2: TLabel;
    LabelID3: TLabel;
    ButtonClearStrings: TButton;
    ButtonClear2: TButton;
    ServerSocket1: TServerSocket;
    TabSheet6: TTabSheet;
    PanelStatus: TPanel;
    MemoStatusSockets: TMemo;
    StatusBar1: TStatusBar;
    XMLDocument1: TXMLDocument;
    ButtonUpdateLogs: TButton;
    ADOQueryLogs: TADOQuery;
    PanelLogs: TPanel;
    TrayIcon1: TTrayIcon;
    ListBoxClientOnline: TListBox;
    GroupBoxClientOnline: TGroupBox;
    GroupBoxStatusSockets: TGroupBox;
    ADOQueryComputers: TADOQuery;
    GroupBoxSearch: TGroupBox;
    EditSort: TEdit;
    ButtonSort: TButton;
    RadioGroupGroupColumn: TRadioGroup;
    LabelDate: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    LabelFrom1: TLabel;
    LabelTo1: TLabel;
    CheckBoxGroup: TCheckBox;
    LabelData: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    LabelTo2: TLabel;
    LabelFrom2: TLabel;
    LabelTime: TLabel;
    DBLookupComboBoxIP: TDBLookupComboBox;
    DBLookupComboBoxMAC: TDBLookupComboBox;
    DBLookupComboBoxNb: TDBLookupComboBox;
    DBLookupComboBoxLoc: TDBLookupComboBox;
    GroupBoxSort: TGroupBox;
    CheckBoxSort: TCheckBox;
    GroupBox3: TGroupBox;
    RadioGroupSortColumn: TRadioGroup;
    RadioGroupAscDesc: TRadioGroup;
    GroupBox1: TGroupBox;
    ADOQueryLocation: TADOQuery;
    DataSourceLocation: TDataSource;
    DataSourceNameComputer: TDataSource;
    ADOQueryNameComputer: TADOQuery;
    DBLookupComboBoxNC: TDBLookupComboBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    CheckBoxSearch: TCheckBox;
    LabelNb: TLabel;
    LabelNC: TLabel;
    LabelIPad: TLabel;
    LabelMACad: TLabel;
    LabelLoc: TLabel;
    procedure ButtonAddStringsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonChangeClick(Sender: TObject);
    procedure DBLookupComboBoxID2Click(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonClearStringsClick(Sender: TObject);
    procedure ButtonClear2Click(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ButtonUpdateLogsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure ServerSocket1Accept(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonSortClick(Sender: TObject);
    function Sort(StrSQL: string):string;
    function Group(StrSQL: string):string;
    function Search(StrSQL: string):string;
    procedure CheckBoxGroupClick(Sender: TObject);
    procedure CheckBoxSortClick(Sender: TObject);
    procedure DBLookupComboBoxLocDropDown(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBLookupComboBoxNCClick(Sender: TObject);
    procedure DBLookupComboBoxIPClick(Sender: TObject);
    procedure DBLookupComboBoxMACClick(Sender: TObject);
    procedure DBLookupComboBoxNbClick(Sender: TObject);
    procedure DBLookupComboBoxLocClick(Sender: TObject);
    procedure CheckBoxSearchClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  StrSQL,column,AscDesc: string;
  i,k: integer;

implementation

uses unit2;

{$R *.dfm}

 // сортировка
procedure TForm1.ButtonSortClick(Sender: TObject);
begin
  {С помощью оператора выбора case назначаем индексы группе переключателей}
  ADOQueryLogs.SQL.Clear; // очищаем свойство sql от запросов
  StrSQL := 'SELECT logs.NameComputer, logs.IP, logs.MAC_address, computers.InventoryNumber, computers.Location, AccessTime '+
            'FROM logs '+
            'JOIN computers '+
            'ON logs.MAC_address=computers.MAC_address '+
            'AND logs.AccessTime BETWEEN '''+FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)+
            ' '+FormatDateTime('HH:mm:ss',DateTimePicker3.date)+''' AND '''+FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date)+
            ' '+FormatDateTime('HH:mm:ss',DateTimePicker4.date)+''';';
  {если независимый переключатель(флажок) отмечен - добавляем запрос с сгрупировкой данных}
  if CheckBoxSearch.Checked = True then
  begin
    StrSQL:=Search(StrSQL);
  end;
  if CheckBoxGroup.Checked = True then
  begin
    StrSQL:=Group(StrSQL);
  end;
  if CheckBoxSort.Checked = True then
  begin
    StrSQL:=Sort(StrSQL);
  end;
  ADOQueryLogs.SQL.Add(StrSQL);
  ADOQueryLogs.Close;
  ADOQueryLogs.Open;
end;

// Функция поиска
function TForm1.Search(StrSQL: string):string;
begin
  k:=-1;
  if CheckBoxSearch.Checked = True then
  begin
    if (EditSort.Text) = (ADOQueryNameComputer.FieldByName('NameComputer').AsString) then
    begin k:=0; end;
    if  (EditSort.Text) = (ADOQueryComputers.FieldByName('IP').AsString) then
    begin k:=1; end;
    if  (EditSort.Text) = (ADOQueryComputers.FieldByName('MAC_address').AsString) then
    begin k:=2; end;
    if  (EditSort.Text) = (ADOQueryComputers.FieldByName('InventoryNumber').AsString) then
    begin k:=3; end;
    if  (EditSort.Text) = (ADOQueryLocation.FieldByName('Location').AsString) then
    begin k:=4; end;
    case k of
      0: begin
        delete(StrSQL,pos(';',StrSQL),1);
        result:= StrSQL + 'AND logs.NameComputer='''+EditSort.Text+''';';
      end;
      1: begin
        delete(StrSQL,pos(';',StrSQL),1);
        result:= StrSQL + 'AND logs.IP='''+EditSort.Text+''';';
      end;
      2: begin
        delete(StrSQL,pos(';',StrSQL),1);
        result:= StrSQL + 'AND logs.MAC_address='''+EditSort.Text+''';';
      end;
      3: begin
        delete(StrSQL,pos(';',StrSQL),1);
        result:= StrSQL + 'AND computers.InventoryNumber='''+EditSort.Text+''';';
      end;
      4: begin
        delete(StrSQL,pos(';',StrSQL),1);
        result:= StrSQL + 'AND computers.Location='''+EditSort.Text+''';';
      end;
    end;
  end;
end;

// Функция работы групировки
function TForm1.Group(StrSQL: string):string;
begin
  AscDesc:=''; column:='';
  case RadioGroupGroupColumn.ItemIndex of
    0:column:='logs.NameComputer';
    1:column:='logs.IP';
    2:column:='logs.MAC_address';
    3:column:='computers.InventoryNumber';
    4:column:='computers.Location';
    5:column:='logs.AccessTime';
  end;
  if CheckBoxGroup.Checked = True then
  begin
    delete(StrSQL,pos(';',StrSQL),1);
    result:= StrSQL + ' GROUP BY '+column+';';
  end;
end;

//Свернуть в трей
procedure TForm1.N1Click(Sender: TObject);
begin
  Form1.Hide;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'), PChar('HelpNA.chm'),nil,nil,SW_SHOW);
end;

// Функция сортировки
function TForm1.Sort(StrSQL: string):string;
begin
  column:='';
  case RadioGroupSortColumn.ItemIndex of
    0:column:='logs.NameComputer';
    1:column:='logs.IP';
    2:column:='logs.MAC_address';
    3:column:='computers.InventoryNumber';
    4:column:='computers.Location';
    5:column:='logs.AccessTime';
  end;
  case RadioGroupAscDesc.ItemIndex of
    0:AscDesc:='ASC';
    1:AscDesc:='DESC';
  end;
  if CheckBoxSort.Checked = True then
  begin
    delete(StrSQL,pos(';',StrSQL),1);
    result:= StrSQL + ' ORDER BY '+column+' '+AscDesc+';';
  end;
end;

// добавить запись в таблице Computers
procedure TForm1.ButtonAddStringsClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear; // очищаем свойство sql от запросов
  StrSQL := 'INSERT INTO computers (MAC_address,IP,InventoryNumber,Location,DateOfCreation,LastChanges) VALUES ('''+EditMAC.Text+''','''+EditIP.Text+''','+EditNumber.Text+','''+
  EditLocation.Text+''', NOW(), NOW() )'; // вводим запрос
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL; // перезапускаем таблицу
  ADOQueryComputers.Close;
  ADOQueryComputers.Open;
  EditMAC.Clear; EditIP.Clear; EditNumber.Clear; EditLocation.Clear;
end;

// обновить запись в таблице Computers
procedure TForm1.ButtonChangeClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL := 'UPDATE computers SET MAC_address='''+EditMAC2.Text+''', IP='''+EditIP2.Text+''', InventoryNumber='+
  EditNumber2.Text+', Location='''+EditLocation2.Text+''', LastChanges=NOW() WHERE  ID='+DBLookupComboBoxID2.Text; // вводим запрос
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOQueryComputers.Close;
  ADOQueryComputers.Open;
end;

// удалить запись в таблице Computers
procedure TForm1.ButtonDeleteClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL:='DELETE FROM computers WHERE  id='+DBLookupComboBoxID3.Text;
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOQueryComputers.Close;
  ADOQueryComputers.Open;
end;

// Очистить запись в Edit
procedure TForm1.ButtonClearStringsClick(Sender: TObject);
begin
  EditMAC.Clear; EditIP.Clear; EditNumber.Clear; Editlocation.Clear;
end;

// Очистить запись в Edit
procedure TForm1.ButtonClear2Click(Sender: TObject);
begin
  EditMAC2.Clear; EditIP2.Clear; EditNumber2.Clear; EditLocation2.Clear;
end;

// Отправить сообщения клиентам для обновления списка информации клиентов
procedure TForm1.ButtonUpdateLogsClick(Sender: TObject);
begin
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
     ServerSocket1.Socket.Connections[i].SendText('#D#');
end;

// Если стоит флажек на чекбоксе - разблокируем компонент
procedure TForm1.CheckBoxGroupClick(Sender: TObject);
begin
  if CheckBoxGroup.Checked = True then
  begin
    RadioGroupGroupColumn.Enabled:=True;
  end else
  begin
    RadioGroupGroupColumn.Enabled:=false;
  end;
end;

// Если стоит флажек на чекбоксе - разблокируем компонент
procedure TForm1.CheckBoxSearchClick(Sender: TObject);
begin
  if CheckBoxSearch.Checked = True then
  begin
   LabelDate.Enabled:=true; LabelNC.Enabled:=true; LabelIPad.Enabled:=true;
    LabelMACad.Enabled:=true; LabelNb.Enabled:=true; LabelLoc.Enabled:=true;
    DBLookupComboBoxNC.Enabled:=true; DBLookupComboBoxIP.Enabled:=true;
    DBLookupComboBoxMAC.Enabled:=true; DBLookupComboBoxNb.Enabled:=true;
    DBLookupComboBoxLoc.Enabled:=true;
  end else
  begin
    LabelDate.Enabled:=false; LabelNC.Enabled:=false; LabelIPad.Enabled:=false;
    LabelMACad.Enabled:=false; LabelNb.Enabled:=false; LabelLoc.Enabled:=false;
    DBLookupComboBoxNC.Enabled:=false; DBLookupComboBoxIP.Enabled:=false;
    DBLookupComboBoxMAC.Enabled:=false; DBLookupComboBoxNb.Enabled:=false;
    DBLookupComboBoxLoc.Enabled:=false;
  end;
end;

// Если стоит флажек на чекбоксе - разблокируем компонент
procedure TForm1.CheckBoxSortClick(Sender: TObject);
begin
  if CheckBoxSort.Checked = True then
  begin
    RadioGroupSortColumn.Enabled:=True; RadioGroupAscDesc.Enabled:=True;
  end else
  begin
    RadioGroupSortColumn.Enabled:=false; RadioGroupAscDesc.Enabled:=false;
  end;
end;

procedure TForm1.DBLookupComboBoxIPClick(Sender: TObject);
begin
  DBLookupComboBoxLoc.KeyValue := NULL; DBLookupComboBoxNC.KeyValue := NULL;
  EditSort.Text:='';
  EditSort.Text := ADOQueryComputers.FieldByName('IP').AsString;
end;

procedure TForm1.DBLookupComboBoxLocClick(Sender: TObject);
begin
  DBLookupComboBoxMAC.KeyValue := NULL; DBLookupComboBoxIP.KeyValue := NULL;
  DBLookupComboBoxNb.KeyValue := NULL;  DBLookupComboBoxNC.KeyValue := NULL;
  EditSort.Text:='';
  EditSort.Text := ADOQueryLocation.FieldByName('Location').AsString;
end;

procedure TForm1.DBLookupComboBoxLocDropDown(Sender: TObject);
begin
  Form1.ADOQueryLocation.Close;
  Form1.ADOQueryLocation.Open;
  Form1.ADOQueryNameComputer.Close;
  Form1.ADOQueryNameComputer.Open;
end;

procedure TForm1.DBLookupComboBoxMACClick(Sender: TObject);
begin
  DBLookupComboBoxLoc.KeyValue := NULL; DBLookupComboBoxNC.KeyValue := NULL;
  EditSort.Text:='';
  EditSort.Text := ADOQueryComputers.FieldByName('MAC_address').AsString;
end;

procedure TForm1.DBLookupComboBoxNbClick(Sender: TObject);
begin
  DBLookupComboBoxLoc.KeyValue := NULL; DBLookupComboBoxNC.KeyValue := NULL;
  EditSort.Text:='';
  EditSort.Text := ADOQueryComputers.FieldByName('InventoryNumber').AsString;
end;

procedure TForm1.DBLookupComboBoxNCClick(Sender: TObject);
begin
  DBLookupComboBoxMAC.KeyValue := NULL; DBLookupComboBoxIP.KeyValue := NULL;
  DBLookupComboBoxNb.KeyValue := NULL;  DBLookupComboBoxLoc.KeyValue := NULL;
  EditSort.Text:='';
  EditSort.Text := ADOQueryNameComputer.FieldByName('NameComputer').AsString;
end;

// вывести данные в Edit из таблицы Computers
procedure TForm1.DBLookupComboBoxID2Click(Sender: TObject);
begin
  EditMAC2.Text := ADOQueryComputers.FieldByName('MAC_address').AsString;
  EditNumber2.Text := ADOQueryComputers.FieldByName('InventoryNumber').AsString;
  EditLocation2.Text := ADOQueryComputers.FieldByName('Location').AsString;
  EditIP2.Text := ADOQueryComputers.FieldByName('IP').AsString;
end;

// Форм закрывается - иконка в трее исчезает
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TrayIcon1.Visible:=false;
end;

// Процедура спрашивает надо ли закрыть программу
procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Вы действительно ходите закрыть программу?',mtInformation,[mbYes, mbNo],0) = mrYes then
    CanClose := True
  else
    CanClose := False;
end;

// Процедура - при создании формы
procedure TForm1.FormCreate(Sender: TObject);
begin
  {При запуске форма недостуна}
  Form1.Enabled:=false;
  LabelDate.Enabled:=false; LabelNC.Enabled:=false; LabelIPad.Enabled:=false;
  LabelMACad.Enabled:=false; LabelNb.Enabled:=false; LabelLoc.Enabled:=false;
  DBLookupComboBoxNC.Enabled:=false; DBLookupComboBoxIP.Enabled:=false;
  DBLookupComboBoxMAC.Enabled:=false; DBLookupComboBoxNb.Enabled:=false;
  DBLookupComboBoxLoc.Enabled:=false;
  RadioGroupSortColumn.Enabled:=false; RadioGroupAscDesc.Enabled:=false;
  RadioGroupGroupColumn.Enabled:=false;
  {Иконка программы в трее становится видимой}
  TrayIcon1.Visible:=true;
  {Запускаем сервер}
  ServerSocket1.Open;
  if ServerSocket1.Active then
   Statusbar1.Panels.Items[0].Text := 'Active and Open Server';
end;

// Процедура - клиент присоединился
procedure TForm1.ServerSocket1Accept(Sender: TObject; Socket: TCustomWinSocket);
begin
  {Какой-то клиент присоединился. Запрашиваем у всех клиентов их имена}
  ListBoxClientOnline.Items.Clear;
  for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
     ServerSocket1.Socket.Connections[i].SendText('#N');
  MemoStatusSockets.Lines.Insert(0, '['+TimeToStr(Time)+'] Подключился клиент '+Socket.RemoteAddress);
end;

// Процедура -  клиент отключился
procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  MemoStatusSockets.Lines.Insert(0, '['+TimeToStr(Time)+'] Клиент отключился '+Socket.RemoteAddress);
  {Какой-то клиент отсоединился. Запрашиваем у всех клиентов их имена}
  ListBoxClientOnline.Items.Clear;
  for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
    ServerSocket1.Socket.Connections[i].SendText('#N');
end;

// Процедура -  при возникновении ошибки
procedure TForm1.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
end;

// Процедура - cервер читает данные клиентов
procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  s:string;
  NameClient, NameComputer, IP_address, MAC_address:string;
begin
  s := '';
  s := Socket.ReceiveText;
  StatusBar1.Panels.Items[0].Text:='Data transferred from '+Socket.RemoteAddress;
  {Прислали имя, записываем в листбокс, отправляем все имена из листбокса все клиентам}
  if Pos('#N',s) <> 0 then
  begin
    NameClient := Copy(s, Pos('#N', s), Length(s));
    Delete(s,Pos('#N', s),Length(s));
    Delete(NameClient,1,2);
    ListBoxClientOnline.Items.Add(NameClient);
    NameClient := '#U';
    for i := 0 to ListBoxClientOnline.Items.Count-1 do
      NameClient := NameClient+ListBoxClientOnline.Items[i]+';';
    for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(NameClient);
    Exit;
  end;
  {Если кто-то кинул сообщение - рассылаем его всем клиентам}
  if (Copy(s,1,2) = '#M')or (Copy(s,1,2) = '#P') then
  begin
    for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(s);
    Exit;
  end;
  {XML сообщения клиентов}
  if Copy(s,1,11) = '<computers>' then
  begin
    XMLDocument1.XML.Text := s;
    XMLDocument1.Active := true;
    {расшифровываем сообщение клиента}
    NameComputer := XMLDocument1.DocumentElement.ChildNodes['NameComputer'].Text;
    IP_address:=  XMLDocument1.DocumentElement.ChildNodes['IP_address'].Text;
    MAC_address := XMLDocument1.DocumentElement.ChildNodes['MAC_address'].Text;
    XMLDocument1.Active := false;
    ADOQuery1.SQL.Clear;
    StrSQL := 'INSERT INTO logs (NameComputer,IP,MAC_address,AccessTime) VALUES ('''+NameComputer+''','''+IP_address+''','''+MAC_address+''', NOW())';
    ADOQuery1.SQL.Add(StrSQL);
    ADOQuery1.ExecSQL;
    {ADOQueryLogs.Close;
    ADOQueryLogs.Open; }
  end;
end;

// Развернуть программу из трея
procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  Form1.Show;
end;

end.
