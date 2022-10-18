unit uWordDicLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxBarBuiltInMenu, cxPC, cxMaskEdit, cxDropDownEdit,
  cxGroupBox, cxTextEdit, cxLabel, dxBevel, cxButtonEdit, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, System.Actions, Vcl.ActnList, cxStyles,
  cxInplaceContainer, cxVGrid, Data.DB, DBAccess, Uni, FileCtrl, Clipbrd;

type
  TfrmWordDicLogin = class(TForm)
    dxBevel1: TdxBevel;
    cxLabel1: TcxLabel;
    cxTxt_UserId: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxTxt_UserPwd: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxCmb_DbmsType: TcxComboBox;
    cxPgCtl_DbmsType: TcxPageControl;
    cxTab_SQLite: TcxTabSheet;
    cxTab_MariaDb: TcxTabSheet;
    cxTab_PostgreSql: TcxTabSheet;
    cxTab_Oralce: TcxTabSheet;
    cxLabel4: TcxLabel;
    cxBtEdit_SQLite: TcxButtonEdit;
    dxBevel2: TdxBevel;
    cxBtn_Login: TcxButton;
    cxBtn_Close: TcxButton;
    ActList_WordDicLogin: TActionList;
    act_Login: TAction;
    act_Logout: TAction;
    act_Close: TAction;
    cxVGrd_SQLite: TcxVerticalGrid;
    OpenDlg_SQLiteDB: TOpenDialog;
    cxBtn_Logout: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cxBtEdit_SQLitePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxVGrd_SQLiteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCmb_DbmsTypePropertiesChange(Sender: TObject);
    procedure cxPgCtl_DbmsTypeChange(Sender: TObject);
    procedure act_CloseExecute(Sender: TObject);
    procedure act_LoginExecute(Sender: TObject);
    procedure cxTxt_UserPwdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure uPWordicInfo(pi_DbfileNm: String; pi_objUniCon : TUniConnection);
    procedure uPInitialClear;
    procedure uPLoadDB;
  end;

var
  frmWordDicLogin: TfrmWordDicLogin;

implementation

{$R *.dfm}

uses uMain, uWordDicMain, uGlobal, uUnidac, ulib, uConst;

//************************************************************************//
//* S : User Defined Function, Procedure
//************************************************************************//

procedure TfrmWordDicLogin.uPInitialClear;
begin
   cxTxt_UserId.Clear;
   cxTxt_UserPwd.Clear;
   cxBtEdit_SQLite.Clear;
end;

{--
   @date : 2022.10.09
   @author : thanksLee
   @description :
      - Word Dic Database Connect
--}
procedure TfrmWordDicLogin.uPWordicInfo(pi_DbfileNm: String; pi_objUniCon : TUniConnection);
var
   lv_vgrdRow : TcxEditorRow;
   lv_LoopCnt : Integer;
   lv_Key, lv_Value, lv_Conn, lv_AutoCommit : String;
begin
   cxVGrd_SQLite.ClearRows;
   cxVGrd_SQLite.BeginUpdate;
   try
      if pi_objUniCon.Connected = True then lv_Conn := 'True'
      else lv_Conn := 'False';

      if pi_objUniCon.AutoCommit = True then lv_AutoCommit := 'True'
      else lv_AutoCommit := 'False';

      with lv_vgrdRow do
      begin
         for lv_LoopCnt := 1 to 7 do
         begin
            case lv_LoopCnt of
               1 : lv_Key := 'DB File';
               2 : lv_Key := 'Connection';
               3 : lv_Key := 'Direct';
               4 : lv_Key := 'ForceCreateDatabase';
               5 : lv_Key := 'EncryptionAlgorithm';
               6 : lv_Key := 'UseUnicode';
               7 : lv_Key := 'AutoCommit';
            end;
            case lv_LoopCnt of
               1 : lv_Value := pi_DbfileNm;
               2 : lv_Value := lv_Conn;
               3 : lv_Value := pi_objUniCon.SpecificOptions.Values['Direct'];
               4 : lv_Value := pi_objUniCon.SpecificOptions.Values['ForceCreateDatabase'];
               5 : lv_Value := pi_objUniCon.SpecificOptions.Values['EncryptionAlgorithm'];
               6 : lv_Value := pi_objUniCon.SpecificOptions.Values['UseUnicode'];
               7 : lv_Value := lv_AutoCommit
            end;

            lv_vgrdRow := TcxEditorRow(cxVGrd_SQLite.Add(TcxEditorRow));
            lv_vgrdRow.Height := 23;
            lv_vgrdRow.Properties.Options.Editing := False;
            lv_vgrdRow.Properties.Caption := lv_Key;
            lv_vgrdRow.Properties.EditPropertiesClassName := 'TcxTextEditProperties';
            lv_vgrdRow.Properties.Value := lv_Value;
         end;
      end;
   finally
      cxVGrd_SQLite.EndUpdate;
   end;
end;

{--
   @date : 2022.10.09
   @author : thanksLee
   @description :
      - Word Dic Database 를 Load 한다.
      - SQLite
--}
procedure TfrmWordDicLogin.uPLoadDB;
var
   lv_FullPath, lv_FilePath, lv_FileNm : String;
   lv_Drive: Char;
begin
   lv_FullPath := getBasePath + DBDIR + '\' + WORDIC_DB;
   if FileExists(lv_FullPath) then
   begin
      {-- Unit에 FileCtrl을 추가해야 사용 할 수 있다. --}
      ProcessPath(lv_FullPath, lv_Drive, lv_FilePath, lv_FileNm);
      if frmMain.ufWorddicDbConn(frmMain.UniConnWordic) = 'SUCCESS' then
      begin
         uPWordicInfo(lv_FileNm, frmMain.UniConnWordic);
         cxBtEdit_SQLite.Text := lv_FullPath;
      end;
   end;
end;

//************************************************************************//
//* E : User Defined Function, Procedure
//************************************************************************//

procedure TfrmWordDicLogin.act_CloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmWordDicLogin.act_LoginExecute(Sender: TObject);
var
   lv_qryTmp : TUniQuery;
   lv_stlParam : TStringList;
   lv_vgrdRow : TcxEditorRow;
begin
   if Trim(cxTxt_UserId.Text) = '' then
   begin
      Application.MessageBox( StrPCopy(pb_arrMsg, ufMsgInfo(901, ''))
                             , '로그인 에러!'
                             , MB_OK +  MB_ICONERROR
                             );
      cxTxt_UserId.SetFocus;
      Exit;
   end;

   if Trim(cxTxt_UserPwd.Text) = '' then
   begin
      Application.MessageBox( StrPCopy(pb_arrMsg, ufMsgInfo(902, ''))
                             , '로그인 에러!'
                             , MB_OK +  MB_ICONERROR
                             );
      cxTxt_UserPwd.SetFocus;
      Exit;
   end;

   lv_qryTmp := TUniQuery.Create(nil);
   lv_stlParam := TStringList.Create;
   lv_stlParam.StrictDelimiter := True;
   try
      lv_qryTmp.Connection := frmMain.UniConnWordic;
      lv_stlParam.Add(cxTxt_UserId.Text);
      lv_stlParam.Add(ufEncrypt(cxTxt_UserPwd.Text, MY_KEY));

      ufBackGroundUniSQLExec(1, pb_DBSQL[49].rSQLText, lv_stlParam, lv_qryTmp);
      lv_qryTmp.FetchingAll;

      while not lv_qryTmp.Eof do
      begin
         pb_WordDicSession[0].rUserId  := lv_qryTmp.Fields[0].AsString;
         pb_WordDicSession[0].rUserAuth := lv_qryTmp.Fields[1].AsString;
         lv_qryTmp.Next;
      end;

      if lv_qryTmp.RecordCount = 0 then
      begin
         Application.MessageBox( StrPCopy(pb_arrMsg, ufMsgInfo(903, ''))
                                , '로그인 에러!'
                                , MB_OK +  MB_ICONERROR
                                );
         cxTxt_UserId.SetFocus;
         Exit;
      end else
      begin
         lv_vgrdRow := TcxEditorRow(cxVGrd_SQLite.Rows.Items[0]);
         frmWordDicMain.Caption := frmWordDicMain.Caption + ' - ' + pb_WordDicSession[0].rUserId + ' [ ' + lv_vgrdRow.Properties.Value + ' ]';
         frmWordDicMain.uPWordList;
         lv_vgrdRow := TcxEditorRow(cxVGrd_SQLite.Rows.Items[1]);
         pb_WordDicSession[0].rConnFlg := lv_vgrdRow.Properties.Value;
         frmWordDicMain.uPButtonCtrl(pb_WordDicSession[0].rConnFlg);
         self.Close;
      end;

   finally
      FreeAndNil(lv_stlParam);
      FreeAndNil(lv_qryTmp);
   end;
end;

procedure TfrmWordDicLogin.cxBtEdit_SQLitePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   {-- file --}
   lv_Drive: Char;
   lv_FilePath, lv_FileNm: String;
begin
   OpenDlg_SQLiteDB.InitialDir := getBasePath() + DBDIR;
   if (OpenDlg_SQLiteDB.Execute) then
   begin
      cxBtEdit_SQLite.Text := OpenDlg_SQLiteDB.FileName;
      ProcessPath(cxBtEdit_SQLite.Text, lv_Drive, lv_FilePath, lv_FileNm);
      //lv_FileNm := ExtractFileName(cxBtEdit_SQLite.Text);
      if frmMain.ufWorddicDbConn(frmMain.UniConnWordic) = 'SUCCESS' then
      begin
         uPWordicInfo(lv_FileNm, frmMain.UniConnWordic);
      end;
   end;
end;

procedure TfrmWordDicLogin.cxCmb_DbmsTypePropertiesChange(Sender: TObject);
begin
   cxPgCtl_DbmsType.ActivePageIndex := cxCmb_DbmsType.ItemIndex;
end;

procedure TfrmWordDicLogin.cxPgCtl_DbmsTypeChange(Sender: TObject);
begin
   cxCmb_DbmsType.ItemIndex := cxPgCtl_DbmsType.ActivePageIndex;
end;

procedure TfrmWordDicLogin.cxTxt_UserPwdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      act_LoginExecute(Sender);
   end;
end;

procedure TfrmWordDicLogin.cxVGrd_SQLiteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   lv_vgrdRow : TcxEditorRow;
   lv_ClipBrdTxt : String;
begin
   if (Shift = [ssCtrl]) and (Key = 67)then // Ctrl + C
   begin
      lv_vgrdRow := TcxEditorRow(cxVGrd_SQLite.FocusedRow);
      lv_ClipBrdTxt := lv_vgrdRow.Properties.Value;
      Clipboard.SetTextBuf(pChar(lv_ClipBrdTxt));
   end;
end;

procedure TfrmWordDicLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmWordDicLogin.FormDestroy(Sender: TObject);
begin
   Self := nil;
end;

end.
