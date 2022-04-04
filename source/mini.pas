unit mini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, pngimage, ExtCtrls, Buttons, ImgList, StdCtrls,
  Menus;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    ImageList2: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Panel2MouseEnter(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Panel3MouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ToolButton2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private

  public
//    procedure Createparams(Var Params:TCreateParams);override;
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses main;

{$R *.dfm}

//procedure TForm8.Createparams(var Params: TCreateParams);
//begin
//   inherited CreateParams(Params);
//Params.ExStyle := Params.ExStyle or WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
//Params.WndParent := GetDeskTopWindow;

//end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//form1.Timer2.Enabled :=false;
//form1.Show;
//form8.hide;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
//Top := 0;
//Left := Screen.WorkAreaWidth - Width;
//janTracker1.ThumbColor :=RGB(21,210,244);
//Panel3.Visible :=false;
//Height :=height-panel3.Height ;
end;

procedure TForm8.FormMouseLeave(Sender: TObject);
begin
//Panel3.Visible :=false;
//Height :=height-panel3.Height ;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
//    form1.Hide ;
//    form1.ToolButton1.Click ;
//    panel2.Caption :=Form1.ClientDataSet1.FieldByName('电台名称').AsString ; ;
//   form1.Timer2.Enabled :=true;
//   name :=Form1.ClientDataSet1.FieldByName('电台名称').AsString ;

//  if stationkind ='Flash电台' then
//    begin
//      Notebook1.PageIndex :=1;
//      FlyFlv1.PlayMovie(stationadd);
//      Panel1.Visible :=true;
//      playvideo :=2;
//    end;
//
//
//  if stationkind ='普通电台' then
//    begin
//    Notebook1.PageIndex :=0;
//    WindowsMediaPlayer1.URL:=stationadd ;
//    WindowsMediaPlayer1.controls.play ;
//    Panel1.Visible :=true;
//    playvideo :=1;
//  end;
end;

procedure TForm8.Image1Click(Sender: TObject);
begin
close;
end;

procedure TForm8.Image2Click(Sender: TObject);
begin
Close
end;

procedure TForm8.Label1MouseEnter(Sender: TObject);
begin
//Panel3.Visible :=True ;
//height:=63;
end;

procedure TForm8.N1Click(Sender: TObject);
begin
form1.N23.Click ;
end;

procedure TForm8.N2Click(Sender: TObject);
begin
Form1.N24.Click ;
end;

procedure TForm8.N3Click(Sender: TObject);
begin
//form1.TrayIcon1Click(self);
//Close;
//form1.Show ;
end;

procedure TForm8.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND,$f012,0);

end;

procedure TForm8.Panel2MouseEnter(Sender: TObject);
begin
//Height :=70;
end;

procedure TForm8.Panel3MouseLeave(Sender: TObject);
begin

//height:=
end;

procedure TForm8.Timer1Timer(Sender: TObject);
begin
//Timer1.OnTimer :=Form1.Timer2.OnTimer ;
end;


procedure TForm8.ToolButton12Click(Sender: TObject);
begin
Form1.ToolButton2.Click ;
end;

procedure TForm8.ToolButton13Click(Sender: TObject);
begin
Form1.N13.Click ;
end;

procedure TForm8.ToolButton1Click(Sender: TObject);
begin
Close
end;

procedure TForm8.ToolButton2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var pt:Tpoint;
begin
if Button= mbLeft then
begin
//得到鼠标位置
GetCursorPos(pt);
//弹出菜单
//PopupMenu1.Popup(pt.X,pt.Y); 和下面那个比较一下
PopupMenu1.Popup(left+x,top+y);

end;

end;

procedure TForm8.ToolButton3Click(Sender: TObject);
begin
form1.N23.Click ;
end;

procedure TForm8.ToolButton5Click(Sender: TObject);
begin
Form1.ToolButton1.Click ;
end;

procedure TForm8.ToolButton7Click(Sender: TObject);
begin
//Form1.ToolButton6.Click ;
end;

procedure TForm8.ToolButton8Click(Sender: TObject);
begin
form1.N24.Click ;
end;

procedure TForm8.TrackBar1Change(Sender: TObject);
begin
//form1.WindowsMediaPlayer1.settings.volume :=TrackBar1.Position ;
//form1.FlyFlv1.Volume :=TrackBar1.Position ;
//TrackBar1.Position :=form1.TrackBar1.Position ;
//trackbar1.hint:='电台音量: '+inttostr(form1.trackbar1.position);
end;

end.
