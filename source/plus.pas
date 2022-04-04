unit plus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  Vcl.ComCtrls, Vcl.StdCtrls, ZipForge;

type
  TForm10 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    IdFTP1: TIdFTP;
    ZipForge1: TZipForge;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses
  setting;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
var
  archiver:TZipForge;
  filesize:integer;
begin
archiver := TZipForge.Create(nil);
idftp1.Connect;
  idftp1.ChangeDir('wwwroot/sdk');
  FileSize:= idftp1.Size('codecs.zip');
  ProgressBar1.Max := FileSize;
  ProgressBar1.Step := 10;
  idftp1.Get('codecs.zip', PChar(ExtractFilePath(Application.ExeName)), True);
   try
  with archiver do
  begin
    FileName := PChar(ExtractFilePath(Application.ExeName))+'\codecs.zip';
    OpenArchive(fmOpenRead);
    BaseDir := 'C:\Users\Public\Thunder Network\APlayer\';
    ExtractFiles('*.*');
    CloseArchive();
    ShowMessage('scuess!');
  end;
  except
  on E: Exception do
    begin
      Writeln('Exception: ', E.Message);
      // Wait for the key to be pressed
      Readln;
    end;
  end;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
winexec('install.bat',sw_hide);
end;

procedure TForm10.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
ProgressBar1.Position := AWorkCount;
end;

procedure TForm10.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  progressBar1.Position:=0;
end;

procedure TForm10.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
 progressBar1.Position:=100;
end;

end.
