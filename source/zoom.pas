unit zoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TForm10 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses main;

{$R *.dfm}

{ TForm10 }

procedure TForm10.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm10.FormResize(Sender: TObject);
begin
Panel1.Left:=(Form10.ClientWidth Div 2) - Panel1.Width div 2;
  Panel1.Top:=(Form10.ClientHeight Div 2) - Panel1.Height div 2;
  Image1.Picture:=nil;
end;

procedure TForm10.Timer1Timer(Sender: TObject);
var
  Srect,Drect,PosForme:TRect;
  iWidth,iHeight,DmX,DmY:Integer;
  iTmpX,iTmpY:Real;
  C:TCanvas;
  hDesktop: Hwnd;
  Kursor:TPoint;
begin
 If not IsIconic(Application.Handle) then begin
  hDesktop:= GetDesktopWindow;
  GetCursorPos(Kursor);
 	PosForme:=Rect(Form10.Left,Form10.Top,Form10.Left+Form10.Width,Form10.Top+Form10.Height);
  If not PtInRect(PosForme,Kursor) then begin

    If Panel1.Visible=True then Panel1.Visible:=False;
    If Image1.Visible=False then Image1.Visible:=True;

 	 iWidth:=Image1.Width;
		 iHeight:=Image1.Height;
    Drect:=Rect(0,0,iWidth,iHeight);

    iTmpX:=iWidth / (TrackBar1.Position * 3);
    iTmpY:=iHeight / (TrackBar1.Position * 3);

    Srect:=Rect(Kursor.x,Kursor.y,Kursor.x,Kursor.y);
    InflateRect(Srect,Round(iTmpX),Round(iTmpY));
    // move Srect if outside visible area of the screen
    If Srect.Left<0 then OffsetRect(Srect,-Srect.Left,0);
    If Srect.Top<0 then OffsetRect(Srect,0,-Srect.Top);
    If Srect.Right>Screen.Width then OffsetRect(Srect,-(Srect.Right-Screen.Width),0);
    If Srect.Bottom>Screen.Height then OffsetRect(Srect,0,-(Srect.Bottom-Screen.Height));

   C:=TCanvas.Create;


   try
     C.Handle:=GetDC(GetDesktopWindow);
     Image1.Canvas.CopyRect(Drect,C,Srect);
    finally
      ReleaseDC(hDesktop, C.Handle);
      C.Free;
    end;
    If checkbox1.Checked=True then begin // show crosshair
    	with Image1.Canvas do begin
        DmX:=TrackBar1.Position * 2 * (Kursor.X-Srect.Left);
        DmY:=TrackBar1.Position * 2 * (Kursor.Y-Srect.Top);
   		 MoveTo(DmX - (iWidth div 4),DmY); // -
   		 LineTo(DmX + (iWidth div 4),DmY); // -
    		 MoveTo(DmX,DmY - (iHeight div 4)); // |
   		 LineTo(DmX,DmY + (iHeight div 4)); // |
      end; // with image1.Canvas
    end; // show crosshair
  	Application.ProcessMessages;
	end // Cursor not inside form
   else begin  // cursor inside form
   	If Panel1.Visible=False then Panel1.Visible:=True;
   	If Image1.Visible=True then Image1.Visible:=False;
  end;
 end; // IsIconic
end;

procedure TForm10.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
   inherited;
   Msg.MinMaxInfo^.ptMinTrackSize := Point(158, 177); // min form size
   Msg.MinMaxInfo^.ptMaxTrackSize := Point(501, 711); // max form size (width, height)
end;

end.
