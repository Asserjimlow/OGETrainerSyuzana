unit TheoryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Memo12: TMemo;
    Memo11: TMemo;
    Memo10: TMemo;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}
procedure TForm3.Button1Click(Sender: TObject);
begin
Form3.Hide;
Form2.Show;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  BasePath: string;
begin
  BasePath := ExtractFilePath(ParamStr(0));

  Memo10.Lines.LoadFromFile(BasePath + '1_���_�����_�����������_����������.txt');
  Memo11.Lines.LoadFromFile(BasePath + '2_�������_���������_����������.txt');
  Memo12.Lines.LoadFromFile(BasePath + '3_��������_�����������.txt');
  Memo1.Lines.LoadFromFile(BasePath + '4_�����������_��������.txt');
  Memo2.Lines.LoadFromFile(BasePath + '5_�����������_�������_�_�����.txt');
  Memo3.Lines.LoadFromFile(BasePath + '6_������_����������.txt');
  Memo4.Lines.LoadFromFile(BasePath + '7_��������_�_�����������_������.txt');
  Memo5.Lines.LoadFromFile(BasePath + '������������_�����_�����������_����������.txt');
end;

end.
