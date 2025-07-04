program KodirovanieInfo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  TheoryForm in 'TheoryForm.pas' {Form3},
  RegisterForm in 'RegisterForm.pas' {FormRegister},
  TestForm in 'TestForm.pas' {Form4},
  JournalForm in 'JournalForm.pas' {FormJournal},
  AboutForm in 'AboutForm.pas' {FormAbout},
  HelpForm in 'HelpForm.pas' {FormHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFormRegister, FormRegister);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFormJournal, FormJournal);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormHelp, FormHelp);
  Application.Run;
end.

