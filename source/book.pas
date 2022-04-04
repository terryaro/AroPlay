unit book;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, jpeg,ShellAPI,Clipbrd, StdCtrls, ImgList, ComCtrls, ToolWin;

resourcestring
netadd= 'https://yunpan.cn/crcBvM6xpqEN4';

type
  TForm14 = class(TForm)
    Panel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    Image1: TImage;
    LabeledEdit2: TLabeledEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses main;

{$R *.dfm}

procedure TForm14.SpeedButton1Click(Sender: TObject);
begin
Clipboard.SetTextBuf(pchar('543e'));
shellExecute(handle,'open',PChar(netadd),nil,nil,SW_NORMAL);
form1.TreeView1.Select(form1.TreeView1.Items[0]);
close;
end;

end.
