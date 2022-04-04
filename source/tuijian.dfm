object Form8: TForm8
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'AbroadRadio - I want to recommend'
  ClientHeight = 207
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 240
    Top = 170
    Width = 92
    Height = 23
    Caption = 'Recommend'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 338
    Top = 170
    Width = 55
    Height = 23
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object LabeledEdit2: TLabeledEdit
    Left = 75
    Top = 67
    Width = 126
    Height = 25
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    EditLabel.Width = 50
    EditLabel.Height = 17
    EditLabel.Caption = 'Genre :  '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlue
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = #24494#36719#38597#40657
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object RadioGroup1: TRadioGroup
    Left = 15
    Top = 102
    Width = 378
    Height = 50
    Caption = 'Share ways:'
    Columns = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'QQ'
      'Skype'
      'Email'
      'Anonymous ')
    ParentFont = False
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object LabeledEdit3: TLabeledEdit
    Left = 80
    Top = 170
    Width = 140
    Height = 21
    EditLabel.Width = 20
    EditLabel.Height = 17
    EditLabel.Caption = 'QQ'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlue
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = #24494#36719#38597#40657
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 2
    OnKeyPress = LabeledEdit3KeyPress
  end
  object LabeledEdit4: TLabeledEdit
    Left = 254
    Top = 67
    Width = 139
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    EditLabel.Width = 42
    EditLabel.Height = 17
    EditLabel.Caption = 'Name :'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlue
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = #24494#36719#38597#40657
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 0
    Text = 'Hotman'
    TextHint = 'Hotman'
  end
  object LabeledEdit1: TLabeledEdit
    Left = 100
    Top = 23
    Width = 197
    Height = 21
    BorderStyle = bsNone
    Color = clBtnFace
    EditLabel.Width = 39
    EditLabel.Height = 17
    EditLabel.Caption = 'Title :  '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlue
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = #24494#36719#38597#40657
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 4
  end
end
