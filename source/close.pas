unit close;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,System.DateUtils,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList;

type
  TForm9 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btn1: TToolButton;
    btn2: TToolButton;
    ImageList1: TImageList;
    ScrollBar1: TScrollBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses
  main;

{$R *.dfm}

procedure TForm9.BitBtn1Click(Sender: TObject);
begin

//ShowMessage(form1.close);
//ShowMessage(FormatDateTime('hhmmss',now));
//Form9.Close;

end;

procedure TForm9.btn2Click(Sender: TObject);
begin
Close;
end;

procedure TForm9.ScrollBar1Change(Sender: TObject);
begin
Caption:='设置关机时间在'+IntToStr(ScrollBar1.Position)+'分钟后';
end;

procedure TForm9.ToolButton3Click(Sender: TObject);
begin
form1.close:=FormatDateTime('hhmmss',now+(1/24/60)*ScrollBar1.Position);
Form1.Timer5.Enabled:=true;
close;

end;

procedure TForm9.ToolButton4Click(Sender: TObject);
begin
form1.Timer5.Enabled:=False;
end;

end.
