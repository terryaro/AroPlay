unit code;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZXIngQRCodeLi, ExtDlgs, Buttons, ExtCtrls,ShellAPI,
  Vcl.Menus;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Get_Form_Image(aform: TForm);  //����
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
   i:byte;
implementation

uses
  main, setting;

{$R *.dfm}

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Timer1.Enabled:=false;
end;

procedure TForm10.FormCreate(Sender: TObject);
var zxingqrcodeli1:TZXingQRCodeLi;
begin
//ZXIngQRCodeLi1:=TZXingQRCodeLi.Create(nil);
Caption :=form1.ClientDataSet1.FieldByName('��̨����').AsString ;
 ZXingQRCodeLi1.Code:=Form1.ClientDataSet1.FieldByName('��̨��ַ').AsString ;
 i:=9;
    if form2.checkbox17.Checked then
      timer1.Enabled:=true
    else
      timer1.Enabled:=False ;
end;

procedure TForm10.Get_Form_Image(aform: TForm);
Var
  abitmap: Tbitmap;
  acanvas: Tcanvas;
  DC: hdc;
  L, T: Integer;
  isfull,isopen: Boolean;
  apath, aopen: String;
Begin

  isfull := False;//�Ƿ�ȫ��
  isopen:= True;//������
  aopen := 'mspaint.exe'; //�򿪷�ʽ
  apath := form2.LabeledEdit7.text+'\'+aform.Caption; //����·��

  aform.Update;

  abitmap := TBitmap.Create;
  acanvas := TCanvas.Create;
  DC := Windows.Getdc(0);

  With aform Do
  Try
    acanvas.Handle := DC;

    If Not isfull Then //����Ҫȫ����ֻ�ǵ�ǰForm
    Begin
      abitmap.Width := Width;
      abitmap.Height := Height;
      L := left;
      T := top;
      abitmap.Canvas.CopyRect(rect(0, 0, Width, Height),
        acanvas, rect(L, T, Width + L, Height + T));
         apath := ChangeFileExt(apath, '.bmp');
      abitmap.savetofile(apath);
    End;
//    apath := ExtractShortPathName(apath); {�޸ĳɶ�·������ֹ���ִ��ո��·��}

  Finally
    acanvas.Free;
    releasedc(0, DC);
    abitmap.Free;
  End;
end;

procedure TForm10.Timer1Timer(Sender: TObject);
begin
Dec(i);
  if i <= 0 then
  begin
    Timer1.Enabled := False;
    if Form2.CheckBox24.Checked then
    Get_Form_Image(self);
    if form2.checkbox26.checked  then
    Form2.SpeedButton10.Click ;
//    if form2.checkbox27.checked  then
//    shellExecute(handle,'open',PChar('http://pan.baidu.com/'),nil,nil,SW_NORMAL);
//    Hide;
    Close ;
  end;
end;

end.
