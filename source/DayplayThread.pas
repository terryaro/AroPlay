unit DayplayThread;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  jpeg, ImgList,shellapi, IdDayTime, IdBaseComponent, IdComponent,bass,
  IdTCPConnection, IdTCPClient,registry, DB, ADODB, DBClient,MidasLib,OleCtrls,
  Clipbrd,TlHelp32, UrlMon,pngimage,WinInet,IniFiles,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP,ShlObj,FileCtrl,DateUtils,
  Provider, SHDocVw, GIFImg,ThreadTimer,bassenc,bassenc_mp3,basshls,basswma,
  CommCtrl,MMSystem,xpmute,Mmdevapi,ActiveX,StrUtils;

type
  Day = class(TThread)
  private
    ftimer:TTimer;
  procedure timerontimer(sender:TObject);
  protected
    procedure Execute; override;
  public
    constructor  Create;
    destructor destroy;override ;
  end;


//type
//  forcast = class(TThread)
//  private
//    ftimer:TTimer;
//  procedure timerontimer(sender:TObject);
//  protected
//    procedure Execute; override;
//  public
//    constructor  Create;
//    destructor destroy;override ;
//  end;

implementation

uses main, setting, time;

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Day.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ Day }

constructor Day.Create;
begin
  inherited Create(False);
  ftimer:=ttimer.create(nil);
  ftimer.interval:=1000;
  ftimer.ontimer:=timerontimer;
  ftimer.enabled:=true;
//  if (form2.CheckBox18.checked) and (form1.ToolButton23.Tag=0) then
//                      form1.ToolButton23.click;
//    Sleep(1000);
end;

destructor Day.destroy;
begin
  ftimer.free;
  inherited;
end;

procedure Day.Execute;
begin
  inherited;

end;

procedure Error(es: string);
begin
  MessageBox(win, PChar(es + #13#10 + '(error code: ' + IntToStr(BASS_ErrorGetCode) +
    ')'), nil, 0);
end;

{ update stream title from metadata }

procedure DoMeta();
var
  meta: PAnsiChar;
  p: Integer;
begin
  meta := BASS_ChannelGetTags(chan, BASS_TAG_META);
  if (meta <> nil) then
  begin
    p := Pos('StreamTitle=', String(AnsiString(meta)));
    if (p = 0) then
      Exit;
    p := p + 13;
    SendMessage(win, WM_INFO_UPDATE, 7, DWORD(PAnsiChar(AnsiString(Copy(meta, p, Pos(';', String(meta)) - p - 1)))));
  end;
end;

procedure MetaSync(handle: HSYNC; channel, data: DWORD; user: Pointer); stdcall;
begin
  DoMeta();
end;

procedure StatusProc(buffer: Pointer; len: DWORD; user: Pointer); stdcall;
begin
  if (buffer <> nil) and (len = 0) then
    SendMessage(win, WM_INFO_UPDATE, 8, DWORD(PAnsiChar(buffer)));
end;

function OpenURL1(url: PAnsiChar): Integer;
var
  icy: PAnsiChar;
  Len, Progress: DWORD;
  youlikename,youlikecoutry,m3u8:String;
begin
  Result := 0;
  form1.title2:='';
  form1.Timer2.Enabled :=True ;
  BASS_StreamFree(chan); // close old stream
  progress := 0;
  SendMessage(win, WM_INFO_UPDATE, 0, 0); // reset the Labels and trying connecting
  BASS_ChannelStop(chan);
  form1.title4:=form1.ClientDataSet2.FieldByName('电台名称').AsString;
  youlikecoutry:=form1.ClientDataSet2.FieldByName('电台国家').AsString;
  youlikename:=form1.ClientDataSet2.FieldByName('电台类别').asstring;
  m3u8:=form1.ClientDataSet2.FieldByName('电台地址').asstring;
  if AnsiContainsText(m3u8,'.m3u8') then
    Chan:= BASS_HLS_StreamCreateURL(PWideChar(url), BASS_STREAM_BLOCK  or BASS_STREAM_STATUS or BASS_STREAM_AUTOFREE, nil, nil)
  else
    chan:= BASS_StreamCreateURL(PWideChar(url), 0, BASS_STREAM_BLOCK  or BASS_STREAM_STATUS or BASS_STREAM_AUTOFREE, @StatusProc, nil);

  if (chan = 0) then
  begin
    SendMessage(win, WM_INFO_UPDATE, 1, Bass_ErrorGetCode()); // Oops Error
  end
  else
  begin
    // Progress
    repeat
      len := BASS_StreamGetFilePosition(chan, BASS_FILEPOS_END);
      if (len = DW_Error) then
        break; // something's gone wrong! (eg. BASS_Free called)
      progress := BASS_StreamGetFilePosition(chan, BASS_FILEPOS_BUFFER) * 100 div len;
      // percentage of buffer filled
      SendMessage(win, WM_INFO_UPDATE, 2, progress); // show the Progess value in the label
    until
      (progress > 75) or (BASS_StreamGetFilePosition(chan, BASS_FILEPOS_CONNECTED) = 0); // over 75% full (or end of download)
//    DoMeta();
    BASS_ChannelSetSync(chan, BASS_SYNC_META, 0, @MetaSync, nil);
    // play it!
    BASS_ChannelPlay(chan, FALSE);

//
  end;
  form1.title2:=form1.title4;
  cthread := 0;
end;


function OpenURL2(url: PAnsiChar): Integer;
var
  icy: PAnsiChar;
  Len, Progress: DWORD;
  youlikename,youlikecoutry,m3u8:String;
begin
  Result := 0;
  form1.title2:='';
  form1.Timer2.Enabled :=True ;
  BASS_StreamFree(chan); // close old stream
  progress := 0;
  SendMessage(win, WM_INFO_UPDATE, 0, 0); // reset the Labels and trying connecting
  BASS_ChannelStop(chan);
  form1.title4:=form1.ClientDataSet2.FieldByName('电台名称').AsString;
  youlikecoutry:=form1.ClientDataSet2.FieldByName('电台国家').AsString;
  youlikename:=form1.ClientDataSet2.FieldByName('电台类别').asstring;
  m3u8:=form1.ClientDataSet2.FieldByName('电台地址').asstring;
//   if (form2.CheckBox18.checked) and (form1.ToolButton23.Tag=0) then
//     form1.ToolButton23.click;
  if AnsiContainsText(m3u8,'.m3u8') then
    Chan:= BASS_HLS_StreamCreateURL(PWideChar(url), BASS_STREAM_BLOCK  or BASS_STREAM_STATUS or BASS_STREAM_AUTOFREE, nil, nil)
  else
    chan:= BASS_StreamCreateURL(PWideChar(url), 0, BASS_STREAM_BLOCK  or BASS_STREAM_STATUS or BASS_STREAM_AUTOFREE, @StatusProc, nil);

  if (chan = 0) then
  begin
    SendMessage(win, WM_INFO_UPDATE, 1, Bass_ErrorGetCode()); // Oops Error
  end
  else
  begin
    // Progress
    repeat
      len := BASS_StreamGetFilePosition(chan, BASS_FILEPOS_END);
      if (len = DW_Error) then
        break; // something's gone wrong! (eg. BASS_Free called)
      progress := BASS_StreamGetFilePosition(chan, BASS_FILEPOS_BUFFER) * 100 div len;
      // percentage of buffer filled
      SendMessage(win, WM_INFO_UPDATE, 2, progress); // show the Progess value in the label
    until
      (progress > 75) or (BASS_StreamGetFilePosition(chan, BASS_FILEPOS_CONNECTED) = 0); // over 75% full (or end of download)
//    DoMeta();
    BASS_ChannelSetSync(chan, BASS_SYNC_META, 0, @MetaSync, nil);
    // play it!

    BASS_ChannelPlay(chan, FALSE);
    if Form2.CheckBox18.Checked then
     BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, 0)
     else
     BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, 1);

    form1.PopupMenu1.items[5].items[3].tag:=1;
       form1.PopupMenu1.items[5].items[3].caption:='Umute';
       form1.ToolButton23.ImageIndex :=35;
       form1.ToolButton23.tag:=1;
       form1.toolbutton23.Hint:='Umute';
       form1.TrayIcon1.IconIndex:=2;
    BASS_Encode_MP3_StartFile(chan, nil,BASS_ENCODE_LIMIT or BASS_UNICODE,PWideChar(changefileext(Form2.LabeledEdit1.Text+'\'+form1.title4+' - ',FormatDateTime('yyyymmddhhnnss',now)+'.mp3')));

//
  end;
  form1.title2:=form1.title4;
  cthread := 0;
end;



procedure Day.timerontimer(sender: TObject);
  var
Found,xunhuan: Boolean; s1,a,fn:string;
  mp:AnsiString ; ID: DWORD;
begin
  Found := False;
  form1.ClientDataSet2.DisableControls;
  form1.clientdataset2.edit;
  form1.ClientDataSet2.First;
//  BASS_ChannelStop(chan);
    try
        while (not form1.ClientDataSet2.Eof) and (not Found) do
        begin
            if (((form1.ClientDataSet2.FieldByName('周期').asstring='') and (FormatDateTime('hh:mm:ss',form1.ClientDataSet2.FieldByName('开始时间').asdatetime) = formatdatetime('hh:mm:ss',now)))
              or ((form1.ClientDataSet2.FieldByName('周期').asstring<>'')  and (FormatDateTime('dddd',now)=form1.ClientDataSet2.FieldByName('周期').asstring)
             and (FormatDateTime('hh:mm:ss',form1.ClientDataSet2.FieldByName('开始时间').asdatetime) = formatdatetime('hh:mm:ss',now)))
             or ((form1.ClientDataSet2.FieldByName('周期').asstring<>'')  and (FormatDateTime('yyyy-mm-dd',now)=form1.ClientDataSet2.FieldByName('周期').asstring)
             and (FormatDateTime('hh:mm:ss',form1.ClientDataSet2.FieldByName('开始时间').asdatetime) = formatdatetime('hh:mm:ss',now)))
             )
             and (form1.ClientDataSet2.FieldByName('计划类型').asstring<>'') then
            begin
              Found := True;
              form1.title5:=form1.ClientDataSet2.FieldByName('电台名称').asstring;
              Form1.videonname :=form1.title5;
              Form1.videokind :=form1.ClientDataSet2.FieldByName('电台类型').asstring;
              form1.videoadd :=form1.ClientDataSet2.FieldByName('电台地址').asstring;
              form1.s2:=form1.ClientDataSet2.FieldByName('完成动作').asstring;
              form1.s3:=form1.ClientDataSet2.FieldByName('计划类型').asstring;
              i:=form1.ClientDataSet2.FieldByName('间隔').asinteger;
              form1.rdfile :=true;
//              Form1.DBGrid1CellClick(Form1.DBGrid1.Columns[1]);
              Break;
            end;
            form1.ClientDataSet2.Next;
        end;
    finally
        form1.ClientDataSet2.EnableControls;
    end;


        if not form1.ClientDataSet2.Eof  then
          begin

            s1:=form1.ClientDataSet2.FieldByName('计划类型').asstring;
            if Form2.CheckBox6.Checked  then
                Form1.Killthunder ;


              if s1='Timing playing' then
              begin
                if form1.CheckOffline   then
                begin
                  with form1.TrayIcon1 do
                    begin
                      BalloonTitle :=appname;
                      BalloonHint:=form1.ClientDataSet2.FieldByName('计划类型').asstring+#32+form1.title5;
                      BalloonFlags:=bfInfo ;
                      ShowBalloonHint ;
                    end;
                    ftimer.Enabled :=true;
//                    if form1.TrayIcon1.IconIndex=2 then
//                      form1.PopupMenu1.Items[5].Items[8].Click ;
                if form1.ClientDataSet2.FieldByName('视频类型').asstring<>'电视台' then
                begin
//                  form1.WindowsMediaplayer1.controls.stop ;
//                  form1.FlyFlv1.StopMovie ;
                  form1.Timer2.Enabled :=True;
                    if form1.ClientDataSet2.FieldByName('电台类型').asstring='Common' then
                      begin
                      BASS_ChannelStop(chan);
//                        form1.WindowsMediaPlayer1.URL:=Form1.ClientDataSet2.FieldByName('电台地址').asstring;
                        mp:=Form1.ClientDataSet2.FieldByName('电台地址').asstring;
                        if Form2.checkbox2.Checked then
                          BASS_SetConfigPtr(BASS_CONFIG_NET_PROXY, nil) // disable proxy
                        else
                          BASS_SetConfigPtr(BASS_CONFIG_NET_PROXY, PWideChar(Form2.ComboBox3.Text)); // set proxy server
//                          form1.DBGrid1DblClick(self);
                          cthread := BeginThread(nil, 0, @OpenURL1, PAnsiChar(mp), 0, Id);
                          playstatus :=2;
                          Application.title:=form1.title5;
                          Form1.Caption:= Application.title;
//                          Form1.Notebook3.PageIndex:=1;
//                          Application.title:=Form1.tvname;
//                          Form1.Caption:= Application.title;
//                          Form1.title2:=Form1.Caption;
//                          Form1.title5:=Form1.title2;

                      end;
//                      else begin
//                          form1.FlyFlv1.PlayMovie(form1.ClientDataSet2.FieldByName('电台地址').asstring);
//                          form1.d:=Now;
//                          playstatus:=6;
//                      end;
                      form1.tv:=False;
                     form1.Timer3.Enabled :=true;
                     form1.Timer4.Enabled :=False;
                     Form1.toolbutton1.tag:=1;
                     form1.toolbutton1.imageindex:=1;
                     form1.PopupMenu1.Items[5].Items[0].Tag:=1;
                     form1.PopupMenu1.Items[5].Items[0].Caption :='Stop';
                end
                else  begin
                  form1.Timer3.Enabled :=false;
                  form1.Timer4.Enabled :=True ;
                  form1.tv:=True;
                  form1.ClientDataSet1.Locate('电台名称',form5.dsname,[]);
                  form1.DBGrid1CellClick(form1.DBGrid1.Columns[1]);
                  form1.DBGrid1DblClick(self);
//                  form1.tvname:=form5.dsname;
//                  if Form1.clientdataset1.FieldByName('电台类型').AsString ='m3u8' then
//                    shellExecute(handle,'open',PChar(form1.clientdataset1.FieldByName('电台地址').AsString),nil,nil,SW_NORMAL)
//                  else
//                  Form1.ShowTv  ;

                end;

                  if Form2.CheckBox8.Checked  then
                    form1.OpenVolumn ;
                end
                else begin
                    with form1.TrayIcon1 do
                       begin
                        BalloonTitle :=appname;
                        BalloonHint:='Timing playing failed, please check the network.';
                        BalloonFlags:=bfInfo ;
                        ShowBalloonHint ;
                       end;
//                       Form1.StatusBar1.Panels[0].Text :='定时播放启动出错，请检查系统是否联网。';
                ftimer.Enabled :=false;
                form1.ToolButton1.Click;
              end;
              end;
//               end;

              if s1='Timing recording' then
              begin
                if form1.CheckOffline  then
                  begin
                    ftimer.Enabled :=true;
                    form1.Timer2.Enabled :=True;

              if form1.ClientDataSet2.FieldByName('电台类型').asstring='Common' then
                  begin
                    BASS_ChannelStop(chan);
                     mp:=Form1.ClientDataSet2.FieldByName('电台地址').asstring;

                        if Form2.checkbox2.Checked then
                          BASS_SetConfigPtr(BASS_CONFIG_NET_PROXY, nil) // disable proxy
                        else
                          BASS_SetConfigPtr(BASS_CONFIG_NET_PROXY, PWideChar(Form2.ComboBox3.Text)); // set proxy server
                          cthread := BeginThread(nil, 0, @OpenURL2, PAnsiChar(mp ), 0, Id);


//                           if (chan <> 0) then
//                BASS_Encode_MP3_StartFile(chan, nil,BASS_ENCODE_LIMIT or BASS_UNICODE,PWideChar(changefileext(fn,FormatDateTime('yyyymmddhhnnss',now)+'.mp3')));

//                          form1.RecordRadio;
//                          Form1.ToolButton2.Click ;
                        playstatus :=2;
                  end;
                    Form1.toolbutton1.tag:=1;
                    form1.toolbutton1.imageindex:=1;
                    form1.PopupMenu1.Items[5].Items[0].Tag:=1;
                    form1.PopupMenu1.Items[5].Items[0].Caption :='Stop';
                    Form1.ToolButton2.ImageIndex :=1;
                    form1.TrayIcon1.IconIndex:=19;
                    Form1.ToolButton2.Hint:='Stop record';
                    Form1.ToolButton2.Tag :=1;

                    with form1.TrayIcon1 do
                       begin
                        BalloonTitle :=appname;
                        BalloonHint:=form1.ClientDataSet2.FieldByName('计划类型').asstring+#32+form1.title5;
                        BalloonFlags:=bfInfo ;
                        ShowBalloonHint ;
                        end;

//                   if (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) then
//                   begin
//                    if Form1.toolbutton2.tag=0 then
//                    begin
//                       if form1.rdfile  then
//                       fn:=Form2.LabeledEdit1.Text+'\'+form1.title5+' - '//                      else//                        fn:=Form2.LabeledEdit1.Text+'\'+form1.title2+' - ';////                      if (chan <> 0) then//                          BASS_Encode_MP3_StartFile(chan, nil,BASS_ENCODE_LIMIT or BASS_UNICODE,PWideChar(changefileext(fn,FormatDateTime('yyyymmddhhnnss',now)+'.mp3')));
//                        form1.Label6.Font.Color:=clred;
//                        form1.label6.ShowHint:=True;
//                        Form1.ToolButton2.ImageIndex :=1;
//                        Form1.ToolButton2.Hint:='停止录音';
//                        Form1.ToolButton2.Tag :=1;
//                        Form1.PopupMenu4.Items[6].Caption :='停止录制当前电台';
//                        form1.PopupMenu4.Items[6].Tag:=1;
//                        Form1.PopupMenu1.Items[6].Caption :='停止录制当前电台';
//                        form1.PopupMenu1.Items[6].Tag:=1;
////
//                    end;
//                   end;

                      form1.Timer3.Enabled :=true;
//                      form1.Timer5.Enabled :=True;
                      form1.PopupMenu1.Items[8].Tag:=1;
                      if Form2.CheckBox8.Checked  then
                        form1.OpenVolumn ;
              end
              else begin
                  with form1.TrayIcon1 do
                       begin
                        BalloonTitle :=appname;
                        BalloonHint:='Timing recording failed, please check the network.';
                        BalloonFlags:=bfInfo ;
                        ShowBalloonHint ;
                        end;
                ftimer.Enabled :=false;
              end;

            end;
      end;
       ftimer.Enabled :=true;

end;

{ forcast }

//constructor forcast.Create;
//begin
//inherited Create(False);
//  ftimer:=ttimer.create(nil);
//  ftimer.interval:=300000;
//  ftimer.ontimer:=timerontimer;
//  ftimer.enabled:=true;
//end;
//
//destructor forcast.destroy;
//begin
//  ftimer.Free ;
//  inherited;
//end;
//
//procedure forcast.Execute;
//begin
//  inherited;
//
//end;

//procedure forcast.timerontimer(sender: TObject);
//begin
//
//end;
end.
