unit tuijian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, pngimage, ImgList, ComCtrls,ShellAPI,
   ToolWin;

type
  TForm8 = class(TForm)
    LabeledEdit2: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    LabeledEdit3: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LabeledEdit3KeyPress(Sender: TObject; var Key: Char);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses main;

{$R *.dfm}

procedure TForm8.FormShow(Sender: TObject);
begin
  labelededit1.Text :=form1.clientdataset1.fieldbyname('电台名称').asstring;
  labelededit2.Text :=form1.clientdataset1.fieldbyname('电台类别').asstring;

end;

procedure TForm8.LabeledEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if RadioGroup1.ItemIndex =0 then
    LabeledEdit3.NumbersOnly :=True
  else
    LabeledEdit3.NumbersOnly :=False ;
end;

procedure TForm8.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex  of
    0: begin
        LabeledEdit3.EditLabel.Caption :='QQ:';
        LabeledEdit3.Enabled :=true;
        LabeledEdit3.text :='';
      end;
    1:begin
        LabeledEdit3.EditLabel.Caption :='Skype:';
        LabeledEdit3.Enabled :=true;
        LabeledEdit3.text :='';
      end;
    2:begin
         LabeledEdit3.EditLabel.Caption :='Email:';
        LabeledEdit3.Enabled :=True;
        LabeledEdit3.text :='';
      end;
    3:begin
         LabeledEdit3.EditLabel.Caption :='Anonymous:';
        LabeledEdit3.Enabled :=false;
        LabeledEdit3.text :='Anonym';
      end;
  end;
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
begin
if LabeledEdit3.Text<>''  then
  begin
    if form1.CheckOffline  then
  begin
    Form8.Hide;
    Form1.Sendmail('Recommend: '+LabeledEdit1.Text,#44+#32+LabeledEdit2.Text,#44+#32+LabeledEdit3.EditLabel.Caption+LabeledEdit3.Text,#44+#32+labeledEdit4.Text,'');
    with form1.TrayIcon1 do
                    begin
                      BalloonTitle :=appname;
                      BalloonHint:='Recommend success!';
                      BalloonFlags:=bfInfo ;
                      ShowBalloonHint;
                    end;
    Form8.Close ;
  end
  else
   Application.MessageBox('Send failed,please check the network!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
  end
  else
  begin
    MessageBeep(16);
    Application.MessageBox(pchar(LabeledEdit3.EditLabel.Caption+'doesn''t allow blank,please use the anonymous!'), appname, MB_OK +
      MB_ICONWARNING);
//    LabeledEdit3.SetFocus ;
  end;
end;

procedure TForm8.SpeedButton2Click(Sender: TObject);
begin
close;
end;



end.
