unit backup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,IdSMTP,IdMessage, ComCtrls;

type
  TForm11 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
  private
    procedure send(add,user,mail:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses main, setting;

{$R *.dfm}

{ TForm11 }

procedure TForm11.Button1Click(Sender: TObject);
begin
if form1.CheckOffline  then
  begin
    Form11.Hide;
    send(LabeledEdit1.Text,Form2.LabeledEdit4.Text,form2.LabeledEdit5.Text);
    form11.Close ;
  end
  else
  Application.MessageBox('备份错误，请检查系统是否已联网！', appname, MB_OK +
   MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm11.send(add, user, mail: string);
var idsmtp1:Tidsmtp;idmessage1:Tidmessage;
begin
  try
  idsmtp1:=Tidsmtp.Create(nil);
  idmessage1:=Tidmessage.Create(nil);
  idSMTP1.Host:= 'smtp.163.com'; //邮件发送服务器
  idsmtp1.Port :=25;
  IdSMTP1.AuthType :=satDefault ; //服务器需验证
  idSMTP1.Username  := 'abroadradio';   //邮箱登录帐号
  idSMTP1.Password := 'duckula828207';  //邮箱登录密码
  idMessage1.From.Address := 'abroadradio@163.com';  //发件人
  idMessage1.Recipients.EMailAddresses := add; //收件人
  idMessage1.Subject :='AbroadRadio 注册备份信息：'+'用户名: '+user+','+'邮箱地址: '+mail;    //邮件主题
  try
    idsmtp1.Connect ;
//    idSMTP1.Authenticate;
    idSMTP1.Send(idMessage1);
//    Form11.Close;
  except
    Application.MessageBox('注册信息备份失败，请稍后再试。', appname, MB_OK +
      MB_ICONSTOP);
    idSMTP1.Disconnect;
    Exit;
  end;


//  idSMTP1.Disconnect;
  finally
  idmessage1.free;
  idsmtp1.free;
end;
end;

end.
