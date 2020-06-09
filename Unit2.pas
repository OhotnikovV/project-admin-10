unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    LabelLogin: TLabel;
    LabelPassword: TLabel;
    LabelServer: TLabel;
    LabelPort: TLabel;
    EditLogin: TEdit;
    EditPassword: TEdit;
    EditServer: TEdit;
    EditPort: TEdit;
    ButtonConnect: TButton;
    ButtonClose: TButton;
    procedure ButtonConnectClick(Sender: TObject);
    procedure CreateDataBase;
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses unit1;

{$R *.dfm}

// Закрывает главную форму
procedure TForm2.ButtonCloseClick(Sender: TObject);
begin
  Form1.Close;
end;

// Подключаемся к БД
procedure TForm2.ButtonConnectClick(Sender: TObject);
begin
  try
    {Закрываем соединение}
    Form1.ADOConnection1.Connected := False;
    {Записываем настройки подключения}
    Form1.ADOConnection1.ConnectionString :=
      'Provider=MSDASQL.1;Password=' + EditPassword.Text +
      ';Persist Security Info=True;User ID=' + EditLogin.Text +
      ';Extended Properties="DRIVER={MySQL ODBC 8.0 ANSI Driver};UID=' +
      EditLogin.Text + ';PWD=' + EditPassword.Text + ';SERVER=' +
      EditServer.Text + ';DATABASE=network_db;PORT=' + EditPort.Text +
      ';COLUMN_SIZE_S32=1;";Initial Catalog=network_db';
    {Подключаемся к БД}
    Form1.ADOConnection1.Connected := True;
    Form1.ADOQueryComputers.Open;
    // Form1.ADOQueryLogs.Open;
    Form1.ADOQueryLocation.Open;
    Form1.ADOQueryNameComputer.Open;
    if Form1.ADOConnection1.Connected = True then
      Form1.Statusbar1.Panels.Items[0].Text := 'Database connected';
    {Pакрываем форму}
    Form1.Enabled := True;
    Form2.Close
  except
    ShowMessage
      ('База данных не обнаружена, либо неправильно введен логин и пароль! '+
       'Попробуйте еще раз!');
    CreateDataBase;
  end;
end;

// Создаем БД
procedure TForm2.CreateDataBase;
begin
  try
    { Обращаемся к конфигу и записываем настройки, подключаемся к БД }
    Form1.ADOConnection1.Connected := False;
    Form1.ADOConnection1.ConnectionString :=
      'Provider=MSDASQL.1;Password=' + EditPassword.Text +
      ';Persist Security Info=True;User ID=' + EditLogin.Text +
      ';Extended Properties="DRIVER={MySQL ODBC 8.0 ANSI Driver};UID=' +
      EditLogin.Text + ';PWD=' + EditPassword.Text + ';SERVER=' +
      EditServer.Text + ';PORT=' + EditPort.Text + ';COLUMN_SIZE_S32=1;"';
    { Создаем БД и таблицы }
    Form1.ADOConnection1.Connected := True;
    Form1.ADOQuery1.SQL.Clear;
    StrSQL := 'create database network_DB;';
    Form1.ADOQuery1.SQL.Add(StrSQL);
    Form1.ADOQuery1.ExecSQL;
    Form1.ADOQuery1.SQL.Clear;
    StrSQL := 'use network_DB;';
    Form1.ADOQuery1.SQL.Add(StrSQL);
    Form1.ADOQuery1.ExecSQL;
    Form1.ADOQuery1.SQL.Clear;
    StrSQL := 'create table computers (id int primary key auto_increment, MAC_address varchar(20) not null, IP varchar(20) not null, InventoryNumber int not null, Location varchar(20) not null, DateOfCreation datetime not null, LastChanges datetime not null);';
    Form1.ADOQuery1.SQL.Add(StrSQL);
    Form1.ADOQuery1.ExecSQL;
    Form1.ADOQuery1.SQL.Clear;
    StrSQL := 'create table logs (NameComputer varchar(20) not null, IP varchar(20) not null, MAC_address varchar(20) not null, AccessTime datetime not null);';
    Form1.ADOQuery1.SQL.Add(StrSQL);
    Form1.ADOQuery1.ExecSQL;
    if Form1.ADOConnection1.Connected = True then
      Form1.Statusbar1.Panels.Items[0].Text := 'Database created';
  except
    ShowMessage('База данных уже создана!');
  end;
end;

end.
