unit uclsProperEdit;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TProperEdit = class(TEdit)
  private
    procedure KeyPress(var Key: Char); override;
  public
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sabium', [TProperEdit]);
end;

{ TProperEdit }

procedure TProperEdit.KeyPress(var Key: Char);
begin
  inherited;

  if (key in ['a'..'z', 'A'..'Z']) then
    if (Text = '') or (Text[Length(Text)] = ' ') then
    begin
      Key := UpCase(Key);
    end;
end;

end.
