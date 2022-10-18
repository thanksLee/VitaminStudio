unit uGlobal;

interface

type
 TDBSQL = record
    rSQLId       : String;
    rSQLDesc     : String;
    rSQLParamCnt : String;
    rSQLText     : String;
 end;

type
 TWORDDICSESSION = record
    rUserId      : String;
    rUserAuth    : String;
    rDBFilePath  : String;
    rConnFlg     : String;
 end;


var
   pb_BasePath : String;
   pb_WordicDbPath : String;
   pb_SqliteLibPath: String;

   pb_DBSQL : array of TDBSQL;
   pb_WordDicSession : array of TWORDDICSESSION;

   pb_DebugMode : Boolean;

   {-- Source Match 변수 --}
   pb_FMatchPainted  : Boolean;
   pb_FPaintUpdating : Boolean;

   {-- Search & Replace --}
   pb_SearchBackWards     : Boolean;
   pb_SearchCaseSensitive : Boolean;
   pb_SearchFromCaret     : boolean;
   pb_SearchSelectionOnly : boolean;
   pb_SearchTextAtCaret   : boolean;
   pb_SearchWholeWords    : boolean;
   pb_SearchRegex         : boolean;

   pb_SearchText         : String;
   pb_SearchTextHistory  : String;
   pb_ReplaceText        : String;
   pb_ReplaceTextHistory : String;

   {-- SynEditor Status --}
   pb_SynEdSelStat : Boolean;

   {-- Log --}
   pb_LogFileNm : String;
   {-- Active Log Form Name --}
   pb_ActiveLogFilePath : String;

   {-- 메시지 정의 --}
   pb_arrMsg : array[0..1000] of Char;


   procedure setBasePath(pi_BasePath: String);
   function getBasePath(): String;

   procedure setWordicDbPath(pi_WordicDbPath: String);
   function getWordicDBPath() : String;

   procedure setSqliteLibPath(pi_LibPath: String);
   function getSqliteLibPath(): String;

   procedure setDebugMode(pi_Mode: Boolean);
   function getDebugMode() : Boolean;

   procedure setLogFileNm(pi_LogSuffix : String);
   function getLogFileNm() : String;

implementation

procedure setBasePath(pi_BasePath: String);
begin
   pb_BasePath := pi_BasePath;
end;

function getBasePath(): String;
begin
   Result := pb_BasePath;
end;

procedure setWordicDbPath(pi_WordicDbPath: String);
begin
   pb_WordicDbPath := pi_WordicDbPath;
end;

function getWordicDBPath() : String;
begin
   Result := pb_WordicDbPath;
end;

procedure setSqliteLibPath(pi_LibPath: String);
begin
   pb_SqliteLibPath := pi_LibPath;
end;

function getSqliteLibPath(): String;
begin
   Result := pb_SqliteLibPath;
end;

procedure setDebugMode(pi_Mode: Boolean);
begin
   pb_DebugMode := pi_Mode;
end;

function getDebugMode() : Boolean;
begin
   Result := pb_DebugMode;
end;

procedure setLogFileNm(pi_LogSuffix : String);
begin
   pb_LogFileNm := pi_LogSuffix + '.log';
end;

function getLogFileNm() : String;
begin
   Result := pb_LogFileNm;
end;
end.
