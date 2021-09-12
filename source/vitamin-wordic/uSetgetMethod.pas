unit uSetgetMethod;

interface

procedure setAppPath(pi_Param : String);
function getAppPath : String;

implementation
var
   pb_AppPath : String;

procedure setAppPath(pi_Param : String);
begin
   pb_AppPath := pi_Param;
end;

function getAppPath : String;
begin
   Result := pb_AppPath;
end;

end.
