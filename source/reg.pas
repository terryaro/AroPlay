unit reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, SHDocVw,ShellAPI, OleCtrls,MSHTML,WinInet ;

type
  TForm8 = class(TForm)
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Image2: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    LabeledEdit3: TLabeledEdit;
    WebBrowser1: TWebBrowser;
    CheckBox1: TCheckBox;
    Memo1: TMemo;
    Button3: TButton;
    Memo2: TMemo;
    Button4: TButton;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses main;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
  if (LabeledEdit1.Text<>'') and (labelededit2.Text<>'') then
  begin
    WebBrowser1.OleObject.document.getelementbyid('ls_username').InnerText:=LabeledEdit1.Text;
    WebBrowser1.OleObject.document.getelementbyid('ls_password').InnerText:=LabeledEdit2.Text;
//    if CheckBox1.Checked  then
      WebBrowser1.OleObject.document.getElementsBytagname('input').item(1).click;
    WebBrowser1.OleObject.document.getElementsBytagname('button').item(0).click;
    form1.SpeedButton2.Caption:=LabeledEdit1.Text ;
//    Close ;


  end
  else begin
  Application.MessageBox('用户名和密码不能为空，请重新输入。', appname, MB_OK +
    MB_ICONWARNING);
  LabeledEdit1.SetFocus ;
  end;


end;

procedure TForm8.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm8.Button3Click(Sender: TObject);
var doc:IHTMLDocument2 ;
begin
if not Webbrowser1.Busy then  //这句代码的意思是
 begin
   Doc:=Webbrowser1.Document as IHTMLDocument2;
Doc.cookie:=Memo1.Lines.Text; //把编辑框中的内容赋给cookie，也就是修改了cookie信息！
   Webbrowser1.Refresh;
end;
end;

procedure TForm8.Button4Click(Sender: TObject);
const
  INTERNET_COOKIE_HTTPONLY = 8192;
var
  hModule: THandle;
  lp: Pointer;
  InternetGetCookieEx: function(lpszUrl, lpszCookieName, lpszCookieData
    : PAnsiChar; var lpdwSize: DWORD; dwFlags: DWORD; lpReserved: pointer)
    : BOOL; stdCall;
  CookieSize: DWORD;
  CookieData: PAnsiChar;
begin
  LoadLibrary('wininet.dll');
  hModule := GetModuleHandle('wininet.dll');
  if hModule <> 0 then
  begin
    @InternetGetCookieEx := GetProcAddress(hModule, 'InternetGetCookieExA');
    if @InternetGetCookieEx <> nil then
    begin
      CookieSize := 1024;
      Cookiedata := AllocMem(CookieSize);
      if InternetGetCookieEx('http://www.abroadradio.net/bbs/forum.php', nil, Cookiedata, CookieSize, INTERNET_COOKIE_HTTPONLY, nil) then
        Memo2.lines.Append(cookiedata);
      FreeMem(Cookiedata);
    end;
  end;
end;
procedure TForm8.Button5Click(Sender: TObject);
begin
if InternetSetCookie('','','CookieTest=CookieValTest;expires=Thu, 01-Jan-2020 00:00:01 GMT') then
WebBrowser1.Refresh;
end;

//end;

procedure TForm8.FormCreate(Sender: TObject);
begin
    WebBrowser1.Navigate('http://www.abroadradio.net/bbs/forum.php');
end;


procedure TForm8.FormMouseLeave(Sender: TObject);
begin
label1.Font.Color :=clblue;
end;

procedure TForm8.Label1Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar('http://www.abroadradio.net/bbs/member.php?mod=reg'), nil, nil, 1);
end;

procedure TForm8.Label1MouseEnter(Sender: TObject);
begin
Label1.Font.Color :=clRed ;
end;

procedure TForm8.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var doc:IHTMLDocument2 ;
begin
if not Webbrowser1.Busy then  //这句代码的意思是
 begin
   Doc:=Webbrowser1.Document as IHTMLDocument2; //将Webbrowser1.Document转化为IHTMLDocument2接口
   Memo1.Lines.Text:=Doc.cookie; //将获取到的COOKIES放到EdCookies.text里面
end;
end;

end.
