unit FFT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls,ComCtrls,bass;

type
  FT = class(TThread)
  private
    ftimer:TTimer;
  procedure timerontimer(sender:TObject);
  protected
    procedure Execute; override;
  public
    constructor  Create;
    destructor destroy;override ;
  end;

implementation

uses main, DayplayThread;

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure FFT.UpdateCaption;
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

{ FFT }

constructor FT.Create;
begin
  inherited Create(False);
  ftimer:=ttimer.create(nil);
  ftimer.interval:=30;
  ftimer.ontimer:=timerontimer;
  ftimer.enabled:=true;
//    Sleep(1000);
end;

destructor FT.destroy;
begin
  ftimer.free;
  inherited;
end;

procedure FT.Execute;
begin
  inherited;

end;

procedure FT.timerontimer(sender: TObject);
const
  w = 8;
var
  i,di: Integer;
  FFTData: array[0..512] of Single;
  bit: TBitmap;
  FFTPeacks  : array [0..128] of Integer;
  FFTFallOff : array [0..128] of Integer;

begin
  if BASS_ChannelIsActive(chan) <> BASS_ACTIVE_PLAYING then Exit;

  BASS_ChannelGetData(chan, @FFTData, BASS_DATA_FFT1024);
  bit := TBitmap.Create;
  bit.Width := form1.PaintBox1.Width;
  bit.Height := form1.PaintBox1.Height;
  bit.Canvas.Brush.Color := clBlack;
  bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));

  bit.Canvas.Pen.Color := clLime;
  for i := 0 to Length(FFTData) - 1 do
  begin
    di := Trunc(Abs(FFTData[i]) * 500);

    if di > bit.Height then di := bit.Height;
    if di >= FFTPeacks[i] then FFTPeacks[i] := di else FFTPeacks[i] := FFTPeacks[i] - 1;
    if di >= FFTFallOff[i] then FFTFallOff[i] := di else FFTFallOff[i] := FFTFallOff[i] - 3;
    if (bit.Height - FFTPeacks[i]) > bit.Height then FFTPeacks[i] := 0;
    if (bit.Height - FFTFallOff[i]) > bit.Height then FFTFallOff[i] := 0;

//    bit.Canvas.MoveTo(i, bit.Height);
//    bit.Canvas.LineTo(i, bit.Height - FFTFallOff[i]);
//    bit.Canvas.Pixels[i, bit.Height - FFTPeacks[i]] := bit.Canvas.Pen.Color;

    bit.Canvas.Pen.Color := bit.Canvas.Pen.Color;
    bit.Canvas.MoveTo(i * (w + 1), bit.Height - FFTPeacks[i]);
    bit.Canvas.LineTo(i * (w + 1) + w, bit.Height - FFTPeacks[i]);

    bit.Canvas.Pen.Color := bit.Canvas.Pen.Color;
    bit.Canvas.Brush.Color := bit.Canvas.Pen.Color;
    bit.Canvas.Rectangle(i * (w + 1), bit.Height - FFTFallOff[i], i * (w + 1) + w, bit.Height);
  end;

  BitBlt(form1.PaintBox1.Canvas.Handle, 0, 0, form1.PaintBox1.Width, form1.PaintBox1.Height, bit.Canvas.Handle, 0, 0, SRCCOPY);
end;


end.
