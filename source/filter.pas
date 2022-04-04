unit filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm10 = class(TForm)
    BitBtn2: TBitBtn;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    ComboBox3: TComboBox;
    Button1: TButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
     function GetFilter: string;
  public
     property Filter: string read GetFilter;
  end;


implementation

{$R *.dfm}

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm10.CheckBox1Click(Sender: TObject);
begin
ComboBox3.Enabled:=CheckBox1.Checked;
end;

procedure TForm10.ComboBox2Change(Sender: TObject);
begin
//case ComboBox2.ItemIndex of
//0:mode:='like';
//1:mode:='=';
//end;

end;

function TForm10.GetFilter: string;
begin
 if CheckBox1.Checked then
  Result:= Format('%s %s %s ''%s''',
    ['(电台类别='+QuotedStr(combobox1.text)+')and (电台国家='+QuotedStr(combobox3.text)+')','and 电台名称', 'like','%'+lowercase(LabeledEdit1.Text)+'%'])
 else
  Result:= Format('%s %s %s ''%s''',
    ['电台类别='+QuotedStr(combobox1.text)+'and','电台名称', 'like','%'+lowercase(LabeledEdit1.Text)+'%']);

// if CheckBox1.Checked then
//  Result:= Format('%s %s %s ''%s''',
//    ['(电台类别='+QuotedStr(combobox1.text)+')and (电台国家='+QuotedStr(combobox3.text)+')','and 电台名称', 'like','%'+lowercase(combobox2.Text)+'%'])
// else
//  Result:= Format('%s %s %s ''%s''',
//    ['电台类别='+QuotedStr(combobox1.text)+'and','电台名称', 'like','%'+lowercase(combobox2.Text)+'%']);


end;

end.
