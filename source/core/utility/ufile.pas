unit ufile;

interface
uses SysUtils, Forms, Inifiles, Classes, Windows, Grids,
  {-- S : Edit Match --}
  SynEdit, SynTokenMatch, SynHighlighterWebMisc, ToolWin, Clipbrd, SynEditKeyCmds, SynEditTypes, cxTL
  {-- E : Edit Match --}
 ;

{-- 2차원 배열 --}
type
   TArrayArray = Array of Array of String;

   function UfCreateDir(pi_Flg : Integer; pi_DirPath : String) : String;
   procedure upSGrdClear(pi_ObjSGrd : TStringGrid);

   function ufReadINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
   function ufReadINI(pi_FileNm, pi_Section : String; pi_ObjSGrd : TStringGrid) : String; Overload;

   function ufWriteINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
   function ufWriteINI(pi_FileNm : String; pi_ObjSGrd : TStringGrid) : String; Overload;

   function ufReadSectionKeyValue(pi_FileNm, pi_SectionNm : String; pi_SectionKeyLst : TStringList) : String;
   procedure upLogFileWrite(pi_Flg : Integer; pi_LogMsg: String);
   function ufSQLSpool(pi_Flg, pi_SQLErrLineNum, pi_SQLErrColNum : Integer; pi_Sql, pi_Msg : String) : String;


var
   {-- Ini File 을 사용하기 위해서 선언 --}
   pb_iniEnv : TIniFile;

implementation

//****************************************************************************//


uses uConst, uGlobal, ustring;//* Directory 디렉토리 생성을 한다.
//* Parameter :
//*   pi_Flg
//*     - 0 : Directory 한개
//*     - 1 : Directory 경로대로 생성
//*   pi_DirPath - 디렉토리 경로
//* ex) ufCreateDir('c:\sample\');
//****************************************************************************//
function UfCreateDir(pi_flg : Integer; pi_DirPath : String) : String;
var
    lv_RetVal : String;
begin
   lv_RetVal := 'SUCCESS';
   try
      if DirectoryExists(pi_DirPath) = False then
      begin
         if pi_Flg = 0 then CreateDir(pi_DirPath)
         else ForceDirectories(pi_DirPath);
      end;
   except
      on E : Exception do
      begin
         lv_RetVal := 'FAIL - ' + E.Message;
      end;
   end;
   Result := lv_RetVal;
end;

//****************************************************************************//
//* Inifile을 읽고 쓰기 위해 사용
//****************************************************************************//
procedure upSGrdClear(pi_ObjSGrd : TStringGrid);
var
   lv_LoopCnt : Integer;
begin
   for lv_LoopCnt := 0 to pi_ObjSGrd.ColCount - 1 do
   begin
      pi_ObjSGrd.Cols[lv_LoopCnt].Clear;
   end;
end;

//****************************************************************************//
//* Inifile 정보를 읽어 들인다.
//****************************************************************************//
function ufReadINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
var
   lv_reVal : String;
begin
   lv_reVal := 'SUCCESS';
   if FileExists(pi_FileNm) then
   begin
      pb_iniEnv := TIniFile.Create(pi_FileNm);
      try
         try
            Result := pb_iniEnv.ReadString(pi_Section, pi_Nm, pi_Value);
         except
            on E : Exception do
            begin
               lv_reVal := 'FAIL - ' + E.Message;
            end;
         end; // try..exception
      finally
        pb_iniEnv.Free;
        {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
        WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
      end; // try..finally
   end; //if FileExists(pi_FileNm) then begin
end;

function ufReadINI(pi_FileNm, pi_Section : String; pi_ObjSGrd : TStringGrid) : String; Overload;
var
   lv_reVal : String;
begin
  if FileExists(pi_FileNm) then begin
    pb_iniEnv := TIniFile.Create(pi_FileNm);
    try
      try
        //Result := pv_iniEnv.ReadString(pi_Section, pi_Nm, pi_Value);
      except
        on E : Exception do begin
           lv_reVal := 'FAIL - ' + E.Message;
        end;
      end; // try..exception
    finally
      pb_iniEnv.Free;
      {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
      WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
    end; // try..finally
  end; //if FileExists(pi_FileNm) then begin
end;

//****************************************************************************//
//* Inifile에 값을 정의 한다
//* Parameter : pi_FileNm - ini 파일명을 포함 전체 경로
//*             pi_Section - ini 파일의 섹션
//*             pi_Nm      - 명
//*             pi_Value   - 값
//*             ex) [섹션]
//*                 명 = 값
//* ex) ufWriteINI('c:\sample.ini', 섹션, 명, 값);
//****************************************************************************//
function ufWriteINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
var
   lv_Return : String;
begin
   lv_Return := 'SUCCESS';
   pb_iniEnv := TIniFile.Create(pi_FileNm);
   try
     try
       pb_iniEnv.WriteString(pi_Section, pi_Nm, pi_Value);
     except
       on E : Exception do begin
          lv_Return := 'FAIL - ' + E.Message;
       end;
     end;
   finally
     pb_iniEnv.Free;
     {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
     WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
     Result := lv_Return;
   end;
end;

function ufWriteINI(pi_FileNm : String; pi_ObjSGrd : TStringGrid) : String; Overload;
var
  lv_LoopCnt : Integer;
  lv_Section, lv_Nm, lv_Value : String;
  lv_Return : String;
begin
  lv_Return := '';
  pb_iniEnv := TIniFile.Create(pi_FileNm);
  try
    try
      for lv_LoopCnt := 0 to pi_ObjSGrd.RowCount - 1 do
      begin
        lv_Section := pi_ObjSGrd.Rows[lv_LoopCnt].Strings[0];
        lv_Nm      := pi_ObjSGrd.Rows[lv_LoopCnt].Strings[1];
        lv_Value   := pi_ObjSGrd.Rows[lv_LoopCnt].Strings[2];

        pb_iniEnv.WriteString(lv_Section, lv_Nm, lv_Value);
      end;
      lv_Return := 'SUCCESS';

      //pv_iniEnv.WriteString(pi_Section, pi_Nm, pi_Value);
    except
      on E : Exception do begin
        lv_Return := 'ERROR';
      end;
    end;
  finally
    pb_iniEnv.Free;
    {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
    WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
    Result := lv_Return;
  end;
end;

function ufReadSectionKeyValue(pi_FileNm, pi_SectionNm : String; pi_SectionKeyLst : TStringList) : String;
var
  lv_Return : String;
begin
  pb_iniEnv := TIniFile.Create(pi_FileNm);
  try
    try
      pb_iniEnv.ReadSectionValues(pi_SectionNm, pi_SectionKeyLst);
      lv_Return := '0';
    except
      on E : Exception do begin
        lv_Return := '-1';
      end;
    end;
  finally
    pb_iniEnv.Free;
    {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
    WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
    Result := lv_Return;
  end;
end;

procedure upLogFileWrite(pi_Flg : Integer; pi_LogMsg: String);
var
   lv_FStream : TFileStream;
   lv_LogFileNm : String;
begin
   lv_LogFileNm := getBasePath() + LOGSDIR + getLogFileNm();
   if FileExists(lv_LogFileNm) = False then
   begin
      lv_FStream := TFileStream.Create(lv_LogFileNm, fmCreate);
      lv_FStream.Free;
   end;
   lv_FStream := TFileStream.Create(lv_LogFileNm, fmOpenReadWrite or fmShareDenyNone);
   try
      lv_FStream.Position := 0;

      lv_FStream.Write(pi_LogMsg, Length(pi_LogMsg));
   finally
      lv_FStream.Free;
   end;
end;

//****************************************************************************//
//* Vitamin SQL Spool
//* Parameter : pi_Flg
//*             pi_SQLErrLineNum : (Editor Y)
//*             pi_SQLErrColNum  : (Editor X)
//*             pi_Sql
//*             pi_SQLMsg
//*             pi_ObjSynEdt
//****************************************************************************//
function ufSQLSpool(pi_Flg, pi_SQLErrLineNum, pi_SQLErrColNum : Integer; pi_Sql, pi_Msg : String) : String;
var
   {-- Log를 저장하기 위한 변수 선언 --}
   lv_FileDir, lv_LogFileNm : String;
   lv_logFile : TextFile;

   lv_LoopCnt, lv_LogLineCnt1, lv_LogLineCnt2 : Integer;
   lv_TmpStr, lv_tmpLog : String;

   lv_SqlTmpEd : TSynEdit;
begin
   lv_LogFileNm := getBasePath() + LOGSDIR + '\'+ getLogFileNm();
   lv_SqlTmpEd := TSynEdit.Create(nil);
   try
      lv_SqlTmpEd.Clear;
      lv_SqlTmpEd.Text := pi_Sql;
      //lv_SqlTmpEd.Lines.Add('');

      case pi_Flg of
         1 :
            begin
               lv_SqlTmpEd.Lines.Add(pi_Msg);
            end;
        9 : begin //* SQL 오류
              lv_SqlTmpEd.Lines.Insert(  pi_SQLErrLineNum+1
                                       , RPad('└', ' ', pi_SQLErrColNum)
                                                   + '[ '
                                                   + StringReplace(pi_Msg, #10, '', [rfReplaceAll])
                                                   + ' ]'
                                                   );
            end;
        10 : begin //* PL/SQL 오류
              lv_TmpStr := StringReplace(pi_Msg, #13, #10, [rfReplaceAll]);
              lv_TmpStr := StringReplace(lv_TmpStr, 'PL/SQL', 'PLS-', [rfReplaceAll]);
              lv_TmpStr := Copy(lv_TmpStr, Pos('PLS-', lv_TmpStr), Length(lv_TmpStr));
              lv_TmpStr := Copy(lv_TmpStr, 1, Pos(#10, lv_TmpStr)-1);
            end;
      end;

      {-- Log file 저장 : Start --}
      AssignFile(lv_logFile, lv_LogFileNm);
      if FileExists(lv_LogFileNm) = False then
      begin
         Rewrite(lv_logFile);
      end else
      begin
         Reset(lv_logFile);
         Append(lv_logFile);
      end;

      for lv_LoopCnt := 0 to lv_SqlTmpEd.Lines.Count - 1 do
      begin
         Writeln(lv_logFile, lv_SqlTmpEd.Lines.Strings[lv_LoopCnt]);
      end;
      Writeln(lv_logFile);
      {-- Log file 저장 : End --}
   finally
      CloseFile(lv_logFile);
      lv_SqlTmpEd.Free;
   end;
end;


end.
