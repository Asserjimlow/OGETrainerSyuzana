object FormJournal: TFormJournal
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083
  ClientHeight = 854
  ClientWidth = 1290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 1290
    Height = 674
    Align = alTop
    ColCount = 4
    TabOrder = 0
  end
  object btnExit: TButton
    AlignWithMargins = True
    Left = 816
    Top = 797
    Width = 193
    Height = 49
    Caption = #1042#1099#1081#1090#1080' '#1080#1079' '#1078#1091#1088#1085#1072#1083#1072
    TabOrder = 1
    OnClick = btnExitClick
  end
  object Button1: TButton
    AlignWithMargins = True
    Left = 617
    Top = 797
    Width = 193
    Height = 49
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
    TabOrder = 2
    OnClick = Button1Click
  end
end
