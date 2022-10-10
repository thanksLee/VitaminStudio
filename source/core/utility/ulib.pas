unit ulib;

interface
uses SysUtils, Classes;


function ufMsgInfo(pi_MsgFlg : Integer; pi_DisParam : String) : String;
function ufEncrypt(const S: String; Key: Word): String;
function ufDecrypt(const S: String; Key: Word): String;



implementation
uses uConst;

//****************************************************************************//
//* Vitamin���� ����ϴ� �޽��� ������ ��Ÿ����.
//* Parameter : p_MessageFlag : �޽��� ����
//*             p_sDisParam : ǥ���ϰ��� �ϴ� �Ķ����(������ -> ^)
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
         901 : lv_msg := '�α��� ���̵� �Է��� �ּ���.';
         902 : lv_msg := '�α��� �񸲹�ȣ�� �Է��� �ּ���.';
         903 : lv_msg := '�α����� ���� �Ǿ����ϴ�.';
      end;
   finally
      FreeAndNil(lv_stlMsg);
   end;
   Result := lv_msg;
end;

//****************************************************************************//
//* ���� ���ڸ� ��ȣȭ
//****************************************************************************//
function ufEncrypt(const S: String; Key: Word): String;
var
   i: byte;
   sEncrypt, rEncrypt: String;
   rChar: Char;
begin
   sEncrypt := ''; // ��ȣȭ�� ���� ���ڿ�
   if S = '' then begin
      ufEncrypt := '';
      System.Exit;
   end;

   for i := 1 to Length(S) do begin
      sEncrypt := sEncrypt + char(byte(S[i]) xor (Key shr 8));
      Key := (byte(sEncrypt[i]) + Key) * C1 + C2;
   end;

   rEncrypt := ''; // ��ȣȭ�� ���� ���ڿ��� ASCII ���ڷ� ����
   for i := 1 to Length(sEncrypt) do begin
      rChar := sEncrypt[i];
      rEncrypt := rEncrypt + format('%.3d', [Ord(rChar)]); // �ѹ��ڴ� 3�ڸ���
   end;
   Result := rEncrypt;
end;

//****************************************************************************//
//* ���� ���ڸ� ��ȣȭ
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
      temp := Copy(S, i, 3); // �ѹ��ڴ� 3�ڸ� ���ڷ� ����Ǿ� �ִ�
      rDecrypt := rDecrypt + Chr(StrToIntDef(temp, 0)); // ASCII���� ���Ѵ�
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
