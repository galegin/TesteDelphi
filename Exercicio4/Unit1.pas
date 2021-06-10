unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.StrUtils, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Memo1: TMemo;
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

  function ContarPalavras(arquivo : string) : integer;
  var
    vConteudo: TStringList;
    vLinha: String;
    vPalavras: TStringDynArray;
  begin
    Result := 0;

    vConteudo:= TStringList.Create;
    vConteudo.LoadFromFile(arquivo);
    for vLinha in vConteudo do
    begin
      SplitString(vLinha, ' ');
      Result := Result + Length(SplitString(vLinha, ' '));
    end;
  end;

  procedure ProcessarArquivo(arquivo : string);
  var
    vThread : TThread;
  begin
    TThread.CreateAnonymousThread(
      procedure
      var
        vQtdePalavras: Integer;
      begin
        vQtdePalavras := ContarPalavras(arquivo);
        Form1.Memo1.Lines.Add(ExtractFileName(arquivo) + ': ' + 
          IntToStr(vQtdePalavras) + ' palavras');
      end
    ).Start;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
begin
  with OpenDialog1 do
  begin
    InitialDir := GetCurrentDir();
    if Execute then
    begin
      for i := 0 to Files.Count - 1 do
      begin
        ProcessarArquivo(Files[i]);
      end;
    end;
  end;
end;

end.
