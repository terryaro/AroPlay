unit add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,StrUtils, pngimage,ShellAPI, OleCtrls,
  ImgList, ComCtrls, ToolWin, IdMessage, IdBaseComponent, IdComponent,Clipbrd,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP,DBClient, Menus, System.ImageList;

//const
//m3u8='http://g.alicdn.com/de/prismplayer-flash/1.2.16/PrismPlayer.swf?vurl=';

type
  TForm3 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    LabeledEdit2: TLabeledEdit;
    Label2: TLabel;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    CheckBox3: TCheckBox;
    SpeedButton1: TSpeedButton;
    CheckBox4: TCheckBox;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    ComboBox3: TComboBox;
    CheckBox5: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton3: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Label3: TLabel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    LabeledEdit4: TLabeledEdit;
    CheckBox2: TCheckBox;
    ComboBox4: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit3Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LabeledEdit3DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LabeledEdit3Exit(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    function Notempty:Boolean; //电台信息不能为空
    procedure sendmail; //发送邮件
    procedure importtree; // 直接导入目录树
  public
    flash:string;   //电台类型名称
  end;

var
  Form3: TForm3;
implementation

uses main, setting;

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
var s:Integer ;
begin
for s:=0 to GroupBox1.ControlCount-1 do
    Begin
      if groupbox1.Controls[s] is TLabeledEdit  then
      begin
        TLabeledEdit(groupbox1.Controls[s]).text :='';
      end;
    End;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var kind,fav,radioname,group:string ;
node:TTreeNode;
begin
  case RadioGroup1.ItemIndex of
          0: kind:='';
          1: kind:='电视台';
          2: kind:='电视台';
  end;

  if CheckBox3.Checked  then
    fav:='★'
  else
    fav:='';

  if (CheckBox5.Checked) and (combobox3.Text<>'')  then
    group:=combobox3.Text
  else
    group:='';
//    flash:=RadioGroup1.items[RadioGroup1.ItemIndex];
  if not form1.ClientDataSet1.Eof  then
    if Notempty  then
      if AnsiContainsText(LabeledEdit3.Text,'http://') or  AnsiContainsText(LabeledEdit3.Text,'rtmp://') or
          AnsiContainsText(LabeledEdit3.Text,'mms://') or AnsiContainsText(LabeledEdit3.Text,'https://')  then
        begin
//          form1.ClientDataSet1.DisableControls;
          if Form1.PopupMenu4.Items[1].Tag=0 then
            begin
              form1.ClientDataSet1.Edit ;
//              CheckBox2.Enabled:=True ;
              if CheckBox2.Checked then
              begin
                if form1.ClientDataSet1.Locate('电台名称',labelededit1.Text,[]) then
                begin
                  Form1.ClientDataSet1.Edit;
                  Form1.ClientDataSet1.FieldByName('电台名称').AsString:=LabeledEdit1.Text ;
                  Form1.ClientDataSet1.FieldByName('电台国家').AsString:=combobox1.Text ;
                  Form1.ClientDataSet1.FieldByName('电台类型').AsString :=RadioGroup1.items[RadioGroup1.ItemIndex];;
                  Form1.ClientDataSet1.FieldByName('电台地址').AsString:=LabeledEdit3.Text;
                  Form1.ClientDataSet1.FieldByName('微博').AsString :=labelededit2.text;
                  Form1.ClientDataSet1.FieldByName('语言类型').AsString :=combobox2.text;
                  Form1.ClientDataSet1.FieldByName('视频类型').AsString :=kind;
                  Form1.ClientDataSet1.FieldByName('收藏').AsString :=fav;
                  Form1.ClientDataSet1.FieldByName('电台分组').AsString:=group ;
                  Form1.ClientDataSet1.FieldByName('自定义2').AsString:=combobox4.text ;
                  Form1.ClientDataSet1.FieldByName('电台网址').AsString:=LabeledEdit4.Text  ;
                end
                else
                  Application.MessageBox('Not find the original record!', appname, MB_OK +
                MB_ICONINFORMATION + MB_TOPMOST);
                LabeledEdit1.SetFocus ;
              end
              else begin
                form1.ClientDataSet1.AppendRecord([trim(LabeledEdit1.Text),trim(ComboBox1.Text),'User','32kbps','','',fav,Trim(combobox2.text),trim(labelededit3.text),'','','','',kind,group,RadioGroup1.items[RadioGroup1.ItemIndex],trim(labelededit2.text),trim(labelededit4.text),'',Trim(combobox4.text)]);
                Form3.Close;
              end;
            end
          else begin
          if Form1.PopupMenu4.Items[1].Tag=1 then
            begin
                CheckBox2.Enabled:=False ;
                Form1.ClientDataSet1.Edit;
                Form1.ClientDataSet1.FieldByName('电台名称').AsString:=LabeledEdit1.Text ;
                Form1.ClientDataSet1.FieldByName('电台国家').AsString:=combobox1.Text ;
                Form1.ClientDataSet1.FieldByName('电台类型').AsString :=RadioGroup1.items[RadioGroup1.ItemIndex];;
                Form1.ClientDataSet1.FieldByName('电台地址').AsString:=LabeledEdit3.Text;
                Form1.ClientDataSet1.FieldByName('微博').AsString :=labelededit2.text;
                Form1.ClientDataSet1.FieldByName('语言类型').AsString :=combobox2.text;
                Form1.ClientDataSet1.FieldByName('视频类型').AsString :=kind;
                Form1.ClientDataSet1.FieldByName('收藏').AsString :=fav;
                Form1.ClientDataSet1.FieldByName('电台分组').AsString:=group ;
                Form1.ClientDataSet1.FieldByName('自定义2').AsString:=ComboBox4.text ;
                Form1.ClientDataSet1.FieldByName('电台网址').AsString:=LabeledEdit4.Text  ;
//                Form3.Close ;
              end;
//              with Form1.ClientDataSet1 do
//              begin
//                Edit;
//                FieldByName('电台名称').AsString:=LabeledEdit1.Text ;
//                FieldByName('电台国家').AsString:=combobox1.Text ;
//                FieldByName('电台地址').AsString:=LabeledEdit3.Text ;
//                FieldByName('电台类型').AsString :=RadioGroup1.items[RadioGroup1.ItemIndex];;
//                FieldByName('微博').AsString :=labelededit2.text;
//                FieldByName('语言类型').AsString :=combobox2.text;
//                FieldByName('视频类型').AsString :=kind;
//                FieldByName('收藏').AsString :=fav;
//                FieldByName('电台分组').AsString:=group ;
//              end;
//              end;
          end;
//          form1.ClientDataSet1.EnableControls;
          radioname:=LabeledEdit1.Text ;
          Form1.ClientDataSet1.MergeChangeLog ;
          Form1.ClientDataSet1.ApplyUpdates(-1);
          Form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
          Form1.ClientDataSet1.Close;
          Form1.ClientDataSet1.Open ;
//          Form1.ClientDataSet1.RefreshRecord;

          Form1.TreeView1.Select(Form1.TreeView1.Items[0]);
//          form1.TreeView1Change(nil,node);


          if CheckBox1.Checked  then
          if form1.CheckOffline  then
            begin
              Form3.Hide;
              form1.sendmail('Add station：'+labelededit1.Text,#44+#32+combobox1.Text,#44+#32+labelededit3.Text,#44+#32+combobox2.Text,'');
            end
            else
              Application.MessageBox('Send error,please check the network!', appname, MB_OK +
                MB_ICONINFORMATION + MB_TOPMOST);


          if CheckBox4.Checked  then
          form1.PlayMusic(LabeledEdit1.Text);
          form1.ToolButton1.Tag:=1;
          Hide;
          Close;

          form1.N69.Click;

        end
    else begin
      MessageBeep(16);
        Application.MessageBox('The source must be start with <http or https>, please retry.', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
        LabeledEdit3.SetFocus ;
    end
    else
    Application.MessageBox('Title and source don''t allow blank!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
//    if checkbox4.checked then

end;

procedure TForm3.BitBtn4Click(Sender: TObject);
var kind,fav,radioname,group:string ;
begin

  case RadioGroup1.ItemIndex of
          0: kind:='';
          1: kind:='电视台';
          2: kind:='电视台';
  end;

  if CheckBox3.Checked  then
    fav:='★'
  else
    fav:='';

  if (CheckBox5.Checked) and (combobox3.Text<>'')  then
    group:=combobox3.Text
  else
    group:='';
//    flash:=RadioGroup1.items[RadioGroup1.ItemIndex];
  if not form1.ClientDataSet1.Eof  then
    if Notempty  then
      if AnsiContainsText(LabeledEdit3.Text,'http://') or AnsiContainsText(LabeledEdit3.Text,'rtmp://') or
          AnsiContainsText(LabeledEdit3.Text,'mms://') or AnsiContainsText(LabeledEdit3.Text,'https://') then
        begin
          if Form1.PopupMenu4.Items[1].Tag=0 then
            begin
              form1.ClientDataSet1.Edit ;
//              if RadioGroup1.ItemIndex<>2 then
                form1.ClientDataSet1.AppendRecord([trim(LabeledEdit1.Text),trim(ComboBox1.Text),'User','32kbps','','',fav,Trim(combobox2.text),trim(labelededit3.text),'','','','',kind,group,RadioGroup1.items[RadioGroup1.ItemIndex],trim(labelededit2.text),trim(labelededit4.text),'',Trim(ComboBox4.text)])

                //else
//                form1.ClientDataSet1.AppendRecord([trim(LabeledEdit1.Text),trim(ComboBox1.Text),'用户自定义','32kbps','','',fav,Trim(combobox2.text),trim(m3u8+labelededit3.text),'','','','',kind,group,RadioGroup1.items[RadioGroup1.ItemIndex],trim(labelededit2.text),trim('电台网址'),'','']);


            end
          else begin
          if Form1.PopupMenu4.Items[1].Tag=1 then
            begin
              with Form1.ClientDataSet1 do
              begin
                Edit;
                FieldByName('电台名称').AsString:=LabeledEdit1.Text ;
                FieldByName('电台国家').AsString:=combobox1.Text ;
                FieldByName('电台地址').AsString:=LabeledEdit3.Text ;
                FieldByName('电台类型').AsString :=RadioGroup1.items[RadioGroup1.ItemIndex];;
                FieldByName('微博').AsString :=labelededit2.text;
                FieldByName('语言类型').AsString :=combobox2.text;
                FieldByName('视频类型').AsString :=kind;
                FieldByName('收藏').AsString :=fav;
                FieldByName('自定义2').AsString:=ComboBox4.Text  ;
                FieldByName('电台分组').AsString:=group ;
                FieldByName('电台网址').AsString :=labelededit4.text;

              end;
            end;
          end;
          radioname:=LabeledEdit1.Text ;
          Form1.ClientDataSet1.MergeChangeLog ;
          Form1.ClientDataSet1.ApplyUpdates(-1);
          Form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
          Form1.ClientDataSet1.Close;
          Form1.ClientDataSet1.Open ;
          Form1.TreeView1.Select(Form1.TreeView1.Items[0]);
          BitBtn1.Click ;
//          LabeledEdit1.SetFocus ;


        end
    else begin
      MessageBeep(16);
        Application.MessageBox('The source must be start with <http or https>, please retry.', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
        LabeledEdit3.SetFocus ;
    end
    else
    Application.MessageBox('Title and source don''t allow blank!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
  LabeledEdit3.Text:='http://';
  Close ;
  form1.TreeView1.Select(form1.TreeView1.Items[0]);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
MessageBeep(16);
case Application.MessageBox('Delete this radio?', appname, MB_OKCANCEL +
    MB_ICONQUESTION + MB_TOPMOST) of
    IDOK:
      begin
        with form1.ClientDataSet1 do
        begin
          Delete;
          MergeChangeLog ;
          ApplyUpdates(-1);
          SaveToFile(GetHomePath + DataBaseFileName);
          LoadFromFile(GetHomePath + DataBaseFileName);
          Open;
//          form1.TreeView1.Select(form1.TreeView1.Items[169]);
        end;
//        if form1.ClientDataSet1.RecordCount =0 then
//          form1.TreeView1.Select(form1.TreeView1.Items[167])
//        else
//          form1.TreeView1.Select(form1.TreeView1.Items[1]);
          Form3.Close ;
      end;
    IDCANCEL:
      begin

      end;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
var cdsnew:Tclientdataset;
begin
MessageBeep(16);
case Application.MessageBox('Delete all user stations?', PChar(appname), MB_OKCANCEL +
  MB_ICONQUESTION) of
  IDOK:
    begin
      try
        form1.ClientDataSet1.DisableControls;
        cdsnew:=Tclientdataset.Create(nil);
        cdsnew.Data :=form1.ClientDataSet1.Data ;
        cdsnew.First;
      while not cdsnew.Eof do
        begin
          if cdsnew.fieldbyname('电台类别').AsString='User' then
            cdsnew.Delete
          else
            cdsnew.Next;
        end;
      form1.ClientDataSet1.Data:=cdsnew.Data;
      with form1.ClientDataSet1 do
        begin
          MergeChangeLog ;
          ApplyUpdates(-1);
          SaveToFile(GetHomePath+ DataBaseFileName);
          LoadFromFile(GetHomePath + DataBaseFileName);
          Open;
//          form1.TreeView1.Select(form1.TreeView1.Items[169]);
        end;
        if form1.ClientDataSet1.RecordCount =0 then
//          form1.TreeView1.Select(form1.TreeView1.Items[167])
//        else
          form1.TreeView1.Select(form1.TreeView1.Items[1]);
          Form3.Close ;
        finally
          cdsnew.Free ;
          Form1.ClientDataSet1.EnableControls ;
        end;
    end;
  IDCANCEL:
    begin

    end;
end;



end;

procedure TForm3.CheckBox2Click(Sender: TObject);
begin
//  if CheckBox2.Checked  then
//    LabeledEdit4.EditLabel.Caption :='节目单: '
//  else
//    LabeledEdit4.EditLabel.Caption :='电台网址:';
end;

procedure TForm3.CheckBox5Click(Sender: TObject);
begin
  ComboBox3.Enabled :=CheckBox5.Checked ;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
if ComboBox1.Text='China' then
label3.Caption:='City:'
else
label3.Caption:='Province:'
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//if checkbox4.checked then
//            form1.PlayMusic(LabeledEdit1.Text);
end;

procedure TForm3.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27  then
    Form3.Close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin

form1.loaddata;
importtree ;
ComboBox3.ItemIndex:=0;

if BitBtn2.Caption='Edit' then
begin
Button1.Visible :=true;
Button2.Visible :=true;
BitBtn4.Enabled  :=false;
form3.Caption :='Edit Station | TV';
ToolBar1.Visible:=true;
end
else begin
Button1.Visible :=False ;
Button2.Visible :=False ;
BitBtn4.enabled :=True  ;
ToolBar1.Visible:=False ;
end;


if Form1.Edit1.Text <>'' then
begin
  SpeedButton3.Hint:='Import user file automatic';
  SpeedButton3.Tag :=1;
end
else begin
  SpeedButton3.Hint:='Import user file';
  SpeedButton3.Tag :=0;
end;
//if form1.DownloadFile('http://www.abroadradio.net/reg/cn/'+form1.cdkey+form2.getcpuid+'.xml',form1.GetShellFolders('Personal')+'\ARO'+'\' + form1.cdkey+form2.getcpuid+'.xml')then
//   CheckBox1.Enabled:=True
//else
//  CheckBox1.Enabled :=false;
end;



procedure TForm3.importtree;
var aint,bint:Integer;
begin
  for aInt:=0 to form1.TreeView1.Items.Count-1 do
  if form1.TreeView1.Items[aInt].Text = 'My Favorite' then
    begin
      for bInt:= 1 to form1.TreeView1.Items[aInt].Count -1 do
        
        ComboBox3.Items.Add(form1.TreeView1.Items[aInt].Item[bInt].Text);
      break;

     end;

end;




procedure TForm3.LabeledEdit3DblClick(Sender: TObject);
begin
  LabeledEdit3.Text :='';
end;

procedure TForm3.LabeledEdit3Enter(Sender: TObject);
begin
//  LabeledEdit3.Text:='http://';
//  LabeledEdit3.SelStart :=7;
end;

procedure TForm3.LabeledEdit3Exit(Sender: TObject);
begin
if RadioGroup1.ItemIndex =0 then
if AnsiContainsText(LabeledEdit3.Text,'/listen.pls')  then
begin
LabeledEdit3.Text :=Copy(LabeledEdit3.Text,1,Pos('/listen.pls',LabeledEdit3.Text)-1);
end;
end;

procedure TForm3.N1Click(Sender: TObject);
var cdsnew:TClientDataSet ;
begin
try
cdsnew:=TClientDataSet.Create(nil);
cdsnew.Edit;
form1.ClientDataSet1.Edit ;
cdsnew.Data:=form1.ClientDataSet1.Data ;

cdsnew.First ;
while not cdsnew.Eof do
begin
cdsnew.Edit;
cdsnew.FieldByName('电台类型').AsString :='User';
cdsnew.Delete;
cdsnew.Post;
cdsnew.Next ;
end;
form1.ClientDataSet1.Data :=cdsnew.Data ;
finally
  cdsnew.Free ;
end;
end;

function TForm3.Notempty: Boolean;
begin
  if (LabeledEdit1.Text<>'') and (ComboBox1.Text<>'')
  and (LabeledEdit3.Text<>'') then
  Result :=True
  else
  Result :=False

end;

procedure TForm3.RadioGroup1Click(Sender: TObject);
var left1,top1:integer;
begin
case RadioGroup1.ItemIndex  of
  0: begin
  GroupBox1.Caption :='Radio Info:(Eg:mp3,pls,nsv,m4a,m3u,asx,m3u8)' ;
  ToolButton1.ImageIndex:=1;
  ToolButton1.Hint:='Radio';
  Panel1.Visible:=False;
  LabeledEdit4.Enabled:=False;
  end;
  1: begin
  GroupBox1.Caption :='TV Info:(Eg:http://xxx.com/xx.html)' ;
  ToolButton1.ImageIndex:=0;
  ToolButton1.Hint:='TV';
  Panel1.Visible:=True;
  LabeledEdit4.Enabled:=True;
  end;
  2: begin
  if Form2.CheckBox23.Checked then
  begin
  GroupBox1.Caption :='TV Info:(Eg:http://xxx.com/xx.m3u8)';
  ToolButton1.ImageIndex:=0;
  ToolButton1.Hint:='TV';
  Panel1.Visible:=True;
  LabeledEdit4.Enabled:=True;
  end
  else begin
            Left1:=self.Left + 80;
            Top1:= self.Top+40;
            with form2 do
            begin
                left:=Left1;
                Top:=Top1;
                FormStyle:=fsStayOnTop;
                Show ;
                Notebook1.ActivePage:='7';
                MessageBeep(16);
                Application.MessageBox('The station needs Aplayer Plug-in enginee support,please check the''Use aplayer plug-in enginee'' option.', PChar(appname), MB_OK + MB_ICONWARNING);
            end;
  RadioGroup1.ItemIndex:=0;
  end;


  end;

    end;
end;


procedure TForm3.sendmail;
//var idsmtp1:Tidsmtp;idmessage1:Tidmessage;
begin
//  try
//  idsmtp1:=Tidsmtp.Create(nil);
//  idmessage1:=Tidmessage.Create(nil);
//  idSMTP1.Host:= 'smtp.163.com'; //邮件发送服务器
//  idsmtp1.Port :=25;
//  IdSMTP1.AuthType :=satDefault ; //服务器需验证
//  idSMTP1.Username  := 'terry_zhou82';   //邮箱登录帐号
//  idSMTP1.Password := 'duckula';  //邮箱登录密码
//  idMessage1.From.Address := 'terry_zhou82@163.com';  //发件人
//  idMessage1.Recipients.EMailAddresses := 'terry_zhou82@163.com'; //收件人
//  idMessage1.Subject := labelededit1.Text+#32+combobox1.Text+#32+labelededit3.Text+#32+combobox2.Text;    //邮件主题
//  idsmtp1.Authenticate;
//  try
//    idsmtp1.Connect ;
//    idSMTP1.Authenticate;
//    idSMTP1.Send(idMessage1);
//  except
//    Application.MessageBox('发送邮件失败，请稍后再试。', appname, MB_OK +
//      MB_ICONSTOP);
//    idSMTP1.Disconnect;
//    Exit;
//  end;


//  idSMTP1.Disconnect;
//  finally
//  idmessage1.free;
//  idsmtp1.free;
//end;
end;

procedure StatusProc(buffer: Pointer; len: DWORD; user: Pointer); stdcall;
begin
  if (buffer <> nil) and (len = 0) then
    SendMessage(win, WM_INFO_UPDATE, 8, DWORD(PAnsiChar(buffer)));
end;


procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  LabeledEdit3.Text:='';
  LabeledEdit3.Text :=Clipboard.AsText ;
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
//var open:TOpenDialog ;  cdsnew: TClientDataSet ;
begin
Form3.Hide ;
//if SpeedButton3.Tag=0 then
form1.N338.Click;
//else
//
//begin
//try
//  try
//    open:=TOpenDialog.Create(nil);
//    open.Filter :='用户自定义文件|*.cds';
//    cdsnew:=TClientDataSet.Create(nil);
//    if open.Execute  then
//      cdsnew.LoadFromFile(open.FileName);
//    form1.ClientDataSet1.DisableControls ;
//    Form1.ClientDataSet1.Edit ;
//    cdsnew.Edit ;
//    with form1.ClientDataSet1 do
//    begin
//      AppendData(cdsnew.Data,False);
//      MergeChangeLog ;
//      ApplyUpdates(-1);
//      SaveToFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      Close;
//      Application.MessageBox(pchar('共导入了'+inttostr(cdsnew.RecordCount)+'条记录！'), appname, MB_OK +
//        MB_ICONINFORMATION);
//      LoadFromFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      Open;
//    end;
//  finally
//    form1.ClientDataSet1.EnableControls ;
//    open.Free ;
//    cdsnew.Free;
//  end;
//except
//  Application.MessageBox('导入失败，发生未知错误，或请稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);
//end;
form3.close;
 form1.TreeView1.Select(form1.TreeView1.Items[0]);

//end
//else begin
//  Form3.Close;
//Form1.N336.Click ;
//end;
end;


procedure TForm3.ToolButton2Click(Sender: TObject);
begin
if Form1.ClientDataSet1.RecNo>1 then
  begin
    form1.ClientDataSet1.Prior ;
    Form1.loaddata;
  end
  else begin
  MessageBeep(16);
    Application.MessageBox('It''s the first record!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
  end;
end;

procedure TForm3.ToolButton4Click(Sender: TObject);
begin
if form1.ClientDataSet1.RecNo < form1.ClientDataSet1.RecordCount  then
  begin
    form1.ClientDataSet1.Next ;
    form1.loaddata;
  end
  else  begin
  MessageBeep(16);
    Application.MessageBox('It''s the last record!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
  end;
end;

end.

