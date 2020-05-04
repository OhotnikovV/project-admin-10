unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.Win.ADODB, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  System.Win.ScktComp, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridComputers: TDBGrid;
    DBGrid2: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSourceComp: TDataSource;
    ADOTableComp: TADOTable;
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
    PanelMenu: TPanel;
    ButtonTray: TButton;
    TrayIcon1: TTrayIcon;
    ListBoxClientOnline: TListBox;
    GroupBoxClientOnline: TGroupBox;
    GroupBoxStatusSockets: TGroupBox;
    procedure ButtonAddStringsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonChangeClick(Sender: TObject);
    procedure DBLookupComboBoxID2Click(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonClearStringsClick(Sender: TObject);
    procedure ButtonClear2Click(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ButtonUpdateLogsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonTrayClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure ServerSocket1Accept(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  StrSQL:string;
  i:integer;

implementation

{$R *.dfm}

// добавить запись в таблице Computers
procedure TForm1.ButtonAddStringsClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear; // очищаем свойство sql от запросов
  StrSQL := 'insert into computers (MAC_address,IP,InventoryNumber,Location,DateOfCreation,LastChanges) values('''+EditMAC.Text+''','''+EditIP.Text+''','+EditNumber.Text+','''+
  EditLocation.Text+''', now(), now() )'; // вводим запрос
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL; // перезапускаем таблицу
  ADOTableComp.Close;
  ADOTableComp.Open;
  EditMAC.Clear; EditIP.Clear; EditNumber.Clear; EditLocation.Clear;
end;

// обновить запись в таблице Computers
procedure TForm1.ButtonChangeClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL := 'update computers set MAC_address='''+EditMAC2.Text+''', IP='''+EditIP2.Text+''', InventoryNumber='+
  EditNumber2.Text+', Location='''+EditLocation2.Text+''', LastChanges=now() Where  ID='+DBLookupComboBoxID2.Text; // вводим запрос
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOTableComp.Close;
  ADOTableComp.Open;
end;

// удалить запись в таблице Computers
procedure TForm1.ButtonDeleteClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL:='delete from computers where id='+DBLookupComboBoxID3.Text;
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOTableComp.Close;
  ADOTableComp.Open;
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
     ServerSocket1.Socket.Connections[i].SendText('#date#');
end;

// Свернуть в трей
procedure TForm1.ButtonTrayClick(Sender: TObject);
begin
  Form1.Hide;
end;

// вывести данные в Edit из таблицы Computers
procedure TForm1.DBLookupComboBoxID2Click(Sender: TObject);
begin
  EditMAC2.Text := ADOTableComp.FieldByName('MAC_address').AsString;
  EditNumber2.Text := ADOTableComp.FieldByName('InventoryNumber').AsString;
  EditLocation2.Text := ADOTableComp.FieldByName('Location').AsString;
  EditIP2.Text := ADOTableComp.FieldByName('IP').AsString;
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
   {Иконка программы в трее становится видимой}
   TrayIcon1.Visible:=true;
   {Обновляем таблицы БД}
   ADOTableComp.Active := False; ADOTableComp.Active := True;
   ADOQueryLogs.Active := False; ADOQueryLogs.Active := True;
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
end;

// Процедура -  клиент присоединяется
procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
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
  //Memo1.Lines.Add(Socket.ReceiveText);  // получить сообщение от клиента
  s := Socket.ReceiveText;
  StatusBar1.Panels.Items[0].Text:='Data transferred from '+Socket.RemoteAddress;

  {Какой-то клиент прислал серверу свое имя}
  if Copy(s,1,2) = '#N' then
  begin
    Delete(s,1,2);
    {добавляем имя клиента в листбокс}
    ListBoxClientOnline.Items.Add(s);
    {отправляем имена клиентов из листбокса всем клиентам}
    NameClient := '#U';
    for i := 0 to ListBoxClientOnline.Items.Count-1 do
      NameClient := NameClient+ListBoxClientOnline.Items[i]+';';
    for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(NameClient);
    Exit;
  end;

  {Если кто-то кинул сообщение - рассылаем его всем клиентам}
  if Copy(s,1,2) = '#P' then
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
    {отправляем сообщение в таблицу logs}
    ADOQuery1.SQL.Clear;
    StrSQL := 'insert logs (NameComputer,IP,MAC_address,AccessTime) values ('''+NameComputer+''','''+IP_address+''','''+MAC_address+''', now())';
    ADOQuery1.SQL.Add(StrSQL);
    ADOQuery1.ExecSQL;
    ADOQueryLogs.Close;
    ADOQueryLogs.Open;
  end;
end;

// Развернуть программу из трея
procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  Form1.Show;
end;

end.
