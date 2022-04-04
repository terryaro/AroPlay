unit focast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls,XMLDoc, Buttons,ShellAPI ;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Notebook1: TNotebook;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Image7: TImage;
    Label8: TLabel;
    Image8: TImage;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Image9: TImage;
    Label10: TLabel;
    Image10: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Label12: TLabel;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label16: TLabel;
    label19: TLabel;
    Image12: TImage;
    Label17: TLabel;
    GroupBox5: TGroupBox;
    SpeedButton4: TSpeedButton;
    CheckBox1: TCheckBox;
    Label11: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label14: TLabel;
    Label29: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
  private
    procedure WMNCHittest(var M:TWMNCHittest);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
implementation

uses main, DayplayThread;

{$R *.dfm}

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if AnimateWindow(Handle,200,AW_VER_POSITIVE+AW_HIDE)=false then
//    begin
//      Application.MessageBox('窗体退出错误，将关闭。', appname, MB_OK +
//        MB_ICONINFORMATION);
//      Close;
//    end;

//  Form1.playradio :=false;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
Notebook1.PageIndex :=0;
end;

procedure TForm9.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const SC_DRAGMOVE:Longint=$F012;
begin
//ReleaseCapture;
//SendMessage(Handle,WM_SYSCOMMAND,SC_DRAGMOVE,0);
end;

procedure TForm9.FormShow(Sender: TObject);
begin

//  if AnimateWindow(Handle,200,AW_VER_NEGATIVE)=false then
//      begin
//        Application.MessageBox('窗体退出错误，将关闭。', appname, MB_OK +
//          MB_ICONINFORMATION);
//      end;

end;



procedure TForm9.Image1Click(Sender: TObject);
begin

//form1.playradio :=False;
end;

procedure TForm9.Label24Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar(website+'personal.html'),nil,nil,SW_NORMAL);

end;

procedure TForm9.Label2Click(Sender: TObject);
begin
   Form1.PlayMusic(form1.newradio);

  close;
//  form1.playradio :=false ;
end;

procedure TForm9.Notebook1PageChanged(Sender: TObject);
begin
if Notebook1.PageIndex =0 then
  SpeedButton2.Visible :=False
else
  SpeedButton2.Visible :=True;

if Notebook1.PageIndex =5 then
//ShowMessage('ok');
  SpeedButton3.caption:='完成'
else
  SpeedButton3.caption:='下一步';
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
case Application.MessageBox('是否退出 AbroadRadio 入门手册？', Appname, MB_OKCANCEL +
  MB_ICONQUESTION) of
  IDOK:
    begin
      close;
    end;
  IDCANCEL:
    begin

    end;
end;

end;

procedure TForm9.SpeedButton2Click(Sender: TObject);
begin
  if Notebook1.PageIndex >0 then
  begin
    Notebook1.PageIndex :=Notebook1.PageIndex -1;
//    SpeedButton2.Visible :=true;
  end
//  else
//    SpeedButton2.Visible :=false;
end;

procedure TForm9.SpeedButton3Click(Sender: TObject);
begin
if Notebook1.PageIndex <5 then
//  begin
    Notebook1.PageIndex :=Notebook1.PageIndex +1
//    SpeedButton2.Visible :=true;
//    SpeedButton3.Caption :='下一步';
//  end
  else begin
//    SpeedButton3.Caption :='完成';
    Form9.Hide ;
    if CheckBox1.Checked  then
      form1.N30.Click ;
      Close;
  end;





end;

procedure TForm9.SpeedButton4Click(Sender: TObject);
begin
Notebook1.PageIndex :=5;
end;

procedure TForm9.WMNCHittest(var M: TWMNCHittest);
begin
//if M.Result = HtClient then M.Result := HtCaption;
end;

end.
