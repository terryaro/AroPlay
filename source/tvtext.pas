unit tvtext;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls,jpeg, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient,DB , IdHTTP,DateUtils;

type
  TForm11 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    CheckBox1: TCheckBox;
    IdHTTP1: TIdHTTP;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
//    procedure add; //添加到计划
    { Private declarations }
  public
    procedure CreateParams(var Params: TCreateParams);
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses main, setting, time;

{$R *.dfm}


//procedure TForm11.add;
//begin

//try
//if not form1.ClientDataSet1.Eof  then
//      begin
//        form1.Notebook1.PageIndex :=0;
//  form1.TreeView1.Select(form1.TreeView1.Items[0]);
//  form1.ClientDataSet1.Filter := '';
//  form1.ClientDataSet1.Filtered := True;
//  form1.ClientDataSet1.Locate('电台名称',form1.tvforcast,[]);
//  form1.DBGrid1CellClick(form1.DBGrid1.Columns[1]);
//          Form1.ClientDataSet1.Edit;
//          Form1.ClientDataSet1.Fieldbyname('电台名称').asstring:=form1.tvforcast;
//            Form1.ClientDataSet1.FieldByName('周期').AsString :=form1.tvdate;
//             Form1.ClientDataSet1.FieldByName('开始时间').AsDateTime:=strtotime(form1.tvtime);
//          Form1.ClientDataSet1.FieldByName('结束时间').AsDateTime:=now+(1/24/60)*60;
//          Form1.ClientDataSet1.FieldByName('计划类型').AsString :='定时播放';
//          Form1.ClientDataSet1.FieldByName('间隔').asinteger:=SecondsBetween(form5.DateTimePicker1.Time,form5.DateTimePicker2.Time);
//      end;
//
//      Form1.ClientDataSet1.MergeChangeLog ;
//      Form1.ClientDataSet1.ApplyUpdates(-1);
//      Form1.ClientDataSet1.SaveToFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      form1.clientdataset2.data:=form1.clientdataset1.data;
//      Form1.ClientDataSet1.Close  ;
//      Form1.ClientDataSet1.LoadFromFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      Form1.ClientDataSet1.open;
//      form1.TotalRecord ;
//      TDateField(Form1.DBGrid2.Columns.items[2].Field).DisplayFormat:='hh:mm:ss';
//      TDateField(Form1.DBGrid2.Columns.items[3].Field).DisplayFormat:='hh:mm:ss';
//      FORM1.TreeView1.Select(form1.TreeView1.Items[0]);
//  end;
//except
//  showmessage('poew');
//end;
//end;
//
//procedure TForm11.add;
//begin
//if not form1.ClientDataSet1.Eof  then
//      begin
//          Form1.ClientDataSet1.Edit;
//          Form1.ClientDataSet1.Fieldbyname('电台名称').asstring:=form1.tvforcast ;
//            Form1.ClientDataSet1.FieldByName('周期').AsString :=formatdatetime('yyyy-mm-dd',datetimepicker3.date)
//            Form1.ClientDataSet1.FieldByName('开始时间').AsDateTime:=DateTimePicker1.Time;
//          Form1.ClientDataSet1.FieldByName('结束时间').AsDateTime:=DateTimePicker2.Time;
//          Form1.ClientDataSet1.FieldByName('计划类型').AsString :='';
//          Form1.ClientDataSet1.FieldByName('间隔').asinteger:=SecondsBetween(DateTimePicker1.Time,DateTimePicker2.Time);
//          Form1.ClientDataSet1.FieldByName('完成动作').AsString :=ComboBox2.text ;
//      end;
//       dsname:=LabeledEdit1.Text ;

//       form2.saveini ;
//      Form1.ClientDataSet1.MergeChangeLog ;
//      Form1.ClientDataSet1.ApplyUpdates(-1);
//      Form1.ClientDataSet1.SaveToFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      form1.clientdataset2.data:=form1.clientdataset1.data;
//      Form1.ClientDataSet1.Close  ;
//      Form1.ClientDataSet1.LoadFromFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//      Form1.ClientDataSet1.open;
//      form1.TotalRecord ;
//      dsname:=LabeledEdit1.Text;
//      TDateField(Form1.DBGrid2.Columns.items[2].Field).DisplayFormat:='hh:mm:ss';
//      TDateField(Form1.DBGrid2.Columns.items[3].Field).DisplayFormat:='hh:mm:ss';
//      FORM1.TreeView1.Select(form1.TreeView1.Items[0]);
//      form1.tvshow:=False ;
//end;

procedure TForm11.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do begin
    EXStyle := EXStyle or WS_EX_TOPMOST or WS_EX_NOACTIVATE;
    wndParent := GetDesktopWindow;
  end;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//Form1.tvshow:=false;
if CheckBox1.Checked then
form2.checkbox16.checked:=false
else
form2.checkbox16.checked:=true;
form2.saveini;
end;

procedure TForm11.FormCreate(Sender: TObject);
var
  rStream: TStringstream;
  imagestream:TMemoryStream;jpg:TJpegImage;
begin
try
imagestream := TMemoryStream.Create();
        jpg:=TJpegImage.Create;
        idhttp1.Get(website+'tv.jpg',imagestream);
        imagestream.Position:=0;
        jpg.LoadFromStream(imagestream);
        image1.Picture.Assign(jpg);
finally
  imagestream.Free ;
  jpg.Free ;

end;
end;

procedure TForm11.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin


end; //无标题窗体移动

procedure TForm11.FormPaint(Sender: TObject);
begin
//Canvas.MoveTo(0, Self.Height - 1);
//  Canvas.LineTo(0, 0); //绘制左边线
//  Canvas.LineTo(Self.Width - 1, 0); //绘制上边线
//  Canvas.LineTo(Self.Width - 1, Self.Height); //绘制右边线
end;

procedure TForm11.FormResize(Sender: TObject);
begin
//Self.Repaint;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
label4.Caption:=form1.tvmemo;
//ShowMessage(form1.tvmemo);
//close;
end;

procedure TForm11.Label2Click(Sender: TObject);
begin
Form1.PlayMusic(form1.tvforcast);
close;
Form1.Close ;
end;

procedure TForm11.Label3Click(Sender: TObject);
begin
  form1.Notebook1.PageIndex :=0;
  form1.TreeView1.Select(form1.TreeView1.Items[0]);
  form1.ClientDataSet1.Filter := '';
  form1.ClientDataSet1.Filtered := True;
  form1.ClientDataSet1.Locate('电台名称',form1.tvforcast,[]);
  form1.DBGrid1CellClick(form1.DBGrid1.Columns[1]);
form1.tvshow:=true;
//add;
Form1.ShowSchool;
hide;
close;
end;

procedure TForm11.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft then
       begin
         ReleaseCapture;
         Perform(WM_SYSCOMMAND, $F012, 0);
       end;
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure TForm11.SpeedButton2Click(Sender: TObject);
begin
Form1.PlayMusic(form1.tvforcast);
close;
Form1.Close ;
end;


end.
