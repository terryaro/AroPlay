unit video;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, OleCtrls, ImgList,
  pngimage, StdCtrls,IniFiles, OleServer,ShellAPI, SHDocVw, WinInet, Buttons,
  AppEvnts, Menus ;

const
url='http://g.alicdn.com/de/prismplayer-flash/1.2.16/PrismPlayer.swf?vurl=';
xunlei='https://www.abroadradio.net/aplayer.html?videourl=';

type
  TForm7 = class(TForm)
    WebBrowser1: TWebBrowser;
    ApplicationEvents1: TApplicationEvents;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure WebBrowser1NewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure Panel3MouseEnter(Sender: TObject);
    procedure Panel3MouseLeave(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure WebBrowser1Enter(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
//    procedure ToolButton9Click(Sender: TObject);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure Panel5MouseEnter(Sender: TObject);
    procedure Notebook1MouseLeave(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
  private
//    FOnTop: Boolean;
//    procedure Playchannel(n:Integer); //播放电视台
//    procedure loadvideo; //导入窗体
//    procedure savevideo; //设定窗体
//    procedure AppMessage(var Msg:TMsg;var Handled:Boolean);

  public
    avkind,stationname,stationkind,stationadd,stationforcast:string;
//    procedure CreateParams(var Params: TCreateParams); override;
//    procedure Stayon; //始终显示在最前面



  end;

var
  Form7: TForm7;
  s2:string;
//  count:integer=0;
implementation

uses main, setting, time, pdset, DayplayThread;

{$R *.dfm}

procedure TForm7.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
if ((Msg.message = WM_RBUTTONDOWN) or (Msg.message = WM_RBUTTONUP)) then  Handled := true;

end;








//procedure TForm7.AppMessage(var Msg: TMsg; var Handled: Boolean);
//begin
//if(Msg.message = WM_LButtonDown)and(DefWindowProc
//(Handle,WM_NCHitTest,0,GetMessagePos) = HTClient)
//   then
//   begin
//     SendMessage(Handle,WM_NCLButtonDown,HTCaption,GetMessagePos);
//     Handled := True;
//   end;
//
//end;

//procedure TForm7.CreateParams(var Params: TCreateParams);
//begin
//  inherited CreateParams(Params);
//  with params do
//  begin
//    ExStyle:=ExStyle or WS_EX_TOPMOST;
//    WndParent:=GetDesktopWindow;
//  end;
//
//end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.PopupMenu1.Items[6].visible :=true ;
   form1.PopupMenu1.Items[5].visible:=true ;
   form1.PopupMenu1.Items[4].visible:=true ;
   form1.PopupMenu1.Items[7].visible:=true ;
   form1.TrayIcon1.IconIndex:=8;
//  SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0,SWP_NoMove or SWP_NoSize);
//  if stationkind='网页电台' then
//  begin
      if form1.ToolButton2.Tag =1 then
//  begin
        form1.ToolButton2.Click ;

//      Form1.Label5.Caption :='0.000';

      action:=caFree;


  end;

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//savevideo;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
//Set8087CW(Default8087CW or $0004);
//Set8087CW(Longword($133f));
//FOnTop := False;
//Application.OnMessage := AppMessage;
WebBrowser1.Offline:=True;
end;

procedure TForm7.FormDestroy(Sender: TObject);
begin
//savevideo ;
end;

procedure TForm7.FormKeyPress(Sender: TObject; var Key: Char);
begin
//case Key of
//#48: SpeedButton1.Click ;
//#49: SpeedButton2.Click ;
//#50: SpeedButton3.Click ;
//#51: SpeedButton4.Click ;
//#52: SpeedButton5.Click ;
//#53: SpeedButton6.Click ;
//#54: SpeedButton7.Click ;
//#55: SpeedButton8.Click ;
//#56: SpeedButton9.Click ;
//#57: SpeedButton10.Click ;
end;


procedure TForm7.FormMouseEnter(Sender: TObject);
begin
//BorderStyle:=bsSizeable;
end;

procedure TForm7.FormMouseLeave(Sender: TObject);
begin
//BorderStyle:=bsNone ;
end;

//end;

procedure TForm7.FormShow(Sender: TObject);
begin
  form2.loadini;
//  loadvideo ;
//  Label1.Caption:='当前已设定了'+#32+inttostr(count)+#32+'个频道';
//  if form2.CheckBox11.Checked  then
//  Panel1.Visible :=False
//  else
//  panel1.Visible :=true;
//  WebBrowser1.Refresh ;
  stationadd :=Form1.videoadd ;
  stationkind :=form1.videokind;
  stationname:= form1.videonname ;
  stationforcast:=form1.videoforcast;
  avkind:=form1.radiokind ;
  Form1.title2:=stationname;

  form7.Caption :='AbroadRadio TV - '+FORM1.tvname;
   form1.PopupMenu1.Items[5].visible:=False ;
   form1.PopupMenu1.Items[7].visible:=False ;
   form1.PopupMenu1.Items[4].visible:=False ;
   if form1.CheckOffline  then
   begin
      if stationkind='电视台' then
        begin
//          Notebook1.PageIndex :=1;
//          WebBrowser1.Refresh;
          WebBrowser1.Navigate(stationadd);
//          form1.PopupMenu1.Items[6].visible :=true ;
        end;

      if (stationkind='电视台') and (avkind='rtmp | m3u8') then
        begin
//          WebBrowser1.Refresh;
//          if Form2.CheckBox23.Checked then
          WebBrowser1.Navigate(Trim(xunlei+stationadd))
//          else
//          Application.MessageBox('此电视台需要 Aplayer 引擎支持，请先勾选《启用 Aplayer 播放插件》选项。', PChar(appname), MB_OK + MB_ICONWARNING);
//          WebBrowser1.Navigate(Trim(url+stationadd));
//          form1.PopupMenu1.Items[6].visible :=true ;
        end;
   end
   else
   Application.MessageBox('播放错误，请查看系统是否已联网。', PChar(appname), MB_OK + MB_ICONWARNING);
  if Form1.tv  then
   form1.Timer4.Enabled :=true
  else
    Form1.Timer4.Enabled :=False ;



end;


procedure TForm7.Notebook1MouseLeave(Sender: TObject);
begin
end;

//end;

//procedure TForm7.loadvideo;
//var t:TIniFile ;
//begin
//  try
//    t:=tIniFile.Create(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'video.ini');
//    count:=t.ReadInteger('video','count',count);
//  finally
//    t.Free ;
//  end;
//
//end;


procedure TForm7.Panel1MouseEnter(Sender: TObject);
begin
//panel1.Visible:=True;
//Panel1.Height:=30;
end;

procedure TForm7.Panel1MouseLeave(Sender: TObject);
begin
Form7.BorderStyle:=bsSizeable ;
//panel1.Visible:=false;
//Panel1.Height:=5;
end;

procedure TForm7.Panel3MouseEnter(Sender: TObject);
begin
//panel1.Visible:=true;
//Panel1.Height:=30;
end;

procedure TForm7.Panel3MouseLeave(Sender: TObject);
begin
//panel1.Visible:=False ;
//Panel1.Height:=0;
end;

procedure TForm7.Panel5MouseEnter(Sender: TObject);
begin
//Panel1.Visible:=false;
end;

//procedure TForm7.Playchannel(n:integer);
//var i:tinifile;slSections:TStringList;j:Integer;
//begin
//  try
//    i:=TIniFile.Create(form1.GetShellFolders('Personal')+'\ARO'+'\'+'arotvc.dat');
//    slSections := TStringList.Create;
//    i.ReadSectionValues('tv',slSections);
//    WebBrowser1.Navigate(slSections.ValueFromIndex[n]);
//    i.ReadSection('tv',slSections);
//    form7.Caption :='AbroadRadio TV - '+slsections.strings[n];
//  finally
//    i.free;
//  end;


//  end;

//procedure TForm7.savevideo;
//var t:TIniFile ;
//begin
//  try
//    t:=tIniFile.Create(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'video.ini');
//    t.WriteInteger('video','count',count);
//  finally
//    t.Free ;
//  end;
//end;


procedure TForm7.SpeedButton10Click(Sender: TObject);
begin
//playchannel(9);
end;

procedure TForm7.SpeedButton15Click(Sender: TObject);
begin



//if SpeedButton15.Down then
//begin
//Timer1.Enabled:=true;
//SpeedButton15.Hint :='取消置顶';
//end
//else begin
//Timer1.Enabled:=false;
//SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0,SWP_NoMove or SWP_NoSize);
//SpeedButton15.hint:='置顶';
//end;
end;

procedure TForm7.SpeedButton17Click(Sender: TObject);
begin
//SpeedButton15.Down:=true;
//SpeedButton15Click(nil);
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
//Playchannel(0);
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
//Playchannel(1);
end;

procedure TForm7.SpeedButton3Click(Sender: TObject);
begin
//Playchannel(2);
end;

procedure TForm7.SpeedButton4Click(Sender: TObject);
begin
//Playchannel(3);
end;

procedure TForm7.SpeedButton5Click(Sender: TObject);
begin
//Playchannel(4);
end;

procedure TForm7.SpeedButton6Click(Sender: TObject);
begin
//Playchannel(5);
end;

procedure TForm7.SpeedButton7Click(Sender: TObject);
begin
//Playchannel(6);
end;

procedure TForm7.SpeedButton8Click(Sender: TObject);
begin
//Playchannel(7);
end;

procedure TForm7.SpeedButton9Click(Sender: TObject);
begin
//Playchannel(8);
end;

//procedure TForm7.Stayon;
//begin
//if FOnTop then
//  begin
//    取消置顶
//    SetWindowPos(Self.Handle,HWND_NOTOPMOST,Left,Top,Width,Height,0);
//    FOnTop := False;
//    ToolButton1.ImageIndex:=5;
//  end else begin
    //置顶
//    FOnTop := True;
//    SetWindowPos(Self.Handle,HWND_TOPMOST,Left,Top,Width,Height,0);
//    ToolButton1.ImageIndex:=0;
//  end;
//end;

procedure TForm7.Timer1Timer(Sender: TObject);
begin

//TThread.CreateAnonymousThread( //直接写入方法体
//    procedure
//    begin
//      SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,SWP_NoMove or SWP_NoSize);
//    end //此处无分号
//  ).Start;


end;

procedure TForm7.ToolButton3Click(Sender: TObject);
//var i:tinifile;
begin
//Loadvideo;
//if count<9 then
//begin
//  try
//    i:=TIniFile.Create(FORM1.GetShellFolders('Personal')+'\ARO'+'\'+'arotvc.dat');
//    i.writestring('tv',stationname,stationadd);
//  finally
//    I.Free;
//  end;
//  Inc(Count);
//  savevideo;
end;
//else
//Application.MessageBox('软件最多只能设定10个频道,如需更改,请按右侧的<重置电视台频道>按钮进行更改.', appname, MB_OK +
//      MB_ICONINFORMATION);
//end;

procedure TForm7.ToolButton4Click(Sender: TObject);
//var i:tinifile;slSections:TStringList;
begin
//  try
//    i:=TIniFile.Create(form1.GetShellFolders('Personal')+'\ARO'+'\'+'arotvc.dat');
//    slSections := TStringList.Create;
//    i.ReadSection('tv',slSections);
//    Application.MessageBox(PWideChar('以下为 0-9 电视台频道清单'+#13+'注：只截取前10个频道'+#13+#13+slSections.Text), appname, MB_OK +
//      MB_ICONINFORMATION);
//  finally
//    i.Free;
//  end;
end;

procedure TForm7.ToolButton5Click(Sender: TObject);
begin
//WebBrowser1.Refresh ;
end;

procedure TForm7.ToolButton7Click(Sender: TObject);
begin
//Panel1.Visible:=not Panel1.Visible;
end;

//procedure TForm7.ToolButton9Click(Sender: TObject);
//begin
//case Application.MessageBox('是否需要重置频道列表? (注,此步骤不可恢复！)', appname, MB_OKCANCEL +
//  MB_ICONQUESTION) of
//  IDOK:
//    begin
//      DeleteFile(form1.GetShellFolders('Personal')+'\ARO'+'\'+'arotvc.dat');
//      DeleteFile(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'video.ini');
//      count:=0;
//      Label1.Caption:='当前设置频道数为 0';
//    end;
//  IDCANCEL:
//    begin
//
//    end;
//end;
//end;

procedure TForm7.WebBrowser1DownloadComplete(Sender: TObject);
var url:string;
begin
if url=stationadd  then
  begin
    WebBrowser1.oleobject.Document.body.style.width:= '600px';
    WebBrowser1.oleobject.Document.body.style.height:= '400px' ;
    WebBrowser1.oleobject.Document.body.style.overflow:= 'hidden';
  end;
end;

procedure TForm7.WebBrowser1Enter(Sender: TObject);
begin
//panel1.Visible:=False;
end;

procedure TForm7.WebBrowser1NewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
Cancel:=True ;
end;




end.





