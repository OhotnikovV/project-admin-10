object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = PageControl1
  Caption = 'Network Administration'
  ClientHeight = 496
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
    Height = 454
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1099
      object DBGridComputers: TDBGrid
        Left = 0
        Top = 0
        Width = 789
        Height = 213
        Align = alClient
        DataSource = DataSourceComputer
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object PanelComputers: TPanel
        Left = 0
        Top = 213
        Width = 789
        Height = 213
        Align = alBottom
        TabOrder = 1
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 787
          Height = 211
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 0
          object TabSheet3: TTabSheet
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            object LabelMAC: TLabel
              Left = 11
              Top = 3
              Width = 60
              Height = 13
              Caption = 'MAC-'#1072#1076#1088#1077#1089':'
            end
            object LabelNumber: TLabel
              Left = 147
              Top = 3
              Width = 106
              Height = 13
              Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088':'
            end
            object LabelLocation: TLabel
              Left = 147
              Top = 49
              Width = 77
              Height = 13
              Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
            end
            object LabelIP: TLabel
              Left = 11
              Top = 49
              Width = 48
              Height = 13
              Caption = 'IP-'#1072#1076#1088#1077#1089':'
            end
            object EditMAC: TEdit
              Left = 11
              Top = 22
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object EditLocation: TEdit
              Left = 147
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 1
            end
            object EditNumber: TEdit
              Left = 147
              Top = 22
              Width = 121
              Height = 21
              TabOrder = 2
            end
            object ButtonAddStrings: TButton
              Left = 11
              Top = 104
              Width = 75
              Height = 25
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 3
              OnClick = ButtonAddStringsClick
            end
            object EditIP: TEdit
              Left = 11
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 4
            end
            object ButtonClearStrings: TButton
              Left = 92
              Top = 104
              Width = 75
              Height = 25
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 5
              OnClick = ButtonClearStringsClick
            end
          end
          object TabSheet4: TTabSheet
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            ImageIndex = 1
            object LabelMAC2: TLabel
              Left = 11
              Top = 49
              Width = 60
              Height = 13
              Caption = 'MAC-'#1072#1076#1088#1077#1089':'
            end
            object LabelNumber2: TLabel
              Left = 146
              Top = 49
              Width = 106
              Height = 13
              Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088':'
            end
            object LabelLocation2: TLabel
              Left = 146
              Top = 95
              Width = 77
              Height = 13
              Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
            end
            object LabelID2: TLabel
              Left = 11
              Top = 3
              Width = 52
              Height = 13
              Caption = 'ID '#1079#1072#1087#1080#1089#1080':'
            end
            object LabelIP2: TLabel
              Left = 11
              Top = 95
              Width = 48
              Height = 13
              Caption = 'IP-'#1072#1076#1088#1077#1089':'
            end
            object EditMAC2: TEdit
              Left = 11
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object EditNumber2: TEdit
              Left = 146
              Top = 68
              Width = 121
              Height = 21
              TabOrder = 1
            end
            object EditLocation2: TEdit
              Left = 146
              Top = 114
              Width = 121
              Height = 21
              TabOrder = 2
            end
            object ButtonChange: TButton
              Left = 11
              Top = 149
              Width = 75
              Height = 25
              Caption = #1048#1079#1084#1077#1085#1080#1090#1100
              TabOrder = 3
              OnClick = ButtonChangeClick
            end
            object DBLookupComboBoxID2: TDBLookupComboBox
              Left = 11
              Top = 22
              Width = 121
              Height = 21
              KeyField = 'id'
              ListField = 'id'
              ListSource = DataSourceComputer
              TabOrder = 4
              OnClick = DBLookupComboBoxID2Click
            end
            object EditIP2: TEdit
              Left = 11
              Top = 114
              Width = 121
              Height = 21
              TabOrder = 5
            end
            object ButtonClear2: TButton
              Left = 92
              Top = 149
              Width = 75
              Height = 25
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 6
              OnClick = ButtonClear2Click
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1059#1076#1072#1083#1080#1090#1100
            ImageIndex = 2
            object LabelID3: TLabel
              Left = 11
              Top = 3
              Width = 52
              Height = 13
              Caption = 'ID '#1079#1072#1087#1080#1089#1080':'
            end
            object DBLookupComboBoxID3: TDBLookupComboBox
              Left = 11
              Top = 22
              Width = 145
              Height = 21
              KeyField = 'id'
              ListField = 'id'
              ListSource = DataSourceComputer
              TabOrder = 0
            end
            object ButtonDelete: TButton
              Left = 11
              Top = 56
              Width = 75
              Height = 25
              Caption = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              OnClick = ButtonDeleteClick
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1051#1086#1075#1080
      ImageIndex = 1
      object DBGridLogs: TDBGrid
        Left = 0
        Top = 0
        Width = 789
        Height = 371
        Align = alClient
        DataSource = DataSourceLogs
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object PanelLogs: TPanel
        Left = 0
        Top = 371
        Width = 789
        Height = 55
        Align = alBottom
        TabOrder = 1
        object ButtonUpdateLogs: TButton
          Left = 696
          Top = 14
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
      object PanelStatus: TPanel
        Left = 0
        Top = 0
        Width = 789
        Height = 426
        Align = alClient
        TabOrder = 0
        object GroupBoxClientOnline: TGroupBox
          Left = 1
          Top = 201
          Width = 787
          Height = 224
          Align = alClient
          Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1099' '#1074' '#1089#1077#1090#1080
          TabOrder = 0
          object ListBoxClientOnline: TListBox
            Left = 2
            Top = 15
            Width = 783
            Height = 207
            Align = alClient
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object GroupBoxStatusSockets: TGroupBox
          Left = 1
          Top = 1
          Width = 787
          Height = 200
          Align = alTop
          Caption = #1057#1090#1072#1090#1091#1089' '#1088#1072#1073#1086#1090#1099' '#1089#1086#1082#1077#1090#1086#1074
          TabOrder = 1
          object MemoStatusSockets: TMemo
            Left = 2
            Top = 15
            Width = 783
            Height = 183
            Align = alClient
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 3
      object Label1: TLabel
        Left = 40
        Top = 27
        Width = 30
        Height = 13
        Caption = #1051#1086#1075#1080#1085
      end
      object Label2: TLabel
        Left = 33
        Top = 54
        Width = 37
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100
      end
      object Label3: TLabel
        Left = 33
        Top = 81
        Width = 37
        Height = 13
        Caption = #1057#1077#1088#1074#1077#1088
      end
      object Label4: TLabel
        Left = 45
        Top = 108
        Width = 25
        Height = 13
        Caption = #1055#1086#1088#1090
      end
      object EditLogin: TEdit
        Left = 76
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'anetwork'
      end
      object EditPwd: TEdit
        Left = 76
        Top = 51
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'qwerty'
      end
      object EditServer: TEdit
        Left = 76
        Top = 78
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'localhost'
      end
      object EditPort: TEdit
        Left = 76
        Top = 105
        Width = 121
        Height = 21
        TabOrder = 3
        Text = '3306'
      end
      object Button1: TButton
        Left = 122
        Top = 140
        Width = 75
        Height = 25
        Caption = #1054#1050
        TabOrder = 4
        OnClick = Button1Click
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 477
    Width = 797
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 23
    Align = alTop
    TabOrder = 2
    object ButtonTray: TButton
      Left = 718
      Top = 2
      Width = 75
      Height = 20
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      TabOrder = 0
      OnClick = ButtonTrayClick
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=qwerty;Persist Security Info=True;Us' +
      'er ID=anetwork;Extended Properties="Driver=MySQL ODBC 8.0 ANSI D' +
      'river;SERVER=localhost;UID=anetwork;PWD=qwerty;PORT=3306;COLUMN_' +
      'SIZE_S32=1"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
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
  object DataSourceComputer: TDataSource
    DataSet = ADOQueryComputers
    Left = 600
    Top = 40
  end
  object DataSourceLogs: TDataSource
    DataSet = ADOQueryLogs
    Left = 672
    Top = 40
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
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'select logs.NameComputer, logs.IP, logs.MAC_address, computers.I' +
        'nventoryNumber, computers.Location, AccessTime'
      'from logs'
      'join computers'
      'on logs.MAC_address=computers.MAC_address;')
    Left = 672
    Top = 96
  end
  object TrayIcon1: TTrayIcon
    OnDblClick = TrayIcon1DblClick
    Left = 672
    Top = 160
  end
  object ADOQueryComputers: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from computers;')
    Left = 600
    Top = 96
  end
end
