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
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    TabSheet6: TTabSheet;
    Panel2: TPanel;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    XMLDocument1: TXMLDocument;
    Button6: TButton;
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
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  str:string;
  NameComputer, MAC_address:string;
  i:integer;

implementation

{$R *.dfm}

// добавить запись в БД
procedure TForm1.Button1Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear; // очищаем свойство sql от запросов
  str := 'insert into computers (MAC_address,IP,InventoryNumber,Location,DateOfCreation,LastChanges) values('''+Edit1.Text+''','''+Edit7.Text+''','+Edit2.Text+','''+
  Edit3.Text+''', now(), now() )'; // вводим запрос
  ADOQuery1.SQL.Add(str);
  ADOQuery1.ExecSQL; // перезапускаем таблицу
  ADOTableComp.close;
  ADOTableComp.open;
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit7.Clear;
end;

// обновить запись в БД
procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  str := 'update computers set MAC_address='''+Edit4.Text+''', IP='''+Edit8.Text+''', InventoryNumber='+
  Edit5.Text+', Location='''+Edit6.Text+''', LastChanges=now() Where  ID='+DBLookupComboBox1.Text; // вводим запрос
  ADOQuery1.SQL.Add(str);
  ADOQuery1.ExecSQL;
  ADOTableComp.close;
  ADOTableComp.open;
end;

// удалить запись в БД
procedure TForm1.Button3Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  str:='delete from computers where id='+DBLookupComboBox2.Text;
  ADOQuery1.SQL.Add(str);
  ADOQuery1.ExecSQL;
  ADOTableComp.close;
  ADOTableComp.open;
end;

// очистить запись в Edit
procedure TForm1.Button4Click(Sender: TObject);
begin
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit7.Clear;
end;

// очистить запись в Edit
procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit4.Clear; Edit5.Clear; Edit6.Clear; Edit8.Clear;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  for i :=0 to ServerSocket1.Socket.ActiveConnections - 1 do
     ServerSocket1.Socket.Connections[i].SendText('need date');   //Отправить сообщение клиенту
end;

// выыести данные в Edit из БД
procedure TForm1.DBLookupComboBox1Click(Sender: TObject);
begin
  Edit4.Text:=ADOTableComp.FieldByName('MAC_address').AsString;
  Edit5.Text:=ADOTableComp.FieldByName('InventoryNumber').AsString;
  Edit6.Text:=ADOTableComp.FieldByName('Location').AsString;
  Edit8.Text:=ADOTableComp.FieldByName('IP').AsString;
end;

// Процедура - при создании формы
procedure TForm1.FormCreate(Sender: TObject);
begin
   ADOTableComp.Active:=false; ADOTableComp.Active:=true;
   ADOTableLogs.Active:=false; ADOTableLogs.Active:=true;

   // --- Создаем сервер---///
   {ServerSocket1.Port:= 65000; // указываем порт
   ServerSocket1.Active:=True; // активируем наш сервер }
   ServerSocket1.Open; // запускаем

   if ServerSocket1.Active then
    Statusbar1.Panels.Items[0].Text:='Active and Open Server 192.168.100.3';
end;

// Процедура -  клиент подсоединился
procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add('['+TimeToStr(Time)+'] Подключился клиент '+Socket.RemoteAddress);
end;

// Процедура -  клиент отключился
procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add('['+TimeToStr(Time)+'] Клиент отключился '+Socket.RemoteAddress);
end;

// Процедура -  при возникновении ошибки
procedure TForm1.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
end;

// Процедура - клиент передал cерверу какие-либо данные
procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  //Memo1.Lines.Add(Socket.ReceiveText);  // получить сообщение от клиента
  XMLDocument1.XML.Text:=Socket.ReceiveText; // отправить сообщение клиента компоненту XMLDocument
  XMLDocument1.Active := true; // активируем компонент XMLDocument

  // расшифровываем сообщение клиента
  NameComputer := XMLDocument1.DocumentElement.ChildNodes['NameComputer'].Text;
  MAC_address := XMLDocument1.DocumentElement.ChildNodes['MAC_address'].Text;

  XMLDocument1.Active := false; // деактивируем компонент XMLDocument
  StatusBar1.Panels.Items[0].Text:='Data transferred from '+Socket.RemoteAddress;

  //отправляем сообщение в логи
  ADOQuery1.SQL.Clear;
  str := 'insert logs (NameComputer,IP,MAC_address,AccessTime) values ('''+NameComputer+''','''+Socket.RemoteAddress+''','''+MAC_address+''', now())';
  ADOQuery1.SQL.Add(str);
  ADOQuery1.ExecSQL;
  ADOTableLogs.close;
  ADOTableLogs.open;
end;

end.
