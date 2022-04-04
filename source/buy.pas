unit buy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pngimage,Clipbrd, GIFImg,ShellAPI;

type
  TForm16 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Notebook1: TNotebook;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses main, setting;

{$R *.dfm}

procedure TForm16.BitBtn1Click(Sender: TObject);
begin
if CheckBox1.Checked then
form2.speedbutton12.Click;
Application.MessageBox('当您完成支付之后,只需过5-10分钟后,重新启动您的程序，即可发现您已经是 AbroadRadio 的一位注册用户了。',
PChar(appname), MB_OK + MB_ICONINFORMATION);
close;
end;

procedure TForm16.BitBtn2Click(Sender: TObject);
begin
close
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
Image1.Hint :='扫一扫上述二维码'+#13+'微信支付只需53元';
Image7.Hint :='扫一扫上述二维码'+#13+'微信支付只需78元';
end;

procedure TForm16.FormShow(Sender: TObject);
begin
//if form2.combobox7.ItemIndex=0  then
//  Notebook1.PageIndex :=1
//else
//  Notebook1.PageIndex :=0;
end;

procedure TForm16.Image2Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('http://www.abroadradio.net/contact.html'),nil,nil,SW_NORMAL);

end;

procedure TForm16.Image4Click(Sender: TObject);
var temp1: real;
 temp3: integer;
begin
 if (form2.LabeledEdit4.Text<>'') and (form2.LabeledEdit5.Text<>'')  then
 begin
 temp1:=0;    //edit1是用户名,edit2是邮件地址,edit3是注册码
 for  temp3:=0 to   length(form2.LabeledEdit4.Text) do
 temp1:=temp1+Ord((form2.LabeledEdit4.Text)[temp3])*2+Ord((form2.LabeledEdit5.Text)[temp3])*3 ; //将用户名的每个字符ASC相加
 temp1:=temp1+length(form2.LabeledEdit4.Text)*3 ;
 form2.LabeledEdit6.Text:=floattostr(temp1);
 form2.savereg;
 clipboard.AsText:= '注册给  '+form2.labelededit4.Text+': '+','+form2.labelededit5.Text+','+form2.labelededit6.Text+#32+uppercase(copy(form2.LabeledEdit5.Text ,1,2))+form2.LabeledEdit5.Text;
//Form2.Close;

 Application.MessageBox('机器码已复制到剪贴板中,请将此代码发送至terry_zhou82@163.com', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
end
else
 Application.MessageBox('机器码不能为空!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
shellExecute(handle,'open',PChar('http://abroadradio.net/contact.html#buy'),nil,nil,SW_NORMAL);

end;

procedure TForm16.Image5Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('http://www.sharebank.com.cn/soft/softbuy.php?soid=45636'),nil,nil,SW_NORMAL);

end;

procedure TForm16.Image6Click(Sender: TObject);
var temp1: real;
 temp3: integer;
begin
 if (form2.LabeledEdit4.Text<>'') and (form2.LabeledEdit5.Text<>'')  then
 begin
 temp1:=0;    //edit1是用户名,edit2是邮件地址,edit3是注册码
 for  temp3:=0 to   length(form2.LabeledEdit4.Text) do
 temp1:=temp1+Ord((form2.LabeledEdit4.Text)[temp3])*2+Ord((form2.LabeledEdit5.Text)[temp3])*3 ; //将用户名的每个字符ASC相加
 temp1:=temp1+length(form2.LabeledEdit4.Text)*3 ;
 form2.LabeledEdit6.Text:=floattostr(temp1);
 form2.savereg;
 clipboard.AsText:= '注册给  '+form2.labelededit4.Text+': '+','+form2.labelededit5.Text+','+form2.labelededit6.Text+#32+uppercase(copy(form2.LabeledEdit5.Text ,1,2))+form2.LabeledEdit5.Text;
//Form2.Close;

 Application.MessageBox('机器码已复制到剪贴板中,请将此代码发送至terry_zhou82@163.com', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
end
else
 Application.MessageBox('机器码不能为空!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
shellExecute(handle,'open',PChar('http://abroadradio.net/contact.html#buy'),nil,nil,SW_NORMAL);

end;

end.
