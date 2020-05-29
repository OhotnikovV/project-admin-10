object Form1: TForm1
  Left = 0
  Top = 0
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
  OnClose = FormClose
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
      Caption = #1048#1085#1074#1077#1090#1072#1088#1080#1079#1072#1094#1080#1103
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
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
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
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
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PanelLogs: TPanel
        Left = 0
        Top = 240
        Width = 789
        Height = 186
        Align = alBottom
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 1
          Top = 1
          Width = 787
          Height = 184
          Align = alClient
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          object Label5: TLabel
            Left = 220
            Top = 16
            Width = 93
            Height = 13
            Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
          end
          object Label1: TLabel
            Left = 200
            Top = 62
            Width = 14
            Height = 13
            Caption = #1054#1090
          end
          object Label2: TLabel
            Left = 200
            Top = 89
            Width = 14
            Height = 13
            Caption = #1044#1086
          end
          object EditSort: TEdit
            Left = 220
            Top = 35
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object ButtonSort: TButton
            Left = 347
            Top = 31
            Width = 75
            Height = 25
            Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
            TabOrder = 1
            OnClick = ButtonSortClick
          end
          object ButtonAll: TButton
            Left = 464
            Top = 27
            Width = 105
            Height = 25
            Caption = #1055#1086#1083#1085#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
            TabOrder = 2
            OnClick = ButtonAllClick
          end
          object RadioGroup1: TRadioGroup
            Left = 3
            Top = 21
            Width = 185
            Height = 160
            Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1089#1090#1086#1083#1073#1094#1091
            ItemIndex = 0
            Items.Strings = (
              #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
              'IP-'#1072#1076#1088#1077#1089
              'MAC-'#1072#1076#1088#1077#1089
              #1048#1085#1074#1077#1085#1090#1088#1072#1085#1099#1081' '#1085#1086#1084#1077#1088
              #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077)
            TabOrder = 3
          end
          object DateTimePicker1: TDateTimePicker
            Left = 220
            Top = 62
            Width = 202
            Height = 21
            Date = 43972.000000000000000000
            Time = 43972.000000000000000000
            TabOrder = 4
          end
          object ButtonUpdateLogs: TButton
            Left = 464
            Top = 58
            Width = 105
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
            TabOrder = 5
            OnClick = ButtonUpdateLogsClick
          end
          object DateTimePicker2: TDateTimePicker
            Left = 220
            Top = 89
            Width = 202
            Height = 21
            Date = 43972.958333333340000000
            Time = 43972.958333333340000000
            TabOrder = 6
          end
          object CheckBox1: TCheckBox
            Left = 220
            Top = 116
            Width = 165
            Height = 17
            Caption = #1057#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
            TabOrder = 7
          end
        end
      end
      object DBGridLogs: TDBGrid
        Left = 0
        Top = 0
        Width = 789
        Height = 240
        Align = alClient
        DataSource = DataSourceLogs
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
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
          Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1086#1074' '#1086#1085#1083#1072#1081#1085
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
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=qwerty;Persist Security Info=True;Us' +
      'er ID=anetwork;Extended Properties="Driver=MySQL ODBC 8.0 ANSI D' +
      'river;SERVER=localhost;UID=anetwork;PWD=qwerty;PORT=3306;COLUMN_' +
      'SIZE_S32=1"'
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
    Left = 688
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
