unit uUnidac;

interface
uses System.SysUtils, Vcl.Forms, Inifiles, System.Classes, Winapi.Windows, Data.DB, DBAccess, Uni;

{-- 2차원 배열 --}
type
   TArrayArray = Array of Array of String;

function ufDBConn(pi_Flg : Integer; pi_ObjDbConn : TUniConnection; pi_DbConnInfo : TArray<String>) : String;
//****************************************************************************//
//* SQL을 실행한다.
//****************************************************************************//
function ufBackGroundUniSQLExec(pi_Flg : Integer; pi_Sql, pi_SQLSession : String; pi_stlParam : TStringList; pi_ObjQry : TUniQuery) : TArray<String>;
//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function fGetQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;

implementation


uses udate, ustring;

//****************************************************************************//
//* DB Connection
//* pi_flg :
//*   - 0 : Oracle
//*     1 : MS-SQL
//*     2 : MySQL
//*     3 : Mariadb
//*     4 : Postgresql
//*     6 : Firebird
//*     7 : Sqlite
//****************************************************************************//
function ufDBConn(pi_Flg : Integer; pi_ObjDbConn : TUniConnection; pi_DbConnInfo : TArray<String>) : String;
var
   lv_RetVal : String;
   lv_DbProvider, lv_DbHost, lv_DbPort, lv_DbUserId, lv_DbUserPwd, lv_DbName : String;
   lv_DbServiceName, lv_DbCharacterSet : String;
begin
   lv_RetVal := 'SUCCESS';
   try
      lv_DbProvider := pi_DbConnInfo[0];
      lv_DbHost     := pi_DbConnInfo[1];
      lv_DbPort     := pi_DbConnInfo[2];
      lv_DbUserId   := pi_DbConnInfo[3];
      lv_DbUserPwd  := pi_DbConnInfo[4];
      lv_DbName     := pi_DbConnInfo[5];

      lv_DbServiceName  := pi_DbConnInfo[6];
      lv_DbCharacterSet := pi_DbConnInfo[7];

      with pi_ObjDbConn do
      begin
         Connected   := False;
         Name        := lv_DbName;
         LoginPrompt := False;
         AutoCommit  := False;

         ProviderName := lv_DbProvider;

         case pi_Flg of
            0 :
               begin
                  Username := lv_DbUserId;
                  Password := lv_DbUserPwd;
                  Server   := lv_DbHost;
                  Port     := StrToInt(lv_DbPort);

                  Server := lv_DbHost + ':' + lv_DbPort + ':' + lv_DbServiceName;
                  SpecificOptions.Values['Direct'] := 'True';
                  SpecificOptions.Values['Charset'] := lv_DbCharacterSet;
                  SpecificOptions.Values['UseUnicode'] := 'True';
               end;
            7 :
               begin
                  Connected := False;
                  // local DB를 사용
                  Database := lv_DbServiceName;
                  SpecificOptions.Values['Direct'] := 'True';
                  SpecificOptions.Values['ForceCreateDatabase'] := 'True';
                  SpecificOptions.Values['EncryptionAlgorithm'] := 'leAES256';
                  SpecificOptions.Values['UseUnicode'] := 'True';
               end;
         end;

         Connected := True;
      end;
      lv_RetVal := 'SUCCESS';
   except
      on E : Exception do
      begin
         lv_RetVal := 'FAIL : ' + E.Message;
      end;
   end;

   Result := lv_RetVal;
end;

//****************************************************************************//
//* SQL을 실행한다.
//****************************************************************************//
function ufBackGroundUniSQLExec(pi_Flg : Integer; pi_Sql, pi_SQLSession : String; pi_stlParam : TStringList; pi_ObjQry : TUniQuery) : TArray<String>;
var
   lv_iParamCnt : Integer;
   lv_bCheck    : Boolean;
   lv_Sql, lv_Msg, lv_QryElapsedTM, lv_tmpStr : String;

   {-- 소요시간 계산  --}
   lv_dtStart, lv_dtEnd : TDateTime;
   lv_SqlExecTime, lv_SpoolParam : String;

   {-- SQL Error --}
   lv_SQLErrLineNum, lv_SQLErrColNum : Integer;
   lv_retVal : TArray<String>;
begin
   SetLength(lv_retVal, 3);
   {-- Local Variable Initialize --}
   lv_bCheck := True;
   lv_Msg   := '';
   lv_Sql   := pi_Sql;
   lv_SpoolParam := '';

   {-- SQL 실행 시간 --}
   lv_SqlExecTime := ufDateFormat(5, Now);

   {-- Global 변수 초기화 (SQL Parase Error)  --}
   lv_SQLErrLineNum := 0;
   lv_SQLErrColNum  := 0;
   try
      with pi_ObjQry do
      begin
         Active     := False;
         try
            SQL.Clear;
            SQL.Text := lv_Sql;
            {-- 소요시간 Start --}
            lv_dtStart := Now;
            Case pi_Flg of
               0 :
                  begin  {-- Parameter 와 SQL 같이 오는 경우 --}
                     FetchRows := 100;
                     Active := True;
                  end;
               1 :
                  begin  {-- Parameter 와 SQL 따로 오는 경우 --}
                     for lv_iParamCnt := 0 to pi_stlParam.Count - 1 do
                     begin
                        Params[lv_iParamCnt].AsString := pi_stlParam.Strings[lv_iParamCnt];
                        if lv_iParamCnt = 0 then lv_SpoolParam := '### Parameter : ' + pi_stlParam.Strings[lv_iParamCnt]
                        else lv_SpoolParam := lv_SpoolParam + ', ' + pi_stlParam.Strings[lv_iParamCnt];
                     end;
                     FetchRows := 100;
                     Active := True;
                  end;
               2 :
                  begin {-- Parameter 와 SQL 같이 오는 경우 --}
                     ExecSQL;
                     lv_retVal[1] := IntToStr(pi_ObjQry.RowsAffected);
                  end;
               3 :
                  begin
                     for lv_iParamCnt := 0 to pi_stlParam.Count - 1 do
                     begin
                        lv_tmpStr := pi_stlParam.Strings[lv_iParamCnt];

                        if Pos('BLOB^', lv_tmpStr) > 0 then
                        begin
                           SpecificOptions.Values['TemporaryLOBUpdate'] := 'True';
                           Params[lv_iParamCnt].DataType := ftOraClob;
                           Params[lv_iParamCnt].ParamType := ptInput;
                           Params[lv_iParamCnt].AsBlobRef.AsString := Copy(lv_tmpStr, Pos('^', lv_tmpStr) + 1, Length(lv_tmpStr));
                        end else
                        begin
                           SpecificOptions.Values['TemporaryLOBUpdate'] := 'False';
                           Params[lv_iParamCnt].DataType := ftString;
                           Params[lv_iParamCnt].AsString := pi_stlParam.Strings[lv_iParamCnt];
                        end;

                        if lv_iParamCnt = 0 then lv_SpoolParam := '### Parameter : ' + pi_stlParam.Strings[lv_iParamCnt]
                        else lv_SpoolParam := lv_SpoolParam + ', ' + pi_stlParam.Strings[lv_iParamCnt];
                     end;
                     ExecSQL;
                     lv_retVal[1] := IntToStr(pi_ObjQry.RowsAffected);
                  end;
            end;
            lv_retVal[0] := 'SUCCESS';
         except
            on E : Exception do
            begin
               {-- SQL Parae Error 정보 --}
               lv_Msg := '##### SQL Fail !!! : ' + E.Message + ' #####';
               lv_retVal[0] := 'FAIL';
               lv_retVal[1] := lv_Msg;
            end;
         end;
      end;
   finally
      {-- 소요시간 End --}
      lv_dtEnd := Now;
      lv_QryElapsedTM := 'SQL Elapsed Time : ' + fGetQueryElapsedTime(0, lv_dtStart, lv_dtEnd);
      {-- 소요시간 Logging --}
      lv_Msg := '######### SQL 실행 시간 :  ' + lv_SqlExecTime + ' - ' + lv_QryElapsedTM + ' ##########';
      lv_retVal[2] := lv_Msg;
   end;
   Result := lv_retVal;
end;

//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function fGetQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;
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
  lv_ElpTime := LPad(IntToStr( lv_Hour), '0', 2)  + ':'
              + LPad(IntToStr( lv_Min ), '0', 2)  + ':'
              + LPad(IntToStr( lv_Sec ), '0', 2) + '.'
              + LPad(IntToStr( lv_MSec), '0', 2);

  Result := lv_ElpTime;
end;

end.



{

uses
  Uni,
  NetEncoding;

procedure SetDatabaseParams(const DB: TUniConnection; const DBName, DllName: string);
begin
  DB.Close();
  DB.ProviderName := 'SQLite';
  DB.Database := DBName;
  // If you prefer to use a SQLite.DLL you need below code.
  // Can be safely assigned EmptyStr to the parameter
  DB.SpecificOptions.Values['ClientLibrary']       := DllName;
  DB.SpecificOptions.Values['ForceCreateDatabase'] := 'True';
  DB.SpecificOptions.Values['Direct'] := 'True';
  // Create Encrypted Database
  DB.SpecificOptions.Values['EncryptionAlgorithm'] := 'leAES256';
  DB.SpecificOptions.Values['EncryptionKey'] := TNetEncoding.Base64.EncodeBytesToString(TBytes(KeyDB));
end;

object UniConnection1: TUniConnection
    ProviderName = 'SQLite'
    SpecificOptions.Strings = (
      'SQLite.Direct=True'
      'SQLite.EncryptionAlgorithm=leAES256'
      'SQLite.ForceCreateDatabase=True'
      'SQLite.UseUnicode=True')
}