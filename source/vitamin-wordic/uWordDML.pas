unit uWordDML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, MemDS, DBAccess,
  Grids, DBGrids, Clipbrd, CRGrid, Uni;

type
  TfrmWordDML = class(TForm)
    Notebook1: TNotebook;
    Panel1: TPanel;
    gb_Word: TGroupBox;
    Bevel3: TBevel;
    sbtn_WordSave: TSpeedButton;
    sbtn_DelWord: TSpeedButton;
    sbtn_NewWord: TSpeedButton;
    sbtn_WordClear: TSpeedButton;
    pan_WordControl: TPanel;
    StaticText9: TStaticText;
    txt_EFWord: TEdit;
    StaticText1: TStaticText;
    txt_ESWord: TEdit;
    StaticText2: TStaticText;
    mem_Memo: TMemo;
    StaticText3: TStaticText;
    txt_HFWord: TEdit;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    sbtn_NewSynWord: TSpeedButton;
    sbtn_Close: TSpeedButton;
    cmb_Wordform: TComboBox;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    sbtn_SynWordSave: TSpeedButton;
    sbtn_SynDelWord: TSpeedButton;
    sbtn_SynNewWord: TSpeedButton;
    sbtn_WordNew: TSpeedButton;
    sbtn_SynWordClear: TSpeedButton;
    pan_SynControl: TPanel;
    StaticText11: TStaticText;
    txt_SynHFWord: TEdit;
    cmb_SynWordSort: TComboBox;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    cmb_SynWordForm: TComboBox;
    StaticText6: TStaticText;
    mem_SynMemo: TMemo;
    StaticText7: TStaticText;
    txt_SynEFWord: TEdit;
    StaticText8: TStaticText;
    txt_SynESWord: TEdit;
    sbtn_SynWordCancel: TSpeedButton;
    sbtn_WordCancel: TSpeedButton;
    me_DMLClipboard: TMemo;
    cmb_WordSort: TComboBox;
    schg_WordLst: TCRDBGrid;
    oraQry_WordLst: TUniQuery;
    dst_WordLst: TUniDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtn_WordClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtn_NewWordClick(Sender: TObject);
    procedure sbtn_DelWordClick(Sender: TObject);
    procedure sbtn_WordSaveClick(Sender: TObject);
    procedure sbtn_SynWordSaveClick(Sender: TObject);
    procedure sbtn_WordCancelClick(Sender: TObject);
    procedure schg_WordLstDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure schg_WordLstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure schg_WordLstMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure schg_WordLstCellClick(Column: TColumn);
    procedure sbtn_WordNewClick(Sender: TObject);
    procedure sbtn_NewSynWordClick(Sender: TObject);
  private
    { Private declarations }
    //* DBGrid ���� ���콺 �ٵǰ� �ϱ�
    procedure MouseWheelHandler(var Message: TMessage); override;

    //* ��ư ����
    procedure pSet_BtnCtrl(pi_iFlag : Integer);
    //* �ܾ� ���� Setting
    procedure pSet_WForm(pi_sFlag : String; pi_iIndex : Integer; ComObj : TComboBox);
    //* Data Setting
    //* pi_iFlag : NoteBook PageIndex
    procedure pSet_DataSet(pi_iFlag : Integer; pi_sHFWord, pi_sEFWord, pi_sESWord, pi_sWordSort, pi_sWordForm, pi_sMemo : String);
    //* WordList Data Call
    //* pi_iFlag : Notebook PageIndex
    procedure pSet_WordLst(pi_iFlag : Integer; pi_sESeq : String);
    //* DBGrid Setting
    procedure pSet_DBGrid;
  public
    { Public declarations }
  end;

var
  frmWordDML: TfrmWordDML;
  pv_TpDML : String;
implementation
uses uMain, uWordMg;
{$R *.dfm}

//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//

//****************************************************************************//
//* DBGrid ���� ���콺 �ٵǰ� �ϱ�
//****************************************************************************//
procedure TfrmWordDML.MouseWheelHandler(var Message: TMessage);
begin
  if Message.msg = WM_MOUSEWHEEL then begin
    if (ActiveControl is TCRDBGrid) then begin
      if Message.wParam > 0 then begin
        keybd_event(VK_UP, VK_UP, 0, 0);
      end else if Message.wParam < 0 then begin
        keybd_event(VK_DOWN, VK_DOWN, 0, 0);
      end;
    end;
  end;
end;


//****************************************************************************//
//* ��ư ����
//* 0, 1, 2 : Notbook Page Index �� 0
//****************************************************************************//
procedure TfrmWordDML.pSet_BtnCtrl(pi_iFlag : Integer);
var
   v_iLoopCnt : Integer;
begin
   for v_iLoopCnt := 0 to ComponentCount - 1 do begin
      if pi_iFlag = 0 then begin {-- �ܾ��� --}
         if (Components[v_iLoopCnt] is TSpeedButton) then begin
            Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
               104, 105, 106, 300 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
               else (Components[v_iLoopCnt] as TSpeedButton).Enabled := False;
            end;
         end;
      end;
      if pi_iFlag = 1 then begin {-- �ܾ��� �Ϸ� --}
         if (Components[v_iLoopCnt] is TSpeedButton) then begin
            Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
               101, 103, 100, 300 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
               else (Components[v_iLoopCnt] as TSpeedButton).Enabled := False;
            end;
         end;
      end;
      if pi_iFlag = 2 then begin {-- ����Ʈ Ŭ�� --}
         if (Components[v_iLoopCnt] is TSpeedButton) then begin
            if frmMain.fGet_AuthCheck(oraQry_WordLst.FieldByName('C_REGUSERID').AsString) = False then begin
               Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
                  202, 204, 103, 105 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := False
                  else (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
               end;
            end else begin
               if Notebook1.PageIndex = 0 then begin
                  if (Components[v_iLoopCnt] as TSpeedButton).Tag = 106 then (Components[v_iLoopCnt] as TSpeedButton).Enabled := False
                  else (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
               end else begin
                  if (Components[v_iLoopCnt] as TSpeedButton).Tag = 205 then (Components[v_iLoopCnt] as TSpeedButton).Enabled := False
                  else (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
               end;
            end; // ���� üũ
         end;
      end;
      if pi_iFlag = 3 then begin {-- �ܾ��� --}
         if (Components[v_iLoopCnt] is TSpeedButton) then begin
            Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
               203, 204, 205, 300 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
               else (Components[v_iLoopCnt] as TSpeedButton).Enabled := False;
            end;
         end;
      end;
      if pi_iFlag = 4 then begin {-- �ܾ��� �Ϸ� --}
         if (Components[v_iLoopCnt] is TSpeedButton) then begin
            Case (Components[v_iLoopCnt] as TSpeedButton).Tag of
               201, 202, 200, 300 : (Components[v_iLoopCnt] as TSpeedButton).Enabled := True;
               else (Components[v_iLoopCnt] as TSpeedButton).Enabled := False;
            end;
         end;
      end;
   end; // for
end;

//****************************************************************************//
//* �ܾ� ���� Setting
//****************************************************************************//
procedure TfrmWordDML.pSet_WForm(pi_sFlag : String; pi_iIndex : Integer; ComObj : TComboBox);
var
   v_iLoopCnt : Integer;
   v_sStr     : String;
begin
   ComObj.Clear;

   for v_iLoopCnt := 0 to pb_stMemIns.Count - 1 do begin
      if CompareStr(Copy(pb_stMemIns.Strings[v_iLoopCnt], 1, 3), pi_sFlag) = 0 then begin
         v_sStr := frmMain.fGet_stMemIns(1, IntToStr(v_iLoopCnt));
         v_sStr := Copy(v_sStr, Pos('-', v_sStr)+1, Length(v_sStr));
         ComObj.Items.Add(v_sStr);
      end;
   end;
   ComObj.ItemIndex := pi_iIndex;
end;

//****************************************************************************//
//* Data Setting
//* pi_iFlag : NoteBook PageIndex
//****************************************************************************//
procedure TfrmWordDML.pSet_DataSet(pi_iFlag : Integer; pi_sHFWord, pi_sEFWord, pi_sESWord, pi_sWordSort, pi_sWordForm, pi_sMemo : String);
var
   v_iLoopCnt : Integer;
   v_strTmp   : String;
   v_strText  : String;
begin
   if pi_iFlag = 0 then begin  {-- PageIndex : 0 --}
      txt_HFWord.Text := pi_sHFWord;
      txt_EFWord.Text := pi_sEFWord;
      txt_ESWord.Text := pi_sESWord;

      for v_iLoopCnt := 0 to pb_stMemIns.Count - 1 do begin
         v_strTmp  := pb_stMemIns.Strings[v_iLoopCnt];
         v_strText := frmMain.fGet_stMemIns(1, IntToStr(v_iLoopcnt));
         if CompareStr(Copy(v_strTmp, 1, 3), 'A01') = 0 then
            if CompareStr(Copy(v_strTmp, Pos('=', v_strTmp)+1, 3), pi_sWordSort) = 0 then
               cmb_WordSort.ItemIndex := StrToInt(pi_sWordSort);
         if CompareStr(Copy(v_strTmp, 1, 3), 'B01') = 0 then
            if CompareStr(Copy(v_strTmp, Pos('=', v_strTmp)+1, 3), pi_sWordForm) = 0 then
               cmb_Wordform.ItemIndex := StrToInt(pi_sWordForm);
      end;
      mem_Memo.Text := pi_sMemo;
   end else begin  {-- PageIndex : 1 --}
      txt_SynEFWord.Text := pi_sEFWord;
      txt_SynESWord.Text := pi_sESWord;
      txt_SynHFWord.Text := pi_sHFWord;

      for v_iLoopCnt := 0 to pb_stMemIns.Count - 1 do begin
         v_strTmp  := pb_stMemIns.Strings[v_iLoopCnt];
         v_strText := frmMain.fGet_stMemIns(1, IntToStr(v_iLoopcnt));
         if CompareStr(Copy(v_strTmp, 1, 3), 'A01') = 0 then
            if CompareStr(Copy(v_strTmp, Pos('=', v_strTmp)+1, 3), pi_sWordSort) = 0 then
               cmb_SynWordSort.ItemIndex := StrToInt(pi_sWordSort);
         if CompareStr(Copy(v_strTmp, 1, 3), 'B01') = 0 then
            if CompareStr(Copy(v_strTmp, Pos('=', v_strTmp)+1, 3), pi_sWordForm) = 0 then
               cmb_SynWordForm.ItemIndex := StrToInt(pi_sWordForm);
      end;
      mem_SynMemo.Text := pi_sMemo;
   end;
end;

//****************************************************************************//
//* WordList Data Call
//* pi_iFlag : Notebook PageIndex
//****************************************************************************//
procedure TfrmWordDML.pSet_WordLst(pi_iFlag : Integer; pi_sESeq : String);
var
   v_sSql     : String;
   v_stlParam : TStringList;
begin
   v_sSql := 'SELECT A.C_ESEQ                                                   ' + #13 +
             '     , B.C_HSEQ                                                   ' + #13 +
             '     , B.C_REGUSERID                                              ' + #13 +
             '     , B.C_WORDSORT                                               ' + #13 +
             '     , fGet_CommonInfo(''1'', ''A01'', B.C_WORDSORT) C_WORDSORTNM ' + #13 +
             '     , B.C_WORDFORM                                               ' + #13 +
             '     , fGet_CommonInfo(''1'', ''B01'', B.C_WORDFORM) C_WORDFORMNM ' + #13 +
             '     , B.C_MEMO                                                   ' + #13 +
             '     , A.C_EFWORD                                                 ' + #13 +
             '     , A.C_ESWORD                                                 ' + #13 +
             '     , B.C_HFWORD                                                 ' + #13 +
             '     , ROW_NUMBER() OVER(ORDER BY C_HSEQ) RNUM                    ' + #13 +
             '     , C_USEFLAG                                                  ' + #13 +
             '  FROM T_EWORD A, T_HWORD B                                       ' + #13 +
             ' WHERE A.C_ESEQ = B.C_ESEQ                                        ' + #13 +
             '   AND A.C_ESEQ = :c_eseq                                         ';

   v_stlParam := TStringList.Create;
   try
      v_stlParam.Add(pi_sESeq);
      try
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stlParam
                              , oraQry_WordLst
                              );
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end;
   finally
      v_stlParam.Free;
   end;
end;

//****************************************************************************//
//* DBGrid Setting
//****************************************************************************//
procedure TfrmWordDML.pSet_DBGrid;
var
   v_iLoopCnt : Integer;
begin
   with schg_WordLst do begin
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
               2 : begin
                      Title.Caption := '������';
                      FieldName     := 'C_EFWORD';
                      Width := 170;
                   end;
               3 : begin
                      Title.Caption := '��������';
                      FieldName     := 'C_ESWORD';
                      Width := 80;
                   end;
               1 : begin
                      Title.Caption := '�ѱ۸�';
                      FieldName     := 'C_HFWORD';
                      Width := 170;
                   end;
               4 : begin
                      Title.Caption := '�ܾ�����';
                      FieldName     := 'C_WORDSORTNM';
                      Alignment     := taCenter;
                      Width := 70;
                   end;
               5 : begin
                      Title.Caption := '�ܾ�����';
                      FieldName     := 'C_WORDFORMNM';
                      Alignment     := taCenter;
                      Width := 70;
                   end;
            end; // Case..end;
         end; // with..do
      end; // for .. end
   end;
end;
//****************************************************************************//
// User Define function, procedure End
//****************************************************************************//


procedure TfrmWordDML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action   := caFree;
end;

procedure TfrmWordDML.FormDestroy(Sender: TObject);
begin
   TForm(frmWordDML) := nil;
end;

procedure TfrmWordDML.sbtn_CloseClick(Sender: TObject);
begin
   Try
      frmWordMg.tbn_ReloadClick(Sender);
      Close;
   Except
      on E : Exception do begin
         Close;
      end;
   End;
end;

procedure TfrmWordDML.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmWordDML.FormActivate(Sender: TObject);
begin
   {-- Grid Setting --}
   pSet_DBGrid;
   {-- �ܾ� ���� Setting --}
   pSet_WForm('A01', 0, cmb_WordSort);
   {-- �ܾ� ���� Setting --}
   pSet_WForm('B01', 2, cmb_Wordform);
   {-- �ܾ� ���� Setting --}
   pSet_WForm('A01', 1, cmb_SynWordSort);
//   cmb_SynWordSort.Items.Delete(0); {-- ǥ�شܾ ���� ���Ͽ�... --}

   {-- �ܾ� ���� Setting --}
   pSet_WForm('B01', 2, cmb_SynWordForm);

   Case Notebook1.PageIndex of
      0 : begin
             if CompareStr(pv_TpDML, 'INSERT') = 0 then begin
                {-- ��ư ���� --}
                pSet_BtnCtrl(0);
             end else begin
                {-- Data Setting --}
                pSet_WordLst(0, frmWordMg.Qry_WordLst.FieldByName('C_ESEQ').AsString);
                {-- Data Settsing --}
                with frmWordMg.Qry_WordLst do begin
                   pSet_DataSet(  Notebook1.PageIndex
                                , FieldByName('C_HFWORD').AsString
                                , FieldByName('C_EFWORD').AsString
                                , FieldByName('C_ESWORD').AsString
                                , FieldByName('C_WORDSORT').AsString
                                , FieldByName('C_WORDFORM').AsString
                                , FieldByName('C_MEMO').AsString
                                );
                end;

                {-- SpeedButton Control --}
                pSet_BtnCtrl(2);
             end;
             txt_HFWord.SetFocus;
          end;
      1 : begin
             {-- ��ư ���� --}
             pSet_BtnCtrl(0);

             if CompareStr(pv_TpDML, 'INSERT') = 0 then begin
                {-- Data Setting --}
                pSet_WordLst(1, frmWordMg.Qry_WordLst.FieldByName('C_ESEQ').AsString);
                {-- SpeedButton Control --}
                pSet_BtnCtrl(3);
                {-- Cancel Button Call --}
                sbtn_WordClearClick(Sender);
             end else begin
                {-- Data Setting --}
                pSet_WordLst(1, frmWordMg.Qry_WordLst.FieldByName('C_ESEQ').AsString);
                {-- Data Settsing --}
                with frmWordMg.Qry_WordLst do begin
                   pSet_DataSet(  Notebook1.PageIndex
                                , FieldByName('C_HFWORD').AsString
                                , FieldByName('C_EFWORD').AsString
                                , FieldByName('C_ESWORD').AsString
                                , FieldByName('C_WORDSORT').AsString
                                , FieldByName('C_WORDFORM').AsString
                                , FieldByName('C_MEMO').AsString
                                );
                end;
                {-- SpeedButton Control --}
                pSet_BtnCtrl(2);
             end;
             txt_SynHFWord.SetFocus;
          end;
   end;
   {-- �ٽ� ����ġ�� Ŀ�� �̵��ϱ� --}
   if oraQry_WordLst.RecordCount > 0 then
      frmMain.pSet_CurLocate(  'C_HSEQ'
                             , frmWordMg.Qry_WordLst.FieldByName('C_HSEQ').AsString
                             , oraQry_WordLst
                             );

end;

procedure TfrmWordDML.sbtn_NewWordClick(Sender: TObject);
begin
   pv_TpDML := 'INSERT';

   Case Notebook1.PageIndex of
      0 : pSet_BtnCtrl(0); {-- ��ư ���� --}
      1 : pSet_BtnCtrl(3); {-- ��ư ���� --}
   end;

   {-- �Է� �Ǿ� �ִ� ���� Clear --}
   sbtn_WordClearClick(Sender);

end;

procedure TfrmWordDML.sbtn_DelWordClick(Sender: TObject);
var
   v_sMax : String;
   v_sWordSort, v_sWord : String;
begin
   v_sWordSort := schg_WordLst.Fields[4].AsString;
   v_sWord     := schg_WordLst.Fields[2].AsString;
   
   if Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(600, v_sWordSort + ' '
                                                                                    + '"' + v_sWord + '"'
                                                                                    + ' �� �ܾ ���� �Ͻðڽ��ϱ�?'
                                                                                ))
                             , '����Ȯ��!'
                             , MB_YESNO + MB_ICONWARNING
                             ) = 7 then begin

      Exit;
   end;
   v_sMax := frmWordMg.fSet_WordDel(  oraQry_WordLst.FieldByName('C_ESEQ').AsString
                                    , oraQry_WordLst.FieldbyName('C_HSEQ').AsString
                                    , oraQry_WordLst.FieldbyName('C_WORDSORT').AsString
                                    );

   if CompareStr(v_sMax, '00000') <> 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  v_sWordSort +  ' '
                                                                                    + '"' + v_sWord + '"'
                                                                                    + ' �� �ܾ ���� �Ǿ����ϴ�.'
                                                                                 ))
                             , '�ܾ����!'
                             , MB_OK + MB_ICONINFORMATION
                             );
      pSet_WordLst(0, frmWordMg.Qry_WordLst.FieldByName('C_ESEQ').AsString);
   end else if CompareStr(v_sMax, '-1') = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  v_sWordSort + ' '
                                                                                    + '"' + v_sWord + '"'
                                                                                    + ' �� �ܾ "���" �� ��� �Ǿ����ϴ�.' + #13
                                                                                    + ' ���� "���" �� ���� �ܾ�� ���� �� �� �����ϴ�.'
                                                                                 ))
                             , '�ܾ��������!'
                             , MB_OK + MB_ICONERROR
                             );
   end;

end;

procedure TfrmWordDML.sbtn_WordClearClick(Sender: TObject);
var
   v_iLoopCnt : Integer;
begin
   if pv_TpDML = 'INSERT' then begin
      for v_iLoopCnt := 0 to ComponentCount - 1 do begin
         if Notebook1.PageIndex = 0 then begin
            if (Components[v_iLoopCnt] is TEdit) then begin
               Case (Components[v_iLoopCnt] as TEdit).Tag of
                  101, 102, 103 : (Components[v_iLoopCnt] as TEdit).Clear;
               end;
            end;
            if (Components[v_iLoopCnt] is TMemo) then begin
               Case (Components[v_iLoopCnt] as TMemo).Tag of
                  106 : (Components[v_iLoopCnt] as TMemo).Clear;
               end;
            end;
            if (Components[v_iLoopCnt] is TComboBox) then begin
               Case (Components[v_iLoopCnt] as TComboBox).Tag of
                  105 : (Components[v_iLoopCnt] as TComboBox).ItemIndex := 2;
               end;
            end;
         end else begin
            if (Components[v_iLoopCnt] is TEdit) then begin
               Case (Components[v_iLoopCnt] as TEdit).Tag of
                  203 : (Components[v_iLoopCnt] as TEdit).Clear;
               end;
            end;
            if (Components[v_iLoopCnt] is TMemo) then begin
               Case (Components[v_iLoopCnt] as TMemo).Tag of
                  206 : (Components[v_iLoopCnt] as TMemo).Clear;
               end;
            end;
            if (Components[v_iLoopCnt] is TComboBox) then begin
               Case (Components[v_iLoopCnt] as TComboBox).Tag of
                  204 : (Components[v_iLoopCnt] as TComboBox).ItemIndex := 1;
                  205 : (Components[v_iLoopCnt] as TComboBox).ItemIndex := 2;
               end;
            end;
         end;
      end;
      if Notebook1.PageIndex = 0 then txt_HFWord.SetFocus;
      if Notebook1.PageIndex = 1 then txt_SynHFWord.SetFocus;
   end else begin
      {-- Call --}
      with  oraQry_WordLst do begin
         pSet_DataSet(  Notebook1.PageIndex
                      , Fields[10].AsString
                      , Fields[8].AsString
                      , Fields[9].AsString
                      , Fields[3].AsString
                      , Fields[5].AsString
                      , Fields[7].AsString
                      );
      end;
   end;
end;

procedure TfrmWordDML.sbtn_WordSaveClick(Sender: TObject);
var
   v_sDuple : String; {-- �ߺ� üũ --}
   v_sMax   : String; {-- ���� Max �� --}
   v_sEFWord, v_sESWord, v_sHFWord : String;
begin
  {-- Null Check --}
   with frmMain do begin
      if fGet_ValCheck(txt_HFWord, '�ѱ۸��� �Է��� �ּ���.!'     ) = false then Exit;
      if fGet_ValCheck(txt_EFWord, '�������� �Է��� �ּ���.!'     ) = false then Exit;
      if fGet_ValCheck(txt_ESWord, '���������� �Է��� �ּ���.!' ) = false then Exit;
   end;
   {-- �ߺ� üũ --}
   if pv_TpDML = 'INSERT' then begin
      v_sEFWord := txt_EFWord.Text;
      v_sESWord := txt_ESWord.Text;
      v_sHFWord := txt_HFWord.Text;
   end else begin
      if CompareStr(oraQry_WordLst.FieldByName('C_EFWORD').AsString, txt_EFWord.Text) = 0 then v_sEFWord := '' else  v_sEFWord := txt_EFWord.Text;
      if CompareStr(oraQry_WordLst.FieldByName('C_ESWORD').AsString, txt_ESWord.Text) = 0 then v_sESWord := '' else  v_sESWord := txt_ESWord.Text;
      if CompareStr(oraQry_WordLst.FieldByName('C_HFWORD').AsString, txt_HFWord.Text) = 0 then v_sHFWord := '' else  v_sHFWord := txt_HFWord.Text;
   end;

   v_sDuple := frmWordMg.fGet_WordDupleCheck(  v_sEFWord
                                             , v_sESWord
                                             , v_sHFWord
                                             , ''
                                             , ''
                                             );

   if CompareStr(v_sDuple, '1') = 0 then begin
     Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,   '������ '
                                                                                     + '"' + txt_EFWord.Text + '"'
                                                                                     + ' �� �ܾ �ߺ� �Ǿ����ϴ�.'
                                                                                 ))
                             , '�ܾ��ߺ�!'
                             , MB_OK + MB_ICONERROR
                             );
      txt_EFWord.SetFocus;
      Exit;
   end;
   if CompareStr(v_sDuple, '2') = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,   '�������� '
                                                                                     + '"' + txt_ESWord.Text + '"'
                                                                                     + ' �� �ܾ �ߺ� �Ǿ����ϴ�.'
                                                                                ))
                             , '�ܾ��ߺ�!'
                             , MB_OK + MB_ICONERROR
                             );
      txt_ESWord.SetFocus;
      Exit;
   end;
   if CompareStr(v_sDuple, '3') = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  '�ѱ۸� '
                                                                                    + '"' + txt_HFWord.Text + '"'
                                                                                    + ' �� �ܾ �ߺ� �Ǿ����ϴ�.'
                                                                                ))
                             , '�ܾ��ߺ�!'
                             , MB_OK + MB_ICONERROR
                             );
      txt_HFWord.SetFocus;
      Exit;
   end;

   {-- �ܾ� ��� --}
   if pv_TpDML = 'INSERT' then begin
      v_sMax := frmWordMg.fSet_WordAdd(  txt_EFWord.Text
                                       , txt_ESWord.Text
                                       , mem_Memo.Text
                                       , txt_HFWord.Text
                                       , IntToStr(cmb_WordSort.ItemIndex)
                                       , IntToStr(cmb_Wordform.ItemIndex)
                                       );
      if CompareStr(v_sMax , '00000') <> 0 then begin
         Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  'ǥ�شܾ� '
                                                                                       + '"' + txt_EFWord.Text + '"'
                                                                                       + ' �� �ܾ ��� �Ǿ����ϴ�.'
                                                                                    ))
                                , '�ܾ���!'
                                , MB_OK + MB_ICONINFORMATION
                                );
         {-- List �� �߰� --}
         pSet_WordLst(0, v_sMax);

         {-- �ٽ� ����ġ�� Ŀ�� �̵��ϱ� --}
         frmMain.pSet_CurLocate(  'C_ESEQ'
                                  , v_sMax
                                  , oraQry_WordLst
                                  );

         {-- ��ư ���� --}
         pSet_BtnCtrl(1);
      end;
   end else begin
      v_sMax := frmWordMg.fSet_WordUp(  oraQry_WordLst.FieldByName('C_ESEQ').AsString
                                      , oraQry_WordLst.FieldByName('C_HSEQ').AsString
                                      , txt_EFWord.Text
                                      , txt_ESWord.Text
                                      , txt_HFWord.Text
                                      , mem_Memo.Text
                                      , IntToStr(cmb_WordSort.ItemIndex)
                                      , IntToStr(cmb_Wordform.ItemIndex)
                                      );

       if CompareStr(v_sMax, '00000') <> 0 then begin
          Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  'ǥ�شܾ� '
                                                                                        + '"' + txt_EFWord.Text + '"'
                                                                                        + ' �� �ܾ ���� �Ǿ����ϴ�.'
                                                                                     ))
                                 , '�ܾ����!'
                                 , MB_OK + MB_ICONINFORMATION
                                 );
         pSet_WordLst(0, v_sMax);
         {-- �ٽ� ����ġ�� Ŀ�� �̵��ϱ� --}
         frmMain.pSet_CurLocate(  'C_ESEQ'
                                  , v_sMax
                                  , oraQry_WordLst
                                  );
       end else if CompareStr(v_sMax, '-1') = 0 then begin
          Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  'ǥ�شܾ� '
                                                                                        + '"' + txt_EFWord.Text + '"'
                                                                                        + ' �� �ܾ "���" �� ��� �Ǿ����ϴ�.' + #13
                                                                                        + ' ���� "���" �� ���� �ܾ�� ���� �� �� �����ϴ�.'
                                                                                     ))
                                 , '�ܾ��������!'
                                 , MB_OK + MB_ICONERROR
                                 );
       end;
   end;

end;

procedure TfrmWordDML.sbtn_SynWordSaveClick(Sender: TObject);
var
   v_sDuple : String; {-- �ߺ� üũ --}
   v_sMax   : String; {-- ���� Max �� --}
   v_sSynEFWord, v_sSynESWord, v_sSynHFWord : String;
begin
   {-- Null Check --}
   if frmMain.fGet_ValCheck(txt_SynHFWord, '�ѱ۸��� �Է��� �ּ���.!'     ) = false then Exit;
   {-- �ߺ� üũ --}
   v_sSynEFWord := '';
   v_sSynESWord := '';
   if pv_TpDML = 'INSERT' then begin
      v_sSynHFWord := txt_SynHFWord.Text;
   end else begin
      if CompareStr(oraQry_WordLst.FieldByName('C_HFWORD').AsString, txt_SynHFWord.Text) = 0 then v_sSynHFWord := '' else  v_sSynHFWord := txt_SynHFWord.Text;
   end;

   v_sDuple := frmWordMg.fGet_WordDupleCheck(  v_sSynEFWord
                                             , v_sSynESWord
                                             , v_sSynHFWord
                                             , txt_SynESWord.Text
                                             , format('%.3d', [cmb_SynWordSort.ItemIndex])
                                             );

   if CompareStr(v_sDuple, '3') = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  '�ѱ۸� '
                                                                                    + '"' + txt_SynHFWord.Text + '"'
                                                                                    + ' �� �ܾ �ߺ� �Ǿ����ϴ�.'
                                                                                ))
                             , '�ܾ��ߺ�!'
                             , MB_OK + MB_ICONERROR
                             );
      txt_SynHFWord.SetFocus;
      Exit;
   end;

   if CompareStr(v_sDuple, '4') = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  'ǥ�ؾ� '
                                                                                    + '"' + txt_SynESWord.Text + '"'
                                                                                    + ' �� �ܾ �̹� ��ϵǾ� �ֽ��ϴ�.'
                                                                                ))
                             , '�ܾ��ߺ�!'
                             , MB_OK + MB_ICONERROR
                             );
      txt_SynHFWord.SetFocus;
      Exit;
   end;

   {-- �������Ǿ� ��� --}
   if pv_TpDML = 'INSERT' then begin
      v_sMax := frmWordMg.fSet_SynWordAdd(  0
                                          , oraQry_WordLst.FieldByName('C_ESEQ').AsString
                                          , txt_SynHFWord.text
                                          , IntToStr(cmb_SynWordSort.ItemIndex)
                                          , IntToStr(cmb_SynWordForm.ItemIndex)
                                          , mem_SynMemo.Text
                                          );
      if CompareStr(v_sMax , '00000') <> 0 then begin
         Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  '�������Ǿ� '
                                                                                       + '"' + txt_SynHFWord.Text + '"'
                                                                                       + ' �� �ܾ ��� �Ǿ����ϴ�.'
                                                                                    ))
                                , '�ܾ���!'
                                , MB_OK + MB_ICONINFORMATION
                                );
         {-- List �� �߰� --}
         pSet_WordLst(1, oraQry_WordLst.FieldByName('C_ESEQ').AsString);
         {-- �ٽ� ����ġ�� Ŀ�� �̵��ϱ� --}
         frmMain.pSet_CurLocate(  'C_HSEQ'
                                  , v_sMax
                                  , oraQry_WordLst
                                  );

         {-- ��ư ���� --}
         pSet_BtnCtrl(3);
      end;
   end else begin
      v_sMax := frmWordMg.fSet_SynWordUp(  oraQry_WordLst.FieldByName('C_ESEQ').AsString
                                         , oraQry_WordLst.FieldByName('C_HSEQ').AsString
                                         , txt_SynHFWord.Text
                                         , IntToStr(cmb_SynWordSort.ItemIndex) 
                                         , IntToStr(cmb_SynWordForm.ItemIndex)
                                         , mem_SynMemo.Text
                                         );
      if CompareStr(v_sMax, '00000') <> 0 then begin
         Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  '�������Ǿ� '
                                                                                       + '"' + txt_SynHFWord.Text + '"'
                                                                                       + ' �� �ܾ ���� �Ǿ����ϴ�.'
                                                                                    ))
                                , '�ܾ����!'
                                , MB_OK + MB_ICONINFORMATION
                                );
         pSet_WordLst(1, oraQry_WordLst.FieldByName('C_ESEQ').AsString);
         {-- �ٽ� ����ġ�� Ŀ�� �̵��ϱ� --}
         frmMain.pSet_CurLocate(  'C_HSEQ'
                                  , v_sMax
                                  , oraQry_WordLst
                                  );

         schg_WordLstCellClick(schg_WordLst.Columns.Items[1]);
      end else if CompareStr(v_sMax, '-1') = 0 then begin
         Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  '�������Ǿ� '
                                                                                       + '"' + txt_SynHFWord.Text + '"'
                                                                                       + ' �� �ܾ "���" �� ��� �Ǿ����ϴ�.' + #13
                                                                                       + ' ���� "���" �� ���� �ܾ�� ���� �� �� �����ϴ�.'
                                                                                    ))
                                , '�ܾ��������!'
                                , MB_OK + MB_ICONERROR
                                );
      end;
   end;
end;

procedure TfrmWordDML.sbtn_WordCancelClick(Sender: TObject);
begin
   Case Notebook1.PageIndex of
      0 : begin
              pSet_BtnCtrl(1);
              if oraQry_WordLst.RecordCount = 0 then begin
                 sbtn_DelWord.Enabled    := False;
                 sbtn_NewSynWord.Enabled := False;
              end;
          end;
      1 : pSet_BtnCtrl(4);
   end;
end;

procedure TfrmWordDML.schg_WordLstDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   v_sFieldValue : String;
begin
   //* ������ �´� Cell �� ���� ���� �� ����
   v_sFieldValue := oraQry_WordLst.FieldByName('C_WORDSORT').AsString;
   if CompareStr(v_sFieldValue, '002') = 0 then begin
      (Sender as TCRDBGrid).Canvas.Font.Color  := clRed;
      (Sender as TCRDBGrid).Canvas.Font.Style  := [fsBold];
      (Sender as TCRDBGrid).Canvas.FillRect(Rect);
      (Sender as TCRDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
   end;

   v_sFieldValue := oraQry_WordLst.FieldByName('C_WORDSORT').AsString;
   if CompareStr(v_sFieldValue, '001') = 0 then begin
      (Sender as TCRDBGrid).Canvas.Font.Color  := clBlue;
      (Sender as TCRDBGrid).Canvas.Font.Style  := [fsBold];
      (Sender as TCRDBGrid).Canvas.FillRect(Rect);
      (Sender as TCRDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
   end;

   v_sFieldValue := oraQry_WordLst.FieldByName('C_USEFLAG').AsString;
   if CompareStr(v_sFieldValue, '1') = 0 then begin
      (Sender as TCRDBGrid).Canvas.Font.Color  := clPurple;
      (Sender as TCRDBGrid).Canvas.Font.Style  := [fsBold];
      (Sender as TCRDBGrid).Canvas.FillRect(Rect);
      (Sender as TCRDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
   end;
   {
   with TCRDBGrid(Sender) do begin
      if SelectedRows.CurrentRowSelected then begin //�����õ��ٸ� ��ĥ�ϱ�
         Canvas.Brush.Color := $00CFFAE0;
         Canvas.FillRect(Rect);
         //�ʵ�Ÿ�Կ� ���� �ٽþ��� ��ġ�� �����ϼ���. Field.DataType
         canvas.TextRect(Rect, Rect.Left, Rect.Top, Column.Field.AsString);
      end;
   end;

   if gdFocused in State then begin
      me_DMLClipboard.Text := Column.Field.AsString;
       with (Sender as TCRDBGrid) do begin
          Canvas.Brush.Color := $00CFFAE0;
          Canvas.FillRect(Rect);
          Canvas.TextOut(Rect.Left, Rect.Top, Column.Field.AsString);
          SelectedRows.CurrentRowSelected := True;
      end;
   end;
   }
end;

procedure TfrmWordDML.schg_WordLstKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {
   with TCRDBGrid(Sender) do begin
      SelectedRows.Clear;
   end;
  }
   {-- CTRL + C --}
   if ((KEY = $43) and (shift = [ssCtrl])) then
      Clipboard.SetTextBuf(PChar(me_DMLClipboard.Text));
end;

procedure TfrmWordDML.schg_WordLstMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{
   with TCRDBGrid(Sender) do begin
      SelectedRows.Clear;
   end;
}
end;

procedure TfrmWordDML.schg_WordLstCellClick(Column: TColumn);
begin
   if oraQry_WordLst.RecordCount = 0 then Exit;
   pv_TpDML := 'UPDATE';
   {-- Data Setting --}
   with oraQry_WordLst do begin
      if CompareStr(Fields[3].AsString, '000') = 0 then begin
         Notebook1.PageIndex := 0;
         txt_HFWord.SetFocus;
      end else begin
         Notebook1.PageIndex := 1;
         txt_SynHFWord.SetFocus;
      end;
      pSet_DataSet(  Notebook1.PageIndex
                   , Fields[10].AsString
                   , Fields[8].AsString
                   , Fields[9].AsString
                   , Fields[3].AsString
                   , Fields[5].AsString
                   , Fields[7].AsString
                   );

   end;

   {-- SpeedButton Control --}
   pSet_BtnCtrl(2);

end;

procedure TfrmWordDML.sbtn_WordNewClick(Sender: TObject);
begin
   pv_TpDML := 'INSERT';
   Notebook1.PageIndex := 0;

   txt_EFWord.Clear;
   txt_ESWord.Clear;
   txt_HFWord.Clear;
   cmb_Wordform.ItemIndex := 2;

   txt_HFWord.SetFocus;

   pSet_BtnCtrl(0);
end;

procedure TfrmWordDML.sbtn_NewSynWordClick(Sender: TObject);
begin
   pv_TpDML := 'INSERT';
   if oraQry_WordLst.RecordCount = 0 then begin
      sbtn_DelWord.Enabled    := False;
      sbtn_NewSynWord.Enabled := False;
   end else begin
      Notebook1.PageIndex := 1;
      txt_SynEFWord.Text := schg_WordLst.Columns.Items[2].Field.AsString;
      txt_SynESWord.Text := schg_WordLst.Columns.Items[3].Field.AsString;
      txt_SynHFWord.Clear;
      cmb_SynWordSort.ItemIndex := 1;
      cmb_SynWordForm.ItemIndex := 2;
      txt_SynHFWord.SetFocus;
      pSet_BtnCtrl(3);
   end;
end;

end.
