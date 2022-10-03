unit ufile;

interface
uses System.SysUtils, Vcl.Forms, Inifiles, System.Classes, Winapi.Windows;

{-- 2차원 배열 --}
type
   TArrayArray = Array of Array of String;

   function UfCreateDir(pi_Flg : Integer; pi_DirPath : String) : String;

implementation

//****************************************************************************//
//* Directory 디렉토리 생성을 한다.
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

end.
