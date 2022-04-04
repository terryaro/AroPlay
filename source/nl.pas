unit nl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,ShellAPI, ActnList, PlatformDefaultStyleActnCtrls,
  ActnMan, pngimage, ExtCtrls;

type
  TForm15 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    ActionManager1: TActionManager;
    Action1: TAction;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses main;

{$R *.dfm}

procedure TForm15.Action1Execute(Sender: TObject);
begin
shellExecute(handle,'open',PChar( Timage(sender).hint),nil,nil,SW_NORMAL);
end;

procedure TForm15.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TForm15.Label2Click(Sender: TObject);
begin
Form15.Hide ;
//form1.toolbutton4.Click ;
Form15.Close ;
end;

end.
