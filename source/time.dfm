object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Schedule'
  ClientHeight = 370
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 10
    Top = 320
    Width = 390
    Height = 2
    Shape = bsTopLine
  end
  object SpeedButton1: TSpeedButton
    Left = 10
    Top = 43
    Width = 387
    Height = 25
    Caption = 'Detect the timing function is close , click here to open'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 73
    Top = 10
    Width = 322
    Height = 23
    EditLabel.Width = 35
    EditLabel.Height = 17
    EditLabel.Caption = 'Title : '
    EditLabel.Color = clWhite
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlue
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = #24494#36719#38597#40657
    EditLabel.Font.Style = []
    EditLabel.ParentColor = False
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 140
    Width = 390
    Height = 50
    Caption = 'Period :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object RadioButton4: TRadioButton
      Left = 280
      Top = 21
      Width = 20
      Height = 17
      TabOrder = 0
      OnClick = RadioButton4Click
    end
    object RadioButton5: TRadioButton
      Left = 20
      Top = 21
      Width = 65
      Height = 17
      Caption = 'Everyday'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RadioButton5Click
    end
    object ComboBox1: TComboBox
      Left = 300
      Top = 18
      Width = 71
      Height = 23
      Style = csDropDownList
      Enabled = False
      TabOrder = 2
      Items.Strings = (
        'Monday'
        'Tuesday'
        'Wednesday'
        'Thursday'
        'Friday'
        'Saturday'
        'Sunday')
    end
    object RadioButton1: TRadioButton
      Left = 118
      Top = 21
      Width = 17
      Height = 17
      TabOrder = 3
      OnClick = RadioButton1Click
    end
    object DateTimePicker3: TDateTimePicker
      Left = 140
      Top = 18
      Width = 115
      Height = 23
      Date = 42516.749029583330000000
      Format = 'yyyy-MM-dd'
      Time = 42516.749029583330000000
      Enabled = False
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 10
    Top = 205
    Width = 390
    Height = 59
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 30
      Width = 30
      Height = 15
      Caption = 'Start :'
    end
    object Label2: TLabel
      Left = 183
      Top = 30
      Width = 26
      Height = 15
      Caption = 'End :'
    end
    object SpeedButton4: TSpeedButton
      Left = 327
      Top = 27
      Width = 23
      Height = 22
      Hint = 'Record 30 mins'
      Caption = '30'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 355
      Top = 27
      Width = 23
      Height = 22
      Hint = 'Record 60 mins'
      Caption = '60'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton5Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 60
      Top = 26
      Width = 93
      Height = 23
      Date = 41161.656123032410000000
      Format = 'HH:mm:ss'
      Time = 41161.656123032410000000
      Kind = dtkTime
      TabOrder = 0
      OnExit = DateTimePicker2Exit
    end
    object DateTimePicker2: TDateTimePicker
      Left = 238
      Top = 26
      Width = 80
      Height = 23
      Date = 41161.660614710650000000
      Format = 'HH:mm:ss'
      Time = 41161.660614710650000000
      Kind = dtkTime
      TabOrder = 1
      OnExit = DateTimePicker2Exit
    end
  end
  object CheckBox1: TCheckBox
    Left = 10
    Top = 288
    Width = 120
    Height = 17
    Caption = 'After playing then'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object ComboBox2: TComboBox
    Left = 135
    Top = 284
    Width = 92
    Height = 23
    Style = csDropDownList
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Items.Strings = (
      'Shutdown'
      'Sleep'
      'Quit'
      'Delete Plan')
  end
  object BitBtn1: TBitBtn
    Left = 239
    Top = 330
    Width = 75
    Height = 25
    Caption = '&Add'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = bkOK
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 320
    Top = 330
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 10
    Top = 75
    Width = 390
    Height = 50
    Caption = 'Type :'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Timing playing'
      'Timing recording')
    ParentFont = False
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
  object BitBtn3: TBitBtn
    Left = 20
    Top = 328
    Width = 75
    Height = 27
    Caption = '&Delete'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      D5D5D56F746FBFBFBFEFF0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFF878B87101010575757E1E0E1FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF938F8AD2D2D2FFFFFFFFFFFFFFFFFFFFFFFF
      B9B9B920181030282097938FF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFE5E4E33B42
      3BE1E1E1FFFFFFFFFFFFFFFFFFFFFFFFF3F2F27373732D262D494949D8D8D8FF
      FFFFFFFFFFF0F0F0F0F0F0565656818181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE5E4E5494949202020636363F1F1F1F0F0F0F0F0F08181813C3C3CE5E4
      E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E556504930282070
      6B70D5D4D2656565303030A4A19DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE5E6E5565049303030303030403830494249FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB30
      3030403840494949F2F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFDBDBDB6363634038303C3C3C3C3C3C706B65F2F2F1FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABABAB40404040404091
      9191DBDADB938F934040408A8A8AF2F2F1FFFFFFFFFFFFFFFFFFFFFFFFE7E7E7
      CFCFCF7B7B7B404040404040868686F4F4F4FFFFFFF3F3F286817B4040408A8F
      8AF2F2F2FFFFFFFFFFFFFFFFFFB7B7B77B7B7B403830404040A7A3A7FFFFFFFF
      FFFFFFFFFFFFFFFFF2F2F1CFCFCF5A535A878787FFFFFFFFFFFFFFFFFFB7BAB7
      4040404B4B4BC8C6C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
      E9ABAFABFFFFFFFFFFFFFFFFFFDEDDDE7B757BD3D1D3FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnClick = BitBtn3Click
  end
end
