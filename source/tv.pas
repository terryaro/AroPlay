unit tv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ShellAPI, Buttons, pngimage, ExtCtrls, StdCtrls;

type
  TForm11 = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses  time;

{$R *.dfm}

procedure TForm11.FormCreate(Sender: TObject);
var
  abd:TAppBarData;
  aHeight:integer; //任務欄的高度
begin
  abd.cbSize:=sizeof(abd);
  SHAppBarMessage(ABM_GETTASKBARPOS,abd);
  aHeight:=abd.rc.Bottom-abd.rc.Top;
  form11.left:=Screen.Width-form11.width;
  form11.top:=screen.height-form11.height-aheight;
  AnimateWindow(form11.Handle,1200,AW_HIDE or AW_VER_NEGATIVE);
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
close;
end;

end.
