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
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSourceComp: TDataSource;
    ADOTableComp: TADOTable;
    DataSourceLogs: TDataSource;
    ADOTableLogs: TADOTable;
    Panel1: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button2: TButton;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Button3: TButton;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Button4: TButton;
    Button5: TButton;
    ServerSocket1: TServerSocket;
    TabSheet6: TTabSheet;
    Panel2: TPanel;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    XMLDocument1: TXMLDocument;
    ButtonUpdateLogs: TButton;
    ADOQueryLogs: TADOQuery;
    Panel3: TPanel;
    Panel4: TPanel;
    Button7: TButton;
    TrayIcon1: TTrayIcon;
    ListBoxClientOnline: TListBox;
    GroupBoxClientOnline: TGroupBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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
    procedure Button7Click(Sender: TObject);
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
procedure TForm1.Button1Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear; // очищаем свойство sql от запросов
  StrSQL := 'insert into computers (MAC_address,IP,InventoryNumber,Location,DateOfCreation,LastChanges) values('''+Edit1.Text+''','''+Edit7.Text+''','+Edit2.Text+','''+
  Edit3.Text+''', now(), now() )'; // вводим запрос
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL; // перезапускаем таблицу
  ADOTableComp.close;
  ADOTableComp.open;
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit7.Clear;
end;

// обновить запись в таблице Computers
procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL := 'update computers set MAC_address='''+Edit4.Text+''', IP='''+Edit8.Text+''', InventoryNumber='+
  Edit5.Text+', Location='''+Edit6.Text+''', LastChanges=now() Where  ID='+DBLookupComboBox1.Text; // вводим запрос
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOTableComp.close;
  ADOTableComp.open;
end;

// удалить запись в таблице Computers
procedure TForm1.Button3Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL:='delete from computers where id='+DBLookupComboBox2.Text;
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOTableComp.close;
  ADOTableComp.open;
end;

// Очистить запись в Edit
procedure TForm1.Button4Click(Sender: TObject);
begin
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit7.Clear;
end;

// Очистить запись в Edit
procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit4.Clear; Edit5.Clear; Edit6.Clear; Edit8.Clear;
end;

// Отправить сообщения клиентам для обновления списка информации клиентов
procedure TForm1.ButtonUpdateLogsClick(Sender: TObject);
begin
  for i :=0 to ServerSocket1.Socket.ActiveConnections - 1 do
     ServerSocket1.Socket.Connections[i].SendText('#date#');
end;

// Свернуть в трей
procedure TForm1.Button7Click(Sender: TObject);
begin
  Form1.Hide;
end;

// вывести данные в Edit из таблицы Computers
procedure TForm1.DBLookupComboBox1Click(Sender: TObject);
begin
  Edit4.Text:=ADOTableComp.FieldByName('MAC_address').AsString;
  Edit5.Text:=ADOTableComp.FieldByName('InventoryNumber').AsString;
  Edit6.Text:=ADOTableComp.FieldByName('Location').AsString;
  Edit8.Text:=ADOTableComp.FieldByName('IP').AsString;
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
   ADOTableComp.Active:=false; ADOTableComp.Active:=true;
   ADOTableLogs.Active:=false; ADOTableLogs.Active:=true;
   {Запускаем сервер}
   ServerSocket1.Open;
   if ServerSocket1.Active then
    Statusbar1.Panels.Items[0].Text:='Active and Open Server';
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
  Memo1.Lines.Insert(0, '['+TimeToStr(Time)+'] Подключился клиент '+Socket.RemoteAddress);
end;

// Процедура -  клиент отключился
procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Insert(0, '['+TimeToStr(Time)+'] Клиент отключился '+Socket.RemoteAddress);
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
  NameClient, NameComputer, MAC_address:string;
begin
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
    MAC_address := XMLDocument1.DocumentElement.ChildNodes['MAC_address'].Text;
    XMLDocument1.Active := false;
    {отправляем сообщение в таблицу logs}
    ADOQuery1.SQL.Clear;
    StrSQL := 'insert logs (NameComputer,IP,MAC_address,AccessTime) values ('''+NameComputer+''','''+Socket.RemoteAddress+''','''+MAC_address+''', now())';
    ADOQuery1.SQL.Add(StrSQL);
    ADOQuery1.ExecSQL;
    ADOQueryLogs.close;
    ADOQueryLogs.open;
  end;
end;

// Развернуть программу из трея
procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  Form1.Show;
end;

end.
