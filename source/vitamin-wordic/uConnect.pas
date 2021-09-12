unit uConnect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, MemDS, DBAccess, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxButtonEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Uni;

type
  TfrmConnect = class(TForm)
    Panel4: TPanel;
    sbtn_Conn: TSpeedButton;
    sbtn_DisConn: TSpeedButton;
    sbtn_Close: TSpeedButton;
    GroupBox1: TGroupBox;
    Bevel2: TBevel;
    sbtn_Save: TSpeedButton;
    sbtn_clear: TSpeedButton;
    sbtn_Load: TSpeedButton;
    chb_Tnsname: TCheckBox;
    Bevel1: TBevel;
    txt_UserID: TEdit;
    txt_UserPass: TEdit;
    StaticText1: TStaticText;
    StaticText9: TStaticText;
    StaticText3: TStaticText;
    rdbtn_Local: TRadioButton;
    rdbtn_Oracle: TRadioButton;
    rdbtn_mariadb: TRadioButton;
    Notebook1: TNotebook;
    txt_HostName: TEdit;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    txt_Servicename: TEdit;
    StaticText2: TStaticText;
    txt_Port: TEdit;
    StaticText4: TStaticText;
    txt_DBUserId: TEdit;
    txt_DBUserPass: TEdit;
    StaticText5: TStaticText;
    cxBtnEdt_FirebirdPath: TcxButtonEdit;
    StaticText6: TStaticText;
    Qry_Conn: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_CloseClick(Sender: TObject);
    procedure sbtn_clearClick(Sender: TObject);
    procedure sbtn_LoadClick(Sender: TObject);
    procedure sbtn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chb_TnsnameClick(Sender: TObject);
    procedure sbtn_ConnClick(Sender: TObject);
    procedure sbtn_DisConnClick(Sender: TObject);
    procedure txt_UserPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_UserIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    //* WordDic DB ���������� �о�´�.
    function fGet_ReadLoginInfo : Boolean;

    //* DB Connect �� �Ѵ�.
    function fGet_ConnInfo(pi_sDBUserID, pi_sDBUserPw, pi_sDBInfo, pi_sUserID, pi_sUserPw : String) : Boolean;
    function fGet_DBConnInfo(pi_Flg : Integer) : Boolean;

    //* User Login �� �Ѵ�.
    function fGet_LoginInfo(pi_sUserID, pi_sUserPw : String) : Boolean;

  public
    { Public declarations }
  end;

var
  frmConnect: TfrmConnect;

implementation
uses uMain, uSetgetMethod;
{$R *.dfm}

//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//

//****************************************************************************//
//* WordDic DB ���������� �о�´�.
//****************************************************************************//
function TfrmConnect.fGet_ReadLoginInfo : Boolean;
var
  lv_DBType : String;
begin
   if frmMain.fGet_IniFiles('DBConInfo', 'DB_User_ID',       '') = 'False' then begin
      chb_Tnsname.Checked := True;
      txt_DBUserId.SetFocus;
      Result := False;
   end else begin
      with frmMain do begin
         {-- DB Connect Info �� �ҷ��´�. --}
         lv_DBType := fGet_IniFiles('DBConInfo', 'DB_TYPE', '');

         if lv_DBType = 'LOCAL' then rdbtn_Local.Checked := True
         else if lv_DBType = 'ORACLE' then rdbtn_Oracle.Checked := True
         else if lv_DBType = 'MARIADB' then rdbtn_mariadb.Checked := True;

         txt_DBUserId.Text    := fGet_Decrypt(fGet_IniFiles('DBConInfo', 'DB_User_ID',       ''), MY_KEY);
         txt_DBUserPass.Text  := fGet_Decrypt(fGet_IniFiles('DBConInfo', 'DB_User_PassWord', ''), MY_KEY);
         txt_HostName.Text    := fGet_Decrypt(fGet_IniFiles('DBConInfo', 'DB_Host',          ''), MY_KEY);
         txt_Servicename.Text := fGet_Decrypt(fGet_IniFiles('DBConInfo', 'DB_SID',           ''), MY_KEY);
         txt_Port.Text        := fGet_Decrypt(fGet_IniFiles('DBConInfo', 'DB_Port',          ''), MY_KEY);

         {-- WordDic User �� ������ �о�´�. --}
         txt_UserID.Text   := fGet_IniFiles('WordDicInfo', 'User_ID',       '');
         txt_UserPass.Text := fGet_Decrypt(fGet_IniFiles('WordDicInfo', 'User_PassWord', ''), MY_KEY);
      end;
      Result := True;
   end;
end;

//****************************************************************************//
//* DB Connect �� �Ѵ�.
//****************************************************************************//
function TfrmConnect.fGet_ConnInfo(pi_sDBUserID, pi_sDBUserPw, pi_sDBInfo, pi_sUserID, pi_sUserPw : String) : Boolean;
begin
//   try
//      with frmMain do begin
//         {-- Login Info --}
//         OraSession.Username  := pi_sDBUserID;
//         OraSession.Password  := pi_sDBUserPw;
//         OraSession.Server    := pi_sDBInfo;
//
//         {-- Connect Info --}
//         OraSession.Connected := True;
//         pb_bConnStatus       := True;
//
//         {-- Memory �� �����ϸ� Free ��Ű�� �� ���� --}
//         if pb_stMemIns <> nil then pb_stMemIns.Free;
//
//         pb_stMemIns := TStringList.Create;
//
//         try
//            if fGet_LoginInfo(pi_sUserID, pi_sUserPw) = true then Result := True
//            else Result := False;
//         except
//            on E : Exception do begin
//               Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
//                                      , 'SQL ����!'
//                                      , MB_OK + MB_ICONERROR
//                                      );
//               Result := False;
//            end;
//         end;
//      end;
//   except
//      on E : Exception do begin
//         Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
//                                , 'WordDic DB ���� ����!'
//                                , MB_OK + MB_ICONERROR
//                                );
//         pb_bConnStatus := False;
//         Result         := False;
//      end;
//   end;
end;

function TfrmConnect.fGet_DBConnInfo(pi_Flg : Integer) : Boolean;
var
  lv_Path : String;
  lv_DBExistsChk : Boolean;
  lv_retVal : Boolean;
begin
  lv_retVal := True;
  try
    pb_stMemIns.Clear;
    with frmMain.UniConn do
    begin
      Connected   := False;
      LoginPrompt := False;
      AutoCommit  := False;

      case pi_Flg of
        1 : // Oracle
          begin
            ProviderName := 'Oracle';
            Username     := txt_DBUserId.Text;
            Password     := txt_DBUserPass.Text;
            Server       := txt_HostName.Text + ':' + txt_Port.Text + ':' + txt_Servicename.Text;
            Port         := StrToInt(txt_Port.Text);

            SpecificOptions.Values['Direct'] := 'True';
            SpecificOptions.Values['Charset'] := 'UTF8';
            SpecificOptions.Values['UseUnicode'] := 'True';
          end;
      end;
      Connected := True;
      pb_bConnStatus := True;
    end;
  except
    on E : Exception do
    begin
      pb_bConnStatus := False;
      lv_retVal := False;
    end;
  end;
  Result := lv_retVal;
end;

//****************************************************************************//
//* User Login �� �Ѵ�.
//****************************************************************************//
function TfrmConnect.fGet_LoginInfo(pi_sUserID, pi_sUserPw : String) : Boolean;
var
   v_sSql    : String;
   v_stParam : TStringList;
begin
   v_sSql := 'SELECT C_USERID              ' + #13 +
             '     , C_USERNM              ' + #13 +
             '     , C_USERPW              ' + #13 +
             '     , C_USERATH             ' + #13 +
             '  FROM T_USER                ' + #13 +
             ' WHERE C_USERID = :c_userid  ' + #13 +
             '   AND C_USERPW = :c_userpw  ' + #13 +
             '   AND ROWNUM   = 1          ';
   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sUserID);
      v_stParam.Add(frmMain.fGet_Encrypt(pi_sUserPw, MY_KEY));
      try
         Qry_Conn.SpecificOptions.Values['FetchAll'] := 'True';
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , Qry_Conn
                              );
         if Qry_Conn.RecordCount > 0 then begin
            {-- Memory Instance Create Call --}
            pb_stMemIns.Add('USERID='  + Qry_Conn.Fields[0].AsString);
            pb_stMemIns.Add('USERNM='  + Qry_Conn.Fields[1].AsString);
            pb_stMemIns.Add('USERPW='  + Qry_Conn.Fields[2].AsString);
            pb_stMemIns.Add('USERATH=' + Qry_Conn.Fields[3].AsString);
            pb_stMemIns.Add('APPFLAG=' + '0');

            {-- �����ڵ� ���� --}
            v_stParam.Clear;

            v_sSql := 'SELECT C_GUBUNKEY   ' + #13 +
                      '     , C_FLAG       ' + #13 +
                      '     , C_MEMO1      ' + #13 +
                      '     , C_MEMO2      ' + #13 +
                      '  FROM T_COMMON     ';

            frmMain.pGet_QryExec(  0
                                 , v_sSql
                                 , v_stParam
                                 , Qry_Conn
                                 );
            while not Qry_Conn.Eof do begin
               pb_stMemIns.Add(Qry_Conn.Fields[0].AsString + '-' +
                               Qry_Conn.Fields[2].AsString + '=' +
                               Qry_Conn.Fields[1].AsString
                               );
               Qry_Conn.Next;
            end;

            Result := True;
         end else begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, '"' + Qry_Conn.Params[0].AsString + '"' + ' ����ڰ� �������� �ʽ��ϴ�.'))
                                   , 'WordDic �α��� ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
            Result := False;
         end;
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
            Result := False;
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;

//****************************************************************************//
// User Define function, procedure End
//****************************************************************************//


procedure TfrmConnect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmConnect.FormDestroy(Sender: TObject);
begin
   TForm(frmConnect) := nil;
end;

procedure TfrmConnect.FormCreate(Sender: TObject);
begin
   {-- Init Check --}
   if pb_bConnStatus = False then
      sbtn_DisConn.Enabled := False;

   rdbtn_Local.Checked := True;
   rdbtn_Oracle.Checked := False;
   rdbtn_Mariadb.Checked := False;

   {-- Call --}
   sbtn_LoadClick(Sender);
end;

procedure TfrmConnect.sbtn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmConnect.sbtn_clearClick(Sender: TObject);
begin
   {-- Init --}
   txt_DBUserId.Clear;
   txt_DBUserPass.Clear;
   txt_HostName.Clear;
   txt_Servicename.Clear;

   txt_DBUserId.SetFocus;
end;

procedure TfrmConnect.sbtn_LoadClick(Sender: TObject);
begin
   {-- private function Call --}
   {-- WordDic DB ���������� �о�´�. --}
   if fGet_ReadLoginInfo = False then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, 'DB ���� ������ �������� �ʽ��ϴ�.'))
                             , '����!'
                             , MB_OK + MB_ICONERROR
                             );

   end;
end;

procedure TfrmConnect.sbtn_SaveClick(Sender: TObject);
var
   v_sDbUserId, v_sDbUserPass, v_sDbHost, v_sDbSID, v_sDbPort : String;
   lv_DBType : String;
begin
   {-- IniFile �� ���� --}

   with frmMain do begin
      if fGet_ValCheck(txt_DBUserId,    'WordDic�� ������ DB ������ �Է��� �ּ���.!'         ) = false then Exit;
      if fGet_ValCheck(txt_DBUserPass,  'WordDic�� ������ DB ���� �н����带 �Է��� �ּ���.!') = false then Exit;
      if fGet_ValCheck(txt_HostName,    'WordDic�� ������ DB ���� IP �� �Է��� �ּ���.!'     ) = false then Exit;
      if fGet_ValCheck(txt_Servicename, 'WordDic�� ������ DB ���񽺸��� �Է��� �ּ���.!'     ) = false then Exit;
      if fGet_ValCheck(txt_Port,        '����Ŭ ���� Port �� �Է��� �ּ���.!'                ) = false then Exit;

      if Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(600,  'WordDic DB ���� ������ ���� �Ͻðڽ��ϱ�?'))
                                , '����Ȯ��!'
                                , MB_YESNO + MB_ICONWARNING
                                ) = IDYES then
      begin
         if rdbtn_Local.Checked = True then lv_DBType := 'LOCAL'
         else if rdbtn_Oracle.Checked = True then lv_DBType := 'ORACLE'
         else if rdbtn_mariadb.Checked = True then lv_DBType := 'MARIADB';

         {-- DB ������ Encrypt ��Ų��. --}
         v_sDbUserId   := fGet_Encrypt(txt_DBUserId.Text,    MY_KEY);
         v_sDbUserPass := fGet_Encrypt(txt_DBUserPass.Text,  MY_KEY);
         v_sDbHost     := fGet_Encrypt(txt_HostName.Text,    MY_KEY);
         v_sDbSID      := fGet_Encrypt(txt_Servicename.Text, MY_KEY);
         v_sDbPort     := fGet_Encrypt(txt_Port.Text,        MY_KEY);

         pSet_IniFiles('DBConInfo', 'DB_TYPE',          lv_DBType);
         pSet_IniFiles('DBConInfo', 'DB_User_ID',       v_sDbUserId);
         pSet_IniFiles('DBConInfo', 'DB_User_PassWord', v_sDbUserPass);
         pSet_IniFiles('DBConInfo', 'DB_Host',          v_sDbHost);
         pSet_IniFiles('DBConInfo', 'DB_SID',           v_sDbSID);
         pSet_IniFiles('DBConInfo', 'DB_Port',          v_sDbPort);
      end;
   end;

end;


procedure TfrmConnect.chb_TnsnameClick(Sender: TObject);
var
   v_iCom : Integer;
begin
   for v_iCom := 0 to ComponentCount - 1 do begin
      if chb_Tnsname.Checked = True then begin
         if (Components[v_iCom] is TEdit) then begin
            if (Components[v_iCom] as TEdit).Tag in [3, 4, 5, 6, 7] then begin
               (Components[v_iCom] as TEdit).Color := clWhite;
               (Components[v_iCom] as TEdit).ReadOnly := False;
               txt_DBUserId.SetFocus;
            end;
         end;
         if (Components[v_iCom] is TSpeedButton) then begin
            if (Components[v_iCom] as TSpeedButton).Tag in [1, 2, 3] then begin
               (Components[v_iCom] as TSpeedButton).Enabled := True;
            end;
         end;
         if (Components[v_iCom] is TRadioButton) then begin
            if (Components[v_iCom] as TRadioButton).Tag in [1, 2, 3] then begin
               (Components[v_iCom] as TRadioButton).Enabled := True;
            end;
         end;
      end else begin
         if (Components[v_iCom] is TEdit) then begin
            if (Components[v_iCom] as TEdit).Tag in [3, 4, 5, 6, 7] then begin
               (Components[v_iCom] as TEdit).Color := clSilver;
               (Components[v_iCom] as TEdit).ReadOnly := True;
               txt_UserID.SetFocus;
            end;
         end;
         if (Components[v_iCom] is TSpeedButton) then begin
            if (Components[v_iCom] as TSpeedButton).Tag in [1, 2, 3] then begin
               (Components[v_iCom] as TSpeedButton).Enabled := False;
            end;
         end;
         if (Components[v_iCom] is TRadioButton) then begin
            if (Components[v_iCom] as TRadioButton).Tag in [1, 2, 3] then begin
               (Components[v_iCom] as TRadioButton).Enabled := False;
            end;
         end;
      end;
   end;
end;

procedure TfrmConnect.sbtn_ConnClick(Sender: TObject);
begin
   if frmMain.fGet_ValCheck(txt_UserID,    '����� ���̵� �Է��� �ּ���.!'         ) = false then Exit;
   if frmMain.fGet_ValCheck(txt_UserPass,  '����� ��й�ȣ�� �Է��� �ּ���.!'     ) = false then Exit;

   if fGet_DBConnInfo(1) = True then begin
      {-- Call --}
      if fGet_LoginInfo(txt_UserID.Text, txt_UserPass.Text) = False then Exit;

      frmMain.pGet_MenuCtrl(pb_bConnStatus, frmMain.fGet_stMemIns(0, 'USERATH'));
      frmMain.mmWordMgClick(Sender);

      sbtn_DisConn.Enabled := True;
      Close;
   end;
end;

procedure TfrmConnect.sbtn_DisConnClick(Sender: TObject);
begin
   frmMain.mmLogoutClick(Sender);
end;

procedure TfrmConnect.txt_UserPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then begin
      sbtn_ConnClick(Sender);
   end;
end;

procedure TfrmConnect.txt_UserIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      txt_UserPass.SetFocus;
end;

procedure TfrmConnect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      sbtn_CloseClick(Sender);
end;

end.
