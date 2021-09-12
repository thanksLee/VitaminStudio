unit uUserMg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, MemDS, DBAccess, ExtCtrls,
  StdCtrls, Buttons, CRGrid, Uni;

type
  TfrmUserMg = class(TForm)
    Notebook1: TNotebook;
    StaticText9: TStaticText;
    txt_UserID: TEdit;
    StaticText1: TStaticText;
    txt_UserPass: TEdit;
    chb_Auth: TCheckBox;
    Bevel1: TBevel;
    sbtn_New: TSpeedButton;
    sbtn_Clear: TSpeedButton;
    sbtn_Delete: TSpeedButton;
    Panel4: TPanel;
    sbtn_Close: TSpeedButton;
    txt_UserNm: TEdit;
    StaticText2: TStaticText;
    sbtn_Save: TSpeedButton;
    schGrd_Lst: TCRDBGrid;
    oraQry_Lst: TUniQuery;
    dts_Lst: TUniDataSource;
    oraqry_tmp: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure schGrd_LstCellClick(Column: TColumn);
    procedure sbtn_ClearClick(Sender: TObject);
    procedure sbtn_NewClick(Sender: TObject);
    procedure sbtn_SaveClick(Sender: TObject);
    procedure sbtn_DeleteClick(Sender: TObject);
  private
    //* Update Insert ������
    pr_Flag : String;
    { Private declarations }
    //* ����� ����Ʈ
    procedure pGet_UserLst;
    //* ����� �ߺ�üũ
    function fGet_UserDupleCheck(pi_sUserId : String) : Integer;
    //* ����� ����
    function fGet_UserDel(pi_sUserId1, pi_sUserId2 : String) : Integer;
    //* ����� ����
    function fSet_UserSave(pi_sFlag, pi_sUserNm, pi_sUserID, pi_sUserPw, pi_sAuth : String) : Integer;

    //* Grid Setting
    procedure pSet_UserGridSetting;
    //* Clear
    procedure pSet_Clear(pi_iFlag : Integer);
    //* Button Control
    procedure pSet_BtnCtrl(pi_iFlag : Integer);
  public
    { Public declarations }
  end;

var
  frmUserMg: TfrmUserMg;

implementation
uses uMain, uWordMg;

{$R *.dfm}

//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//


//****************************************************************************//
//* ����� ����Ʈ
//****************************************************************************//
procedure TfrmUserMg.pGet_UserLst;
var
   v_sSql    : String;
   v_stParam : TStringList;
begin
   v_sSql := 'SELECT C_USERID                                         ' + #13 +
             '     , C_USERNM                                         ' + #13 +
             '     , C_USERPW                                         ' + #13 +
             '     , C_USERATH                                        ' + #13 +
             '     , DECODE(C_USERATH, ''A'', ''������'') C_USERATHNM ' + #13 +
             '     , ROW_NUMBER() OVER(ORDER BY C_USERNM) RNUM        ' + #13 +
             '  FROM T_USER                                           ';
   v_stParam := TStringList.Create;
   try
      try
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , oraQry_Lst
                              );
         {-- Grid Setting --}
         pSet_UserGridSetting;
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;

//****************************************************************************//
//* ����� �ߺ�üũ
//****************************************************************************//
function TfrmUserMg.fGet_UserDupleCheck(pi_sUserId : String) : Integer;
var
   v_sSql    : String;
   v_stParam : TStringList;
begin
  v_sSql := 'SELECT ''1''                     ' + #13 +
            '  FROM T_USER                    ' + #13 +
            ' WHERE C_USERID = :c_userid      ' + #13 +
            '   AND ROWNUM = 1                ';

   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sUserId);
      try
         oraqry_tmp.SpecificOptions.Values['FetchAll'] := 'True';
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , oraqry_tmp
                              );
         Result := oraqry_tmp.RecordCount;
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
            Result := -1;
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;

//****************************************************************************//
//* ����� ����
//****************************************************************************//
function TfrmUserMg.fGet_UserDel(pi_sUserId1, pi_sUserId2 : String) : Integer;
var
   v_sSql    : String;
   v_stParam : TStringList;
   v_iCnt    : Integer;
begin
   v_sSql := 'SELECT ( SELECT COUNT(*)                          ' + #13 +
             '           FROM T_HWORD                           ' + #13 +
             '          WHERE C_APRUSERID = :c_apruserid        ' + #13 +
             '            AND ROWNUM = 1                        ' + #13 +
             '         ) A                                      ' + #13 +
             '     , ( SELECT COUNT(*)                          ' + #13 +
             '           FROM T_HWORD                           ' + #13 +
             '          WHERE C_REGUSERID = :c_reguserid        ' + #13 +
             '            AND ROWNUM = 1                        ' + #13 +
             '         ) B                                      ' + #13 +
             '  FROM DUAL                                       ';

   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sUserId1);
      v_stParam.Add(pi_sUserId1);
      frmMain.UniConn.StartTransaction;
      try
         oraqry_tmp.SpecificOptions.Values['FetchAll'] := 'True';
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , oraqry_tmp
                              );

         v_iCnt := oraqry_tmp.Fields[0].AsInteger + oraqry_tmp.Fields[1].AsInteger;
         if v_iCnt = 0 then begin
            v_sSql := 'DELETE                                                 ' + #13 +
                      '  FROM T_USER                                          ' + #13 +
                      ' WHERE C_USERID = :c_userid                            ' + #13 +
                      '   AND ROWNUM = 1                                      ';
            v_stParam.Clear;
            v_stParam.Add(pi_sUserId1);

            frmMain.pGet_QryExec(  1
                                 , v_sSql
                                 , v_stParam
                                 , oraqry_tmp
                                 );
            Result := oraqry_tmp.RowsAffected;
         end else begin
            if oraqry_tmp.Fields[0].AsInteger = 1 then begin
               v_sSql := 'UPDATE T_HWORD                     ' + #13 +
                         '   SET C_APRUSERID = :c_apruserid  ' + #13 +
                         ' WHERE C_APRUSERID = :c_userid     ';

            end else if oraqry_tmp.Fields[1].AsInteger = 1 then begin
               v_sSql := 'UPDATE T_HWORD                     ' + #13 +
                         '   SET C_REGUSERID = :c_reguserid  ' + #13 +
                         ' WHERE C_REGUSERID = :c_userid     ';
            end;
            v_stParam.Clear;
            v_stParam.Add(pi_sUserId2);
            v_stParam.Add(pi_sUserId1);

            frmMain.pGet_QryExec(  1
                                 , v_sSql
                                 , v_stParam
                                 , oraqry_tmp
                                 );

            v_sSql := 'DELETE                                                 ' + #13 +
                      '  FROM T_USER                                          ' + #13 +
                      ' WHERE C_USERID = :c_userid                            ' + #13 +
                      '   AND ROWNUM = 1                                      ';
            v_stParam.Clear;
            v_stParam.Add(pi_sUserId1);

            frmMain.pGet_QryExec(  1
                                 , v_sSql
                                 , v_stParam
                                 , oraqry_tmp
                                 );
            frmMain.UniConn.Commit;
            Result := oraqry_tmp.RowsAffected;
         end;
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
            frmMain.UniConn.Rollback;
            Result := -1;
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;
//****************************************************************************//
//* ����� ����
//****************************************************************************//
function TfrmUserMg.fSet_UserSave(pi_sFlag, pi_sUserNm, pi_sUserID, pi_sUserPw, pi_sAuth : String) : Integer;
var
   v_sSql    : String;
   v_stParam : TStringList;
begin
   v_stParam := TStringList.Create;
   try
      frmMain.UniConn.StartTransaction;
      try
         if CompareStr(pi_sFlag, 'INSERT') = 0 then begin
            v_sSql := 'INSERT INTO T_USER(  C_USERNM                ' + #13 +
                      '                   , C_USERID                ' + #13 +
                      '                   , C_USERPW                ' + #13 +
                      '                   , C_USERATH               ' + #13 +
                      '                   ) VALUES (  :c_usernm     ' + #13 +
                      '                             , :c_userid     ' + #13 +
                      '                             , :c_userpw     ' + #13 +
                      '                             , :c_userath    ' + #13 +
                      '                              )              ';
            v_stParam.Add(pi_sUserNm);
            v_stParam.Add(pi_sUserID);
            v_stParam.Add(pi_sUserPw);
            v_stParam.Add(pi_sAuth);
         end else begin
            v_sSql := 'UPDATE T_USER                     ' + #13 +
                      '   SET C_USERNM = :c_usernm       ' + #13 +
                      '     , C_USERPW = :c_userpw       ' + #13 +
                      '     , C_USERATH = :c_userath     ' + #13 +
                      ' WHERE C_USERID = :c_userid       ' + #13 +
                      '   AND ROWNUM = 1                 ';
            v_stParam.Add(pi_sUserNm);
            v_stParam.Add(pi_sUserPw);
            v_stParam.Add(pi_sAuth);
            v_stParam.Add(pi_sUserID);
         end;
         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , oraqry_tmp
                              );
         frmMain.UniConn.Commit;
         Result := oraqry_tmp.RowsAffected;
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
            frmMain.UniConn.Rollback;
            Result := -1;
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;

//****************************************************************************//
//* Grid Setting
//****************************************************************************//
procedure TfrmUserMg.pSet_UserGridSetting;
var
   v_iLoopCnt : Integer;
begin
   with schGrd_Lst do begin
      for v_iLoopCnt := 0 to Columns.Count - 1 do begin
            Columns[v_iLoopCnt].Title.Font.Style := [fsBold];
            Columns[v_iLoopCnt].Title.Alignment  := taCenter;
            with Columns[v_iLoopCnt] do begin
               Case v_iLoopCnt of
                  0 : begin
                         Title.Caption := '����';
                         FieldName     := 'RNUM';
                         Width := 40;
                      end;
                  1 : begin
                         Title.Caption := '�̸�';
                         FieldName     := 'C_USERNM';
                         Width := 100;
                      end;
                  2 : begin
                         Title.Caption := '���̵�';
                         FieldName     := 'C_USERID';
                         Width := 100;
                      end;
                  3 : begin
                         Title.Caption := '����';
                         FieldName     := 'C_USERATHNM';
                         Width := 55;
                      end;
               end;
            end;
      end;
   end;
end;

//****************************************************************************//
//* Clear
//****************************************************************************//
procedure TfrmUserMg.pSet_Clear(pi_iFlag : Integer);
var
   v_iLoopCnt : Integer;
begin
   for v_iLoopCnt := 0 to ComponentCount - 1 do begin
      Case pi_iFlag of
         0 : begin
                if (Components[v_iLoopCnt] is TEdit) then begin
                  Case (Components[v_iLoopCnt] as TEdit).Tag of
                     10, 11, 12 : (Components[v_iLoopCnt] as TEdit).Clear;
                  end;
                end;
             end;
      end;
   end;
end;

//****************************************************************************//
//* Button Control
//****************************************************************************//
procedure TfrmUserMg.pSet_BtnCtrl(pi_iFlag : Integer);
var
   v_iLoopCnt : Integer;
begin
   for v_iLoopCnt := 0 to ComponentCount -1 do begin
      if (Components[v_iLoopCnt] is TSpeedButton) then begin
         Case pi_iFlag of
            0 : begin
                   Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
                      100 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
                      101, 102, 103 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := False;
                   end;
                end;
            1 : begin
                   Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
                      101, 102 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
                      100, 103 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := False;
                   end;
                end;
            2 : begin
                   Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
                      100, 101, 102, 103 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
                   end;
                end;
         end;
      end;
   end;
end;

//****************************************************************************//
// User Define function, procedure End
//****************************************************************************//

procedure TfrmUserMg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmUserMg.FormDestroy(Sender: TObject);
begin
   TForm(frmUserMg) := nil;
end;

procedure TfrmUserMg.sbtn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmUserMg.FormActivate(Sender: TObject);
begin
   pr_Flag := 'INSERT';
   Case Notebook1.PageIndex of
      0 : begin
             {-- ����� ����Ʈ Call --}
             pGet_UserLst;
          end;
   end;
   {-- Button Control --}
   pSet_BtnCtrl(0);
end;

procedure TfrmUserMg.schGrd_LstCellClick(Column: TColumn);
begin
   {-- Flag Setting --}
   pr_Flag := 'UPDATE';
   {-- Button Control --}
   pSet_BtnCtrl(2);

   txt_UserNm.Text   := schGrd_Lst.Fields[1].AsString;

   txt_UserID.Text     := schGrd_Lst.Fields[2].AsString;
   txt_UserID.ReadOnly := True;
   txt_UserID.Color    := clSilver;

   txt_UserPass.Text := frmMain.fGet_Decrypt(oraQry_Lst.Fields[2].AsString, MY_KEY);

   if CompareStr(oraQry_Lst.Fields[3].AsString, 'A') = 0 then
      chb_Auth.Checked := True
   else chb_Auth.Checked := False;

   txt_UserNm.SetFocus;
end;

procedure TfrmUserMg.sbtn_NewClick(Sender: TObject);
begin
   {-- Flag Setting --}
   pr_Flag := 'INSERT';
   {-- Button Control --}
   pSet_BtnCtrl(1);
   txt_UserID.ReadOnly := False;
   txt_UserID.Color    := clWhite;
   {-- Call --}
   sbtn_ClearClick(Sender);
end;

procedure TfrmUserMg.sbtn_ClearClick(Sender: TObject);
begin
   {-- Clear --}
   pSet_Clear(0);
   chb_Auth.Checked := False;
   if CompareStr(pr_Flag, 'UPDATE') = 0 then begin
      schGrd_LstCellClick(schGrd_Lst.Columns.Items[2]);
   end;
   txt_UserNm.SetFocus;
end;


procedure TfrmUserMg.sbtn_SaveClick(Sender: TObject);
var
   v_sPw, v_sAuth : String;
begin
   if frmMain.fGet_ValCheck(txt_UserNm, '����ڸ��� �Է��� �ּ���.') = False then Exit;
   if frmMain.fGet_ValCheck(txt_UserID, '����� ���̵� �Է��� �ּ���.') = False then Exit;
   if frmMain.fGet_ValCheck(txt_UserPass, '����� �н����带 �Է��� �ּ���.') = False then Exit;

   v_sPw := frmMain.fGet_Encrypt(txt_UserPass.Text, MY_KEY);
   if chb_Auth.Checked = True then v_sAuth := 'A'
   else v_sAuth := 'U';

   if CompareStr(pr_Flag, 'INSERT') = 0 then begin
      if fGet_UserDupleCheck(txt_UserID.Text) = 1 then begin
         Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  '����� ���̵� '
                                                                                       + '"' + txt_UserID.Text + '"'
                                                                                       + ' �� �ߺ� �Ǿ����ϴ�.'
                                                                                   ))
                                , '����� �ߺ�!'
                                , MB_OK + MB_ICONERROR
                                );
         txt_UserID.SetFocus;
         Exit;
      end;
   end;

   if fSet_UserSave(  pr_Flag
                    , txt_UserNm.Text
                    , txt_UserID.Text
                    , v_sPw
                    , v_sAuth
                    ) <> -1 then
   begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  '����� '
                                                                                    + '"' + txt_UserID.Text + '"'
                                                                                    + ' �� ���(����) �Ǿ����ϴ�.'
                                                                                 ))
                             , '�ܾ���(����)!'
                             , MB_OK + MB_ICONINFORMATION
                             );
      {-- ����� ����Ʈ Call --}
      pGet_UserLst;

      {-- ����ġ�� ���� ���Ͽ� Call --}
      frmMain.pSet_CurLocate(  'C_USERID'
                               , txt_UserID.Text
                               , oraQry_Lst
                               );
      {-- Call --}
      schGrd_LstCellClick(schGrd_Lst.Columns.Items[2]);

//      pSet_Clear(0);
      pSet_BtnCtrl(2);
   end;
end;

procedure TfrmUserMg.sbtn_DeleteClick(Sender: TObject);
begin
   if Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(600, '�����  '
                                                                                    + '"' + txt_UserID.Text + '"'
                                                                                    + ' �� ���� �Ͻðڽ��ϱ�?'
                                                                                ))
                             , '����Ȯ��!'
                             , MB_YESNO + MB_ICONWARNING
                             ) = 7 then begin

      Exit;
   end;

   if fGet_UserDel(txt_UserID.Text, frmMain.fGet_stMemIns(0, 'USERID')) <> -1 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  '����� ���̵� '
                                                                                    + '"' + txt_UserID.Text + '"'
                                                                                    + ' �� �����Ǿ����ϴ�.'
                                                                                ))
                             , '����� ����!'
                             , MB_OK + MB_ICONINFORMATION
                             );
      {-- ����� ����Ʈ Call --}
      pGet_UserLst;

      {-- ����ġ�� ���� ���Ͽ� Call --}
      frmMain.pSet_CurLocate(  'C_USERID'
                               , schGrd_Lst.Fields[2].AsString
                               , oraQry_Lst
                               );
      {-- Call --}
      schGrd_LstCellClick(schGrd_Lst.Columns.Items[2]);

      pSet_BtnCtrl(2);
   end;
end;

end.
