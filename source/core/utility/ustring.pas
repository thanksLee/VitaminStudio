unit ustring;

interface
uses System.SysUtils, Vcl.Forms, Inifiles, System.Classes, Winapi.Windows;

function RPad(S: string; Ch: Char; Len: Integer): string; overload;
function LPad(S: string; Ch: Char; Len: Integer): string; overload;
function ufNumberFormat(pi_Flg : Integer; pi_Data : Double) : String;
function ufQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;


implementation

function LPad(S: string; Ch: Char; Len: Integer): string; overload;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function RPad(S: string; Ch: Char; Len: Integer): string; overload;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

//****************************************************************************//
//* 숫자에 ,를 추가한다.                                                                                                                            //
//* Parameter : pi_Flg - format Mode
//*             pi_Data - 숫자 데이터
//* ex) Value := ufInsComma('1000000')                                                                                                                  //
//****************************************************************************//
function ufNumberFormat(pi_Flg : Integer; pi_Data : Double) : String;
var
  lv_Result : String;
  lv_TmpStr : String;
  lv_StlTmp : TStringList;
begin
  try
    try
      case pi_Flg of
        1 : lv_Result := FormatFloat('#,##0', pi_Data);
        9 : begin
              lv_TmpStr := ufNumberFormat(1, pi_Data);
              lv_StlTmp := TStringList.Create;
              try
                ExtractStrings(  [',']
                               , [' ']
                               , PChar(lv_TmpStr)
                               , lv_StlTmp
                               );
                lv_Result := lv_StlTmp.Strings[0];
                case (lv_StlTmp.Count-1) of
                  0 : lv_Result := lv_Result + 'kb';
                  1 : lv_Result := lv_Result + 'k';
                  2 : lv_Result := lv_Result + 'm';
                  3 : lv_Result := lv_Result + 'g';
                  4 : lv_Result := lv_Result + 't';
                end;
              finally
                lv_StlTmp.Free;
              end;
            end;
      end;
    except
      case pi_Flg of
        1 : lv_Result := '0'
        else
          lv_Result := '';
      end;
    end;
  finally
    Result := lv_Result;
  end;
end;

//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function ufQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;
var
  {-- 소요시간 계산  --}
  lv_Hour, lv_Min, lv_Sec, lv_MSec : Word;
  lv_dtElp : TDateTime;
  lv_strtmp, lv_StartTime, lv_EndTime, lv_ElpTime : String;
begin
  lv_StartTime := TimeToStr( pi_StartTime );
  lv_EndTime := TimeToStr( pi_EndTime );

  lv_dtElp := pi_EndTime - pi_StartTime;
  DecodeTime( lv_dtElp, lv_Hour, lv_Min, lv_Sec, lv_MSec );

//  lv_ElpTime := LeftPad(IntToStr( lv_Hour * 60 + lv_Min ), '0', 2)  + ':'
  lv_ElpTime := RPad(IntToStr( lv_Hour), '0', 2)  + ':'
              + RPad(IntToStr( lv_Min ), '0', 2)  + ':'
              + RPad(IntToStr( lv_Sec ), '0', 2) + '.'
              + RPad(IntToStr( lv_MSec), '0', 2);

  Result := lv_ElpTime;
end;

end.
