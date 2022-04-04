unit qrcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DelphiZXingQRCode, ExtDlgs, Buttons, ExtCtrls,ShellAPI;

type
  TForm17 = class(TForm)
//    ZXingQRCodeLi1: TZXingQRCodeLi;
    Timer1: TTimer;
    Label2: TLabel;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
  private
    QRCodeBitmap: TBitmap;
    procedure SaveBmpFromPaintBox(pbox: TPaintBox; fn: string);
  public
    procedure Update;
  end;

var
  Form17: TForm17;
  i:byte;
implementation

uses main, setting;

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
begin
//if SavePictureDialog1.Execute then
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Timer1.Enabled:=false;
end;

procedure TForm17.FormCreate(Sender: TObject);
begin
Caption :=form1.ClientDataSet1.FieldByName('电台名称').AsString ;
QRCodeBitmap := TBitmap.Create;
  Update;
    i:=9;
    if form2.checkbox17.Checked then
      timer1.Enabled:=true
    else
      timer1.Enabled:=False ;
end;

procedure TForm17.FormDestroy(Sender: TObject);
begin
QRCodeBitmap.Free;
end;

procedure TForm17.PaintBox1Click(Sender: TObject);
begin
SaveBmpFromPaintBox(paintbox1, form2.LabeledEdit7.text+'\'+form17.Caption+'.png');
end;

procedure TForm17.PaintBox1Paint(Sender: TObject);
var
  Scale: Double;
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(Rect(0, 0, PaintBox1.Width, PaintBox1.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (PaintBox1.Width < PaintBox1.Height) then
    begin
      Scale := PaintBox1.Width / QRCodeBitmap.Width;
    end else
    begin
      Scale := PaintBox1.Height / QRCodeBitmap.Height;
    end;
    PaintBox1.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width), Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;

end;

procedure TForm17.Panel1Click(Sender: TObject);
begin
shellexecute(handle,'open',PChar('http://www.abroadradio.net'),nil,nil,SW_SHOWNORMAL )
end;

procedure TForm17.SaveBmpFromPaintBox(pbox: TPaintBox; fn: string);
var
bmp: TBitmap;
r: TRect;
begin
bmp := TBitmap.Create;
bmp.Width := pbox.Width;
bmp.Height := pbox.Height;
try
r.Left := 0;
r.Top := 0;
r.Right := pbox.Width;
r.Bottom := pbox.Height;
bmp.Canvas.CopyRect(r, pbox.Canvas, r);
bmp.SaveToFile(fn);
finally
FreeAndNil(bmp);
end;
end;

procedure TForm17.SpeedButton1Click(Sender: TObject);
begin
form1.N45Click(Self);
end;

procedure TForm17.SpeedButton2Click(Sender: TObject);
begin
SaveBmpFromPaintBox(paintbox1, form2.LabeledEdit7.text+'\'+form17.Caption+'.png');
end;

procedure TForm17.Timer1Timer(Sender: TObject);
begin
  Dec(i);
  Label2.Caption:='此窗口将在 '+inttostr(i)+' 秒后关闭';
  if i <= 0 then
  begin
    Timer1.Enabled := False;
    Form17.Close ;
  end;
end;

procedure TForm17.Update;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    if form1.ClientDataSet1.FieldByName('电台类型').AsString='普通电台' then
    QRCode.Data := Form1.ClientDataSet1.FieldByName('电台地址').AsString
    else
    QRCode.Data := Form1.ClientDataSet1.FieldByName('电台网址').AsString;
    QRCode.QuietZone := StrToIntDef('3',4);
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
  PaintBox1.Repaint;
end;


end.
