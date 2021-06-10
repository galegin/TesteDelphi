unit Unit2;

interface

type
  TNumDivisor = class
  private
    FNumero: integer;
    procedure SetNumero(const Value: integer);
  public
    function GetNumeroDivisores() : Integer;
  published
    property Numero : integer read FNumero write SetNumero;
  end;

  TNumPrimo = class(TNumDivisor)
  public
    function IsNumeroPrimo : boolean;
  end;

implementation

{ TNumDivisor }

function TNumDivisor.GetNumeroDivisores: Integer;
var
  I: Integer;
begin
  Result := 0;

  for I := 1 to FNumero do
  begin
    if ((FNumero mod I) = 0) then
    begin
      inc(Result);
    end;
  end;
end;

procedure TNumDivisor.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

{ TNumPrimo }

function TNumPrimo.IsNumeroPrimo: boolean;
begin
  Result := GetNumeroDivisores() = 2;
end;

end.
