unit cloudy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage,DBClient, IdBaseComponent, IdComponent,
  IdHTTP,IdSMTP,IdMessage, IdExplicitTLSClientServerBase, IdFTP,
  ComCtrls,WinInet, Buttons, IdAttachmentFile, IdTCPConnection, IdTCPClient,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL ;

type
  TForm13 = class(TForm)
    Button1: TButton;
    Bevel1: TBevel;
    LabeledEdit1: TLabeledEdit;
    Button2: TButton;
    IdFTP1: TIdFTP;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure syncb; //导入收藏夹
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses main, setting;

{$R *.dfm}

procedure TForm13.Button1Click(Sender: TObject);
begin
TThread.CreateAnonymousThread(syncb).Start;

end;

procedure TForm13.Button2Click(Sender: TObject);
var data:array of string; i:Integer; open:TOpenDialog; cdsnew:Tclientdataset;
MyStream:TMemoryStream; dr:string;tmpStream:TFileStream;
begin
if LabeledEdit1.Text <>'' then
begin
//form1.TreeView1.Select(form1.TreeView1.Items[2]);
Form1.N20.Click;
ProgressBar1.Visible :=true;
Form13.Hide ;
//idftp1.Connect;
try
    cdsnew:=TClientDataSet.Create(nil);
    idftp1.Connect;
  idftp1.ChangeDir('wwwroot/uSeR/en/'+labelededit1.Text);
//  FileSize:= idftp1.Size('shoucang.cds');
  dr:=GetHomePath+'\shoucang.cds';
  idftp1.Get('shoucang.cds', PChar(dr), True);

//    if Form1.DownloadFile(website+'uSeR/cn/'+labelededit1.Text+'/shoucang.cds',GetHomePath+'\shoucang.cds') then
//  idftp1.Get('shoucang.cds', PChar(dr), True);
//    MyStream.SaveToFile(GetHomePath+'\shoucang.cds');
    Form1.ClientDataSet1.Edit ;
    cdsnew.LoadFromFile(GetHomePath+'\shoucang.cds');
  SetLength(data,1000);
  try
    Form1.ClientDataSet1.DisableControls;
  cdsnew.First;
  i := 0;
  while not cdsnew.Eof do
  begin
    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
    cdsnew.Next;
    i := i + 1;
  end;

  for i := 0 to cdsnew.RecordCount - 1 do
  begin
    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
    begin
    Form1.ClientDataSet1.Edit;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';
    Form1.ClientDataSet1.Post;
  end
  else begin
    Form1.ClientDataSet1.Insert ;
    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';
    Form1.ClientDataSet1.Post;
  end;
    cdsnew.Next ;
  end;
  Application.MessageBox(pchar('Your favorite imported '+inttostr(cdsnew.RecordCount)+' records!'), Appname, MB_OK + MB_ICONQUESTION);

  finally
  form1.ClientDataSet1.EnableControls ;
  open.Free ;
  cdsnew.Free;
  end;
form1.ClientDataSet1.MergeChangeLog ;
 form1.ClientDataSet1.ApplyUpdates(-1);
 form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
 form1.ClientDataSet1.close;

 form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
 form1.ClientDataSet1.open;
 form1.TreeView1.Select(form1.TreeView1.Items[0]);
 DeleteFile(GetHomePath+'\shoucang.cds');
// ShowMessage('ok');
// Application.MessageBox(pchar('收藏夹同步成功！'), Appname, MB_OK + MB_ICONQUESTION);
  IdFTP1.Disconnect;
  Form13.Close;
//  Form2.Close;
//  end;
except
  Application.MessageBox('Your favorite imported failed,please retry!', appname, MB_OK +
    MB_ICONWARNING);
end;
end
else begin
  MessageBeep(16);
  Application.MessageBox('Email mustn''t be blank,please input the correct Email address.', appname, MB_OK +
    MB_ICONWARNING);

end;
end;

procedure TForm13.Button3Click(Sender: TObject);
begin
close;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
LabeledEdit1.Text :=Form2.LabeledEdit5.Text ;
end;

procedure TForm13.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
ProgressBar1.Position:= AWorkCount;
end;

procedure TForm13.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
ProgressBar1.Max:=AWorkCountMax;
  ProgressBar1.Min:=0;
  progressBar1.Position:=0;
end;

procedure TForm13.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
ProgressBar1.Position:= AWorkCount;
end;

procedure TForm13.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
ProgressBar1.Max:=AWorkCountMax;
  ProgressBar1.Min:=0;
  progressBar1.Position:=0;
end;

procedure TForm13.SpeedButton1Click(Sender: TObject);
begin
LabeledEdit1.Visible :=true;
end;

procedure TForm13.SpeedButton2Click(Sender: TObject);
var idsmtp1:Tidsmtp;idmessage1:Tidmessage;
cdsNew : TClientDataset ;
  i : integer;
  fieldName : string ;
  save:TSaveDialog ;
begin
try
    form1.TreeView1.Select(form1.TreeView1.Items[171]);
    ProgressBar1.Visible :=true;
   cdsNew := TClientDataset.Create(application);
   try
     Form1.ClientDataSet1.DisableControls ;
     cdsNew.FieldDefs.Assign(Form1.ClientDataSet1.FieldDefs);
     cdsNew.CreateDataset;
     Form1.ClientDataSet1.First;
  while not Form1.ClientDataSet1.eof do
  begin
    if Form1.ClientDataSet1.FieldByName('收藏').AsString = '★' then
    begin
      cdsNew.Append;
      for i := 0 to (cdsNew.FieldCount-1) do
      begin
        fieldName := cdsNew.Fields[i].FieldName ;
        cdsNew.FieldByName(fieldName).Value := form1.ClientDataSet1.FieldByName(fieldName).Value;
      end;
      cdsNew.Post;
    end;
//    end;
    Form1.ClientDataSet1.next;
  end;
  finally
    form1.ClientDataSet1.EnableControls ;
  end;
    cdsNew.SaveToFile(GetHomePath + '\shoucang.cds');
finally
  cdsNew.Free;
end;

  try
  idsmtp1:=Tidsmtp.Create(nil);
  idmessage1:=Tidmessage.Create(nil);
  idSMTP1.Host:= 'smtp.21cn.com'; //邮件发送服务器
  idsmtp1.Port :=25;
  IdSMTP1.AuthType :=satDefault ; //服务器需验证
  idSMTP1.Username  := 'abroadradio';   //邮箱登录帐号
  idSMTP1.Password := 'Duckula1';  //邮箱登录密码
  idMessage1.From.Address := 'abroadradio@21cn.com';  //发件人
  idMessage1.Recipients.EMailAddresses := 'abroadradio@21cn.com'; //收件人
  idMessage1.Subject := form2.labelededit5.Text+#32+'收藏夹文件';    //邮件主题
  TIdAttachmentFile.Create(idmessage1.MessageParts,GetHomePath+ '\shoucang.cds');

  idsmtp1.Authenticate;
  try
    idsmtp1.Connect ;
    idSMTP1.Authenticate;
    idSMTP1.Send(idMessage1);
    Application.MessageBox('人工上传云端已成功。', appname, MB_OK + MB_ICONINFORMATION);
    form13.close;
  except
    Application.MessageBox('发送邮件失败，请稍后再试。', appname, MB_OK +
      MB_ICONSTOP);
    idSMTP1.Disconnect;
    Exit;
  end;
//
//
  idSMTP1.Disconnect;
  finally
  idmessage1.free;
  idsmtp1.free;
end;
end;

procedure TForm13.SpeedButton3Click(Sender: TObject);
begin
close;
end;

procedure TForm13.syncb;
var
  cdsNew : TClientDataset ;
  i : integer;
  fieldName : string ;
  save:TSaveDialog ;
begin
  Screen.Cursor :=crHourGlass ;
try
  try
    form1.TreeView1.Select(form1.TreeView1.Items[0]);
    ProgressBar1.Visible :=true;
   cdsNew := TClientDataset.Create(application);
   try
     Form1.ClientDataSet1.DisableControls ;
     cdsNew.FieldDefs.Assign(Form1.ClientDataSet1.FieldDefs);
     cdsNew.CreateDataset;
     Form1.ClientDataSet1.First;
  while not Form1.ClientDataSet1.eof do
  begin
    if (Form1.ClientDataSet1.FieldByName('收藏').AsString = '★')
      then
    begin
      cdsNew.Append;
      for i := 0 to (cdsNew.FieldCount-1) do
      begin
        fieldName := cdsNew.Fields[i].FieldName ;
        cdsNew.FieldByName(fieldName).Value := form1.ClientDataSet1.FieldByName(fieldName).Value;
      end;
      cdsNew.Post;
    end;
//    end;
    Form1.ClientDataSet1.next;
  end;
  finally
    form1.ClientDataSet1.EnableControls ;
  end;
    cdsNew.SaveToFile(GetHomePath+ '\shoucang.cds');
    IdFTP1.Disconnect;
     IdFTP1.Connect ;
     Form13.Hide ;
     with form1.TrayIcon1 do
  begin
    BalloonTitle :=appname;
    BalloonHint:='Uploading to the cloudy,please waiting...';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
      if IdFTP1.Connected then
        begin

          IdFTP1.ChangeDir('wwwroot/uSeR/cn/'+labelededit1.Text);
          IdFTP1.Put(GetHomePath + '\shoucang.cds','shoucang.cds',false);
          with form1.TrayIcon1 do
            begin
              BalloonTitle :=appname;
              BalloonHint:='Uploading '+inttostr(cdsnew.RecordCount)+' records!';
              BalloonFlags:=bfInfo ;
              ShowBalloonHint ;
            end;
//          Application.MessageBox(pchar('收藏夹上传云端成功！共上传了'+inttostr(cdsnew.RecordCount)+'条记录！'), Appname, MB_OK + MB_ICONQUESTION);
          Form13.Close;
          DeleteFile(GetHomePath+ '\shoucang.cds');
        end;
  finally
    cdsNew.Free;
    save.Free ;
  end;
except
   Application.MessageBox('Uploading failed,please retry!', appname, MB_OK +
    MB_ICONWARNING);
end;
   Cursor :=crHourGlass ;
end;

end.
