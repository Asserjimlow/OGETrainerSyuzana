unit HelpForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormHelp = class(TForm)
    lblHelp: TLabel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHelp: TFormHelp;

implementation

{$R *.dfm}

procedure TFormHelp.btnCloseClick(Sender: TObject);
begin
FormHelp.Hide;
end;

procedure TFormHelp.FormShow(Sender: TObject);
begin
lblHelp.Caption :='����������:' + #13#10 +
                  '1. ������� ���, ���� � ������.' + #13#10 +
                  '2. �������� �� 20 ��������.' + #13#10 +
                  '3. ������� "��������� ����", ����� ������� �����.' + #13#10 +
                  '4. ��� ���������� ����������� � ������.'+ #13#10 +
                  '5. �� ������ ����� � ������� ���� ��� ������ ����� ����.' + #13#10 + #13#10 +
                  '���� ��������� �������, ���������� � �������������.'+ #13#10 +
                  '�����!';

end;

end.
