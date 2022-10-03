unit uGlobal;

interface
type
 TDBSQL = record
    rSQLId       : String;
    rSQLDesc     : String;
    rSQLParamCnt : String;
    rSQLText     : String;
 end;

var
   pb_BasePath : String;
   pb_WordicDbPath : String;
   pb_SqliteLibPath: String;
   pb_DBSQL : array of TDBSQL;

   procedure setBasePath(pi_BasePath: String);
   function getBasePath(): String;

   procedure setWordicDbPath(pi_WordicDbPath: String);
   function getWordicDBPath() : String;

   procedure setSqliteLibPath(pi_LibPath: String);
   function getSqliteLibPath(): String;

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

end.
