object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 227
  ClientWidth = 231
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 231
    Height = 227
    Align = alClient
    Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
    TabOrder = 0
    object LabelLogin: TLabel
      Left = 34
      Top = 40
      Width = 30
      Height = 13
      Caption = #1051#1086#1075#1080#1085
    end
    object LabelPassword: TLabel
      Left = 27
      Top = 75
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object LabelServer: TLabel
      Left = 27
      Top = 109
      Width = 37
      Height = 13
      Caption = #1057#1077#1088#1074#1077#1088
    end
    object LabelPort: TLabel
      Left = 39
      Top = 144
      Width = 25
      Height = 13
      Caption = #1055#1086#1088#1090
    end
    object EditLogin: TEdit
      Left = 70
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EditPassword: TEdit
      Left = 70
      Top = 72
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object EditServer: TEdit
      Left = 70
      Top = 106
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'localhost'
    end
    object EditPort: TEdit
      Left = 70
      Top = 141
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '3306'
    end
    object ButtonConnect: TButton
      Left = 19
      Top = 185
      Width = 86
      Height = 25
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
      TabOrder = 4
      OnClick = ButtonConnectClick
    end
    object ButtonClose: TButton
      Left = 128
      Top = 185
      Width = 81
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 5
      OnClick = ButtonCloseClick
    end
  end
end
