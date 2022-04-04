unit psform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;


{========================================================================
  DESIGN BY :  �����
  DATE:        2004-10-28
  SITE:        http://kacarton.yeah.net/
  BLOG:        http://blog.csdn.net/nhconch
  EMAIL:       kacarton@sohu.com

  ����Ϊ����ԭ����ת��ǰ�����뱾����ϵ��ת����ע�����³���������������Ϣ��лл֧�֣�
=========================================================================}

type
  TfrmPSHotKey = class(TForm)
    imgTitleBar: TImage;
    imgTitleBarBG: TImage;
    imgShapeBG: TImage;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormPaint(Sender: TObject);
    procedure imgTitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure Label12MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgTitleBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPSHotKey: TfrmPSHotKey;

implementation

{$R *.dfm}

procedure TfrmPSHotKey.FormCreate(Sender: TObject);
begin
    Tag := Height;
    Height := 16;
    //��λ����Ļ���½�
    Top := Screen.Height - 40;
    Left := Screen.Width - Width - 2;
    Show;
    //����Ļ���½��𽥵���
    while Height<Tag do begin
        Height := Height + 5;
        Top := Top - 5;
        Update;
        Application.ProcessMessages;
        Sleep(10);
    end;
    Height := Tag;
    Tag := 0;
    Color := $F4BA9D;
    FormResize(Sender);
end;

procedure TfrmPSHotKey.FormPaint(Sender: TObject);
var
    i: integer;
    rgn: HRGN;
    r: TRect;
begin
    with Canvas do begin
        //����imgTitleBarBG���Ʊ��ⱳ��
        for i:=0 to ClientWidth div imgTitleBarBG.Width do
            Draw(i*imgTitleBarBG.Width, 0, imgTitleBarBG.Picture.Bitmap);
        if Tag<>0 then Exit;  //����������ڵ���״̬��������������屳��
        //����������屳��
        SetRect(r, 5, 15, Width-5, Height-5);
        StretchDraw(r, imgShapeBG.Picture.Bitmap);
        Pen.Color := $C97F55;
        Brush.Style := bsClear;
        RoundRect(r.Left, r.Top, r.Right, r.Bottom, 6, 6);
        //���ƴ���߿�
        rgn := CreateRectRgn(0,0,0,0);
        GetWindowRgn(Self.Handle, rgn);
        Brush.Color := $BE796B;
        windows.FrameRgn(Handle, rgn, Brush.Handle, 2, 2);
        DeleteObject(rgn);
    end;
end;

procedure TfrmPSHotKey.imgTitleBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    //�ڱ��ⰴ������ʱ�������ƶ������ı䴰���С
    ReleaseCapture;
    if X < 5 then Perform(WM_SYSCOMMAND, $F004, 0)
    else if X > Width - 5 then Perform(WM_SYSCOMMAND, $F005, 0)
    else if Y < 3 then Perform(WM_SYSCOMMAND, $F003, 0)
    else Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmPSHotKey.FormResize(Sender: TObject);
var
    rgn, rgn2: HRGN;
begin
    if Tag<>0 then Exit;
    //����ı��Сʱ�ؽ�Rgn
    rgn := CreateRoundRectRgn(0, 0, Width+1, Height, 4, 4);
    rgn2 := CreateRectRgn(0, 11, Width, Height);
    CombineRgn(rgn, rgn, rgn2, RGN_OR);
    SetWindowRgn(Handle, rgn, True);
    DeleteObject(rgn);
    DeleteObject(rgn2);
    Invalidate;
end;

procedure TfrmPSHotKey.SpeedButton1Click(Sender: TObject);
begin
    Close;
end;

//���¼���Label�����ı䴰���С
procedure TfrmPSHotKey.Label11MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    ReleaseCapture;
    if X < 5 then Perform(WM_SYSCOMMAND, $F007, 0)
    else if X > Width - 5 then Perform(WM_SYSCOMMAND, $F008, 0)
    else Perform(WM_SYSCOMMAND, $F006, 0);
end;

procedure TfrmPSHotKey.Label12MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, $F001, 0);
end;

procedure TfrmPSHotKey.Label13MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, $F002, 0);
end;

//��������ж��������λ�ã����ı�����꣬��ʾ�û������϶������ı��С
procedure TfrmPSHotKey.imgTitleBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if X < 5 then imgTitleBar.Cursor := crSizeNWSE
    else if X > Width - 5 then imgTitleBar.Cursor := crSizeNESW
    else if Y < 3 then imgTitleBar.Cursor := crSizeNS
    else imgTitleBar.Cursor := crSizeAll;
end;

procedure TfrmPSHotKey.Label11MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if X < 5 then Label11.Cursor := crSizeNESW
    else if X > Width - 5 then Label11.Cursor := crSizeNWSE
    else Label11.Cursor := crSizeNS;
end;

end.






