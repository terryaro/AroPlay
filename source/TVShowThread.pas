unit TVShowThread;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  jpeg, ImgList,shellapi, IdDayTime, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient,registry, DB, ADODB, DBClient,MidasLib,OleCtrls,
  WMPLib_TLB,Clipbrd,TlHelp32, UrlMon,pngimage,WinInet,IniFiles,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP,ShlObj,FileCtrl,DateUtils,
  Provider, SHDocVw, GIFImg,ThreadTimer,CommCtrl,MMSystem,xpmute,Mmdevapi,ActiveX;

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

uses main, setting, focast, time;

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

procedure Day.timerontimer(sender: TObject);
  var
Found,xunhuan: Boolean; s1:string;
  rStream: TStringstream;
  a:String;
  idhttp2:tidhttp;

