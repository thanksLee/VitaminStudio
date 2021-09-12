unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, Inifiles, DB, DBAccess, StdCtrls, ComCtrls,
  ToolWin, System.ImageList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.OracleDef, FireDAC.Phys.Oracle, FireDAC.Phys.MySQL,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, InterBaseUniProvider, MySQLUniProvider,
  UniProvider, OracleUniProvider, Uni, MemDS, SynEdit;

type
   TDBSQL = record
      rSQLId       : String;
      rSQLDesc     : String;
      rSQLParamCnt : String;
      rSQLText     : String;
   end;

type
  {-- User ���� ����. --}
  TUserHint = class(THintWindow)
  constructor Create(AOwner: TComponent); override;
  end;
  TfrmMain = class(TForm)
    mnmn: TMainMenu;
    mmEnv: TMenuItem;
    mmLogin: TMenuItem;
    mmLogout: TMenuItem;
    N1: TMenuItem;
    mmEnvSet: TMenuItem;
    N2: TMenuItem;
    mmExit1: TMenuItem;
    mmWordDic: TMenuItem;
    mmWordMg: TMenuItem;
    mmManager: TMenuItem;
    mmUserMg: TMenuItem;
    mmWordSMg: TMenuItem;
    mmWordFMg: TMenuItem;
    mmDataTMg: TMenuItem;
    mmWindow: TMenuItem;
    mmCasCade: TMenuItem;
    mmTileHorizontally: TMenuItem;
    mmTileVertically: TMenuItem;
    mmMinAll: TMenuItem;
    mmEixt2: TMenuItem;
    imglst: TImageList;
    mmDomainMg: TMenuItem;
    mmTermMg: TMenuItem;
    ToolBar1: TToolBar;
    tbn_Login: TToolButton;
    tbn_Logout: TToolButton;
    ToolButton3: TToolButton;
    tbn_WordMg: TToolButton;
    tbn_DomainMg: TToolButton;
    tbn_TermMg: TToolButton;
    ToolButton14: TToolButton;
    tbnUserMg: TToolButton;
    tbnWordFMg: TToolButton;
    tnbDataTMg: TToolButton;
    ToolButton13: TToolButton;
    tbnExit2: TToolButton;
    tbnWordSMg: TToolButton;
    mmMaxAll: TMenuItem;
    UniConn: TUniConnection;
    OracleUniProvider: TOracleUniProvider;
    MySQLUniProvider1: TMySQLUniProvider;
    InterBaseUniProvider1: TInterBaseUniProvider;
    UniQuery1: TUniQuery;
    SynEd_BaseSQL: TSynEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure mmEixt2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmLoginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mmLogoutClick(Sender: TObject);
    procedure mmWordMgClick(Sender: TObject);
    procedure mmCasCadeClick(Sender: TObject);
    procedure mmUserMgClick(Sender: TObject);
    procedure mmTermMgClick(Sender: TObject);
    procedure mmEnvSetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    //****************************************************************************//
    // SQL�� ����
    //****************************************************************************//
    procedure pSetDBSQL(pi_ObjSynEd : TSynEdit);
    //* Message �� �����Ѵ�.
    //* p_MessageFlag : �޽��� ����, p_sDisParam : ǥ���ϰ��� �ϴ� �Ķ����(������ -> ^)
    function fGet_MessageInfo(p_iMessageFlag : Integer; p_sDisParam : String) : String;

    //  form Ȱ��ȭ �ι� ����                                                     //
    function fGet_ExisitsChildForm(formname: string):Boolean;

    //* ���� ���ڸ� ��ȣȭ
    function fGet_Encrypt(const S: String; Key: Word): String;
    //* ���� ���ڸ� ��ȣȭ
    function fGet_Decrypt(const S: String; Key: Word): String;

    //* IniFile �� ȯ�漳���� Setting �Ѵ�.
    procedure pSet_IniFiles(pi_sName, pi_sValue, pi_sDefault : String);
    //* IniFile �� ���õ� ������ �о���δ�.
    function fGet_IniFiles(pi_sName, pi_sValue, pi_sDefault : String) : String;

    //* Memory Instance �� ���� �����´�.
    //* pi_iFlag : 0 = Loop �� ���� �ʰ� pi_sKeyValue �� ���� ���� �����´�.
    //*            1 = Index �� �´� ���� �����´�.
    function fGet_stMemIns(pi_iFlg : Integer; pi_sKeyValue : String) : String;

    //* �Է°��� ���� Validate �� üũ�Ѵ�.
    function fGet_ValCheck(pi_Obj : TEdit; pi_sMsg : String) : Boolean;

    //* Query �� �����Ų��.
    //* 0 : Select
    //* 1 : DML
    //* 2 : DDL
    procedure pGet_QryExec(pi_iFlag : Integer; pi_sSql : String; pi_stParam : TStringList; pi_ObjQry : TUniQuery);
    //* �ٽ� ����ġ�� Ŀ�� �̵��ϱ�
    procedure pSet_CurLocate(pi_sKeyFields : String; pi_sKeyValues : Variant; QryObj : TUniQuery);

    //* Menu �� Control �Ѵ�.
    procedure pGet_MenuCtrl(pi_bDBStatus : Boolean; pi_UserAuth : String);
    //* Menu Bar �� �߰�
    procedure pSet_MenuBar;

    //* ���� üũ
    function fGet_AuthCheck(pi_sCheckUserId : String) : Boolean;

    var
       pb_DBSQL : array of TDBSQL;
  end;
const
   C1 = 52845;     // ����Ű1
   C2 = 22719;     // ����Ű2
   MY_KEY = 12345; // �����Ű

var
  frmMain: TfrmMain;

  //* Connection Info
  pb_bConnStatus : Boolean;
  //* �޽��� ����
  pb_arrMessage : array[0..1000] of Char;
  //* Ini File �� ����ϱ� ���ؼ� ����
  pb_iniEnv : TIniFile;
  //* ComboBox �� �ڵ����� ���ڸ� ��Ÿ���� ���� ����
  //* �Է��� Key ���� ����
  pb_wKeyList : Word;
  //* Memory Instance
  pb_stMemIns : TStringList;
  //* Excel ����� ���
  pb_iSaveFlg : Integer;
  //* Table, Col ���ξ�
  pb_sTblJubdo, pb_sColJubdo, pb_sTblJubmi : String;

implementation

uses uConnect, uWordMg, uUserMg, uTermMg, uEnvMg, uSetgetMethod;

{$R *.dfm}

//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//

procedure TfrmMain.pSetDBSQL(pi_ObjSynEd : TSynEdit);
var
   lv_LoopCnt, lv_Idx : Integer;
   lv_tmpStr, lv_Key, lv_Value : String;

   function lfGetSQL(pi_LoopCnt : Integer) : String;
   var
      lpv_LoopCnt : Integer;
      lpv_RetVal, lpv_tmpStr : String;
      lpv_stlSQL : TStringList;
   begin
      lpv_stlSQL := TStringList.Create;
      lpv_stlSQL.StrictDelimiter := True;
      try
         for lpv_LoopCnt := pi_LoopCnt to pi_ObjSynEd.Lines.Count - 1 do
         begin
            lpv_tmpStr := Trim(pi_ObjSynEd.Lines.Strings[lpv_LoopCnt]);

            if CompareStr('[', Copy(lpv_tmpStr, 1, 1)) = 0 then Break;

            lpv_tmpStr := Copy(lpv_tmpStr, Pos('=', lpv_tmpStr) + 1, Length(lpv_tmpStr));
            lpv_stlSQL.Add(lpv_tmpStr);
         end;
      finally
         lpv_RetVal := lpv_stlSQL.Text;
         FreeAndNil(lpv_stlSQL);
      end;
      Result := lpv_RetVal;
   end;
begin
   lv_Idx := 0;
   for lv_LoopCnt := 0 to pi_ObjSynEd.Lines.Count - 1 do
   begin
      lv_tmpStr := Trim(pi_ObjSynEd.Lines.Strings[lv_LoopCnt]);

      if (CompareStr(lv_tmpStr, '') = 0) then Continue;

      if CompareStr('[', Copy(lv_tmpStr, 1, 1)) = 0 then
      begin
         SetLength(pb_DBSQL, Length(pb_DBSQL)+1);
         pb_DBSQL[lv_Idx].rSQLId := Copy(lv_tmpStr, 2, Pos(']', lv_tmpStr) - 1);
      end else
      begin
         lv_Key   := Copy(lv_tmpStr, 1, Pos('=', lv_tmpStr) - 1);
         lv_Value := Copy(lv_tmpStr, Pos('=', lv_tmpStr) + 1, Length(lv_tmpStr));

         if CompareStr(lv_Key, 'sql_desc') = 0 then
         begin
            pb_DBSQL[lv_Idx].rSQLDesc := lv_Value;
         end else if CompareStr(lv_Key, 'sql_param_cnt') = 0 then
         begin
            pb_DBSQL[lv_Idx].rSQLParamCnt := lv_Value;
            pb_DBSQL[lv_Idx].rSQLText     := lfGetSQL(lv_LoopCnt+1);
            Inc(lv_Idx);
         end;
      end;
      //Inc(lv_LoopCnt);
   end; // while..end
end;

//****************************************************************************//
//  Hint Handling �ϱ�                                                        //
//****************************************************************************//
constructor TUserHint.Create;
begin
  inherited Create(Owner);
//  Canvas.Font.Name := '����ü';   //���ϴ� ��Ʈ�� �̸� ����
//  Canvas.Font.Size := 10;         //���ϴ� ��Ʈ�� ������ ����
  Canvas.Brush.Color := $FFCCCC; //���ϴ� ������ ����
end;                              //implementation�ο� ����

//****************************************************************************//
//  form Ȱ��ȭ �ι� ����                                                     //
//****************************************************************************//
function TfrmMain.fGet_ExisitsChildForm(formname: string):Boolean;
var
  i : Integer;
begin
   Result:= False;
   for i:=0 to frmMain.MDIChildCount-1 do begin
      if frmMain.MDIChildren[i].Name= formname then begin
        Result:= True;
        Break;
      end;
   end;
end;

//****************************************************************************//
//* Message �� �����Ѵ�.
//* p_MessageFlag : �޽��� ����, p_sDisParam : ǥ���ϰ��� �ϴ� �Ķ����(������ -> ^)
//****************************************************************************//
function TfrmMain.fGet_MessageInfo(p_iMessageFlag : Integer; p_sDisParam : String) : String;
var
   v_sMessage   : String;
begin
   //* Information - 100 Start
   //* Confirm     - 300 Start
   //* waring      - 600 Start
   //* Error       - 900 Start
   //* DBError     - 1000 Start
   Case p_iMessageFlag of
      100 : v_sMessage := Format('WordDic - Info  : %s ' + #13 + #13 + '%s', [IntToStr(p_iMessageFlag), p_sDisParam + #13]);
      600 : v_sMessage := Format('WordDic - War   : %s ' + #13 + #13 + '%s', [IntToStr(p_iMessageFlag), p_sDisParam + #13]);
      901 : v_sMessage := Format('WordDic - Error : %s ' + #13 + #13 + '%s', [IntToStr(p_iMessageFlag), p_sDisParam + #13]);
   end;
   Result := v_sMessage;
end;

//****************************************************************************//
//* ���� ���ڸ� ��ȣȭ
//****************************************************************************//
function TfrmMain.fGet_Encrypt(const S: String; Key: Word): String;
var
   i: byte;
   sEncrypt, rEncrypt: String;
   rChar: Char;
begin
   sEncrypt := ''; // ��ȣȭ�� ���� ���ڿ�
   if S = '' then begin
      fGet_Encrypt := '';
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
function TfrmMain.fGet_Decrypt(const S: String; Key: Word): String;
var
   i: byte;
   sDecrypt, rDecrypt, temp: String;
begin
   rDecrypt := '';
   if S = '' then begin
      fGet_Decrypt := '';
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

//****************************************************************************//
//* IniFile �� ȯ�漳���� Setting �Ѵ�.
//****************************************************************************//
procedure TfrmMain.pSet_IniFiles(pi_sName, pi_sValue, pi_sDefault : String);
var
   v_sIniFileName : String;
begin
   //* FileName ����
   v_sIniFileName := 'Env.ini';
   //* ������ ���
   pb_iniEnv := TIniFile.Create(ExtractFilePath(ParamStr(0)) + v_sIniFileName);
   try
      try
         //* Inifile �� ����
         pb_iniEnv.WriteString(pi_sName, pi_sValue, pi_sDefault);
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, fGet_MessageInfo(901, E.Message))
                                   , 'IniFile �������'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end;
   finally
      pb_iniEnv.Free;
   end;
end;

//****************************************************************************//
//* IniFile �� ���õ� ������ �о���δ�.
//****************************************************************************//
function TfrmMain.fGet_IniFiles(pi_sName, pi_sValue, pi_sDefault : String) : String;
var
   v_sIniFileName : String;
begin
   v_sIniFileName := 'Env.ini';
   if FileExists(getAppPath + v_sIniFileName) then begin
      pb_iniEnv := TIniFile.Create(getAppPath + v_sIniFileName);
      try
         try
            Result := pb_iniEnv.ReadString(pi_sName, pi_sValue, pi_sDefault);
         except
            on E : Exception do begin
               Application.MessageBox(  StrPCopy(pb_arrMessage, fGet_MessageInfo(901, E.Message))
                                      , 'IniFile �б����'
                                      , MB_OK + MB_ICONERROR
                                      );
               Result := 'False';
            end;
         end;
      finally
         pb_iniEnv.Free;
      end;
   end else Result := 'False';
end;

//****************************************************************************//
//* Memory Instance �� ���� �����´�.
//* pi_iFlag : 0 = Loop �� ���� �ʰ� pi_sKeyValue �� ���� ���� �����´�.
//*            1 = Index �� �´� ���� �����´�.
//****************************************************************************//
function TfrmMain.fGet_stMemIns(pi_iFlg : Integer; pi_sKeyValue : String) : String;
begin
   Case pi_iFlg of
      0 : begin
             Result := pb_stMemIns.Values[pi_sKeyValue];
          end;
      1 : begin
             Result := pb_stMemIns.Names[StrToInt(pi_sKeyValue)];
          end;
      2 : begin
             Result := pb_stMemIns.ValueFromIndex[StrToInt(pi_sKeyValue)];
          end;
   end;
end;

//****************************************************************************//
//* �Է°��� ���� Validate �� üũ�Ѵ�.
//****************************************************************************//
function TfrmMain.fGet_ValCheck(pi_Obj : TEdit; pi_sMsg : String) : Boolean;
var
   v_bCheck : Boolean;
begin
   {-- Local Init --}
   v_bCheck := False;
   if Trim(pi_Obj.Text) = '' then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, fGet_MessageInfo(901, pi_sMsg))
                             , '����!'
                             , MB_OK + MB_ICONERROR
                             );
      pi_Obj.SetFocus;
   end else v_bCheck := True;
   Result := v_bCheck;
end;

//****************************************************************************//
//* Query �� �����Ų��.
//* 0 : Select
//* 1 : DML
//* 2 : DDL
//****************************************************************************//
procedure TfrmMain.pGet_QryExec(pi_iFlag : Integer; pi_sSql : String; pi_stParam : TStringList; pi_ObjQry : TUniQuery);
var
   v_iLoopCnt : Integer;
begin
   with pi_ObjQry do begin
      Case pi_iFlag of
         0 : begin
               Active := False;
               SQL.Clear;
               SQL.Text := pi_sSql;
               for v_iLoopCnt := 0 to pi_stParam.Count - 1 do begin
                  Params[v_iLoopCnt].Value :=  pi_stParam.Strings[v_iLoopCnt];
               end;
               Active := True;
             end;
         1 : begin
                Active := False;
                SQL.Clear;
                SQL.Text := pi_sSql;
                for v_iLoopCnt := 0 to pi_stParam.Count - 1 do begin
                   Params[v_iLoopCnt].Value := pi_stParam.Strings[v_iLoopCnt];
                end;
                ExecSQL;
             end;
      end; // Cass pi_iFlag of...
   end; // with..do
end;

//****************************************************************************//
//* �ٽ� ����ġ�� Ŀ�� �̵��ϱ�
//****************************************************************************//
procedure TfrmMain.pSet_CurLocate(pi_sKeyFields : String; pi_sKeyValues : Variant; QryObj : TUniQuery);
var
   v_bookmark : TBookmark;
begin
   QryObj.Locate(pi_sKeyFields, pi_sKeyValues, []);
   v_bookmark := QryObj.GetBookmark;
   try
      QryObj.GotoBookmark(v_bookmark);
   finally
      QryObj.FreeBookmark(v_bookmark);
   end;
end;


//****************************************************************************//
//* Menu �� Control �Ѵ�.
//****************************************************************************//
procedure TfrmMain.pGet_MenuCtrl(pi_bDBStatus : Boolean; pi_UserAuth : String);
var
   v_iCom : Integer;
begin
   for v_iCom := 0 to ComponentCount - 1 do begin
      {-- DB Connection Check --}
      if pb_bConnStatus = False then begin
         if (Components[v_iCom] is TMenuItem) then begin
            Case (Components[v_iCom] as TMenuItem).Tag of
               100, 101, 103, 104, 700 : (Components[v_iCom] as TMenuItem).Enabled := True;
               else (Components[v_iCom] as TMenuItem).Enabled := False;
            end;
         end;
         if (Components[v_iCom] is TToolButton) then begin
            Case (Components[v_iCom] as TToolButton).Tag of
               1001, 7000 : (Components[v_iCom] as TToolButton).Enabled := True;
               else (Components[v_iCom] as TToolButton).Enabled := False;
            end;
         end;
      end else begin
         {--  Authority Check --}
         if CompareStr(pi_UserAuth, 'A') = 0 then begin {-- ������ --}
            if (Components[v_iCom] is TMenuItem) then begin
               (Components[v_iCom] as TMenuItem).Enabled := True;
            end;
            if (Components[v_iCom] is TToolButton) then begin
               (Components[v_iCom] as TToolButton).Enabled := True;
            end;
         end else begin  {-- �Ϲ� ����� --}
            if (Components[v_iCom] is TMenuItem) then begin
               Case (Components[v_iCom] as TMenuItem).Tag of
                  300 : (Components[v_iCom] as TMenuItem).Enabled := False;
                  else (Components[v_iCom] as TMenuItem).Enabled := True;
               end;
            end;
            if (Components[v_iCom] is TToolButton) then begin
               Case (Components[v_iCom] as TToolButton).Tag of
                  3001, 3002, 3003, 3004 : (Components[v_iCom] as TToolButton).Enabled := False;
                  else (Components[v_iCom] as TToolButton).Enabled := True;
               end;
            end;
         end;
      end; // if pb_bConnStatus
   end; // for
   mmDomainMg.Enabled := False;
   mmWordSMg.Enabled  := False;
   mmWordFMg.Enabled  := False;
   mmDataTMg.Enabled  := False;
   tbn_DomainMg.Enabled := False;
   tbnWordSMg.Enabled   := False;
   tbnWordFMg.Enabled   := False;
   tnbDataTMg.Enabled   := False;
end;

//****************************************************************************//
//* Menu Bar �� �߰�
//****************************************************************************//
procedure TfrmMain.pSet_MenuBar;
begin
   WindowMenu := frmMain.mmWindow;
end;

//****************************************************************************//
//* ���� üũ
//****************************************************************************//
function TfrmMain.fGet_AuthCheck(pi_sCheckUserId : String) : Boolean;
var
   v_sUserId, v_sAuth : String;
   v_bBool            : Boolean;
begin
   v_sUserId := fGet_stMemIns(0, 'USERID');
   v_sAuth   := fGet_stMemIns(0, 'USERATH');
   if (CompareStr(v_sAuth, 'U') = 0) then begin
      if (CompareStr(pi_sCheckUserId, v_sUserId) = 0) then v_bBool := True
      else v_bBool := False;
   end else v_bBool := True;

   Result := v_bBool;
end;

//****************************************************************************//
// User Define function, procedure End
//****************************************************************************//

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
   v_iLoopCnt : Integer; { MDI Childform }
begin
   for v_iLoopCnt := 0 to frmMain.MDIChildCount - 1 do
      frmMain.MDIChildren[v_iLoopCnt].Close;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
   v_iLoopCnt : Integer; { MDI Childform }
begin
   for v_iLoopCnt := 0 to frmMain.MDIChildCount - 1 do
      TForm(Sender) := nil;

   {-- Global ���� �ʱ�ȭ --}
   pb_bConnStatus := False;
   pb_stMemIns.Free;
   pb_stMemIns    := nil;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
   v_bOldHint : Boolean;
begin
   pb_stMemIns := TStringList.Create;
   setAppPath(ExtractFilePath(ParamStr(0)));
   {-- For Hint Code --}
   v_bOldHint            := Application.ShowHint;
   Application.ShowHint  := false;
   HintWindowClass       := TUserHint;
   Application.ShowHint  := v_bOldHint;
   Application.HintPause := 60;

   {-- DB Connect Initialized --}
   pb_bConnStatus        := False;
   pGet_MenuCtrl(False, '');
   pb_iSaveFlg := 0;
   {-- �� ����� ���ξ� --}
   pb_sTblJubdo := fGet_IniFiles('Prepared', 'STable',  '');
   pb_sTblJubmi := fGet_IniFiles('Prepared', 'ETable',  '');
   pb_sColJubdo := fGet_IniFiles('Prepared', 'Column', '');

   {-- SQL Load --}
   pSetDBSQL(SynEd_BaseSQL);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
   {-- Login --}
   mmLoginClick(Sender);
end;

procedure TfrmMain.mmEixt2Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmMain.mmLoginClick(Sender: TObject);
begin
   {-- Connection Manager Call --}
   frmConnect := TfrmConnect.Create(Application);
   frmConnect.ShowModal;
end;

procedure TfrmMain.mmLogoutClick(Sender: TObject);
var
   v_iLoopCnt : Integer;
begin
   if Application.MessageBox(  StrPCopy(pb_arrMessage, fGet_MessageInfo(600, 'WordDic ������ ���� �Ͻðڽ��ϱ�?'))
                             , '��������!'
                             , MB_YESNO + MB_ICONWARNING
                             ) = IDYES then begin
      UniConn.Connected := False;
      pb_bConnStatus       := False;
      {-- Call --}
      pGet_MenuCtrl(pb_bConnStatus, '');

      for v_iLoopCnt := 0 to frmMain.MDIChildCount - 1 do
         frmMain.MDIChildren[v_iLoopCnt].Close;
         
      for v_iLoopCnt := 0 to frmMain.MDIChildCount - 1 do
         TForm(Sender) := nil;

   end;

end;

procedure TfrmMain.mmWordMgClick(Sender: TObject);
begin
   if not fGet_ExisitsChildForm('frmWordMg') then begin
      frmWordMg             := TfrmWordMg.Create(Application);
      frmWordMg.Caption     := '[' + fGet_stMemIns(0, 'USERNM') + '] - ' +
                               'Word Manager Ver0.9.1 - [ ' + IntToStr(frmMain.MDIChildCount) + ']';
      frmWordMg.Show;
      frmWordMg.WindowState := wsMaximized;
      {-- Call --}
      pSet_MenuBar;
   end else begin
      frmWordMg.Show;
      frmWordMg.WindowState := wsMaximized;
      {-- Call --}
      pSet_MenuBar;
   end;
end;

procedure TfrmMain.mmCasCadeClick(Sender: TObject);
var
   v_iLoopCnt : Integer;
begin
   Case TMenuItem(Sender).Tag of
      401 : begin {-- Cascade --}
               mmCasCade.Checked          := True;
               mmTileHorizontally.Checked := False;
               mmTileVertically.Checked   := False;
               Cascade;
            end;
      402 : begin {-- TileHorizontally --}
               mmCasCade.Checked          := False;
               mmTileHorizontally.Checked := False;
               mmTileVertically.Checked   := True;
               TileMode                   := tbVertical;
               Tile;
            end;
      403 : begin {-- TileVertically --}
               mmCasCade.Checked          := False;
               mmTileHorizontally.Checked := True;
               mmTileVertically.Checked   := False;
               TileMode                   := tbHorizontal;
               Tile;
            end;
      404 : begin {-- Min All --}
               for v_iLoopCnt := frmMain.MDIChildCount - 1 downto 0 do
                  TfrmMain(ActiveMDIChild).WindowState := wsMinimized;
            end;
      405 : begin {-- Max All --}
               v_iLoopCnt := 0;
               repeat
                  frmMain.MDIChildren[v_iLoopCnt].WindowState := wsNormal;
                  Inc(v_iLoopCnt);
               until v_iLoopCnt = frmMain.MDIChildCount;
            end;
   end; // Case..of..end
end;

procedure TfrmMain.mmUserMgClick(Sender: TObject);
begin
   Case TMenuItem(Sender).Tag of
      301 : begin
               frmUserMg := TfrmUserMg.Create(Application);
               frmUserMg.Caption := '����ڰ���';
               frmUserMg.Notebook1.PageIndex := 0;
               frmUserMg.ShowModal;
            end;
   end;
end;

procedure TfrmMain.mmTermMgClick(Sender: TObject);
begin
   if not fGet_ExisitsChildForm('frmTermMg') then begin
      frmTermMg := TfrmTermMg.Create(Application);
      with frmTermMg do begin
         Caption     := '[' + fGet_stMemIns(0, 'USERNM') + '] - ' +
                        'Term Manager Ver0.9.1 - [ ' + IntToStr(frmMain.MDIChildCount) + ']';
         Show;
         WindowState := wsMaximized;
      end;
   end else begin
      frmTermMg.Show;
      frmTermMg.WindowState := wsMaximized;
   end;

end;

procedure TfrmMain.mmEnvSetClick(Sender: TObject);
begin
   frmEnvMg := TfrmEnvMg.Create(Application);
   frmEnvMg.ShowModal;
end;

end.
