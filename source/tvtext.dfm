object Form11: TForm11
  Left = 0
  Top = 0
  ActiveControl = Panel1
  BorderStyle = bsNone
  Caption = 'Form11'
  ClientHeight = 175
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 175
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    object Bevel1: TBevel
      Left = 8
      Top = 140
      Width = 285
      Height = 2
    end
    object Label2: TLabel
      Left = 160
      Top = 150
      Width = 48
      Height = 17
      Cursor = crHandPoint
      AutoSize = False
      Caption = #31435#21363#25773#25918
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnClick = Label2Click
    end
    object Label3: TLabel
      Left = 220
      Top = 150
      Width = 69
      Height = 17
      Cursor = crHandPoint
      AutoSize = False
      Caption = #28155#21152#21040#35745#21010'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      OnClick = Label3Click
    end
    object Label4: TLabel
      Left = 145
      Top = 40
      Width = 137
      Height = 73
      Cursor = crHandPoint
      AutoSize = False
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = Label2Click
    end
    object Image1: TImage
      Left = 16
      Top = 34
      Width = 110
      Height = 95
      Cursor = crHandPoint
      OnClick = Label2Click
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 300
      Height = 18
      Align = alTop
      BevelOuter = bvNone
      Caption = 'AbroadRadio '#25552#37266#24744
      Color = 16044563
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 282
        Top = 0
        Width = 18
        Height = 18
        Cursor = crHandPoint
        Align = alRight
        Caption = 'X'
        Flat = True
        OnClick = SpeedButton1Click
        ExplicitLeft = 278
      end
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 150
      Width = 118
      Height = 17
      Caption = #20851#38381#33410#30446#39044#21578#21151#33021
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 200
    Top = 32
  end
end
