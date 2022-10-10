unit ulib;

interface
uses SysUtils, Classes;


function ufMsgInfo(pi_MsgFlg : Integer; pi_DisParam : String) : String;
function ufEncrypt(const S: String; Key: Word): String;
function ufDecrypt(const S: String; Key: Word): String;



implementation
uses uConst;

//****************************************************************************//
//* Vitamin에서 사용하는 메시지 정보를 나타낸다.
//* Parameter : p_MessageFlag : 메시지 정의
//*             p_sDisParam : 표현하고자 하는 파라메터(구분자 -> ^)
//*             Information - 100 Start
//*             Confirm     - 300 Start
//*             waring      - 600 Start
//*             Error       - 900 Start
//*             DBError     - 1000 Start
//****************************************************************************//
function ufMsgInfo(pi_MsgFlg : Integer; pi_DisParam : String) : String;
var
   lv_msg   : String;
   lv_stlMsg : TStringList;
begin
   lv_stlMsg := TStringList.Create;
   lv_stlMsg.StrictDelimiter := True;
   try
      case pi_msgFlg of
         901 : lv_msg := '로그인 아이디를 입력해 주세요.';
         902 : lv_msg := '로그인 비림번호를 입력해 주세요.';
         903 : lv_msg := '로그인이 실패 되었습니다.';
      end;
   finally
      FreeAndNil(lv_stlMsg);
   end;
   Result := lv_msg;
end;

//****************************************************************************//
//* 들어온 문자를 암호화
//****************************************************************************//
function ufEncrypt(const S: String; Key: Word): String;
var
   i: byte;
   sEncrypt, rEncrypt: String;
   rChar: Char;
begin
   sEncrypt := ''; // 암호화된 이진 문자열
   if S = '' then begin
      ufEncrypt := '';
      System.Exit;
   end;

   for i := 1 to Length(S) do begin
      sEncrypt := sEncrypt + char(byte(S[i]) xor (Key shr 8));
      Key := (byte(sEncrypt[i]) + Key) * C1 + C2;
   end;

   rEncrypt := ''; // 암호화된 이진 문자열을 ASCII 숫자로 변경
   for i := 1 to Length(sEncrypt) do begin
      rChar := sEncrypt[i];
      rEncrypt := rEncrypt + format('%.3d', [Ord(rChar)]); // 한문자당 3자리씩
   end;
   Result := rEncrypt;
end;

//****************************************************************************//
//* 들어온 문자를 복호화
//****************************************************************************//
function ufDecrypt(const S: String; Key: Word): String;
var
   i: byte;
   sDecrypt, rDecrypt, temp: String;
begin
   rDecrypt := '';
   if S = '' then begin
      ufDecrypt := '';
      System.Exit;
   end;

   i := 1;
   repeat
      temp := Copy(S, i, 3); // 한문자당 3자리 숫자로 저장되어 있다
      rDecrypt := rDecrypt + Chr(StrToIntDef(temp, 0)); // ASCII값을 구한다
      i := i + 3;
   until i > Length(S);

   sDecrypt := '';
   for i := 1 to Length(rDecrypt) do begin
      sDecrypt := sDecrypt + char(byte(rDecrypt[i]) xor (Key shr 8));
      Key := (byte(rDecrypt[i]) + Key) * C1 + C2;
   end;
   Result := sDecrypt;
end;

end.
