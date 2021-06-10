unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Edit2: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
var
  vNumDivisor : TNumDivisor;
  vNumPrimo : TNumPrimo;
begin
  Memo1.Clear;

  vNumDivisor := TNumDivisor.Create;
  vNumDivisor.Numero := StrToIntDef(Edit1.Text, 0);
  Memo1.Lines.Add('Valor de entrada...: ' + IntToStr(vNumDivisor.Numero));
  Memo1.Lines.Add('Numero de divisores: ' + IntToStr(vNumDivisor.GetNumeroDivisores));
  Memo1.Lines.Add('');
  vNumDivisor.Free;

  vNumPrimo := TNumPrimo.Create;
  vNumPrimo.Numero := StrToIntDef(Edit2.Text, 0);
  Memo1.Lines.Add('Valor de entrada...: ' + IntToStr(vNumPrimo.Numero));
  Memo1.Lines.Add('Numero primo ? ' + IfThen(vNumPrimo.IsNumeroPrimo, 'True', 'False'));
  vNumDivisor.Free;
end;

end.
