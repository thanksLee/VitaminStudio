unit ufile;

interface
uses System.SysUtils, Vcl.Forms, Inifiles, System.Classes, Winapi.Windows;

{-- 2���� �迭 --}
type
   TArrayArray = Array of Array of String;

   function UfCreateDir(pi_Flg : Integer; pi_DirPath : String) : String;

implementation

//****************************************************************************//
//* Directory ���丮 ������ �Ѵ�.
//* Parameter :
//*   pi_Flg
//*     - 0 : Directory �Ѱ�
//*     - 1 : Directory ��δ�� ����
//*   pi_DirPath - ���丮 ���
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
