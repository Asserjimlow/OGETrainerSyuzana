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
  Form4.Hide;      // Скрыть форму тестирования
  Form2.Show;      // Показать главное меню
end;

procedure TForm4.Button1Click(Sender: TObject);
var
  score, row, i: Integer;
  ExcelApp, WorkBook, WorkSheet: Variant;
begin
  score := 0;

  if not Assigned(FormRegister) then
    FormRegister := TFormRegister.Create(Application);

  if not Assigned(FormJournal) then
    FormJournal := TFormJournal.Create(Application);

  // Вопрос 1: Edit1 — "600"
  if Trim(Edit1.Text) = '600' then Inc(score);

  // Вопрос 2: RadioGroup1 — 7 бит (индекс 1)
  if RadioGroup1.ItemIndex = 1 then Inc(score);

  // Вопрос 3: CheckListBox1 — 1 Кбайт, 1024 байта, 8192 бита (индексы 0,1,2)
  if CheckListBox1.Checked[0] and CheckListBox1.Checked[1] and CheckListBox1.Checked[2]
     and not CheckListBox1.Checked[3] then Inc(score);

  // Вопрос 4: Edit2 — "4096"
  if Trim(Edit2.Text) = '4096' then Inc(score);

  // Вопрос 5: Edit3 — "1101"
  if Trim(Edit3.Text) = '1101' then Inc(score);

  // Вопрос 6: RadioGroup2 — "AF" (индекс 0)
  if RadioGroup2.ItemIndex = 0 then Inc(score);

  // Вопрос 7: CheckListBox2 — SUM(A1:A10), SUM(A1:A10) (индексы 0,1)
  if CheckListBox2.Checked[0] and CheckListBox2.Checked[1]
     and not CheckListBox2.Checked[2] and not CheckListBox2.Checked[3] then Inc(score);

  // Вопрос 8: ListBox1 — правильный вариант (индекс 0)
  if ListBox1.ItemIndex = 0 then Inc(score);

  // Вопрос 9: RadioGroup3 — "0" (индекс 0)
  if RadioGroup3.ItemIndex = 0 then Inc(score);

  // Вопрос 10: CheckListBox3 — A И B (только индекс 0)
  if CheckListBox3.Checked[0] and not CheckListBox3.Checked[1]
     and not CheckListBox3.Checked[2] and not CheckListBox3.Checked[3] then Inc(score);

  // Вопрос 11: Edit4 — "5"
  if Trim(Edit4.Text) = '5' then Inc(score);

  // Вопрос 12: CheckListBox4 — "Москва" и возраст>18 (0 и 2)
  if CheckListBox4.Checked[0] and CheckListBox4.Checked[2]
     and not CheckListBox4.Checked[1] and not CheckListBox4.Checked[3] then Inc(score);

  // Вопрос 13: Edit5 — "10"
  if Trim(Edit5.Text) = '10' then Inc(score);

  // Вопрос 14: CheckListBox5 — увеличение X (0 и 2)
  if CheckListBox5.Checked[0] and CheckListBox5.Checked[2]
     and not CheckListBox5.Checked[1] and not CheckListBox5.Checked[3] then Inc(score);

  // Вопрос 15: Edit6 — "4"
  if Trim(Edit6.Text) = '4' then Inc(score);

  // Вопрос 16: CheckListBox6 — условные действия (0 и 2)
  if CheckListBox6.Checked[0] and CheckListBox6.Checked[2]
     and not CheckListBox6.Checked[1] and not CheckListBox6.Checked[3] then Inc(score);

  // Вопрос 17: ListBox2 — "Условие никогда не выполнится" (индекс 0)
  if ListBox2.ItemIndex = 0 then Inc(score);

  // Вопрос 18: ListBox3 — "Сумма обнуляется в цикле" (индекс 2)
  if ListBox3.ItemIndex = 2 then Inc(score);

  // Вопрос 19: Edit7 — "32"
  if Trim(Edit7.Text) = '32' then Inc(score);

  // Вопрос 20: CheckListBox7 — логические операции (0 и 1)
  if CheckListBox7.Checked[0] and CheckListBox7.Checked[1]
     and not CheckListBox7.Checked[2] and not CheckListBox7.Checked[3] then Inc(score);

  row := FormJournal.StringGrid1.RowCount;
  FormJournal.StringGrid1.RowCount := row + 1;

  with FormJournal.StringGrid1 do
  begin
    Cells[0, row] := FormRegister.edtFIO.Text;
    Cells[1, row] := FormRegister.cbCourse.Text;
    Cells[2, row] := FormRegister.edtGroup.Text;
    Cells[3, row] := IntToStr(score);
  end;

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

  // Показать результат
  ShowMessage('Вы набрали ' + IntToStr(score) + ' из 20 баллов.');
//FormJournal.Show;
end;


end.
