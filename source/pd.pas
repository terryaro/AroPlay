unit pd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, Buttons, AppEvnts, pngimage, StdCtrls,
  ShellAPI;

type
  TForm10 = class(TForm)
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    ApplicationEvents1: TApplicationEvents;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    procedure WebBrowser1DownloadComplete(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses main;

{$R *.dfm}

procedure TForm10.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
with Msg do
begin
  if not IsChild(WebBrowser1.Handle, hWnd) then  Exit;
   Handled := (message = WM_RBUTTONDOWN) or (message = WM_RBUTTONUP) or (message = WM_CONTEXTMENU);
end;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ANimateWindow(Handle,200,AW_SLIDE+AW_HOR_POSITIVE+AW_HIDE);
end;

procedure TForm10.FormShow(Sender: TObject);
begin
//if Form1.WindowsMediaPlayer1.isOnline  then
WebBrowser1.Navigate(website+'baiduad.html')
//else
//Panel1.Visible :=false;
//ANimateWindow(Handle,200,AW_SLIDE+AW_VER_NEGATIVE);
end;

procedure TForm10.Image1Click(Sender: TObject);
begin
form1.PlayMusic('BBC World Service');
SpeedButton1.Click ;
end;

procedure TForm10.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if Button=mbRight then
//    ShellExecute(0, nil, PChar('http://www.voa365.com/BBC'), nil, nil, 1);
end;

procedure TForm10.Image2Click(Sender: TObject);
begin
form1.PlayMusic('WDR Event');
SpeedButton1.Click ;
end;

procedure TForm10.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if Button=mbRight then
//    ShellExecute(0, nil, PChar('http://www.abroadradio.net/ting/daily/ndr.html'), nil, nil, 1);
end;

procedure TForm10.Image3Click(Sender: TObject);
begin
form1.PlayMusic('NPR Hourly Newscast');
SpeedButton1.Click ;
end;

procedure TForm10.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if Button=mbRight then
//    ShellExecute(0, nil, PChar('http://www.voa365.com/'), nil, nil, 1);
end;

procedure TForm10.Image4Click(Sender: TObject);
begin
form1.PlayMusic('France Info News');
SpeedButton1.Click ;
end;

procedure TForm10.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  if Button=mbRight then
//    ShellExecute(0, nil, PChar(website+'ting/daily/france24.html'), nil, nil, 1);
end;

procedure TForm10.Image5Click(Sender: TObject);
begin
form1.PlayMusic('NHK Radio Japan - Japan');
SpeedButton1.Click ;
end;

procedure TForm10.Image5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if Button=mbRight then
//    ShellExecute(0, nil, PChar(website+'ting/daily/nhk.html'), nil, nil, 1);
end;

procedure TForm10.Image6Click(Sender: TObject);
begin
form1.PlayMusic('Mayak FM103.4');
SpeedButton1.Click ;
end;

procedure TForm10.Image6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if Button=mbRight then
//    ShellExecute(0, nil, PChar(website+'ting/daily/russ.html'), nil, nil, 1);
end;

procedure TForm10.Label2Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar(website), nil, nil, 1);
end;

procedure TForm10.Label2MouseEnter(Sender: TObject);
begin
//  label2.Font.Color :=clRed;
end;

procedure TForm10.Label2MouseLeave(Sender: TObject);
begin
//  label2.Font.Color :=clBlue;
end;

procedure TForm10.Panel2Click(Sender: TObject);
begin
form1.PlayMusic('BBC World Service UK');
SpeedButton1.Click ;
end;

procedure TForm10.SpeedButton1Click(Sender: TObject);
begin
close;
SpeedButton1.hint:='ÊÕÆð';
end;

procedure TForm10.WebBrowser1DownloadComplete(Sender: TObject);
var url:string;
begin
  if url=website+'baiduad.html' then
  begin
    WebBrowser1.oleobject.Document.body.style.width:= '230px';
    WebBrowser1.oleobject.Document.body.style.height:= '55px' ;
    WebBrowser1.oleobject.Document.body.style.overflow:= 'hidden';
  end;
end;

end.
