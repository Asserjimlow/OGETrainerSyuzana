unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormAbout = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

uses Unit2;

{$R *.dfm}

procedure TFormAbout.Button1Click(Sender: TObject);
begin
  FormAbout.Hide;      // ������ ����� "�� ������"
  Form2.Show;      // �������� ������� ����
end;

procedure TFormAbout.FormShow(Sender: TObject);
begin
Label1.Caption := '�����������: �����-���' + #13#10 +
                  '������: ��������-�������������� ��������� "����������� ����������"' + #13#10 +
                  '������: 1.0' + #13#10 +
                  '����: ������ 2025' + #13#10 +
                  'Telegram: @aysay123' + #13#10 +
                  'VK: @id413792484' + #13#10;

end;

end.
