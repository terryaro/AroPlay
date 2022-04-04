unit sync;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,DBClient, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,WinInet,StrUtils,ShellAPI, pngimage;

type
  TForm12 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    LabeledEdit2: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    procedure Sync;//同步网络数据库
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses main, setting;

{$R *.dfm}

procedure TForm12.BitBtn1Click(Sender: TObject);
//var data:array of string;  i:Integer; cdsnew:Tclientdataset;
//MyStream:TMemoryStream;
begin
        begin
          if not CheckBox1.Checked then
          begin
          if AnsiContainsText(LabeledEdit2.Text,'rde.cds')  then
          begin
            CopyFile(PChar(ExtractFilePath(Application.ExeName) + DataBaseFileName),PChar(LabeledEdit2.Text),False);
            with form1.TrayIcon1 do
              begin
                BalloonTitle :=appname;
                BalloonHint:='Update success!';
                BalloonFlags:=bfInfo ;
                ShowBalloonHint ;
              end;
          Form1.ClientDataSet1.loadfromfile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
          Form12.Close;
          end
          else
        Application.MessageBox('Import error, you should import the .rds file!', appname, MB_OK +
                MB_ICONINFORMATION + MB_TOPMOST);
          end
        else begin
          MessageBeep(16);
          case Application.MessageBox('This operation will overwrite your favorite, user stations, Would you want to upload your favorites to cloudy?', PChar(appname),
              MB_OKCANCEL + MB_ICONQUESTION) of
            IDOK:
              begin
                form1.ToolButton7.Click ;
              end;
            IDCANCEL:
              begin
//              TThread.CreateAnonymousThread(sync).Start;
              Sync ;


              end;

          end;
        end;
end;


end;

procedure TForm12.BitBtn2Click(Sender: TObject);
begin
close
end;

procedure TForm12.Button1Click(Sender: TObject);
begin
ShowMessage(ExtractFilePath(LabeledEdit2.Text));
end;

procedure TForm12.CheckBox1Click(Sender: TObject);
begin
//  if CheckBox1.Checked  then
//  SpeedButton1.Enabled :=False
//  else
//  SpeedButton1.Enabled :=true;
 SpeedButton1.Enabled:=not CheckBox1.Checked;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
LabeledEdit1.Text :=ExtractFilePath(Application.ExeName)+'rd.cds';
end;

procedure TForm12.Image1Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('http://shang.qq.com/wpa/qunwpa?idkey=455122d98bbceef38e4dc2b1cf1ac500d241afb7fafda9cebc58241aa1358518'),nil,nil,SW_NORMAL);

end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
begin
if OpenDialog1.Execute  then
begin
//OpenDialog1.FileName:='';
LabeledEdit2.Text:=OpenDialog1.FileName ;
end;
end;

procedure TForm12.Sync;
var
// MyStream:TMemoryStream;
 cdsnew:TClientDataSet;
 filesize:integer;
//  dr:string;
 begin
try
Screen.Cursor:=crHourGlass ;
if form1.CheckOffline then
          begin
            form1.ClientDataSet1.filtered:=false;
            form1.ClientDataSet1.filter:='';
            form1.ClientDataSet1.filtered:=True ;
            Application.Minimize;
//               form1.TreeView1.Select(form1.TreeView1.Items[0]);
                  with form1.TrayIcon1 do
                    begin
                      BalloonTitle :=appname;
                      BalloonHint:='Synchronization, please wait...';
                      BalloonFlags:=bfInfo ;
                      ShowBalloonHint;
                    end;
                     Form12.hide;
                     SendMessage(handle,WM_CLOSE,0,0);
//                     Application.Minimize;
                     form1.Cursor :=crHourGlass;
                     try
                      cdsnew := Tclientdataset.Create(nil);
//                      MyStream := TMemoryStream.Create;
                      DeleteUrlCacheEntry(PWideChar(website +'download/en/rde.cds'));
                      Form2.idftp1.Connect;
                      Form2.idftp1.ChangeDir('wwwroot/download/en');
                      FileSize:= Form2.idftp1.Size('rde.cds');
//                      dr:=ExtractFilePath(Application.ExeName)+'rd.cds';
                      Form2.idftp1.Get('rd.cds', PChar(form1.GetShellFolders('Personal')+'\rde.cds'), True);
//                              IdHTTP1.Get(website + 'download/cn/rd.cds',MyStream);
//                              MyStream.SaveToFile(form1.GetShellFolders('Personal') + '\ARO' +'\' + 'rd.cds');
//                              if form1.DownloadFile(website+'download/cn/rd.cds',form1.GetShellFolders('Personal')+'\ARO\rd.cds') then
//                              LabeledEdit1.Text :=GetHomePath+'\rd.cds';
                              // cdsnew.LoadFromFile(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'rd.cds');
                               CopyFile(PChar(form1.GetShellFolders('Personal')+'\rde.cds'),PChar(GetHomePath + DataBaseFileName),False);
                               Form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
                               Screen.Cursor := crHourGlass;
                              Form12.Close;
                              with form1.TrayIcon1 do
                              begin
                                BalloonTitle := appname;
                                BalloonHint := 'Synchronized complete!';
                                BalloonFlags := bfInfo;
                                ShowBalloonHint;
                              end;
                              screen.Cursor :=crDefault ;
                              DeleteFile(GetHomePath+'\rde.cds');
                            finally
                              cdsnew.Free;
//                              MyStream.Free;
                            end;
                          end
                          else begin
                          MessageBeep(16);
                            Application.MessageBox('Synchronized failed. please check the network!',
                              appname, MB_OK + MB_ICONWARNING);
                          with form1.TrayIcon1 do
                          begin
                            BalloonTitle := appname;
                            BalloonHint := 'Synchronized failed. please check the network!';
                            BalloonFlags := bfInfo;
                            ShowBalloonHint;
                          end;
                          end;
//          end;
          Screen.Cursor:=crDefault ;
                        except
                          Application.MessageBox('Import error, please check the .rds file!', appname,
                            MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
                        end;
                      end;

                      end.
