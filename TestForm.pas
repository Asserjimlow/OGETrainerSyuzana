unit TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, CheckLst, ExtCtrls, ComObj, RegisterForm, JournalForm, Unit2;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lblQ1: TLabel;
    TabSheet2: TTabSheet;
    lblQ2: TLabel;
    TabSheet3: TTabSheet;
    lblQ3: TLabel;
    TabSheet4: TTabSheet;
    lblQ4: TLabel;
    TabSheet5: TTabSheet;
    lblQ5: TLabel;
    TabSheet6: TTabSheet;
    lblQ6: TLabel;
    TabSheet7: TTabSheet;
    lblQ7: TLabel;
    TabSheet8: TTabSheet;
    lblQ8: TLabel;
    TabSheet9: TTabSheet;
    lblQ9: TLabel;
    TabSheet10: TTabSheet;
    lblQ10: TLabel;
    TabSheet11: TTabSheet;
    lblQ11: TLabel;
    TabSheet12: TTabSheet;
    lblQ12: TLabel;
    TabSheet13: TTabSheet;
    lblQ13: TLabel;
    TabSheet14: TTabSheet;
    lblQ14: TLabel;
    TabSheet15: TTabSheet;
    lblQ15: TLabel;
    TabSheet16: TTabSheet;
    lblQ16: TLabel;
    TabSheet17: TTabSheet;
    lblQ17: TLabel;
    TabSheet18: TTabSheet;
    lblQ18: TLabel;
    TabSheet19: TTabSheet;
    lblQ19: TLabel;
    TabSheet20: TTabSheet;
    lblQ20: TLabel;
    Button1: TButton;
    btnExit: TButton;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    CheckListBox1: TCheckListBox;
    Edit2: TEdit;
    Edit3: TEdit;
    RadioGroup2: TRadioGroup;
    CheckListBox2: TCheckListBox;
    ListBox1: TListBox;
    RadioGroup3: TRadioGroup;
    CheckListBox3: TCheckListBox;
    Edit4: TEdit;
    CheckListBox4: TCheckListBox;
    Edit5: TEdit;
    CheckListBox5: TCheckListBox;
    Edit6: TEdit;
    CheckListBox6: TCheckListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Edit7: TEdit;
    CheckListBox7: TCheckListBox;
    procedure btnExitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  FormJournal: TFormJournal;
  RegisterForm: TFormRegister;
  row: Integer;
  fio, kurs, group: string;
  ExcelApp, WorkBook, WorkSheet: Variant;
  i, j: Integer;

implementation

{$R *.dfm}

procedure TForm4.btnExitClick(Sender: TObject);
begin
  Form4.Hide;      // ������ ����� ������������
  Form2.Show;      // �������� ������� ����
end;

procedure TForm4.Button1Click(Sender: TObject);
var
  score, row, i: Integer;
  ExcelApp, WorkBook, WorkSheet: Variant;
begin
if not Assigned(FormJournal) then
  FormJournal := TFormJournal.Create(Application);

  score := 0;

  if Trim(Edit1.Text) = '600' then Inc(score); // ������ 1

  if RadioGroup1.ItemIndex = 1 then Inc(score); // ������ 2: 7 ���

  if CheckListBox1.Checked[0] and CheckListBox1.Checked[1] and CheckListBox1.Checked[2]
     and not CheckListBox1.Checked[3] then Inc(score); // ������ 3

  if Trim(Edit2.Text) = '4096' then Inc(score); // ������ 4

  if Trim(Edit3.Text) = '1101' then Inc(score); // ������ 5

  if RadioGroup2.ItemIndex = 0 then Inc(score); // ������ 6: AF

  if CheckListBox2.Checked[0] and CheckListBox2.Checked[1]
     and not CheckListBox2.Checked[2] and not CheckListBox2.Checked[3] then Inc(score); // ������ 7

  if ListBox1.ItemIndex = 2 then Inc(score); // ������ 8: 256 ������ (������ 2)

  if RadioGroup3.ItemIndex = 1 then Inc(score); // ������ 9: Unicode (������ 1)

  if CheckListBox3.Checked[0] and CheckListBox3.Checked[1]
     and not CheckListBox3.Checked[2] and not CheckListBox3.Checked[3] then Inc(score); // ������ 10

  if Trim(Edit4.Text) = '32' then Inc(score); // ������ 11

  if CheckListBox4.Checked[0] and CheckListBox4.Checked[1]
     and not CheckListBox4.Checked[2] and not CheckListBox4.Checked[3] then Inc(score); // ������ 12

  if Trim(Edit5.Text) = '8' then Inc(score); // ������ 13

  if CheckListBox5.Checked[0] and CheckListBox5.Checked[1]
     and not CheckListBox5.Checked[2] and not CheckListBox5.Checked[3] then Inc(score); // ������ 14

  if Trim(Edit6.Text) = '32' then Inc(score); // ������ 15

  if CheckListBox6.Checked[0] and CheckListBox6.Checked[2]
     and not CheckListBox6.Checked[1] and not CheckListBox6.Checked[3] then Inc(score); // ������ 16

  if ListBox2.ItemIndex = 1 then Inc(score); // ������ 17: JPEG (������ 1)

  if ListBox3.ItemIndex = 2 then Inc(score); // ������ 18: ����������� �����

  if Trim(Edit7.Text) = '300' then Inc(score); // ������ 19

  if Assigned(CheckListBox7) and (CheckListBox7.Items.Count >= 4) then
  if CheckListBox7.Checked[0] and CheckListBox7.Checked[1]
     and not CheckListBox7.Checked[2] and not CheckListBox7.Checked[3] then
    Inc(score); // ������ 20

    if not Assigned(FormJournal) then
begin
  ShowMessage('FormJournal �� ������!');
  Exit;
end;

if not Assigned(FormJournal.StringGrid1) then
begin
  ShowMessage('StringGrid1 � FormJournal �� ������!');
  Exit;
end;

  row := FormJournal.StringGrid1.RowCount;
  FormJournal.StringGrid1.RowCount := row + 1;

  with FormJournal.StringGrid1 do
  begin
    Cells[0, row] := FormRegister.edtFIO.Text;
    Cells[1, row] := FormRegister.cbCourse.Text;
    Cells[2, row] := FormRegister.edtGroup.Text;
    Cells[3, row] := IntToStr(score);
  end;


try
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Visible := False;

  try
    WorkBook := ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName) + 'journal.xlsx');
  except
    WorkBook := ExcelApp.Workbooks.Add;
  end;

  WorkSheet := WorkBook.Worksheets[1];
  i := 2;
  while WorkSheet.Cells[i, 1].Value <> '' do Inc(i);

  WorkSheet.Cells[i, 1].Value := FormRegister.edtFIO.Text;
  WorkSheet.Cells[i, 2].Value := FormRegister.cbCourse.Text;
  WorkSheet.Cells[i, 3].Value := FormRegister.edtGroup.Text;
  WorkSheet.Cells[i, 4].Value := score;

  WorkBook.SaveAs(ExtractFilePath(Application.ExeName) + 'journal.xlsx');
  WorkBook.Close(False);
  ExcelApp.Quit;
except
  on E: Exception do
    ShowMessage('������ ��� ������ � Excel: ' + E.Message);
end;


  ShowMessage('�� ������� ' + IntToStr(score) + ' �� 20 ������.');
end;

end.
