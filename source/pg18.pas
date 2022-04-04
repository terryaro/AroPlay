unit pg18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, Buttons, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,DBClient,
   IdHTTP,ShellAPI;

type
  TForm12 = class(TForm)
    Image1: TImage;
    IdFTP1: TIdFTP;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    IdHTTP1: TIdHTTP;
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure update18a(db:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses main;

{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
if ListBox1.ItemIndex<>-1 then
  shellExecute(handle,'open',PChar(website+'pg18+/'+Copy(ListBox1.Items[ListBox1.ItemIndex],1,length(ListBox1.Items[ListBox1.ItemIndex])-4)+'.htm'),nil,nil,SW_NORMAL)
else
  Application.MessageBox('请先选中列表中的PG18+增量包文件！', PChar(appname), MB_OK + MB_ICONSTOP);

end;

procedure TForm12.Button2Click(Sender: TObject);
begin
update18a('all.cds');
end;

procedure TForm12.FormShow(Sender: TObject);
begin
if ListBox1.ItemIndex<>-1 then
begin
  button1.Enabled :=False;
  speedbutton2.Enabled :=false;
end
else begin
  button1.Enabled :=True ;
  speedbutton2.Enabled :=True ;
end;
end;

procedure TForm12.ListBox1Click(Sender: TObject);
begin
if FileExists(ListBox1.Items[ListBox1.ItemIndex]+'.txt') then
case Application.MessageBox('系统检测您已下载过此更新包，是否重新下载？', PChar(appname), MB_YESNO + MB_ICONQUESTION)
  of
  IDYES:
    begin
      update18a(ListBox1.Items[ListBox1.ItemIndex]);
    end;
  IDNO:
    begin

    end;
end;


end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
begin
IdFTP1.Connect ;
IdFTP1.ChangeDir('Pg18update/CN');
IdFTP1.List(ListBox1.Items, '*.cds', false);//
SpeedButton1.Enabled:=false;
end;

procedure TForm12.SpeedButton2Click(Sender: TObject);
begin
if ListBox1.ItemIndex<>-1 then
  update18a(ListBox1.Items[ListBox1.ItemIndex])
else
  Application.MessageBox('请先选中列表中的PG18+增量包文件！', PChar(appname), MB_OK + MB_ICONSTOP);

end;

procedure TForm12.SpeedButton3Click(Sender: TObject);
begin
Close;
end;

procedure TForm12.update18a(db: string);
var
 MyStream:TMemoryStream; clidataset:TClientDataSet;
 number:Integer ;
 f:TextFile;
begin
try
  MyStream:=TMemoryStream.Create;
  clidataset :=TClientDataSet.Create(Self);
              try
                idhttp1.Get(website+'Pg18update/CN/'+db,MyStream);
                MyStream.SaveToFile(form1.GetShellFolders('Personal')+'\ARO'+'\'+db);
              except
              end;
              form1.ClientDataSet1.edit;
              clidataset.LoadFromFile(form1.GetShellFolders('Personal')+'\ARO'+'\'+db);
              clidataset.Edit;
              form1.number:=inttostr(clidataset.RecordCount) ;

              form1.ClientDataSet1.AppendData(clidataset.Data,False);
                Application.MessageBox('PG18+增量包列表下载成功!', PChar(appname),
          MB_OK + MB_ICONINFORMATION);
              form1.ClientDataSet1.MergeChangeLog ;
              form1.ClientDataSet1.ApplyUpdates(-1);
              form1.ClientDataSet1.SaveToFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
              form1.ClientDataSet1.Close;
              form1.ClientDataSet1.LoadFromFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
              form1.ClientDataSet1.Open;
              form1.DBGrid1.SetFocus ;
              if FileExists(form1.GetShellFolders('Personal')+'\ARO'+'\'+db) then
              Deletefile(form1.GetShellFolders('Personal')+'\ARO'+'\'+db) ;
              AssignFile(f,ListBox1.Items[ListBox1.ItemIndex]+'.txt');
              Rewrite(f);
              SpeedButton3.Click ;
    finally
          MyStream.Free;
          clidataset.Free;
    end;
end;

end.
