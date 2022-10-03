unit ustring;

interface
uses System.SysUtils, Vcl.Forms, Inifiles, System.Classes, Winapi.Windows;

function RPad(S: string; Ch: Char; Len: Integer): string; overload;
function LPad(S: string; Ch: Char; Len: Integer): string; overload;

implementation

function RPad(S: string; Ch: Char; Len: Integer): string; overload;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function LPad(S: string; Ch: Char; Len: Integer): string; overload;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

end.
