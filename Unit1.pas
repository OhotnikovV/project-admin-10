unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.Win.ADODB, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  System.Win.ScktComp, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, IniFiles;

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
    PanelMenu: TPanel;
    ButtonTray: TButton;
    TrayIcon1: TTrayIcon;
    ListBoxClientOnline: TListBox;
    GroupBoxClientOnline: TGroupBox;
    GroupBoxStatusSockets: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditLogin: TEdit;
    EditPwd: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditServer: TEdit;
    EditPort: TEdit;
    Button1: TButton;
    ADOQueryComputers: TADOQuery;
    GroupBox1: TGroupBox;
    PanetSetting: TPanel;
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
    procedure Button1Click(Sender: TObject);
    procedure CreateDataBase;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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


procedure TForm1.Button1Click(Sender: TObject);
var
  Ini: TIniFile;
begin
  {��������� ���������� �� ����, ���� ����������� - �� �������}
  try
  ADOConnection1.Connected:=False;
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
  Ini.WriteString('ADOConnection','ConnectionString','Provider=MSDASQL.1;Password='+EditPwd.Text+';Persist Security Info=True;User ID='+EditLogin.Text+';Extended Properties="DRIVER={MySQL ODBC 8.0 ANSI Driver};UID='+EditLogin.Text+';PWD='+EditPwd.Text+';SERVER='+EditServer.Text+';DATABASE=network_db;PORT='+EditPort.Text+';COLUMN_SIZE_S32=1;";Initial Catalog=network_db');
  ADOConnection1.ConnectionString:=Ini.ReadString('ADOConnection','ConnectionString','');
  Ini.Free;
  ADOConnection1.Connected:=True;
  ADOQueryComputers.Open;
  ADOQueryLogs.Open;
  if ADOConnection1.Connected=True then
    Statusbar1.Panels.Items[0].Text := 'Database connected';
  except
    ShowMessage('���� ������ �� ����������. ���� ������� �������� ��.');
    CreateDataBase;
  end;
end;

procedure TForm1.CreateDataBase;
var
  Ini: TIniFile;
begin
  try
  ADOConnection1.Connected:=False;
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
  Ini.WriteString('ADOConnection','ConnectionString','Provider=MSDASQL.1;Password='+EditPwd.Text+';Persist Security Info=True;User ID='+EditLogin.Text+';Extended Properties="DRIVER={MySQL ODBC 8.0 ANSI Driver};UID='+EditLogin.Text+';PWD='+EditPwd.Text+';SERVER='+EditServer.Text+';PORT='+EditPort.Text+';COLUMN_SIZE_S32=1;"');
  ADOConnection1.ConnectionString:=Ini.ReadString('ADOConnection','ConnectionString','');
  Ini.Free;
  ADOConnection1.Connected:=True;
  ADOQuery1.SQL.Clear;
  StrSQL := 'create database network_DB;';
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  StrSQL := 'use network_DB;';
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  StrSQL := 'create table computers (id int primary key auto_increment, MAC_address varchar(20) not null, IP varchar(20) not null, InventoryNumber int not null, Location varchar(20) not null, DateOfCreation datetime not null, LastChanges datetime not null);';
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  StrSQL := 'create table logs (NameComputer varchar(20) not null, IP varchar(20) not null, MAC_address varchar(20) not null, AccessTime time not null);';
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  if ADOConnection1.Connected=True then
    Statusbar1.Panels.Items[0].Text := 'Database created';
  except
    ShowMessage('���� ������ ��� �������!');
  end;
end;

// �������� ������ � ������� Computers
procedure TForm1.ButtonAddStringsClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear; // ������� �������� sql �� ��������
  StrSQL := 'insert into computers (MAC_address,IP,InventoryNumber,Location,DateOfCreation,LastChanges) values('''+EditMAC.Text+''','''+EditIP.Text+''','+EditNumber.Text+','''+
  EditLocation.Text+''', now(), now() )'; // ������ ������
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL; // ������������� �������
  ADOQueryComputers.Close;
  ADOQueryComputers.Open;
  EditMAC.Clear; EditIP.Clear; EditNumber.Clear; EditLocation.Clear;
end;

// �������� ������ � ������� Computers
procedure TForm1.ButtonChangeClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL := 'update computers set MAC_address='''+EditMAC2.Text+''', IP='''+EditIP2.Text+''', InventoryNumber='+
  EditNumber2.Text+', Location='''+EditLocation2.Text+''', LastChanges=now() Where  ID='+DBLookupComboBoxID2.Text; // ������ ������
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOQueryComputers.Close;
  ADOQueryComputers.Open;
end;

// ������� ������ � ������� Computers
procedure TForm1.ButtonDeleteClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  StrSQL:='delete from computers where id='+DBLookupComboBoxID3.Text;
  ADOQuery1.SQL.Add(StrSQL);
  ADOQuery1.ExecSQL;
  ADOQueryComputers.Close;
  ADOQueryComputers.Open;
end;

// �������� ������ � Edit
procedure TForm1.ButtonClearStringsClick(Sender: TObject);
begin
  EditMAC.Clear; EditIP.Clear; EditNumber.Clear; Editlocation.Clear;
end;

// �������� ������ � Edit
procedure TForm1.ButtonClear2Click(Sender: TObject);
begin
  EditMAC2.Clear; EditIP2.Clear; EditNumber2.Clear; EditLocation2.Clear;
end;

// ��������� ��������� �������� ��� ���������� ������ ���������� ��������
procedure TForm1.ButtonUpdateLogsClick(Sender: TObject);
begin
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
     ServerSocket1.Socket.Connections[i].SendText('#date#');
end;

// �������� � ����
procedure TForm1.ButtonTrayClick(Sender: TObject);
begin
  Form1.Hide;
end;

// ������� ������ � Edit �� ������� Computers
procedure TForm1.DBLookupComboBoxID2Click(Sender: TObject);
begin
  EditMAC2.Text := ADOQueryComputers.FieldByName('MAC_address').AsString;
  EditNumber2.Text := ADOQueryComputers.FieldByName('InventoryNumber').AsString;
  EditLocation2.Text := ADOQueryComputers.FieldByName('Location').AsString;
  EditIP2.Text := ADOQueryComputers.FieldByName('IP').AsString;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TrayIcon1.Visible:=false;
end;

// ��������� ���������� ���� �� ������� ���������
procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('�� ������������� ������ ������� ���������?',mtInformation,[mbYes, mbNo],0) = mrYes then
    CanClose := True
  else
    CanClose := False;
end;

// ��������� - ��� �������� �����
procedure TForm1.FormCreate(Sender: TObject);
begin
   {������ ��������� � ���� ���������� �������}
   TrayIcon1.Visible:=true;
   {��������� ������� ��}
   //ADOTableComp.Active := False; ADOTableComp.Active := True;
   //ADOQueryLogs.Active := False; ADOQueryLogs.Active := True;
   {��������� ������}
   ServerSocket1.Open;
   if ServerSocket1.Active then
     Statusbar1.Panels.Items[0].Text := 'Active and Open Server';
end;

// ��������� - ������ �������������
procedure TForm1.ServerSocket1Accept(Sender: TObject; Socket: TCustomWinSocket);
begin
  {�����-�� ������ �������������. ����������� � ���� �������� �� �����}
  ListBoxClientOnline.Items.Clear;
  for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
    ServerSocket1.Socket.Connections[i].SendText('#N');
end;

// ��������� -  ������ ��������������
procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  MemoStatusSockets.Lines.Insert(0, '['+TimeToStr(Time)+'] ����������� ������ '+Socket.RemoteAddress);
end;

// ��������� -  ������ ����������
procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  MemoStatusSockets.Lines.Insert(0, '['+TimeToStr(Time)+'] ������ ���������� '+Socket.RemoteAddress);
  {�����-�� ������ ������������. ����������� � ���� �������� �� �����}
  ListBoxClientOnline.Items.Clear;
  for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
    ServerSocket1.Socket.Connections[i].SendText('#N');
end;

// ��������� -  ��� ������������� ������
procedure TForm1.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
end;

// ��������� - c����� ������ ������ ��������
procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  s:string;
  NameClient, NameComputer, IP_address, MAC_address:string;
begin
  s := '';
  //Memo1.Lines.Add(Socket.ReceiveText);  // �������� ��������� �� �������
  s := Socket.ReceiveText;
  StatusBar1.Panels.Items[0].Text:='Data transferred from '+Socket.RemoteAddress;

  {�����-�� ������ ������� ������� ���� ���}
  if Copy(s,1,2) = '#N' then
  begin
    Delete(s,1,2);
    {��������� ��� ������� � ��������}
    ListBoxClientOnline.Items.Add(s);
    {���������� ����� �������� �� ��������� ���� ��������}
    NameClient := '#U';
    for i := 0 to ListBoxClientOnline.Items.Count-1 do
      NameClient := NameClient+ListBoxClientOnline.Items[i]+';';
    for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(NameClient);
    Exit;
  end;

  {���� ���-�� ����� ��������� - ��������� ��� ���� ��������}
  if Copy(s,1,2) = '#P' then
  begin
    for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(s);
    Exit;
  end;

  {XML ��������� ��������}
  if Copy(s,1,11) = '<computers>' then
  begin
    XMLDocument1.XML.Text := s;
    XMLDocument1.Active := true;
    {�������������� ��������� �������}
    NameComputer := XMLDocument1.DocumentElement.ChildNodes['NameComputer'].Text;
    IP_address:=  XMLDocument1.DocumentElement.ChildNodes['IP_address'].Text;
    MAC_address := XMLDocument1.DocumentElement.ChildNodes['MAC_address'].Text;
    XMLDocument1.Active := false;
    {���������� ��������� � ������� logs}
    ADOQuery1.SQL.Clear;
    StrSQL := 'insert logs (NameComputer,IP,MAC_address,AccessTime) values ('''+NameComputer+''','''+IP_address+''','''+MAC_address+''', now())';
    ADOQuery1.SQL.Add(StrSQL);
    ADOQuery1.ExecSQL;
    ADOQueryLogs.Close;
    ADOQueryLogs.Open;
  end;
end;

// ���������� ��������� �� ����
procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  Form1.Show;
end;

end.
