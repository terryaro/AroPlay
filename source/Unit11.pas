unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer;

type
  TForm11 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin
MediaPlayer1.Close ;
MediaPlayer1.FileName :='https://lhttp.qingting.fm/live/386/64k.mp3' ;
MediaPlayer1.Open ;
MediaPlayer1.Play;
end;

end.
