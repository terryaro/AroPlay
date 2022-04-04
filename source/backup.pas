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
  Application.MessageBox('���ݴ�������ϵͳ�Ƿ���������', appname, MB_OK +
   MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm11.send(add, user, mail: string);
var idsmtp1:Tidsmtp;idmessage1:Tidmessage;
begin
  try
  idsmtp1:=Tidsmtp.Create(nil);
  idmessage1:=Tidmessage.Create(nil);
  idSMTP1.Host:= 'smtp.163.com'; //�ʼ����ͷ�����
  idsmtp1.Port :=25;
  IdSMTP1.AuthType :=satDefault ; //����������֤
  idSMTP1.Username  := 'abroadradio';   //�����¼�ʺ�
  idSMTP1.Password := 'duckula828207';  //�����¼����
  idMessage1.From.Address := 'abroadradio@163.com';  //������
  idMessage1.Recipients.EMailAddresses := add; //�ռ���
  idMessage1.Subject :='AbroadRadio ע�ᱸ����Ϣ��'+'�û���: '+user+','+'�����ַ: '+mail;    //�ʼ�����
  try
    idsmtp1.Connect ;
//    idSMTP1.Authenticate;
    idSMTP1.Send(idMessage1);
//    Form11.Close;
  except
    Application.MessageBox('ע����Ϣ����ʧ�ܣ����Ժ����ԡ�', appname, MB_OK +
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
