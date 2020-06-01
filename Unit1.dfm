object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Network Administration'
  ClientHeight = 578
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 874
    Height = 559
    ActivePage = TabSheet6
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1048#1085#1074#1077#1090#1072#1088#1080#1079#1072#1094#1080#1103
      object DBGridComputers: TDBGrid
        Left = 0
        Top = 0
        Width = 866
        Height = 318
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
        Top = 318
        Width = 866
        Height = 213
        Align = alBottom
        TabOrder = 1
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 864
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
              Width = 118
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
      object PanelLogs: TPanel
        Left = 0
        Top = 327
        Width = 866
        Height = 204
        Align = alBottom
        TabOrder = 0
        object GroupBoxSearch: TGroupBox
          Left = 273
          Top = 1
          Width = 277
          Height = 202
          Align = alClient
          Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
          TabOrder = 0
          object LabelDate: TLabel
            Left = 66
            Top = 21
            Width = 48
            Height = 13
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          end
          object LabelNb: TLabel
            Left = 12
            Top = 130
            Width = 102
            Height = 13
            Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088
          end
          object LabelNC: TLabel
            Left = 29
            Top = 49
            Width = 85
            Height = 13
            Caption = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
          end
          object LabelIPad: TLabel
            Left = 70
            Top = 76
            Width = 44
            Height = 13
            Caption = 'IP-'#1072#1076#1088#1077#1089
          end
          object LabelMACad: TLabel
            Left = 58
            Top = 103
            Width = 56
            Height = 13
            Caption = 'MAC-'#1072#1076#1088#1077#1089
          end
          object LabelLoc: TLabel
            Left = 41
            Top = 157
            Width = 73
            Height = 13
            Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
          end
          object EditSort: TEdit
            Left = 120
            Top = 19
            Width = 121
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object DBLookupComboBoxIP: TDBLookupComboBox
            Left = 120
            Top = 73
            Width = 121
            Height = 21
            KeyField = 'id'
            ListField = 'IP'
            ListSource = DataSourceComputer
            TabOrder = 1
            OnClick = DBLookupComboBoxIPClick
          end
          object DBLookupComboBoxMAC: TDBLookupComboBox
            Left = 120
            Top = 100
            Width = 121
            Height = 21
            KeyField = 'id'
            ListField = 'MAC_address'
            ListSource = DataSourceComputer
            TabOrder = 2
            OnClick = DBLookupComboBoxMACClick
          end
          object DBLookupComboBoxNb: TDBLookupComboBox
            Left = 120
            Top = 127
            Width = 121
            Height = 21
            KeyField = 'id'
            ListField = 'InventoryNumber'
            ListSource = DataSourceComputer
            TabOrder = 3
            OnClick = DBLookupComboBoxNbClick
          end
          object DBLookupComboBoxLoc: TDBLookupComboBox
            Left = 120
            Top = 154
            Width = 121
            Height = 21
            KeyField = 'Location'
            ListField = 'Location'
            ListSource = DataSourceLocation
            TabOrder = 4
            OnClick = DBLookupComboBoxLocClick
            OnDropDown = DBLookupComboBoxLocDropDown
          end
          object DBLookupComboBoxNC: TDBLookupComboBox
            Left = 120
            Top = 46
            Width = 120
            Height = 21
            KeyField = 'NameComputer'
            ListField = 'NameComputer'
            ListSource = DataSourceNameComputer
            TabOrder = 5
            OnClick = DBLookupComboBoxNCClick
            OnDropDown = DBLookupComboBoxLocDropDown
          end
        end
        object GroupBoxSort: TGroupBox
          Left = 137
          Top = 1
          Width = 136
          Height = 202
          Align = alLeft
          Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1082#1072
          TabOrder = 1
          object RadioGroupGroupColumn: TRadioGroup
            Left = 2
            Top = 15
            Width = 132
            Height = 185
            Align = alClient
            ItemIndex = 0
            Items.Strings = (
              #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
              'IP-'#1072#1076#1088#1077#1089
              'MAC-'#1072#1076#1088#1077#1089
              #1048#1085#1074#1077#1085#1090#1088#1072#1085#1099#1081' '#1085#1086#1084#1077#1088
              #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
              #1042#1088#1077#1084#1103' '#1076#1086#1089#1090#1091#1087#1072)
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 136
          Height = 202
          Align = alLeft
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
          TabOrder = 2
          object RadioGroupSortColumn: TRadioGroup
            Left = 2
            Top = 15
            Width = 132
            Height = 131
            Align = alClient
            ItemIndex = 0
            Items.Strings = (
              #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
              'IP-'#1072#1076#1088#1077#1089
              'MAC-'#1072#1076#1088#1077#1089
              #1048#1085#1074#1077#1085#1090#1088#1072#1085#1099#1081' '#1085#1086#1084#1077#1088
              #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
              #1042#1088#1077#1084#1103' '#1076#1086#1089#1090#1091#1087#1072)
            TabOrder = 0
          end
          object RadioGroupAscDesc: TRadioGroup
            Left = 2
            Top = 146
            Width = 132
            Height = 54
            Align = alBottom
            ItemIndex = 0
            Items.Strings = (
              #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
              #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102)
            TabOrder = 1
          end
        end
        object GroupBox1: TGroupBox
          Left = 550
          Top = 1
          Width = 315
          Height = 202
          Align = alRight
          Caption = #1047#1072#1087#1088#1086#1089#1099
          TabOrder = 3
          object LabelData: TLabel
            Left = 16
            Top = 119
            Width = 26
            Height = 13
            Caption = #1044#1072#1090#1072
          end
          object LabelFrom1: TLabel
            Left = 23
            Top = 138
            Width = 7
            Height = 13
            Caption = 'C'
          end
          object LabelFrom2: TLabel
            Left = 23
            Top = 178
            Width = 7
            Height = 13
            Caption = #1057
          end
          object LabelTime: TLabel
            Left = 16
            Top = 159
            Width = 30
            Height = 13
            Caption = #1042#1088#1077#1084#1103
          end
          object LabelTo1: TLabel
            Left = 135
            Top = 138
            Width = 13
            Height = 13
            Caption = #1055#1086
          end
          object LabelTo2: TLabel
            Left = 135
            Top = 178
            Width = 13
            Height = 13
            Caption = #1055#1086
          end
          object ButtonUpdateLogs: TButton
            Left = 151
            Top = 16
            Width = 152
            Height = 25
            Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1085#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
            TabOrder = 0
            OnClick = ButtonUpdateLogsClick
          end
          object ButtonSort: TButton
            Left = 14
            Top = 16
            Width = 107
            Height = 25
            Caption = #1047#1072#1087#1088#1086#1089' '#1087#1086' '#1090#1072#1073#1083#1080#1094#1077
            TabOrder = 1
            OnClick = ButtonSortClick
          end
          object CheckBoxGroup: TCheckBox
            Left = 14
            Top = 96
            Width = 157
            Height = 17
            Caption = #1057#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077
            TabOrder = 2
            OnClick = CheckBoxGroupClick
          end
          object CheckBoxSort: TCheckBox
            Left = 14
            Top = 73
            Width = 149
            Height = 17
            Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077
            TabOrder = 3
            OnClick = CheckBoxSortClick
          end
          object DateTimePicker1: TDateTimePicker
            Left = 36
            Top = 135
            Width = 93
            Height = 21
            Date = 43983.000000000000000000
            Time = 43983.000000000000000000
            TabOrder = 4
          end
          object DateTimePicker2: TDateTimePicker
            Left = 154
            Top = 135
            Width = 93
            Height = 21
            Date = 44012.000000000000000000
            Time = 44012.000000000000000000
            TabOrder = 5
          end
          object DateTimePicker3: TDateTimePicker
            Left = 36
            Top = 175
            Width = 93
            Height = 21
            Date = 43972.333333333340000000
            Format = 'HH:mm:ss'
            Time = 43972.333333333340000000
            Kind = dtkTime
            TabOrder = 6
          end
          object DateTimePicker4: TDateTimePicker
            Left = 154
            Top = 175
            Width = 93
            Height = 21
            Date = 43972.666666666660000000
            Format = 'HH:mm:ss'
            Time = 43972.666666666660000000
            Kind = dtkTime
            TabOrder = 7
          end
          object CheckBoxSearch: TCheckBox
            Left = 14
            Top = 51
            Width = 123
            Height = 17
            Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
            TabOrder = 8
            OnClick = CheckBoxSearchClick
          end
        end
      end
      object DBGridLogs: TDBGrid
        Left = 0
        Top = 0
        Width = 866
        Height = 327
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
        Width = 866
        Height = 531
        Align = alClient
        TabOrder = 0
        object GroupBoxClientOnline: TGroupBox
          Left = 1
          Top = 201
          Width = 864
          Height = 329
          Align = alClient
          Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1086#1074' '#1086#1085#1083#1072#1081#1085
          TabOrder = 0
          object ListBoxClientOnline: TListBox
            Left = 2
            Top = 15
            Width = 860
            Height = 312
            Align = alClient
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object GroupBoxStatusSockets: TGroupBox
          Left = 1
          Top = 1
          Width = 864
          Height = 200
          Align = alTop
          Caption = #1057#1090#1072#1090#1091#1089' '#1088#1072#1073#1086#1090#1099' '#1089#1086#1082#1077#1090#1086#1074
          TabOrder = 1
          object MemoStatusSockets: TMemo
            Left = 2
            Top = 15
            Width = 860
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
    Top = 559
    Width = 874
    Height = 19
    Panels = <
      item
        Width = 50
      end>
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
      
        'SELECT logs.NameComputer, logs.IP, logs.MAC_address, computers.I' +
        'nventoryNumber, computers.Location, AccessTime'
      'FROM logs'
      'JOIN computers'
      'ON logs.MAC_address=computers.MAC_address;')
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
      'SELECT * FROM computers;')
    Left = 600
    Top = 96
  end
  object ADOQueryLocation: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT computers.Location FROM computers;')
    Left = 752
    Top = 96
  end
  object DataSourceLocation: TDataSource
    DataSet = ADOQueryLocation
    Left = 752
    Top = 40
  end
  object DataSourceNameComputer: TDataSource
    DataSet = ADOQueryNameComputer
    Left = 832
    Top = 40
  end
  object ADOQueryNameComputer: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT logs.NameComputer FROM logs;')
    Left = 832
    Top = 96
  end
  object MainMenu1: TMainMenu
    Left = 744
    Top = 160
    object N1: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnClick = N3Click
    end
  end
end
