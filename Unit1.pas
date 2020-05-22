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
    ADOQueryComputers: TADOQuery;
    GroupBox2: TGroupBox;
    EditSort: TEdit;
    ButtonSort: TButton;
    ButtonAll: TButton;
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonSortClick(Sender: TObject);
    procedure ButtonAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  StrSQL: string;
  i: integer;

implementation

uses unit2;

{$R *.dfm}

 // ����������
procedure TForm1.ButtonSortClick(Sender: TObject);
var
  column:string;
begin
  {� ������� ��������� ������ case ��������� ������� ������ ��������������}
  column:='';
  case RadioGroup1.ItemIndex of
    0:column:='logs.NameComputer';
    1:column:='logs.IP';
    2:column:='logs.MAC_address';
    3:column:='computers.InventoryNumber';
    4:column:='computers.Location';
    5:column:='logs.AccessTime';
  end;
  ADOQueryLogs.SQL.Clear; // ������� �������� sql �� ��������
  StrSQL := 'select logs.NameComputer, logs.IP, logs.MAC_address, computers.InventoryNumber, computers.Location, AccessTime '+
            'from logs '+
            'join computers on logs.MAC_address=computers.MAC_address '+
            'and '+column+'='''+EditSort.Text+''''+
            //'and logs.AccessTime between '''+DateToStr(DateTimePicker1.DateTime)+''' and '''+DateToStr(DateTimePicker2.DateTime)+''';';
            'and logs.AccessTime between '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',DateTimePicker1.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',DateTimePicker2.Date)+''';';
  {���� ����������� �������������(������) ������� - ��������� ������ � ������������ ������}
  if CheckBox1.Checked = True then
  begin
    delete(StrSQL,pos(';',StrSQL),1);
    StrSQL:= StrSQL + ' group by logs.MAC_address;';
  end;
  ADOQueryLogs.SQL.Add(StrSQL);
  ADOQueryLogs.Close;
  ADOQueryLogs.Open;
end;

// G������ ������� �����
procedure TForm1.ButtonAllClick(Sender: TObject);
begin
  ADOQueryLogs.SQL.Clear; // ������� �������� sql �� ��������
  StrSQL := 'select logs.NameComputer, logs.IP, logs.MAC_address, computers.InventoryNumber, computers.Location, AccessTime '+
            'from logs '+
            'join computers on logs.MAC_address=computers.MAC_address';
  ADOQueryLogs.SQL.Add(StrSQL);
  ADOQueryLogs.Close;
  ADOQueryLogs.Open;
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
  {��� ������� ����� ���������}
  Form1.Enabled:=false;
  {������ ��������� � ���� ���������� �������}
  TrayIcon1.Visible:=true;
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
