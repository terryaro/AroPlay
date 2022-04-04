unit update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, xmldom, XMLIntf, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, msxmldom, XMLDoc,ShellAPI, pngimage,
  ExtCtrls, IdExplicitTLSClientServerBase, IdFTP, Vcl.Buttons ;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    IdFTP1: TIdFTP;
    ProgressBar1: TProgressBar;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure Button1Click(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
  private
    procedure update;//¸üÐÂ³ÌÐò
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses main, setting;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  TThread.CreateAnonymousThread(update).Start
end;

//end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  form4.Close;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
form2.CheckBox4.Checked:=false;
Form2.saveini;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  label1.Caption:='Find'+form1.XMLDocument1.DocumentElement.ChildNodes[1].ChildNodes[0].Text+'new version,do you want to update?';
  Memo1.Lines.Text:=form1.XMLDocument1.DocumentElement.ChildNodes[2].ChildNodes[0].Text;
end;

procedure TForm4.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
ProgressBar1.Position := AWorkCount;
end;

procedure TForm4.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
//  ProgressBar1.Position:= AWorkCount;
end;

procedure TForm4.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
progressBar1.Position:=0;
//  ProgressBar1.Max:=AWorkCountMax;
//  ProgressBar1.Min:=0;
//  progressBar1.Position:=0;
end;

procedure TForm4.Label4Click(Sender: TObject);
begin
  shellExecute(handle,'open',PChar('http://www.aroplay.com/download.html'),nil,nil,SW_NORMAL);
end;

procedure TForm4.Label4MouseEnter(Sender: TObject);
begin
  Label4.Font.Color :=clRed ;
end;

procedure TForm4.Label4MouseLeave(Sender: TObject);
begin
  label4.Font.Color :=clBlue;
end;

procedure TForm4.update;
var
 up:string;
 filesize:integer;
begin


  idftp1.Connect;
  idftp1.ChangeDir('wwwroot/download/cn');
  FileSize:= idftp1.Size('setup.exe');
  ProgressBar1.Max := FileSize;
  ProgressBar1.Step := 10;
  idftp1.Get('setup.exe', PChar(form1.GetShellFolders('Personal')+'\ARO'+'\'+'\setup.exe'), True);
   up :=form1.GetShellFolders('Personal')+'\ARO'+'\'+'\setup.exe';
   case Application.MessageBox('Download complete! Do you want to install now?', appname, MB_OKCANCEL +
     MB_ICONQUESTION) of
     IDOK:
       begin
          shellExecute(handle,'open',PChar(up),nil,nil,SW_NORMAL);
          form1.N2.Click ;
       end;
     IDCANCEL:
       begin
          Application.MessageBox('The file has saved to <ARO>', appname, MB_OK +
            MB_ICONINFORMATION);
          form4.close;
       end;
   end;
 
end;

end.
