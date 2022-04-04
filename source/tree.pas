unit tree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage,ComCtrls, GIFImg, Buttons;

type
  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    LabeledEdit1: TLabeledEdit;
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses main;

{$R *.dfm}



procedure TForm6.Button1Click(Sender: TObject);
var i:Integer ;
begin
   if LabeledEdit1.Text<>'' then
  begin
    form1.treeview1.Items.AddChild(form1.treeview1.Items[0], LabeledEdit1.Text);
    Form1.savetree;
    Close;
    form1.treeview1.items[0].expanded:=true;
  end
  else
  begin
    MessageBeep(16);
    Application.MessageBox('Group name isn''t allow blank!', appname, MB_OK +
      MB_ICONWARNING);
    LabeledEdit1.SetFocus ;
  end;



end;

procedure TForm6.Button2Click(Sender: TObject);
begin
close ;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin

//form6.ClientHeight:=118;

end;

procedure TForm6.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27  then
    Form6.Close;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
form6.ClientHeight:=354;
TGIFImage(Image1.Picture.Graphic).AnimationSpeed := 300;
TGIFImage(Image1.Picture.Graphic).Animate := True;
end;

procedure TForm6.LabeledEdit1Change(Sender: TObject);
begin
if LabeledEdit1.Text <>'' then
Button1.Enabled:=true
else
Button1.Enabled :=false;
end;

procedure TForm6.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
Button1.Click ;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
//if speedbutton1.Down then
//begin
//
//end
//else  begin
//form6.ClientHeight:=110;
////speedbutton1.Tag=0
//end;
end;

end.
