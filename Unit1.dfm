object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = PageControl1
  Caption = 'Network Inventory - Server'
  ClientHeight = 568
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 23
    Width = 797
    Height = 526
    ActivePage = TabSheet6
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 529
    object TabSheet1: TTabSheet
      Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1099
      ExplicitHeight = 501
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 789
        Height = 267
        Align = alClient
        DataSource = DataSourceComp
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 267
        Width = 789
        Height = 231
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 270
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 787
          Height = 229
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 0
          object TabSheet3: TTabSheet
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            object Label1: TLabel
              Left = 11
              Top = 3
              Width = 60
              Height = 13
              Caption = 'MAC-'#1072#1076#1088#1077#1089':'
            end
            object Label2: TLabel
              Left = 147
              Top = 3
              Width = 106
              Height = 13
              Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088':'
            end
            object Label3: TLabel
              Left = 147
              Top = 49
              Width = 77
              Height = 13
              Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
            end
            object Label8: TLabel
              Left = 11
              Top = 49
              Width = 48
              Height = 13
              Caption = 'IP-'#1072#1076#1088#1077#1089':'
            end
            object Edit1: TEdit
              Left = 11
              Top = 22
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object Edit3: TEdit
              Left = 147
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 1
            end
            object Edit2: TEdit
              Left = 147
              Top = 22
              Width = 121
              Height = 21
              TabOrder = 2
            end
            object Button1: TButton
              Left = 11
              Top = 104
              Width = 75
              Height = 25
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 3
              OnClick = Button1Click
            end
            object Edit7: TEdit
              Left = 11
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 4
            end
            object Button4: TButton
              Left = 92
              Top = 104
              Width = 75
              Height = 25
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 5
              OnClick = Button4Click
            end
          end
          object TabSheet4: TTabSheet
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            ImageIndex = 1
            object Label4: TLabel
              Left = 11
              Top = 49
              Width = 60
              Height = 13
              Caption = 'MAC-'#1072#1076#1088#1077#1089':'
            end
            object Label5: TLabel
              Left = 146
              Top = 49
              Width = 106
              Height = 13
              Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088':'
            end
            object Label6: TLabel
              Left = 146
              Top = 95
              Width = 77
              Height = 13
              Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
            end
            object Label7: TLabel
              Left = 11
              Top = 3
              Width = 52
              Height = 13
              Caption = 'ID '#1079#1072#1087#1080#1089#1080':'
            end
            object Label9: TLabel
              Left = 11
              Top = 95
              Width = 48
              Height = 13
              Caption = 'IP-'#1072#1076#1088#1077#1089':'
            end
            object Edit4: TEdit
              Left = 11
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object Edit5: TEdit
              Left = 146
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 1
            end
            object Edit6: TEdit
              Left = 146
              Top = 114
              Width = 121
              Height = 21
              TabOrder = 2
            end
            object Button2: TButton
              Left = 11
              Top = 149
              Width = 75
              Height = 25
              Caption = #1048#1079#1084#1077#1085#1080#1090#1100
              TabOrder = 3
              OnClick = Button2Click
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 11
              Top = 22
              Width = 121
              Height = 21
              KeyField = 'id'
              ListField = 'id'
              ListSource = DataSourceComp
              TabOrder = 4
              OnClick = DBLookupComboBox1Click
            end
            object Edit8: TEdit
              Left = 11
              Top = 114
              Width = 121
              Height = 21
              TabOrder = 5
            end
            object Button5: TButton
              Left = 92
              Top = 149
              Width = 75
              Height = 25
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 6
              OnClick = Button5Click
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1059#1076#1072#1083#1080#1090#1100
            ImageIndex = 2
            object Label10: TLabel
              Left = 11
              Top = 3
              Width = 52
              Height = 13
              Caption = 'ID '#1079#1072#1087#1080#1089#1080':'
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 11
              Top = 22
              Width = 145
              Height = 21
              KeyField = 'id'
              ListField = 'id'
              ListSource = DataSourceComp
              TabOrder = 0
            end
            object Button3: TButton
              Left = 11
              Top = 56
              Width = 75
              Height = 25
              Caption = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              OnClick = Button3Click
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1051#1086#1075#1080
      ImageIndex = 1
      ExplicitHeight = 501
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 789
        Height = 443
        Align = alClient
        DataSource = DataSourceLogs
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel3: TPanel
        Left = 0
        Top = 443
        Width = 789
        Height = 55
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 446
        object ButtonUpdateLogs: TButton
          Left = 705
          Top = 6
          Width = 75
          Height = 25
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = ButtonUpdateLogsClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1057#1090#1072#1090#1091#1089
      ImageIndex = 2
      ExplicitHeight = 501
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 789
        Height = 498
        Align = alClient
        TabOrder = 0
        ExplicitLeft = -3
        ExplicitTop = -2
        ExplicitHeight = 501
        object Memo1: TMemo
          Left = 1
          Top = 1
          Width = 787
          Height = 184
          Align = alTop
          ReadOnly = True
          TabOrder = 0
          ExplicitLeft = 0
        end
        object GroupBoxClientOnline: TGroupBox
          Left = 0
          Top = 191
          Width = 185
          Height = 273
          Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1099' '#1074' '#1089#1077#1090#1080
          TabOrder = 1
          object ListBoxClientOnline: TListBox
            Left = 2
            Top = 15
            Width = 181
            Height = 256
            Align = alClient
            ItemHeight = 13
            TabOrder = 0
            ExplicitLeft = 1
            ExplicitTop = 394
            ExplicitWidth = 787
            ExplicitHeight = 106
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 549
    Width = 797
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitTop = 552
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 23
    Align = alTop
    TabOrder = 2
    object Button7: TButton
      Left = 718
      Top = 2
      Width = 75
      Height = 20
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      TabOrder = 0
      OnClick = Button7Click
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User' +
      ' ID=root;Extended Properties="Driver=MySQL ODBC 8.0 ANSI Driver;' +
      'SERVER=localhost;UID=root;PWD=1234;DATABASE=inventory;PORT=3306;' +
      'COLUMN_SIZE_S32=1";Initial Catalog=inventory'
    LoginPrompt = False
    Left = 528
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 528
    Top = 96
  end
  object DataSourceComp: TDataSource
    DataSet = ADOTableComp
    Left = 600
    Top = 40
  end
  object ADOTableComp: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'computers'
    Left = 600
    Top = 96
  end
  object DataSourceLogs: TDataSource
    DataSet = ADOQueryLogs
    Left = 672
    Top = 40
  end
  object ADOTableLogs: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'logs'
    Left = 736
    Top = 96
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 65000
    ServerType = stNonBlocking
    OnAccept = ServerSocket1Accept
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    OnClientError = ServerSocket1ClientError
    Left = 528
    Top = 160
  end
  object XMLDocument1: TXMLDocument
    Left = 600
    Top = 160
    DOMVendorDesc = 'MSXML'
  end
  object ADOQueryLogs: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'select logs.NameComputer, logs.IP, logs.MAC_address, computers.I' +
        'nventoryNumber, computers.Location, AccessTime'
      'from logs'
      'join computers'
      'on logs.IP=computers.IP;')
    Left = 672
    Top = 96
  end
  object TrayIcon1: TTrayIcon
    OnDblClick = TrayIcon1DblClick
    Left = 672
    Top = 160
  end
end
