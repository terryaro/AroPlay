program AroPlay;

{ Reduce EXE size by disabling as much of RTTI as possible (delphi 2009/2010) }

{$IF CompilerVersion >= 21.0}

{$WEAKLINKRTTI ON}

{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

{$IFEND}





uses
  Forms,
  Windows,
  Dialogs,
  ExtCtrls,
  SysUtils,
  main in 'main.pas' {Form1},
  setting in 'setting.pas' {Form2},
  add in 'add.pas' {Form3},
  update in 'update.pas' {Form4},
  time in 'time.pas' {Form5},
  tree in 'tree.pas' {Form6},
  video in 'video.pas' {Form7},
  DayplayThread in 'DayplayThread.pas',
  tuijian in 'tuijian.pas' {Form8},
  cloudy in 'cloudy.pas' {Form13},
  code in 'code.pas' {Form10};

//  WMPLib_TLB in 'C:\Users\ARO\Documents\RAD Studio\8.0\Imports\WMPLib_TLB.pas';

{$R *.res}

var mutexhandle:integer;
begin
//  try

  if openmutex(MUTEX_ALL_ACCESS,FALSE,'RUNONCEMUTEX')<> 0 THEN
    begin
      Application.MessageBox(PChar('AroPlay is running!'), Appname, MB_OK);
      exit;
    end;
    mutexhandle:=createmutex(nil,true,'RUNONCEMUTEX');
    SetCurrentDirectory(PChar(ExtractFilePath(Application.ExeName)));
    Application.Initialize;
    if not FileExists(GetHomePath+'\rde.cds') then
      CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\rd.cds'),PChar(gethomepath+'\rd.cds'),False );

    if not FileExists(GetHomePath+'\rde.dat') then
      CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\rd.dat'),PChar(gethomepath+'\rd.dat'),False );
//    else begin


      if FileExists(GetHomePath+'\show.txt') then
      Application.ShowMainForm:=true
      else
      Application.ShowMainForm:=false;
      Application.Title := 'AroPlay';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
//    end;
//    except
//    Application.MessageBox('灾难性故障,请重新下载完全版进行安装。',
//      'AbroadRadio 8.2', MB_OK + MB_ICONSTOP + MB_TOPMOST);
//    Application.Terminate ;

//  end;

//    releasemutex(mutexhandle);
end.
