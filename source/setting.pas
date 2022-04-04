unit setting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, ComCtrls, Buttons,ShellAPI,Clipbrd,
  Registry,IniFiles, ImgList,FileCtrl, ToolWin,bass,DBClient,bassenc, DdeMan,
  OleCtrls, SHDocVw, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, jpeg,WinInet, AppEvnts,Xml.XMLDoc, MPlayer, HotKeyManager,Menus,System.StrUtils,
  IdExplicitTLSClientServerBase, IdFTP, ZipForge,System.IOUtils, System.Types ;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox4: TCheckBox;
    Label5: TLabel;
    CheckBox6: TCheckBox;
    Label4: TLabel;
    LabeledEdit1: TLabeledEdit;
    SpeedButton4: TSpeedButton;
    GroupBox11: TGroupBox;
    SpeedButton6: TSpeedButton;
    CheckBox7: TCheckBox;
    GroupBox3: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox8: TCheckBox;
    Button3: TButton;
    ComboBox3: TComboBox;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    groupbox4: TGroupBox;
    RadioGroup1: TRadioGroup;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox12: TCheckBox;
    RadioGroup2: TRadioGroup;
    CheckBox13: TCheckBox;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    GroupBox7: TGroupBox;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    Button4: TButton;
    ComboBox6: TComboBox;
    CheckBox3: TCheckBox;
    OpenDialog1: TOpenDialog;
    SpeedButton12: TSpeedButton;
    CheckBox14: TCheckBox;
    GroupBox6: TGroupBox;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    GroupBox10: TGroupBox;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Image3: TImage;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    panel9: TPanel;
    Bevel1: TBevel;
    GroupBox5: TGroupBox;
    LabeledEdit8: TLabeledEdit;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Button17: TButton;
    Edit1: TEdit;
    SpeedButton16: TSpeedButton;
    btn1: TButton;
    ApplicationEvents1: TApplicationEvents;
    ComboBox10: TComboBox;
    CheckBox16: TCheckBox;
    Panel3: TPanel;
    RadioGroup3: TRadioGroup;
    ComboBox11: TComboBox;
    GroupBox9: TGroupBox;
    Image5: TImage;
    GroupBox14: TGroupBox;
    TrackBar1: TTrackBar;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Image8: TImage;
    Panel13: TPanel;
    Label14: TLabel;
    Label17: TLabel;
    SpeedButton11: TSpeedButton;
    ComboBox4: TComboBox;
    ComboBox7: TComboBox;
    Panel26: TPanel;
    CheckBox15: TCheckBox;
    Edit4: TEdit;
    SpeedButton9: TSpeedButton;
    GroupBox15: TGroupBox;
    SpeedButton2: TSpeedButton;
    Panel15: TPanel;
    Image10: TImage;
    Label18: TLabel;
    Label19: TLabel;
    Bevel3: TBevel;
    ButtonedEdit1: TButtonedEdit;
    Label20: TLabel;
    SpeedButton3: TSpeedButton;
    Label21: TLabel;
    Label23: TLabel;
    Panel16: TPanel;
    GroupBox13: TGroupBox;
    Bevel2: TBevel;
    Label26: TLabel;
    ComboBox12: TComboBox;
    Panel12: TPanel;
    ComboBox13: TComboBox;
    GroupBox16: TGroupBox;
    IdHTTP2: TIdHTTP;
    CheckBox19: TCheckBox;
    Panel10: TPanel;
    GroupBox17: TGroupBox;
    Button15: TButton;
    Button16: TButton;
    Button18: TButton;
    CheckBox20: TCheckBox;
    GroupBox18: TGroupBox;
    LabeledEdit7: TLabeledEdit;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton18: TSpeedButton;
    CheckBox22: TCheckBox;
    HotKey1: THotKey;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    Label24: TLabel;
    HotKey2: THotKey;
    HotKey3: THotKey;
    HotKey4: THotKey;
    HotKey5: THotKey;
    HotKey6: THotKey;
    HotKey7: THotKey;
    Label25: TLabel;
    Label28: TLabel;
    HotKey8: THotKey;
    HotKey9: THotKey;
    SpeedButton19: TSpeedButton;
    CheckBox17: TCheckBox;
    Image6: TImage;
    Label29: TLabel;
    ComboBox1: TComboBox;
    Label30: TLabel;
    ColorBox1: TColorBox;
    CheckBox18: TCheckBox;
    SpeedButton5: TSpeedButton;
    Panel17: TPanel;
    ListBox1: TListBox;
    Label3: TLabel;
    SpeedButton20: TSpeedButton;
    IdFTP1: TIdFTP;
    ZipForge1: TZipForge;
    ProgressBar1: TProgressBar;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    Label6: TLabel;
    HotKey10: THotKey;
    BalloonHint1: TBalloonHint;
    CheckBox26: TCheckBox;
    SpeedButton21: TSpeedButton;
    GroupBox19: TGroupBox;
    Button19: TButton;
    CheckBox23: TCheckBox;
    Button20: TButton;
    ComboBox2: TComboBox;
    Label7: TLabel;
    Edit2: TEdit;
    Label31: TLabel;
    CheckBox21: TCheckBox;
    CheckBox29: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    Label27: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnButton3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label10MouseEnter(Sender: TObject);
    procedure Label10MouseLeave(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure Label12MouseEnter(Sender: TObject);
    procedure TabSheet6MouseLeave(Sender: TObject);
    procedure Label12MouseLeave(Sender: TObject);
    procedure Label13MouseEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn3MouseEnter(Sender: TObject);
    procedure ComboBox5Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label15MouseEnter(Sender: TObject);
    procedure Label15MouseLeave(Sender: TObject);
    procedure Label20MouseEnter(Sender: TObject);
    procedure Label20MouseLeave(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure N336Click(Sender: TObject);
    procedure N337Click(Sender: TObject);
    procedure N338Click(Sender: TObject);
    procedure CheckBox15Click(Sender: TObject);
//    procedure Button13Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure CheckBox20Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure RadioGroup3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel3MouseLeave(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure ComboBox7CloseUp(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure HotKey2Exit(Sender: TObject);
    procedure HotKey1Exit(Sender: TObject);
    procedure ComboBox13KeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Label27Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure HotKeyManager1HotKeyPressed(HotKey: Cardinal; Index: Word);
    procedure HotKey9Change(Sender: TObject);
    procedure HotKey2Change(Sender: TObject);
    procedure HotKey3Change(Sender: TObject);
    procedure HotKey4Change(Sender: TObject);
    procedure HotKey5Change(Sender: TObject);
    procedure HotKey6Change(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure HotKey8Change(Sender: TObject);
    procedure HotKey1Change(Sender: TObject);
    procedure HotKey7Change(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure Label7Click(Sender: TObject);
    procedure Label31Click(Sender: TObject);
    procedure CheckBox23Click(Sender: TObject);
    procedure HotKey10Change(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    function  isvista:Boolean; //是否为win7
    function getcomputername1:string; //获取计算机名称
//    procedure Updatepg18; //下载pg18+
    procedure outwall; //翻墙
    procedure dlcode; //下载解码库
    procedure createfiles; //创建文件
    procedure Netkind; //宽带种类
    function RunAsAdmin(const sFile: string; const sParameters: string = ''; Handle: HWND = 0):Boolean;
  public
     v,netpan,code,dr:string;//网盘地址,注册码code
     sta:Boolean;
     buffer:integer;
     HotKeyIndex1,HotKeyIndex2,HotKeyIndex3,HotKeyIndex4,HotKeyIndex5,HotKeyIndex6,HotKeyIndex7,HotKeyIndex8,HotKeyIndex9,HotKeyIndex10:Word;
    function getcpuid:string;// 获取网卡id
    procedure Savekindle;
    procedure Loadkindle;
    procedure saveini;//保存选项部分
    procedure loadini; //载入选项部分
    procedure savereg; //保存注册部分
    procedure loadreg; //载入注册部分


  end;

var
  Form2: TForm2;

implementation

uses main, add, time, update, regedit, pg18, backup, cloudy, video, buy, kindledr, qrcode, plus;

{$R *.dfm}

procedure TForm2.N337Click(Sender: TObject);
begin
Form1.N337.Click ;
end;

procedure TForm2.N336Click(Sender: TObject);
begin
Form1.N336.Click ;
end;

procedure TForm2.N338Click(Sender: TObject);
begin
Form1.N338.Click ;
end;

//procedure TForm2.Button13Click(Sender: TObject);
//var
// MyStream:TMemoryStream; clidataset:TClientDataSet;
// number:Integer ;
//begin
//  MyStream:=TMemoryStream.Create;
//  clidataset :=TClientDataSet.Create(Self);
//if Form1.CheckOffline  then
//begin
////    if form1.DownloadFile(website+'updatedb.xml',form1.GetShellFolders('Personal')+'\ARO'+'\'+'updatedb.xml')then
////      begin
//
//        if StrToInt(netmobi) > StrToInt(trim(Form2.labelededit2.Text)) then
//        begin
//            try
//                idftp1.Connect;
//                IdFTP1.ChangeDir('wwwroot');
//                dr:=GetHomePath+'\ARO\update.cds';
//                idftp1.Get('update.cds', PChar(dr), True);
////              if form1.DownloadFile(website+'update.cds',form1.GetShellFolders('Personal')+'\ARO'+'\'+'update.cds') then
//              form1.ClientDataSet1.edit;
//              clidataset.LoadFromFile(dr);
//              clidataset.Edit;
//              number:=clidataset.RecordCount ;
//
//              form1.ClientDataSet1.AppendData(clidataset.Data,False);
//              with form1.trayicon1 do
//                begin
//                  Visible:=true;
//                  BalloonTitle:=Appname +'新增加了'+inttostr(number)+'个电台';
//                  BalloonHint:='点击查看详细电台清单...';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                  form1.detail:=true;
//                end;
//              form2.LabeledEdit2.Text:=netmobi;
//              form1.ClientDataSet1.MergeChangeLog ;
//              form1.ClientDataSet1.ApplyUpdates(-1);
//              form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
//              form1.ClientDataSet1.Close;
//              form1.ClientDataSet1.LoadFromFile(GetHomePath + DataBaseFileName);
//              form1.ClientDataSet1.Open;
////              form1.Label14.caption:=' 已找到电台数:'+#32+inttostr(form1.clientdataset1.recordcount);
//              Form2.saveini;
//              form1.DBGrid1.SetFocus ;
//              IdFTP1.Disconnect;
//              DeleteFile(dr);
//              finally
//                MyStream.Free;
//                clidataset.Free;
//            end;
//        end
//        else begin
//          with Form1.TrayIcon1 do
//                begin
//                  BalloonTitle :=appname;
//                  BalloonHint:='当前数据库版本为最新版本!';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//        end;
//
////  end;
//end
//else
//Application.MessageBox('更新失败，请检查是否联网或稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);
//end;

procedure TForm2.Button14Click(Sender: TObject);
begin
form1.deletepg18;
 Application.MessageBox('PG18+电台列表已清空！', appname, MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm2.Button15Click(Sender: TObject);
var cdsnew:Tclientdataset;
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
          SaveToFile(GetHomePath + DataBaseFileName);
          LoadFromFile(GetHomePath + DataBaseFileName);
          Open;
          Application.MessageBox('User stations are emptied!', appname, MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
//          form1.TreeView1.Select(form1.TreeView1.Items[169]);
        end;
        finally
          cdsnew.Free ;
          Form1.ClientDataSet1.EnableControls ;
        end;
end;

procedure TForm2.Button16Click(Sender: TObject);
var cds1:Tclientdataset;
begin
  cds1:=Tclientdataset.Create(nil);
  try
        try
          Form1.ClientDataSet1.DisableControls;
          Form1.ClientDataSet1.Filtered :=False;
          Form1.ClientDataSet1.Filter :='收藏 =  ' + QuotedStr('★');
          Form1.ClientDataSet1.filtered:=True ;
          cds1.data:=Form1.clientdataset1.data;
        with cds1 do
          begin
            First;
            while not Eof do
              begin
                Edit;
                FieldByName('收藏').AsString := '';
                Next;
              end;
            MergeChangeLog;
            ApplyUpdates(-1);
            Form1.ClientDataSet1.data:=cds1.data;
            SaveToFile(GetHomePath + DataBaseFileName);
//            TreeView1.Select(TreeView1.Items[0]);
          end;
        finally
          Form1.clientdataset1.EnableControls;
        end;
          Form1.clientdataset1.filtered:=false;
        Application.MessageBox('My favorite is emptied!', appname, MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
  except
     Application.MessageBox('My favorite is emptied or blank!', appname, MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);

  end;

end;

procedure TForm2.Button17Click(Sender: TObject);
var temp1: real;
 temp3: integer;
begin
 if (LabeledEdit4.Text<>'') and (LabeledEdit5.Text<>'')  then
 begin
 temp1:=0;    //edit1是用户名,edit2是邮件地址,edit3是注册码
 for  temp3:=0 to   length(LabeledEdit4.Text) do
 temp1:=temp1+Ord((LabeledEdit4.Text)[temp3])*2+Ord((LabeledEdit5.Text)[temp3])*3 ; //将用户名的每个字符ASC相加
 temp1:=temp1+length(LabeledEdit4.Text)*3 ;
 LabeledEdit6.Text:=floattostr(temp1);
 Edit1.Text:=labelededit6.Text+#32+uppercase(copy(LabeledEdit5.Text ,1,2))+LabeledEdit5.Text;
 savereg;
  if form1.DownloadFile(website+'reg/cn/'+ansistring(Form2.Edit1.Text)+'.xml',GetHomePath+'\'+ansistring(Form2.Edit1.Text+'.xml')) then
    Application.MessageBox('Please restart the program and make it work.', appname, MB_OK + MB_ICONINFORMATION
        + MB_TOPMOST)
  else
    Application.MessageBox('Detect you aren''t an user,please buy it!', appname, MB_OK + MB_ICONSTOP
      + MB_TOPMOST);


end
else
 Application.MessageBox('Name and Email aren''t allow blank, please retry!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);





//case Application.MessageBox('是否现在就重启程序，以便注册生效？', PChar(appname), MB_OKCANCEL +
//  MB_ICONQUESTION) of
//  IDOK:
//    begin
//      shellExecute(handle,'open',PChar(ExtractFileName(Application.ExeName)),nil,nil,SW_NORMAL);
//      form1.N2.Click ;
//
//    end;
//  IDCANCEL:
//    begin
//
//    end;
//end;


end;

procedure TForm2.Button18Click(Sender: TObject);
begin
form1.emptylist;
 Application.MessageBox('List is emptied!', appname, MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
//Form1.N20.Click ;
end;

procedure TForm2.Button19Click(Sender: TObject);
begin
TThread.CreateAnonymousThread(dlcode).Start;
//idftp1.Disconnect;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin

  if (LabeledEdit1.Text='') or (not DirectoryExists(Form2.LabeledEdit1.Text)) then
     LabeledEdit1.Text :=v;
  //    begin

//      Application.MessageBox('当前录音目录为空或不存在,请重新进行设置！', appname,
//           MB_OK + MB_ICONINFORMATION);
//      form2.PageControl1.TabIndex :=1;
//      LabeledEdit1.SetFocus ;
//    end
//    else
  Close;
end;

procedure TForm2.Button20Click(Sender: TObject);
begin
if DirectoryExists('C:\Users\Public\Thunder Network\APlayer\') then
begin
RunAsAdmin(GetHomePath+'\install.bat');
end
else
Application.MessageBox('Please download the plug-in and register it!', appname, MB_OK +
  MB_ICONINFORMATION);
end;

procedure TForm2.Button21Click(Sender: TObject);
var
  archiver:TZipForge;
  filesize:integer;
  dr:string;
begin
Cursor:=crHourGlass;
GroupBox19.Enabled:=false;
ProgressBar1.Visible:=True ;
archiver := TZipForge.Create(nil);
  idftp1.Connect;
  idftp1.ChangeDir('wwwroot/sdk');
  FileSize:= idftp1.Size('codecs.zip');
  ProgressBar1.Max := FileSize;
  ProgressBar1.Step := 10;
  dr:=GetHomePath+'\codecs.zip';
  idftp1.Get('codecs.zip', PChar(dr), True);
   try
  with archiver do
  begin
    FileName := PChar(GetHomePath)+'\codecs.zip';
    OpenArchive(fmOpenRead);
    BaseDir := 'C:\Users\Public\Thunder Network\APlayer\codecs\';
    ExtractFiles('*.*');
    CloseArchive();
    Application.MessageBox('解码库更新完成！', appname, MB_OK + MB_ICONINFORMATION);
    ProgressBar1.Visible:=False ;
    GroupBox19.Enabled:=true;
  end;
  except
  on E: Exception do
    begin
      Writeln('Error code: ', E.Message);
      Readln;
      GroupBox19.Enabled:=true;
    end;
  end;
IdFTP1.Disconnect;
end;





procedure TForm2.Button22Click(Sender: TObject);
begin
Netkind ;
end;

//end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if (DirectoryExists(LabeledEdit1.Text)) or (DirectoryExists(LabeledEdit7.Text))  then
    begin
      saveini ;
      loadini ;
      Button2.Enabled :=false;
//     Close ;

     end
     else begin
      Application.MessageBox('Record directory is null or not existence, please check it!', appname,
           MB_OK + MB_ICONINFORMATION);
//      form2.Notebook1.PageIndex :=4;
//      form2.PageControl1.TabIndex :=1;
//      LabeledEdit1.SetFocus ;

    end;


end;
//end;



procedure TForm2.N66Click(Sender: TObject);
var left1,top1:Integer;
dr:string;
 XMLDocument1:tXMLDocument;
begin
if Form1.CheckOffline then
begin
       idftp1.Connect;
      IdFTP1.ChangeDir('wwwroot');
      dr:=GetHomePath+'\ARO\update.xml';
      idftp1.Get('update.xml', PChar(dr), True);
//if FORM1.DownloadFile('https://www.abroadradio.net/update.xml',form1.GetShellFolders('Personal')+'\ARO'+'\'+ 'update.xml')then
//      begin
    try
        XMLDocument1:=Txmldocument.create(self);
        XMLDocument1.LoadFromFile(dr);
        if StrToInt(XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text) > StrToInt(Form1.GetBuildInfo) then
          begin
            Left1:=self.Left + 180;
            Top1:= self.Top+140;
            Form4:=TForm4.Create(Self);
              with form4 do
                begin
                  left:=Left1;
                  Top:=Top1;
                  FormStyle:=fsStayOnTop;
                  ShowModal ;
                end;
          end
          else begin
              with form1.TrayIcon1 do
                begin
                  BalloonTitle :=appname;
                  BalloonHint:='It''s the latest version!';
                  BalloonFlags:=bfInfo ;
                  ShowBalloonHint ;
                  deletefile(dr);
                end;
          end;
    finally
      xmldocument1.free;
    end;

          idftp1.disconnect;
//      end;
end
else
Application.MessageBox('Update failed, please check the network.', appname, MB_OK +
    MB_ICONWARNING);
end;



procedure TForm2.Netkind;
var rs:TStringStream;  str,astr:string;
idhttp:TIdHTTP ;
begin
try
rs:=TStringStream.Create;
IdHTTP:=TIdHTTP.Create(nil);
        IdHTTP.Get(form1.ip,rs);
        str:=rs.DataString;
        astr:=copy(Utf8ToAnsi(str),pos('From：',Utf8ToAnsi(str))+3,20);
        Label31.Caption:='Operator: '+RightStr(Copy(astr,1,Pos('</p>',astr)-1),4);
finally
  rs.Free ;
  IdHTTP.Free;
end;

end;

procedure TForm2.outwall;
var dr:string;filesize:Integer;
begin
  idftp1.Connect;
  idftp1.ChangeDir('wwwroot/download/en');
  FileSize:= idftp1.Size('pp3.exe');
  ProgressBar1.Max := FileSize;
  ProgressBar1.Step := 10;
  dr:=GetHomePath+'\pp3.exe';
  idftp1.Get('pp3.exe', PChar(dr), True);
//  if form1.DownloadFile(website+'download/cn/pp3.exe',ExtractFilePath(Application.ExeName)+'pp3.exe') then
   LabeledEdit8.Text :=GetHomePath+'\pp3.exe';
   case Application.MessageBox('Download complete! Run the proxy software now?', appname, MB_OKCANCEL +
     MB_ICONQUESTION) of
     IDOK:
       begin
          shellExecute(handle,'open',PChar(LabeledEdit8.Text),nil,nil,SW_NORMAL);
          SpeedButton15.enabled:=True ;
          SpeedButton16.enabled:=True ;
       end;
     IDCANCEL:
       begin
          SpeedButton15.enabled:=True ;
          SpeedButton16.enabled:=True ;
       end;
   end;
end;
//var
// MyStream:TMemoryStream;
//begin
//if form1.WindowsMediaPlayer1.isOnline then
//begin
// label8.Visible :=True ;
// SpeedButton14.Enabled  :=false;
// SpeedButton15.Enabled :=false;
// if Form1.DownloadFile(website+'download/cn/pp3.exe',ExtractFilePath(Application.ExeName)+'pp3.exe')then
//      begin
//      Screen.Cursor := crHourGlass;
//   label8.Visible :=False ;
//   LabeledEdit8.Text :=ExtractFilePath(Application.ExeName)+'pp3.exe';
//   Screen.Cursor := crDefault;
//   case Application.MessageBox('下载完毕,是否马上运行代理软件？', appname, MB_OKCANCEL +
//     MB_ICONQUESTION+MB_TOPMOST) of
//     IDOK:
//       begin
//          shellExecute(handle,'open',PChar(LabeledEdit8.Text),nil,nil,SW_NORMAL);
//          SpeedButton15.enabled:=True ;
//          SpeedButton16.enabled:=True ;
//       end;
//     IDCANCEL:
//       begin
//       end;
//   end;
//   SpeedButton14.Enabled :=true;
//   SpeedButton15.Enabled :=True ;
//
//end;
//end
//else
//Application.MessageBox('下载失败，请检查是否联网或稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);

procedure TForm2.Panel3MouseLeave(Sender: TObject);
begin
if RadioGroup3.ItemIndex =1 then
begin
  if ComboBox10.ItemIndex=-1 then
  begin
    Application.MessageBox(pchar('Please set the interval time!'), Appname, MB_OK + MB_ICONQUESTION);
    Notebook1.ActivePage :='9';
    ComboBox10.SetFocus ;
  end;
end;
end;


procedure TForm2.RadioButton1Click(Sender: TObject);
begin
//ComboBox10.Enabled :=false;
//ComboBox10.ItemIndex :=-1;
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
//ComboBox10.Enabled:=RadioButton2.Checked;
//ComboBox10.ItemIndex :=0;
end;

procedure TForm2.RadioGroup3Click(Sender: TObject);
begin
case RadioGroup3.ItemIndex of
          0:combobox10.enabled:=false;
          1:begin
             combobox10.enabled:=true;
             combobox10.itemindex:=0;
          end;
end;
end;


procedure TForm2.RadioGroup3Exit(Sender: TObject);
begin
//if RadioGroup3.ItemIndex =1 then
//begin
//  if ComboBox10.ItemIndex=-1 then
//  ShowMessage('error');
//end;
end;


function TForm2.RunAsAdmin(const sFile, sParameters: string;
  Handle: HWND): Boolean;
  var
  seiInfo : TShellExecuteInfo;
begin
  FillChar(seiInfo, SizeOf(seiInfo), 0);

  with seiInfo do
  begin
    cbSize := SizeOf(seiInfo);
    Wnd    := Handle;
    fMask  := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
    lpVerb := 'runas';
    nShow  := SW_SHOWNORMAL;
    lpFile := PWideChar(sFile);
    lpParameters := PWideChar(sParameters);
  end;

  Result := ShellExecuteEx(@seiInfo);
end;

procedure TForm2.Button4Click(Sender: TObject);
var temp1: real;
 temp3: integer;
 left1,top1:Integer;
 zc:string;
begin
  if (LabeledEdit4.Text<>'') and (LabeledEdit5.Text<>'')  then
 begin
 temp1:=0;    //edit1是用户名,edit2是邮件地址,edit3是注册码
 for  temp3:=0 to  length(LabeledEdit4.Text) do
 temp1:=temp1+Ord((LabeledEdit4.Text)[temp3])*2+Ord((LabeledEdit5.Text)[temp3])*3 ; //将用户名的每个字符ASC相加
 temp1:=temp1+length(LabeledEdit4.Text)*3 ;
 LabeledEdit6.Text:=floattostr(temp1);
 Edit1.Text:=labelededit6.Text+#32+uppercase(copy(LabeledEdit5.Text ,1,2))+LabeledEdit5.Text;
 savereg;
Form1.Sendmail('register  '+zc,labelededit4.Text+': '+',',labelededit5.Text+',',labelededit6.Text+#32+uppercase(copy(LabeledEdit5.Text ,1,2))+LabeledEdit5.Text,Label31.Caption);
with form1.TrayIcon1 do
begin
BalloonTitle :=appname;
BalloonHint:='请稍后,正在打开支付页面...';
BalloonFlags:=bfInfo ;
ShowBalloonHint;
end;
Application.Minimize;
shellExecute(handle,'open',PChar('https://www.abroadradio.net/contact.html'),nil,nil,SW_NORMAL);

end
else
 Application.MessageBox('User and email aren''t allow blank, please check it.', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
end;



procedure TForm2.Button5Click(Sender: TObject);
begin
Form1.PG181Click(Self)
end;

procedure TForm2.Button6Click(Sender: TObject);
var rs:TStringStream;  str,astr:string;
begin
try
rs:=TStringStream.Create;
        IdHTTP2.Get(form1.ip,rs);
        str:=rs.DataString;
        astr:=copy(Utf8ToAnsi(str),pos('来自：',Utf8ToAnsi(str))+3,50);

        ComboBox13.Text:= copy(astr, 1,pos('市', astr)-1);
        case Application.MessageBox(PWideChar('检测到您当前位置为：'+ComboBox13.Text+',  是否正确?'), appname, MB_OKCANCEL +
          MB_ICONQUESTION + MB_TOPMOST) of
          IDOK:
            begin
            idhttp2.Disconnect ;
            end;
          IDCANCEL:
            begin
              ComboBox13.Text:='';
              ComboBox13.SetFocus ;
            end;
        end;
finally
  rs.Free ;
end;

end;

//        Application.MessageBox(PWideChar('检测到您来自：'+ComboBox13.Text+',是否正确?'), appname, MB_OK +
//    MB_ICONWARNING);
//ShowMessage(Form1.ip);



procedure TForm2.Button7Click(Sender: TObject);
var
  cdsNew : TClientDataset ;
  i : integer;
  fieldName : string ;
  save:TSaveDialog ;
begin
  form1.TreeView1.Select(form1.TreeView1.Items[0]);
  try
   cdsNew := TClientDataset.Create(application);
   save:=TSaveDialog.Create(nil);
   save.Filter :='AroPlay Favorite|*.cds';
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


  if save.Execute  then
  begin
    save.DefaultExt:='cds';
    save.filename:=ChangeFileExt(Save.FileName,'.cds');
    cdsNew.SaveToFile(save.FileName);
     Application.MessageBox(pchar('My favorite backup  '+inttostr(cdsnew.RecordCount)+' records.'), Appname, MB_OK + MB_ICONQUESTION);
    edit2.Text := save.FileName;
  end;
  finally
    cdsNew.Free;
    save.Free ;
  end;

end;

procedure TForm2.Button8Click(Sender: TObject);
var data:array of string;  i:Integer; open:TOpenDialog; cdsnew:Tclientdataset;
begin
form1.TreeView1.Select(form1.TreeView1.Items[0]);
  try
  open:=TOpenDialog.Create(nil);
    open.Filter :='AroPlay Favorite|*.cds';
    cdsnew:=TClientDataSet.Create(nil);
    form1.ClientDataSet1.Edit ;
    if open.Execute  then
      cdsnew.LoadFromFile(open.FileName);
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
  Application.MessageBox(pchar('My favorite synchronized success! '+inttostr(cdsnew.RecordCount)+'  records has been imported！'), Appname, MB_OK + MB_ICONQUESTION);

  finally
  form1.ClientDataSet1.EnableControls ;
  open.Free ;
  cdsnew.Free;
  end;
 form1.ClientDataSet1.MergeChangeLog ;
 form1.ClientDataSet1.ApplyUpdates(-1);
 form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
 form1.ClientDataSet1.close;
 form1.ClientDataSet1.loadfromfile(GetHomePath+ DataBaseFileName);
 form1.ClientDataSet1.open;
 form1.TreeView1.Select(form1.TreeView1.Items[0]);
// ShowMessage('ok');
// Application.MessageBox(pchar('收藏夹同步成功！'), Appname, MB_OK + MB_ICONQUESTION);

//  Form13.Close;
  Form2.Close;
//  end;
except
  Application.MessageBox('My favorite synchronized failed! please check the network.', appname, MB_OK +
    MB_ICONWARNING);
end;
//
//

end;



procedure TForm2.Button9Click(Sender: TObject);
var open:TOpenDialog ;  cdsnew: TClientDataSet ;data:array of string;  i:Integer;
MyStream:TMemoryStream;
begin
form1.TreeView1.Select(form1.TreeView1.Items[0]);
if Edit2.Text<>'' then
begin
//  popupmenu4.items[10].items[2].enabled:=true;
  try
    cdsnew:=TClientDataSet.Create(nil);
    cdsnew.LoadFromFile(Edit2.Text);
    try
  SetLength(data,10000);

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

    form1.ClientDataSet1.Insert ;
    cdsnew.Locate('电台名称',data[i],[]);
    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:=cdsnew.FieldByName('收藏').AsString;;

    Form1.ClientDataSet1.Post;

  end;
     cdsnew.next;

  end;
  Application.MessageBox(pchar('Automatic import my favorite success! '+inttostr(cdsnew.RecordCount)+' records has been imported.'), appname, MB_OK +
        MB_ICONINFORMATION);
  form1.Cursor :=crdefault;
  finally
  form1.ClientDataSet1.EnableControls ;

  end;
form1.ClientDataSet1.MergeChangeLog ;
 form1.ClientDataSet1.ApplyUpdates(-1);
 form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
 form1.ClientDataSet1.close;

 form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
 form1.ClientDataSet1.open;
 form1.TreeView1.Select(form1.TreeView1.Items[0]);
 Form2.Close ;
// ShowMessage(TreeView1.Select(TreeView1.Items[166]));
// TreeView1Change(self);
except
  Application.MessageBox('Automatic import my favorite failed, please try it later.', appname, MB_OK +
    MB_ICONWARNING);
  end;
  finally
    cdsnew.Free;
    MyStream.free;
  end;
end
else begin
  Application.MessageBox('Import my favorite failed, please choose the correct file!', appname, MB_OK +
    MB_ICONWARNING);
  Exit;
//end;
//
end;
end;

procedure TForm2.ButtonedEdit1RightButtonClick(Sender: TObject);
var test:string;
begin
  if selectdirectory('Select the directory:','',test) then
  begin
    ButtonedEdit1.Text :=test ;
  end;
end;


procedure TForm2.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
//
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  shellExecute(handle,'open',PChar('http://abroadradio.net/screen.html'),nil,nil,SW_NORMAL);

end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
//Form1.fixdb(True)
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
//var open:TOpenDialog ;  cdsnew: TClientDataSet ;
begin
//if Edit1.Text<>'' then
//begin
//  try
//    cdsnew:=TClientDataSet.Create(nil);
//    cdsnew.LoadFromFile(Edit1.Text);
//    BitBtn3.ShowHint :=True;
//    BitBtn3.Hint :='默认存放地址:'+#32+edit1.Text;
//    Form1.ClientDataSet1.Edit ;
//    cdsnew.Edit ;
//    with form1.ClientDataSet1 do
//    begin
//      AppendData(cdsnew.Data,False);
//      MergeChangeLog ;
//      ApplyUpdates(-1);
//      SaveToFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      Close;
//      LoadFromFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      Open;
//    end;
//  finally
//    cdsnew.Free;
//  end;
//end
//else begin
//  Application.MessageBox('导入失败，未找到备份文件，请手工导入！', appname, MB_OK +
//    MB_ICONWARNING);
//  BitBtn3.ShowHint:=False;
//  Exit;
end;

//end;

procedure TForm2.BitBtn3MouseEnter(Sender: TObject);
begin
//if Edit1.Text<>'' then
//begin
//    BitBtn3.ShowHint :=True;
//    BitBtn3.Hint :='默认存放地址:'+#32+edit1.Text+'.cds';
//end
//else
//  BitBtn3.ShowHint :=False ;
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
if(DirectoryExists(LabeledEdit1.Text)) or (DirectoryExists(LabeledEdit7.Text)) then
    begin
      saveini ;
      loadini ;
     Close ;
     end
     else begin
      Application.MessageBox('Record directory is null or inexistence, please check it!', appname,
           MB_OK + MB_ICONINFORMATION);
//      form2.Notebook1.PageIndex :=4;
//      form2.PageControl1.TabIndex :=1;
//      LabeledEdit1.SetFocus ;

    end;
//Form1.Hotkey;
end;

procedure TForm2.btnButton3Click(Sender: TObject);
begin
  Shellexecute(Handle,nil,PChar('mailto:zhouying2003@hotmail.com?subject=I want to add_____function')
                 ,nil,nil,SW_SHOWNORMAL);

end;

procedure TForm2.CheckBox11Click(Sender: TObject);
begin
//Form1.label10.Visible:= not CheckBox11.Checked;
//if CheckBox11.Checked then
//begin
//  Image1.Visible :=false;
//  Image7.Visible :=true;
//end
//else begin
//  Image1.Visible :=true;
//  Image7.Visible :=False;
//end;
end;

procedure TForm2.CheckBox13Click(Sender: TObject);
begin
RadioGroup2.Enabled :=CheckBox13.Checked
end;

procedure TForm2.CheckBox15Click(Sender: TObject);
begin
//form1.WindowsMediaPlayer1.settings.playCount :=99;
end;

procedure TForm2.CheckBox16Click(Sender: TObject);
begin
RadioGroup3.Visible:=CheckBox16.Checked;
ComboBox10.Visible:=CheckBox16.Checked;
RadioGroup3.ItemIndex :=0;
end;

procedure TForm2.CheckBox18Click(Sender: TObject);
begin
//RadioGroup4.Enabled :=CheckBox18.Checked
end;

procedure TForm2.CheckBox19Click(Sender: TObject);
begin
Form1.panel9.Visible:=CheckBox19.Checked;
//if CheckBox19.Checked  then
//form1.Image1.Visible :=False
//form1.adver :='no';
//else

end;

procedure TForm2.CheckBox20Click(Sender: TObject);
begin
//  GroupBox11.Enabled:=CheckBox20.Checked ;
end;

procedure TForm2.CheckBox23Click(Sender: TObject);
begin
//if not DirectoryExists('C:\Users\Public\Thunder Network\APlayer\') then
//Application.MessageBox('请先下载好解码库并进行组件注册后再开启此功能！', appname, MB_OK +
//  MB_ICONINFORMATION)
//else
//CheckBox23.Checked:=True
//else begin
//
//CheckBox23.Checked:=False ;
//end;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  ComboBox3.Enabled :=CheckBox2.Checked ;
  SpeedButton1.Enabled :=CheckBox2.Checked ;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
ComboBox6.Enabled :=CheckBox3.Checked ;
CheckBox7.Checked:=CheckBox3.Checked ;
end;

procedure TForm2.CheckBox5Click(Sender: TObject);
begin

//  Form1.UpdateDB ;
end;

procedure TForm2.CheckBox9Click(Sender: TObject);
begin
//  ComboBox6.Enabled :=CheckBox9.Checked ;
end;

procedure TForm2.ComboBox10Change(Sender: TObject);
begin
case ComboBox10.ItemIndex of
    0:Interval :=1200000;
    1:Interval :=1800000;
    2:Interval :=3600000;
    3:Interval :=5400000;
    4:Interval :=7200000;
    5:Interval :=60000;

  end;
end;

procedure TForm2.ComboBox11Change(Sender: TObject);
begin
form1.ToolButton5.hint:=ComboBox11.Text ;
//form1.PopupMenu8.Items[5].Caption :=ComboBox11.Text ;
end;

procedure TForm2.ComboBox13KeyPress(Sender: TObject; var Key: Char);
begin
combobox13.items.add(string(key));  //model，加入自己搜到的词语
combobox13.DroppedDown:= True;

end;



procedure TForm2.ComboBox1Change(Sender: TObject);
begin
case ComboBox1.ItemIndex of
    0:buffer :=500;
    1:buffer :=5000;
    2:buffer :=10000;
    3:buffer :=15000;
    4:buffer :=20000;
    5:buffer :=25000;
    6:buffer :=30000;
  end;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
case ComboBox2.ItemIndex of
0:createfiles;
1:DeleteFile(GetHomePath+'\show.txt');
end;
end;


procedure TForm2.ComboBox4Change(Sender: TObject);
begin
//  case ComboBox4.ItemIndex of
//    0:buffertime :=5000;
//    1:buffertime :=10000;
//    2:buffertime :=15000;
//    3:buffertime :=20000;
//  end;
end;

procedure TForm2.ComboBox5Change(Sender: TObject);
begin
//var
//	i: Integer;
//    r: Boolean; l: DWord;
//	level: Single;
//begin
//	 enable the selected input
//    r := True;
//    i := 0;
//     first disable all inputs, then...
//	while r do
//    begin
//		r := BASS_RecordSetInput(i, BASS_INPUT_OFF, -1);
//        Inc(i);
//	end;
//     ...enable the selected.
//	BASS_RecordSetInput(ComboBox5.ItemIndex, BASS_INPUT_ON, -1);
//	l:= BASS_RecordGetInput(ComboBox5.ItemIndex, level);
//end;

end;


procedure TForm2.ComboBox5Click(Sender: TObject);
//var
//  i: Integer;
begin
//  form1.input := combobox5.ItemIndex; // get the selection
//  i := 0;
//  while BASS_RecordSetInput(i, BASS_INPUT_OFF, -1) do
//    inc(i); // 1st disable all inputs, then...
//  BASS_RecordSetInput(form1.input, BASS_INPUT_ON, -1); // enable the selected
//  form1.UpdateInputInfo; // update info
end;

procedure TForm2.ComboBox6Change(Sender: TObject);
begin
   case ComboBox6.ItemIndex of
    0:netpan :='http://www.dropbox.com/';
    1:netpan :='http://onedrive.live.com';
    2:netpan :='https://www.google.com/drive';
    3:netpan :='https://www.icloud.com/';
    4:netpan :='https://www.mediafire.com/';


  end;
end;

procedure TForm2.ComboBox7Change(Sender: TObject);
begin
case ComboBox7.ItemIndex of
0:Edit4.Text:='documents';
1:Edit4.Text:='DK_Documents';
2:Edit4.Text:='';
end;
end;

procedure TForm2.ComboBox7CloseUp(Sender: TObject);
begin
if combobox7.itemindex = 2 then
begin
Panel26.visible:=True;
ComboBox4.Enabled :=False ;
end
else begin
Panel26.visible:=false;
ComboBox4.Enabled :=True ;
end;
end;




procedure TForm2.createfiles;
var
  Text:Textfile;
begin
try
   AssignFile(Text,GetHomePath+'\show.txt');
   Rewrite(Text);
 finally
  Closefile(Text);
end;
end;

procedure TForm2.DateTimePicker1CloseUp(Sender: TObject);
begin
//case Application.MessageBox('您可能已改变了当前日期，是否清空累计流量值？', PChar(appname),
//  MB_OKCANCEL + MB_ICONQUESTION) of
//  IDOK:
//    begin
//      form1.Label8.Caption :='0';
//    end;
//  IDCANCEL:
//    begin
//
//    end;
//end;

end;

procedure TForm2.dlcode;
var
  archiver:TZipForge;
  filesize:integer;
  dr:string;
begin
//Cursor:=crHourGlass;
//if DirectoryExists('C:\Users\Public\Thunder Network\APlayer\codecs') then
////begin
//Application.MessageBox('检测到解码库已存在，请点击右侧的''注册播放组件''按钮''。', appname, MB_OK +
//    MB_ICONINFORMATION)
//else begin
Button19.Enabled:=False;
Button20.Enabled:=False;
checkbox23.enabled:=false;
try
archiver := TZipForge.Create(nil);
  idftp1.Connect;
  idftp1.ChangeDir('wwwroot/sdk');
  FileSize:= idftp1.Size('codecs.zip');
  ProgressBar1.Max := FileSize;
  ProgressBar1.Step := 10;
  dr:=GetHomePath+'\codecs.zip';
  idftp1.Get('codecs.zip', PChar(dr), True);
//  Panel18.Visible:=True;
   try
  with archiver do
  begin
    FileName := PChar(GetHomePath)+'\codecs.zip';
    OpenArchive(fmOpenRead);
    BaseDir := 'C:\Users\Public\Thunder Network\APlayer\codecs\';
    ExtractFiles('*.*');
    CopyFile(PChar('C:\Users\Public\Thunder Network\APlayer\codecs\Aplayer.dll'),PChar(gethomepath+'\Aplayer.dll'),True);
    CloseArchive();
    Application.MessageBox('Download complete!', appname, MB_OK + MB_ICONINFORMATION);
    Button19.Enabled:=true;
    Button20.Enabled:=true;
    checkbox23.enabled:=true;
  end;
  except
  on E: Exception do
    begin
      Writeln('Error code: ', E.Message);
      Readln;
      Button19.Enabled:=true;
      Button20.Enabled:=true;
    end;
  end;
finally
  archiver.Free ;
end;
//end;
DeleteFile(GetHomePath+'\codecs.zip');
IdFTP1.Disconnect;

end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);

begin
if not FileExists(gethomepath+'\ARO\device.ini') then
ListBox1.Items.SaveToFile(gethomepath+'\ARO\device.ini');
//begin




if CheckBox1.Checked then
Form1.SetAutoRun(True)
else
form1.SetAutoRun(False);


end;

procedure TForm2.FormCreate(Sender: TObject);
var
  info: BASS_DEVICEINFO;
  i: Integer;
begin
//form1.initbass ;
SpeedButton5.CustomHint:=BalloonHint1;
SpeedButton5.Hint := 'Background record';
LabeledEdit1.Text :=gethomepath+'\Aro\Records';
LabeledEdit7.Text :=gethomepath+'\Aro\QRcode';
Button2.Enabled :=true;
//DateTimePicker1.Date :=Now ;
v:=LabeledEdit1.Text ;
//jianjie:=false;
TreeView1.Select(TreeView1.Items[0]);
i := 1;
  while BASS_GetDeviceInfo(i, info) do
  begin
    ListBox1.Items.Add(string(info.name));
    Inc(i);
  end;

  //  if isvista then
//    btnButton3.Hint :='当前系统为Windows7，您可能需要通过控制面板来配置您的电子邮件。'
//  else
//    btnButton3.Hint :='';
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if (ssCtrl in Shift) and Form1.regeditaro then
//SpeedButton11.Visible :=True
//else
//SpeedButton11.Visible :=false;
//end;
if (ssshift in Shift)  then
SpeedButton14.Visible :=True
else
SpeedButton14.Visible :=false;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Netkind ;
  TreeView1.Items[0].Selected :=True ;
  sta:=False;
  loadreg ;
  loadkindle;
    if form1.regeditaro  then
      begin
        label22.Caption :=LabeledEdit4.Text;
        GroupBox7.Visible :=False;
        GroupBox14.Visible :=True;
        CheckBox16.Enabled :=true;
        SpeedButton12.Visible:=True;
//        if ComboBox7.ItemIndex=0 then
//        groupbox15.Visible:=False
//        else
//        groupbox15.Visible:=True ;
      end
  else begin
        label22.Caption :='Unregister';
        GroupBox7.Visible :=True;
        GroupBox14.Visible :=False;
        SpeedButton12.Visible:=False;
        CheckBox16.Enabled :=False ;
        radiogroup3.Enabled :=False ;
       end;
       if LabeledEdit8.Text<>'' then
       SpeedButton16.Visible :=True
       else
       SpeedButton16.Visible :=False;

//       if not DirectoryExists('C:\Users\Public\Thunder Network\APlayer\codecs\') then
//       CheckBox23.Checked:=False;
  end;


procedure TForm2.savekindle;
var inifile:TIniFile;
begin
  try
    inifile:=Tinifile.Create(GetHomePath+'\kindle.dat');
    inifile.writeInteger('info','drive',form2.ComboBox4.ItemIndex);
    inifile.WriteInteger('info','kindlesys',form2.ComboBox7.ItemIndex);
    inifile.WriteString('info','drive',form2.ComboBox4.Text);
    inifile.writeString('info','direct',form2.Edit4.Text);
    inifile.writeString('info','local',form2.ButtonedEdit1.Text);
    inifile.WriteBool('info','open',form2.CheckBox15.Checked);
  finally
    inifile.Free;
  end;
if form2.ComboBox4.Enabled  then
dr:=form2.ComboBox4.text+edit4.text
else
dr:=form2.Edit4.text;
end;



function TForm2.getcomputername1: string;
var
 tmpstr: PChar;
 Len : ^DWord;
begin
  GetMem(tmpstr,255);
  New(Len);
  Len^:= 255;
  if GetComputerName(tmpstr,Len^) then
    result:= StrPas(tmpstr)
  else
    result:='Unkown Host';
  FreeMem(tmpstr,255);
  Dispose(Len);
end;


function TForm2.getcpuid: string;
var
Lib:   Cardinal;
Func:   function(GUID:   PGUID):   Longint;   stdcall;
GUID1,   GUID2:   TGUID;
begin
Result   :=   '';
Lib   :=   LoadLibrary('rpcrt4.dll');
if   Lib   <>   0   then
begin
        @Func   :=   GetProcAddress(Lib,   'UuidCreateSequential');
        if   Assigned(Func)   then
        begin
            if   (Func(@GUID1)   =   0)   and
                  (Func(@GUID2)   =   0)   and
                  (GUID1.D4[2]   =   GUID2.D4[2])   and
                  (GUID1.D4[3]   =   GUID2.D4[3])   and
                  (GUID1.D4[4]   =   GUID2.D4[4])   and
                  (GUID1.D4[5]   =   GUID2.D4[5])   and
                  (GUID1.D4[6]   =   GUID2.D4[6])   and
                  (GUID1.D4[7]   =   GUID2.D4[7])   then
            begin
                Result   :=
                    IntToHex(GUID1.D4[2],   2)   +   '-'   +
                    IntToHex(GUID1.D4[3],   2)   +   '-'   +
                    IntToHex(GUID1.D4[4],   2)   +   '-'   +
                    IntToHex(GUID1.D4[5],   2)   +   '-'   +
                    IntToHex(GUID1.D4[6],   2)   +   '-'   +
                    IntToHex(GUID1.D4[7],   2);
            end;
        end;
end;


end;



procedure TForm2.HotKey10Change(Sender: TObject);
begin
HotKeyIndex10 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex10, HotKey10.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey1Change(Sender: TObject);
begin
HotKeyIndex1 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex1, HotKey1.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey1Exit(Sender: TObject);
begin
//if HotKey1.HotKey =HotKey2.HotKey then
//begin
//Application.MessageBox('检测到快捷键相同,请重新设置！', PChar(appname),
//          MB_OK + MB_ICONINFORMATION);
//HotKey1.SetFocus;
//end;
end;

procedure TForm2.HotKey2Change(Sender: TObject);
begin
HotKeyIndex2 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex2, HotKey2.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey2Exit(Sender: TObject);
begin
//if HotKey2.HotKey =HotKey1.HotKey then
//begin
//Application.MessageBox('检测到快捷键相同,请重新设置！', PChar(appname),
//          MB_OK + MB_ICONINFORMATION);
//HotKey2.SetFocus;
//end;
end;

procedure TForm2.HotKey3Change(Sender: TObject);
begin
HotKeyIndex3 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex3, HotKey3.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey4Change(Sender: TObject);
begin
HotKeyIndex4 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex4, HotKey4.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname ;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey5Change(Sender: TObject);
begin
HotKeyIndex5 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex5, HotKey5.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname ;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey6Change(Sender: TObject);
begin
HotKeyIndex6 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex6, HotKey6.HotKey);
form1.PopupMenu1.Items[9].Caption:='Prior station   '+ ShortCutToText(HotKey6.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname ;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey7Change(Sender: TObject);
begin
HotKeyIndex7 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex7, HotKey7.HotKey);
form1.PopupMenu1.Items[10].Caption:='Next station   '+ ShortCutToText(HotKey7.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey8Change(Sender: TObject);
begin
HotKeyIndex8 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex8, HotKey8.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKey9Change(Sender: TObject);
begin
HotKeyIndex9 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex9, HotKey9.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.HotKeyManager1HotKeyPressed(HotKey: Cardinal; Index: Word);
begin
//SetForegroundWindow(Application.Handle);
//  if Index = HotKeyIndex2 then
//  begin
//     if form1.TrackBar1.Position <40 then
//     begin
//      form1.TrackBar1.position:=form1.TrackBar1.position+5;
//      end
//     else
//     Application.MessageBox('音量值已经为最大！', appname, MB_OK +
//        MB_ICONINFORMATION + MB_TOPMOST);
//  end
//////    speedbutton5click(nil)
//  else
//  if index = HotKeyIndex1  then
//  begin
//     if form1.TrackBar1.Position >0 then
//     begin
//        form1.TrackBar1.position:= form1.TrackBar1.position-5;
//     end
//     else
//     Application.MessageBox('音量值已经为最小！', appname, MB_OK +
//        MB_ICONINFORMATION + MB_TOPMOST);
//  end;
////  else
//  if index = HotKeyIndex3  then
//  begin
//  form1.ToolButton1click(nil);
//  end;
////  else
//  if index = HotKeyIndex4  then
//  begin
//    form1.speedbutton10click(nil);
//  end;
//  else
//  if index = HotKeyIndex5  then
//  begin
//    form1.ToolButton25click(nil);
//  end
//  else
//  if index = HotKeyIndex6  then
//  begin
//    form1.N23Click(nil);
//  end
//  else
//  if index = HotKeyIndex7  then
//  begin
//    form1.N24Click(nil);
//  end;



end;

procedure TForm2.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
ProgressBar1.Position := AWorkCount;
end;

procedure TForm2.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
//ProgressBar1.Max := AWorkCountMax;
//ProgressBar1.Min:=0;
progressBar1.Position:=0;
end;

procedure TForm2.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
//ProgressBar1.Position := ProgressBar1.Max;
//progressBar1.Position:=100;
end;

procedure TForm2.Image1Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('http://aplayer.open.xunlei.com/'),nil,nil,SW_NORMAL);
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('https://www.qingting.fm/'),nil,nil,SW_NORMAL);
end;

procedure TForm2.Image6Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('https://www.un4seen.com/'),nil,nil,SW_NORMAL);

end;

function TForm2.isvista: Boolean;
  var osvi:_OSVERSIONINFO;
begin
  osvi.dwOSVersionInfoSize:=SizeOf(_OSVERSIONINFO);
    if GetVersionEx(osvi) then
      begin
        if osvi.dwBuildNumber=7600  then
          Result :=True;
      end;
end;

procedure TForm2.Label10Click(Sender: TObject);
begin
//  ShellExecute(0, nil, PChar('http://www.icons8.com/'), nil, nil, 1);
end;

procedure TForm2.Label10MouseEnter(Sender: TObject);
begin
//  label10.Font.Color :=clred;
end;

procedure TForm2.Label10MouseLeave(Sender: TObject);
begin
//  Label10.Font.Color:=clBlue ;
end;

procedure TForm2.Label12MouseEnter(Sender: TObject);
begin
//  Label12.Font.Color :=clRed ;
end;

procedure TForm2.Label12MouseLeave(Sender: TObject);
begin
//  Label12.Font.Color :=clBlue ;
end;

procedure TForm2.Label13Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar(website+'download.html'), nil, nil, 1);
end;

procedure TForm2.Label13MouseEnter(Sender: TObject);
begin
//  label13.font.color:=clred;
end;

procedure TForm2.Label13MouseLeave(Sender: TObject);
begin
//label13.font.color:=clblue;
end;

procedure TForm2.Label15Click(Sender: TObject);
begin
//ShellExecute(0, nil, PChar('http://dash1412.deviantart.com/'), nil, nil, 1);
end;

procedure TForm2.Label15MouseEnter(Sender: TObject);
begin
//label15.Font.Color :=clred;
end;

procedure TForm2.Label15MouseLeave(Sender: TObject);
begin
//label15.Font.Color :=clblue;
end;

procedure TForm2.Label19Click(Sender: TObject);
begin
ShellExecute(handle,'open',PChar('https://www.amazon.cn/gp/digital/fiona/kcp-landing-page/ref=klp_mn'),nil,
               nil,SW_SHOWNORMAL);
end;

procedure TForm2.Label1Click(Sender: TObject);
begin
  ShellExecute(handle,'open',PChar(website+'contact.html'),nil,
               nil,SW_SHOWNORMAL);

end;





procedure TForm2.Label20Click(Sender: TObject);
begin
//  shellexecute(Handle,nil,PChar('mailto:2879952553@qq.com' ),nil,nil,SW_SHOWNORMAL);
end;



procedure TForm2.Label20MouseEnter(Sender: TObject);
begin
//  Label20.Font.Color :=clRed ;
end;

procedure TForm2.Label20MouseLeave(Sender: TObject);
begin
//  Label20.Font.Color :=clBlue ;
end;

procedure TForm2.Label21Click(Sender: TObject);
begin
//shellexecute(Handle,nil,PChar('mailto:840125710@qq.com' ),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm2.Label27Click(Sender: TObject);
begin
Application.MessageBox('本站没有储存任何内容,仅为网友提供信息的交流平台，软件内所有电台和电视台内容归原权利人所有。', appname,MB_OK + MB_ICONINFORMATION);
end;

procedure TForm2.Label31Click(Sender: TObject);
begin
if not DirectoryExists('C:\Users\Public\Thunder Network\APlayer\') then
begin
RunAsAdmin(GetHomePath+'install.bat');
end
else
Application.MessageBox('Please download plug-in and register it!', appname, MB_OK +
  MB_ICONINFORMATION);

end;

procedure TForm2.Label5Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('http://www.aroplay.com'),nil,nil,SW_NORMAL);

end;

procedure TForm2.Label7Click(Sender: TObject);
begin

//TThread.CreateAnonymousThread(dlcode).Start;
end;

procedure TForm2.Label9Click(Sender: TObject);
begin
  ShellExecute(handle,'open',PChar('https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=2&ch=&tn=baiduhome_pg&bar='+'&wd=%E7%BF%BB%E5%A2%99%E8%BD%AF%E4%BB%B6%E4%B8%8B%E8%BD%BD&rsv_spt=1&rsv_pq=8d3e797f00017cc3&rsv_t=1806tKF%2F6J8LF0oF9Rh6F5E1d%2BrEsaiNaAHHPUzYf8yxrXctxsq5U11BhwbX4TDPVx0y&rsv_enter=1&inputT=1140'),nil,
               nil,SW_SHOWNORMAL);
  
end;

procedure TForm2.loadini;
var inifile:TIniFile;
begin
  try
    inifile:=Tinifile.Create(GetHomePath+'\option.dat');
//    ComboBox8.ItemIndex  :=inifile.ReadInteger('info','show',ComboBox8.ItemIndex);
    ComboBox2.ItemIndex  :=inifile.ReadInteger('info','showtext',ComboBox2.ItemIndex);
    ComboBox2.OnChange(Self);
    ListBox1.ItemIndex  :=inifile.ReadInteger('info','dev',listbox1.ItemIndex);
    ColorBox1.ItemIndex:= inifile.ReadInteger('info','color',ColorBox1.ItemIndex);
    ComboBox11.ItemIndex  :=inifile.ReadInteger('info','rand',ComboBox11.ItemIndex);
    ComboBox11.OnChange(Self);
    ComboBox1.ItemIndex := inifile.ReadInteger('info','buffer',ComboBox1.ItemIndex);
    ComboBox1.OnChange(Self);
    ComboBox10.ItemIndex := inifile.ReadInteger('info','tv',ComboBox10.ItemIndex);
    ComboBox10.OnChange(self);
    ComboBox12.ItemIndex :=inifile.ReadInteger('info','select',ComboBox12.ItemIndex);
    ComboBox6.ItemIndex := inifile.ReadInteger('info','netpan',ComboBox6.ItemIndex);
    ComboBox6.OnChange(self);
    CheckBox14.Checked :=inifile.ReadBool ('info','cpu',CheckBox14.Checked);
    CheckBox23.Checked :=inifile.ReadBool ('info','ap',CheckBox23.Checked);
    CheckBox21.Checked :=inifile.ReadBool ('info','lyric',CheckBox21.Checked);
    CheckBox29.Checked :=inifile.ReadBool ('info','time',CheckBox29.Checked);
    CheckBox22.Checked :=inifile.ReadBool ('info','find',CheckBox22.Checked);
    CheckBox25.Checked :=inifile.ReadBool ('info','auto',CheckBox25.Checked);
    CheckBox17.Checked :=inifile.ReadBool ('info','ewm',CheckBox17.Checked);
//    CheckBox11.Checked :=inifile.ReadBool ('info','adr',CheckBox11.Checked);
    CheckBox19.Checked :=inifile.ReadBool ('info','today',CheckBox19.Checked);
    CheckBox20.Checked :=inifile.ReadBool ('info','tvsee',CheckBox20.Checked);
    CheckBox10.Checked :=inifile.ReadBool ('info','emptydj',CheckBox10.Checked);
    CheckBox18.Checked :=inifile.ReadBool('info','back',CheckBox18.Checked);
//    CheckBox5.Checked :=inifile.ReadBool('info','fixdb',CheckBox5.Checked );
    CheckBox24.Checked :=inifile.ReadBool('info','save',CheckBox24.Checked );
//    CheckBox27.Checked :=inifile.ReadBool('info','baidu',CheckBox27.Checked );
//    CheckBox28.Checked :=inifile.ReadBool('info','pg18',CheckBox28.Checked );
    CheckBox12.Checked :=inifile.ReadBool('info','cici',CheckBox12.Checked  );
//    LabeledEdit2.Text :=inifile.ReadString('info','db',LabeledEdit2.Text);
    LabeledEdit7.Text :=inifile.ReadString('info','qrt',LabeledEdit7.Text);
    form1.Label16.Caption :=inifile.ReadString('info','dr',form1.Label16.Caption);
    LabeledEdit1.Text :=inifile.ReadString('info','record',LabeledEdit1.Text);
    LabeledEdit8.Text :=inifile.ReadString('info','outwall',LabeledEdit8.Text);
    CheckBox2.Checked :=inifile.ReadBool('info','openproxy',CheckBox2.Checked);
    CheckBox2.OnClick(self);
    CheckBox16.Checked :=inifile.ReadBool('info','opentvshow',CheckBox16.Checked);
    CheckBox16.OnClick(self);
    CheckBox3.Checked :=inifile.ReadBool('info','selnetpan',CheckBox3.Checked);
    CheckBox3.OnClick(self);
    ComboBox13.Text:=inifile.ReadString('info','ipc',ComboBox13.Text );
    CheckBox13.Checked :=inifile.ReadBool('info','openplay',CheckBox13.Checked);
    CheckBox13.OnClick(self);
    RadioGroup2.ItemIndex :=inifile.ReadInteger('info','start',RadioGroup2.ItemIndex);
    RadioGroup3.ItemIndex :=inifile.ReadInteger('info','tvshow',RadioGroup3.ItemIndex);
    HotKey1.HotKey :=inifile.ReadInteger('info','hotkey',0);
    HotKey2.HotKey :=inifile.ReadInteger('info','hotkey1',0);
    HotKey3.HotKey :=inifile.ReadInteger('info','hotkey2',0);
    HotKey4.HotKey :=inifile.ReadInteger('info','hotkey3',0);
    HotKey5.HotKey :=inifile.ReadInteger('info','hotkey4',0);
    HotKey6.HotKey :=inifile.ReadInteger('info','hotkey5',0);
    HotKey7.HotKey :=inifile.ReadInteger('info','hotkey6',0);
    HotKey8.HotKey :=inifile.ReadInteger('info','hotkey7',0);
    HotKey9.HotKey :=inifile.ReadInteger('info','hotkey8',0);
    CheckBox9.Checked :=inifile.ReadBool('info','guess',CheckBox9.Checked);
    Edit2.Text :=inifile.ReadString('info','favourite',Edit2.Text);
    ComboBox3 .Text:=inifile.ReadString('info','proxyadd',ComboBox3.Text);
    CheckBox4.Checked:=inifile.ReadBool('info','update',CheckBox4.Checked  );
    CheckBox6.Checked:=inifile.ReadBool('info','close',CheckBox6.Checked );
    CheckBox7.Checked :=inifile.ReadBool('info','open',CheckBox7.Checked);
    CheckBox8.Checked :=inifile.ReadBool('info','nomute',CheckBox8.Checked);
    form1.tvjh:=inifile.ReadString('info','tvjh',form1.tvjh);
    RadioGroup1.ItemIndex :=inifile.ReadInteger('info','timevolum',RadioGroup1.ItemIndex);
  finally
    inifile.Free;
end;
end;

procedure TForm2.Loadkindle;
var inifile:TIniFile;
begin
  try
    inifile:=Tinifile.Create(GetHomePath+'\kindle.dat');
    ComboBox4.Text  :=inifile.ReadString('info','drive',ComboBox4.Text);
    ComboBox7.ItemIndex := inifile.ReadInteger('info','kindlesys',ComboBox7.ItemIndex);
    ComboBox7.Oncloseup(self);
    Form1.Label16.Caption:=Form2.ComboBox7.Items[Form2.ComboBox7.ItemIndex];
    Edit4.Text :=inifile.ReadString('info','direct',Edit4.Text);
    ButtonedEdit1.Text :=inifile.ReadString('info','local',ButtonedEdit1.Text);
    CheckBox15.Checked :=inifile.ReadBool('info','open',CheckBox15.Checked);
  finally
    inifile.Free;
end;
end;

procedure TForm2.loadreg;
var inifile:TIniFile;
begin
  try
    inifile:=Tinifile.Create(GetHomePath+'\ARO\reg.aro');
    LabeledEdit4.Text :=inifile.ReadString('reg','regname',LabeledEdit4.Text);
    LabeledEdit5.Text :=inifile.ReadString('reg','regmail',LabeledEdit5.Text);
    LabeledEdit6.Text :=inifile.ReadString('reg','regcode',LabeledEdit6.Text);
    edit1.text:= inifile.ReadString('reg','trueregcode',Edit1.Text);
//    ComboBox7.ItemIndex:=inifile.ReadInteger('reg','version',ComboBox7.ItemIndex);

  finally
    inifile.Free ;
end;
end;



procedure TForm2.saveini;
var inifile:TIniFile;
begin
  try
    inifile:=Tinifile.Create(GetHomePath+'\option.dat');
    inifile.WriteBool('info','open',CheckBox7.Checked);
    inifile.WriteBool('info','toolbar3',CheckBox7.Checked);
    inifile.WriteBool('info','time',CheckBox29.Checked);
//    inifile.WriteBool('info','fixdb',CheckBox5.Checked);
    inifile.WriteBool('info','find',CheckBox22.Checked);
    inifile.WriteBool('info','auto',CheckBox25.Checked);
    inifile.WriteBool('info','today',CheckBox19.Checked);
    inifile.WriteBool('info','back',CheckBox18.Checked);
    inifile.WriteBool('info','lyric',CheckBox21.Checked);
    inifile.WriteBool('info','save',CheckBox24.Checked);
//    inifile.WriteBool('info','baidu',CheckBox27.Checked);
    inifile.WriteString('info','qrt',LabeledEdit7.Text);
//    inifile.WriteBool('info','adr',CheckBox11.Checked);
    inifile.WriteBool('info','start',CheckBox1.Checked);
    inifile.WriteBool('info','ap',CheckBox23.Checked);
    inifile.WriteBool('info','emptydj',CheckBox10.Checked);
//    inifile.WriteBool('info','pg18',CheckBox28.Checked);
    inifile.WriteBool('info','nomute',CheckBox8.Checked);
    inifile.WriteBool('info','cpu',CheckBox14.Checked);
    inifile.WriteBool('info','tvsee',CheckBox20.Checked);
    inifile.WriteInteger('info','rand',ComboBox11.ItemIndex);
    inifile.WriteInteger('info','color',ColorBox1.ItemIndex);
    inifile.WriteInteger('info','tv',ComboBox10.ItemIndex);
    inifile.WriteInteger('info','buffer',ComboBox1.ItemIndex);
    inifile.WriteInteger('info','dev',ListBox1.ItemIndex);
    inifile.WriteInteger('info','select',ComboBox12.ItemIndex);
    inifile.WriteInteger('info','showtext',ComboBox2.ItemIndex);
    inifile.WriteInteger('info','start',RadioGroup2.ItemIndex);
    inifile.WriteInteger('info','tvshow',RadioGroup3.ItemIndex);
    inifile.WriteInteger('info','hotkey',HotKey1.HotKey);
    inifile.WriteInteger('info','hotkey1',HotKey2.HotKey);
    inifile.WriteInteger('info','hotkey2',HotKey3.HotKey);
    inifile.WriteInteger('info','hotkey3',HotKey4.HotKey);
    inifile.WriteInteger('info','hotkey4',HotKey5.HotKey);
    inifile.WriteInteger('info','hotkey5',HotKey6.HotKey);
    inifile.WriteInteger('info','hotkey6',HotKey7.HotKey);
    inifile.WriteInteger('info','hotkey7',HotKey8.HotKey);
    inifile.WriteInteger('info','hotkey8',HotKey9.HotKey);
//    inifile.WriteInteger('info','show',ComboBox8.ItemIndex);
    inifile.WriteBool('info','openproxy',CheckBox2.Checked);
    inifile.WriteBool('info','opentvshow',CheckBox16.Checked);
    inifile.WriteBool('info','openplay',CheckBox13.Checked);
    inifile.WriteBool('info','ewm',CheckBox17.Checked);
    inifile.WriteString('info','proxyadd',ComboBox3.Text);
     inifile.writeString('info','ipc',ComboBox13.Text );
    inifile.WriteString('info','favourite',Edit2.Text);
    IniFile.WriteString('info','dr',form1.Label16.Caption );
     IniFile.WriteString('info','outwall',LabeledEdit8.Text);
    inifile.WriteInteger('info','timevolum',RadioGroup1.ItemIndex);
    inifile.writebool('info','update',CheckBox4.Checked);
    inifile.WriteBool('info','close',CheckBox6.Checked );
    inifile.WriteString('info','tvjh',form1.tvjh );
//    inifile.WriteString('info','db',LabeledEdit2.Text);
    inifile.WriteString('info','record',LabeledEdit1.Text);
    inifile.WriteString('info','proxysite',ComboBox3.Text);
    inifile.WriteBool('info','guess',CheckBox9.Checked);
    inifile.WriteBool('info','cici',CheckBox12.Checked);
    inifile.WriteBool('info','selnetpan',CheckBox3.Checked);
    inifile.WriteInteger('info','netpan',ComboBox6.ItemIndex);
  finally
    inifile.Free;
end;
end;

procedure TForm2.savereg;
var inifile:TIniFile;
begin
try
    inifile:=Tinifile.Create(GetHomePath+'\ARO\reg.aro');
    inifile.WriteString('reg','regname',LabeledEdit4.Text);
    inifile.writeString('reg','regmail',LabeledEdit5.Text);
    inifile.writeString('reg','regcode',LabeledEdit6.Text);
    inifile.writeString('reg','trueregcode',edit1.Text);
//    inifile.WriteInteger('reg','version',ComboBox7.ItemIndex);

finally
  inifile.Free ;
end;
end;

procedure TForm2.SpeedButton10Click(Sender: TObject);
begin
  if LabeledEdit7.Text<>'' then
    ShellExecute(handle,nil,PChar(LabeledEdit7.Text),nil,nil,SW_NORMAL)
  else
    Application.MessageBox('Setting QRcode save directory at first.', appname, MB_OK +
      MB_ICONWARNING + MB_TOPMOST);
end;

procedure TForm2.SpeedButton11Click(Sender: TObject);
begin
if Edit4.Text <>'' then
  savekindle
else
  Application.MessageBox('Please setting the user directory at first.', PChar(appname),
          MB_OK + MB_ICONINFORMATION);
  Loadkindle;
end;

procedure TForm2.SpeedButton11MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if button=mbRight then
//  if form1.DownloadFile(website+'pg18new.xls',Form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18new.xls') then
//    ShellExecute(0, nil, PChar(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18new.xls'), nil, nil, 1);

end;

procedure TForm2.SpeedButton12Click(Sender: TObject);
begin
 Form1.idMessage1.From.Address := '909332700@qq.com';  //发件人
  Form1.idMessage1.Recipients.EMailAddresses := LabeledEdit5.Text; //收件人
  Form1.idMessage1.Subject := 'Your aroplay information：'+'User: '+LabeledEdit4.Text+',Email: '+LabeledEdit5.Text;    //邮件主题
  try
    Form1.idsmtp1.Connect ;
    Form1.idSMTP1.Send(Form1.idMessage1);
    Application.MessageBox('You can find your information from your Email inbox.', appname, MB_OK +
      MB_ICONINFORMATION);
  except
    Application.MessageBox('Push failed,please retry.', appname, MB_OK +
      MB_ICONSTOP);
    Form1.idSMTP1.Disconnect;
    Exit;
  end;
end;



procedure TForm2.SpeedButton13Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar('http://www.aroplay.com/differ.html'),nil,nil,SW_NORMAL);

end;

procedure TForm2.SpeedButton14Click(Sender: TObject);
begin
SpeedButton15.enabled:=False;
SpeedButton14.enabled:=False;
SpeedButton16.enabled:=False;
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Downloading proxy software...';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
if form1.CheckOffline then
TThread.CreateAnonymousThread(outwall).Start
//outwall
else
Application.MessageBox('Downloading error, please check the network.', PChar(appname),
          MB_OK + MB_ICONINFORMATION);

end;

procedure TForm2.SpeedButton15Click(Sender: TObject);
begin
if OpenDialog1.Execute  then
LabeledEdit8.Text :=OpenDialog1.FileName;
end;

procedure TForm2.SpeedButton16Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar(LabeledEdit8.Text),nil,nil,SW_NORMAL);
end;

procedure TForm2.SpeedButton17Click(Sender: TObject);
begin
      ShellExecute(0, nil, PChar('http://www.aroplay.com/screen.html'), nil, nil, 1);
end;

procedure TForm2.SpeedButton19Click(Sender: TObject);
begin
HotKeyIndex8 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex8, HotKey8.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  if Form1.CheckOffline  then
    begin
      if form1.DownloadFile(website+'proxy.txt',GetHomePath+'\proxy.txt') then
        ComboBox3.Items.LoadFromFile(GetHomePath+'\proxy.txt');
        Application.MessageBox('Data import success, please choose it from the combobox.', PChar(appname),
          MB_OK + MB_ICONINFORMATION);

    end
  else
    Application.MessageBox('Please check it whether online or not!', appname, MB_OK + MB_ICONSTOP);
end;

procedure TForm2.SpeedButton20Click(Sender: TObject);
var
  info: BASS_DEVICEINFO;
  i: Integer;
begin

ListBox1.Clear ;
i := 1;
  while BASS_GetDeviceInfo(i, info) do
  begin
    ListBox1.Items.Add(string(info.name));
    Inc(i);
  end;
end;

procedure TForm2.SpeedButton21Click(Sender: TObject);
var
  lstDriver: TStringDynArray;
  strDriver: string;
  NotUsed  : DWORD;
  VolFlag  : DWORD;
  VolName  : array [0 .. 255] of Char;
begin
  lstDriver := TDirectory.GetLogicalDrives;
  for strDriver in lstDriver do
  begin
    if GetVolumeInformation(PChar(strDriver), VolName, Length(VolName), nil, NotUsed, VolFlag, nil, 0) then
      if VolName='Kindle' then
      begin
      ComboBox4.Text := strDriver;
       with form1.TrayIcon1 do
          begin
            BalloonTitle := appname;
            BalloonHint := 'Kindle connects success!';
            BalloonFlags := bfInfo;
            ShowBalloonHint;
           end;
      end;
//      else begin
//      Application.MessageBox('未找到 Kindle 阅读器，请手工链接', appname, MB_OK +
//        MB_ICONINFORMATION);
//      Break;
//      end;

  end;
end;


procedure TForm2.SpeedButton22Click(Sender: TObject);
var
  archiver:TZipForge;
  filesize:integer;
  dr:string;
begin
Cursor:=crHourGlass;
GroupBox19.Enabled:=false;
ProgressBar1.Visible:=True ;
archiver := TZipForge.Create(nil);
  idftp1.Connect;
  idftp1.ChangeDir('wwwroot/sdk');
  FileSize:= idftp1.Size('codecs.zip');
  ProgressBar1.Max := FileSize;
  ProgressBar1.Step := 10;
  dr:=GetHomePath+'\codecs.zip';
  idftp1.Get('codecs.zip', PChar(dr), True);
   try
  with archiver do
  begin
    FileName := PChar(GetHomePath)+'\codecs.zip';
    OpenArchive(fmOpenRead);
    BaseDir := 'C:\Users\Public\Thunder Network\APlayer\';
    ExtractFiles('*.*');
    CloseArchive();
    Application.MessageBox('Update success!', appname, MB_OK + MB_ICONINFORMATION);
    ProgressBar1.Visible:=False ;
    GroupBox19.Enabled:=true;
  end;
  except
  on E: Exception do
    begin
      Writeln('Error code: ', E.Message);
      Readln;
      GroupBox19.Enabled:=true;
    end;
  end;
IdFTP1.Disconnect;
end;

procedure TForm2.SpeedButton23Click(Sender: TObject);
begin
HotKeyIndex4 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex4, HotKey4.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.SpeedButton24Click(Sender: TObject);
begin
HotKeyIndex5 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex5, HotKey5.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.SpeedButton25Click(Sender: TObject);
begin
HotKeyIndex6 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex6, HotKey6.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.SpeedButton26Click(Sender: TObject);
begin
HotKeyIndex7 := form1.HotKeyManager1.ChangeHotKey(HotKeyIndex7, HotKey7.HotKey);
with form1.trayicon1 do
  begin
    Visible:=true;
    BalloonTitle:=Appname;
    BalloonHint:='Shortcuts is working!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
Panel15.Visible :=not Panel15.Visible ;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
var dr:string;
begin
Savekindle;
Loadkindle ;
if form2.ComboBox4.Enabled  then
dr:=form2.ComboBox4.text+edit4.text
else
dr:=form2.Edit4.text;
if (ButtonedEdit1.Text <>'') and (dr<>'') then
begin
try
form1.DirectoryCopy(ButtonedEdit1.Text,dr);
Application.MessageBox('Sync complete!', appname, MB_OK + MB_ICONINFORMATION);

except
Application.MessageBox('ync failed, please check it whether connect the Kindle or not.', appname, MB_OK +
  MB_ICONSTOP);
end;
end
else
  Application.MessageBox('Not found the sync directory, please check the kindle-reader!', appname, MB_OK +
  MB_ICONWARNING);
end;

//procedure TForm2.Updatepg18;
//var data:array of string;  i:Integer; cdsnew:Tclientdataset;
//MyStream:TMemoryStream;
//begin
//if Form1.CheckOffline then
//begin
//form1.TreeView1.Select(form1.TreeView1.Items[0]);
//form1.Cursor :=crhourglass;
//with form1.TrayIcon1 do
//  begin
//    BalloonTitle :=appname;
//    BalloonHint:='正在更新PG18电视台...';
//    BalloonFlags:=bfInfo ;
//    ShowBalloonHint ;
//  end;
//try
//    cdsnew:=TClientDataSet.Create(nil);
//    mystream:=TMemoryStream.Create;
//    DeleteUrlCacheEntry(PWideChar(website+'download/cn/pg18.cds'));
//    idhttp1.Get(website+'download/cn/pg18.cds',MyStream);
//    MyStream.SaveToFile(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18.cds');
//    Form1.ClientDataSet1.Edit ;
//    cdsnew.LoadFromFile(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18.cds');
////    ShowMessage(IntToStr(cdsnew.RecordCount ));
//  try
//  SetLength(data,10000);
//
//  try
//    Form1.ClientDataSet1.DisableControls;
//  cdsnew.First;
//  i := 0;
//  while not cdsnew.Eof do
//  begin
//    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
//    cdsnew.Next;
//    i := i + 1;
//  end;
//
//  for i := 0 to cdsnew.RecordCount - 1 do
//  begin
//    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
//    begin
//    Form1.ClientDataSet1.Edit;
////    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
////    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
////    Form1.ClientDataSet1.FieldByName('视频类型').AsString:=cdsnew.FieldByName('视频类型').AsString;
//    Form1.ClientDataSet1.Post;
//    end
//    else begin
//
//    form1.ClientDataSet1.Insert ;
//    cdsnew.Locate('电台名称',data[i],[]);
//    Form1.ClientDataSet1.FieldByName('视频类型').AsString:=cdsnew.FieldByName('视频类型').AsString;
//    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
//    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
//    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
//    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
//    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
//    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
//    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
//    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
//    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
//
//    //    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';
//
//    Form1.ClientDataSet1.Post;
//
//  end;
//     cdsnew.next;
//
//  end;
////  Application.MessageBox(pchar('PG18+电视台更新成功！'), Appname, MB_OK + MB_ICONQUESTION);
////  form1.Cursor :=crdefault;
//  finally
//  form1.ClientDataSet1.EnableControls ;
//
//  end;
//form1.ClientDataSet1.MergeChangeLog ;
// form1.ClientDataSet1.ApplyUpdates(-1);
// form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
// form1.ClientDataSet1.close;
//
// form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
// form1.ClientDataSet1.open;
// form1.TreeView1.Select(form1.TreeView1.Items[101]);
// with form1.TrayIcon1 do
//  begin
//    BalloonTitle :=appname;
//    BalloonHint:='PG18+电视台更新完成!';
//    BalloonFlags:=bfInfo ;
//    ShowBalloonHint ;
//  end;
//  if form1.DownloadFile(website+'/pg18+/pg18.txt',form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18.txt') then
//    ShellExecute(0, nil, PChar(form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18.txt'), nil, nil, 1);
//
////  if FileExists(form1.GetShellFolders('Personal')+'\ARO'+'\'+'sex.cds') then
////  Deletefile(form1.GetShellFolders('Personal')+'\ARO'+'\'+'sex.cds') ;
//
//except
//  Application.MessageBox('下载失败，请检查是否联网或稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);
//end;
//finally
//  cdsnew.Free;
//  MyStream.free;
//
//end;
// form2.Close;
//end
//else
//  Application.MessageBox('下载失败，请检查是否联网!', appname, MB_OK +
//    MB_ICONWARNING);
//end;


procedure TForm2.SpeedButton4Click(Sender: TObject);
var test:string;
begin
  if selectdirectory('Select recording file directory.','',test) then
  begin
    LabeledEdit1.Text :=test ;
  end;
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
   if LabeledEdit1.Text<>'' then
    ShellExecute(handle,nil,PChar(LabeledEdit1.Text),nil,nil,SW_NORMAL)
  else
    Application.MessageBox('Select the directory.', appname, MB_OK +
      MB_ICONWARNING + MB_TOPMOST);

end;



procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  TrackBar1.Position := 44100;
end;

procedure TForm2.SpeedButton8Click(Sender: TObject);
var test:string;
begin
  if selectdirectory('Select the directory:','',test) then
  begin
    LabeledEdit7.text :=test ;
  end;
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
var  text:string;
begin
if selectdirectory('Select the directory:','/',text) then
begin
  Edit4.Text :=text;
end;
end;

procedure TForm2.TabSheet6MouseLeave(Sender: TObject);
begin
//Label12.Font.Color :=clBlue ;
end;

procedure TForm2.ToolButton2Click(Sender: TObject);
begin
//  case ToolButton2.ImageIndex  of
//    0:shellExecute(handle,'open',PChar('http://baike.baidu.com/view/1310.htm'),nil,nil,SW_NORMAL);
//    1:shellExecute(handle,'open',PChar('http://baike.baidu.com/view/5035.htm'),nil,nil,SW_NORMAL);
//    2:shellExecute(handle,'open',PChar('http://baike.baidu.com/view/1864939.htm'),nil,nil,SW_NORMAL);
//
//
//  end;
end;

procedure TForm2.TrackBar1Change(Sender: TObject);
var freq:Single;
begin
freq:=44100;
BASS_ChannelSlideAttribute(chan,BASS_ATTRIB_FREQ,TrackBar1.Position,0);
BASS_ChannelGetAttribute(chan,BASS_ATTRIB_FREQ,freq);
end;

procedure TForm2.TrackBar2Change(Sender: TObject);
begin
//BASS_RecordSetInput(Form2.ComboBox5.ItemIndex, 0, TrackBar2.Position / 100);
//Label14.Caption := IntToStr(TrackBar2.Position);
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
if Node.Text ='General' then
Notebook1.PageIndex :=0
else if Node.Text ='Proxy' then
Notebook1.PageIndex :=1
else if Node.Text ='Play' then
Notebook1.PageIndex:=2
else if Node.Text ='Record' then
Notebook1.PageIndex:=3
else if Node.Text ='Update' then
Notebook1.PageIndex :=4
else if Node.Text ='Backup' then
Notebook1.PageIndex :=5
else if Node.Text ='UI' then
Notebook1.PageIndex :=6
else if Node.Text ='Register' then
Notebook1.PageIndex :=7
else if Node.Text ='Kindle' then
Notebook1.PageIndex :=9
else if Node.Text ='Shortcuts' then
Notebook1.PageIndex :=10
else if Node.Text ='Default' then
Notebook1.PageIndex :=11
else if Node.Text ='Audio' then
Notebook1.PageIndex :=12;

Form2.Caption:=node.Text+' Setting';

end;

end.
