unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

type
  TForm1 = class(TForm)
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

type
  TLetra = class
    letra : string;
    qtde : integer;
  end;

  function Buscar(lista: TList<TLetra>; letra: string) : TLetra;
  var
    item : TLetra;
  begin
    Result := nil;

    for item in lista do
    begin
      if (item.letra = letra) then
      begin
        Result := item;
        Exit;
      end;
    end;
  end;

  procedure Adicionar(lista: TList<TLetra>; letra: string);
  var
    vLetra : TLetra;
  begin
    vLetra := Buscar(lista, letra);
    if (Assigned(vLetra)) then
    begin
      vLetra.qtde := vLetra.qtde + 1;
      exit;
    end;

    vLetra := TLetra.Create;
    vLetra.letra := letra;
    vLetra.qtde := 1;
    lista.Add(vLetra);
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  vLetraList : TList<TLetra>;
  vLetraRec : TLetra;
  vList : TStringList;
  vLine : String;
  vChar : Char;
  vTotal, vPerc : Real;
  I: Integer;
begin
  vLetraList := TList<TLetra>.Create;

  vList := TStringList.Create;
  vList.LoadFromFile('Conteudo.txt');

  for vLine in vList do
  begin
    for vChar in vLine do
    begin
      if (vChar in ['a'..'z', 'A'..'Z']) then
      begin
        Adicionar(vLetraList, LowerCase(vChar));
      end;
    end;
  end;

  vTotal := 0;

  for vLetraRec in vLetraList do
  begin
    vTotal := vTotal + vLetraRec.qtde;
  end;

  vList.Clear;

  for vLetraRec in vLetraList do
  begin
    vPerc := vLetraRec.qtde / vTotal * 100;
    vList.Add('"' + vLetraRec.letra + '" = ' + FormatFloat('0.00', vPerc) + '%');
  end;

  vList.Sort;

  Memo1.Lines.Clear;
  Memo1.Lines.Add('Total de letras: ' + FloatToStr(vTotal));
  Memo1.Lines.Add('Percentuais:');

  for vLine in vList do
    Memo1.Lines.Add(vLine);

  vList.Free;
end;

end.
