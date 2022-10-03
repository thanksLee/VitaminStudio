unit udate;

interface
uses System.SysUtils, Vcl.Forms, Inifiles, System.Classes, Winapi.Windows;

//****************************************************************************//
//* Date Formate
//****************************************************************************//
function ufDateFormat(pi_Flg : Integer; pi_Date : TDateTime) : String;

implementation

//****************************************************************************//
//* Date Formate
//****************************************************************************//
function ufDateFormat(pi_Flg : Integer; pi_Date : TDateTime) : String;
var
   lv_Date : String;
begin
   case pi_Flg of
      0 : lv_Date := FormatDateTime('yyyy-mm-dd hh:nn:ss dddd', pi_Date);
      1 : lv_Date := FormatDateTime('yyyy-mm-dd', pi_Date);
      2 : lv_Date := FormatDateTime('t', pi_Date);
      3 : lv_Date := FormatDateTime('tt', pi_Date);
      4 : lv_Date := FormatDateTime('yyyymmddhhnnsszzz', pi_Date);
      5 : lv_Date := FormatDateTime('yyyy-mm-dd hh:nn:ss', pi_Date);
      6 : lv_Date := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', pi_Date);
      7 : lv_Date := FormatDateTime('yyyymmdd', pi_Date);
      8 : lv_Date := FormatDateTime('yyyymmddhhnnss', pi_Date);
      9 : lv_Date := FormatDateTime('yyyymm', pi_Date);
      99 : lv_Date := FormatDateTime('yyyy-mm-dd', now);
   end;
   Result := lv_Date;
end;

end.
