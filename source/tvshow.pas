unit tvshow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls,ShellAPI, pngimage;

type
  TForm11 = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
  end;

var
  Form11: TForm11;

implementation

uses setting, time, main;

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
  AnimateWindow(form11.Handle,1500,AW_HIDE or AW_VER_NEGATIVE);
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

end.
