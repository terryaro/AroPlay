unit time;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, ComCtrls, Buttons,DateUtils,DB;

type
  TForm5 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    RadioGroup1: TRadioGroup;
    BitBtn3: TBitBtn;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    RadioButton1: TRadioButton;
    DateTimePicker3: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    dsname:string;
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses main, setting, DayplayThread, video, tvshow, tv;

{$R *.dfm}

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
//if Form1.CheckdirectoryName  then
//  begin
    if not form1.ClientDataSet1.Eof  then
      begin
          Form1.ClientDataSet1.Edit;
          Form1.ClientDataSet1.Fieldbyname('电台名称').asstring:=labelededit1.text;
          if RadioButton1.Checked  then
            Form1.ClientDataSet1.FieldByName('周期').AsString :=formatdatetime('yyyy-mm-dd',datetimepicker3.date)
          else
            Form1.ClientDataSet1.FieldByName('周期').AsString :=ComboBox1.text;
             Form1.ClientDataSet1.FieldByName('开始时间').AsDateTime:=DateTimePicker1.Time;
          Form1.ClientDataSet1.FieldByName('结束时间').AsDateTime:=DateTimePicker2.Time;
          Form1.ClientDataSet1.FieldByName('计划类型').AsString :=RadioGroup1.items[RadioGroup1.ItemIndex];
          Form1.ClientDataSet1.FieldByName('间隔').asinteger:=SecondsBetween(DateTimePicker1.Time,DateTimePicker2.Time);
          Form1.ClientDataSet1.FieldByName('完成动作').AsString :=ComboBox2.text ;
      end;
       dsname:=LabeledEdit1.Text ;
//       if Form1.ClientDataSet1.FieldByName('计划类型').AsString='播放并录音' then
//        Form2.CheckBox20.Checked :=True
//       else
//        Form2.CheckBox20.Checked :=false;
       form2.saveini ;
      Form1.ClientDataSet1.MergeChangeLog ;
      Form1.ClientDataSet1.ApplyUpdates(-1);
      Form1.ClientDataSet1.SaveToFile(GetHomePath +  DataBaseFileName);

      form1.clientdataset2.data:=form1.clientdataset1.data;
      Form1.ClientDataSet1.Close  ;
      Form1.ClientDataSet1.LoadFromFile(GetHomePath +  DataBaseFileName);
      Form1.ClientDataSet1.open;
      form1.TotalRecord ;
//      dsname:=LabeledEdit1.Text;
      TDateField(Form1.DBGrid2.Columns.items[2].Field).DisplayFormat:='hh:mm:ss';
      TDateField(Form1.DBGrid2.Columns.items[3].Field).DisplayFormat:='hh:mm:ss';
      Form1.N46Click(self);
//      FORM1.TreeView1.Select(form1.TreeView1.Items[0]);
      form1.tvshow:=False ;
//  end
//  else begin
//      Application.MessageBox('当前录音目录为空或不存在,请重新进行设置！', appname,
//           MB_OK + MB_ICONINFORMATION);
//      Form2.ShowModal ;
//      form2.PageControl1.TabIndex :=2;
//      Form2.LabeledEdit1.SetFocus ;
//  end;
//  Close;
end;



//end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
case Application.MessageBox('Delete this plan?', appname, MB_OKCANCEL +
    MB_ICONQUESTION + MB_TOPMOST) of
    IDOK:
      begin
        with form1.ClientDataSet1 do
        begin
          Edit;
          FieldByName('计划类型').asstring:='';
          Filtered :=true;
          MergeChangeLog ;
          ApplyUpdates(-1);
          end;
          Form1.ClientDataSet2.Data :=Form1.ClientDataSet1.Data ;
//          form1.TotalRecord ;
          with form1.ClientDataSet1 do
          begin
            MergeChangeLog   ;
            ApplyUpdates(-1);
            SaveToFile(GetHomePath + DataBaseFileName);
            Close ;
            LoadFromFile(GetHomePath + DataBaseFileName);
            Open ;
          end;
          Form1.TotalRecord ;
        TDateField(Form1.DBGrid2.Columns.items[2].Field).DisplayFormat:='hh:mm:ss';
        TDateField(form1.DBGrid2.Columns.items[3].Field).DisplayFormat:='hh:mm:ss';
        if form1.ClientDataSet1.RecordCount <>0 then
          Form1.N46Click(Self);
//
//          form1.TreeView1.Select(form1.TreeView1.Items[105])
//        else
//          form1.TreeView1.Select(form1.TreeView1.Items[0]);
          Close ;
      end;
    IDCANCEL:
      begin

      end;

end;

end;

procedure TForm5.Button1Click(Sender: TObject);
begin
//Form2.CheckBox20.Checked :=True;
end;

procedure TForm5.CheckBox1Click(Sender: TObject);
begin
  ComboBox2.Enabled :=CheckBox1.Checked;
  if not CheckBox1.Checked  then
  ComboBox2.ItemIndex :=-1
  else
  ComboBox2.ItemIndex :=0;
end;

procedure TForm5.DateTimePicker2Exit(Sender: TObject);
begin

//end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin

end;

//SpeedButton3.Hint :='检测定时录音功能已关闭, 点击此处设定';

procedure TForm5.FormShow(Sender: TObject);
begin
if form1.clientdataset1.fieldbyname('视频类型').asstring='电视台' then
RadioGroup1.Controls[1].Enabled := False;
if Form2.CheckBox14.Checked  then
speedbutton1.Visible:=True
else
speedbutton1.Visible :=False;

if Form1.tvshow  then
begin
RadioButton1.Checked :=true;
DateTimePicker3.DateTime:=StrToDateTime(form1.tvdate);
LabeledEdit1.Text :=form1.tvforcast;
DateTimePicker1.Time:=StrToDateTime(form1.tvtime);
end
else begin
LabeledEdit1.Text :=Form1.ClientDataSet1.FieldByName('电台名称').AsString ;
DateTimePicker1.Time :=Now;
end;
GroupBox2.Caption :='Now:'+formatdatetime('hh:nn:ss',now);

//if form1.ClientDataSet1.FieldByName('电台类型').AsString ='网页电台' then
//  RadioGroup1.Controls[1].Enabled := False;
form1.loadplan;


end;





procedure TForm5.RadioButton1Click(Sender: TObject);
begin
  DateTimePicker3.Enabled:=RadioButton1.Checked;
  ComboBox1.ItemIndex :=-1;
  ComboBox1.Enabled :=false;
  ComboBox1.ItemIndex :=-1;

end;

procedure TForm5.RadioButton4Click(Sender: TObject);
begin
  DateTimePicker3.Enabled:=False;
  ComboBox1.Enabled:=RadioButton4.Checked;
  ComboBox1.ItemIndex :=0;
end;

procedure TForm5.RadioButton5Click(Sender: TObject);
begin
  ComboBox1.Enabled :=false;
  DateTimePicker3.Enabled:=False;
  ComboBox1.ItemIndex :=-1;
end;


procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
//  Form2.loadini ;
  case RadioGroup1.ItemIndex  of
    0:begin
         if not Form1.CheckdirectoryName  then
          begin
            speedbutton1.Visible :=True;
          end
          else begin
            speedbutton1.Visible :=False ;
            CheckBox1.Caption :='After playing then';
          end;
      end;
    1:begin
        Form2.loadini;
        if Form2.CheckBox18.Checked then
        case Application.MessageBox('Detect you''re using silence record function,do you want to close it? Click ''Ok'' to close.',
          appname, MB_OKCANCEL + MB_ICONINFORMATION + MB_TOPMOST) of
          IDOK:
            begin
              Form2.CheckBox18.Checked:=False ;
              Form2.saveini;
            end;
          IDCANCEL:
            begin

            end;
        end;



        if not Form1.CheckdirectoryName  then
          begin
            speedbutton1.Visible :=True;
          end
        else begin
          speedbutton1.Visible :=False ;
          CheckBox1.Caption :='After recording then' ;
        end;
      end;
end;
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  with form2 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      Show ;
      Notebook1.ActivePage:='4';
    end;
end;

procedure TForm5.SpeedButton4Click(Sender: TObject);
begin
DateTimePicker2.Time :=now+(1/24/60)*30;
end;

procedure TForm5.SpeedButton5Click(Sender: TObject);
begin
DateTimePicker2.Time :=now+(1/24/60)*60;
end;

procedure TForm5.SpeedButton6Click(Sender: TObject);
begin
 Form2.ShowModal ;
 form2.Notebook1.PageIndex :=4;
end;

procedure TForm5.StatusBar1Click(Sender: TObject);
begin
  Form2.ShowModal ;
//  Form2.PageControl1.TabIndex :=2;
end;

procedure TForm5.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
//  StatusBar1.Canvas.Font.Color :=clRed;
end;

end.



































