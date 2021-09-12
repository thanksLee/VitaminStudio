unit uWordMg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, DB, MemDS,
  DBAccess, Grids, DBGrids, Clipbrd, CRGrid, Uni;

type
  TfrmWordMg = class(TForm)
    ToolBar1: TToolBar;
    tbn_Reload: TToolButton;
    ToolButton6: TToolButton;
    tbn_WordInsert: TToolButton;
    tbn_WordDel: TToolButton;
    ToolButton1: TToolButton;
    tbn_Approval: TToolButton;
    ToolButton4: TToolButton;
    tbn_DataSave: TToolButton;
    ToolButton7: TToolButton;
    tbn_Close: TToolButton;
    Panel1: TPanel;
    sbtn_DataSearch: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cmb_SearchList: TComboBox;
    txt_DataSearch: TEdit;
    chb_Count: TCheckBox;
    cmb_WordSort: TComboBox;
    StaticText7: TStaticText;
    StaticText1: TStaticText;
    me_Clipboard: TMemo;
    tbn_WordEdit: TToolButton;
    shg_WordList: TCRDBGrid;
    Qry_WordLst: TUniQuery;
    dts_WordLst: TUniDataSource;
    Qry_Dml: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure tbn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure shg_WordListDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure shg_WordListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure shg_WordListTitleClick(Column: TColumn);
    procedure cmb_WordSortChange(Sender: TObject);
    procedure sbtn_DataSearchClick(Sender: TObject);
    procedure txt_DataSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chb_CountClick(Sender: TObject);
    procedure tbn_ReloadClick(Sender: TObject);
    procedure tbn_WordInsertClick(Sender: TObject);
    procedure shg_WordListDblClick(Sender: TObject);
    procedure shg_WordListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbn_WordDelClick(Sender: TObject);
    procedure tbn_DataSaveClick(Sender: TObject);
  private
    { Private declarations }
    //* DBGrid 에서 마우스 휠되게 하기
    procedure MouseWheelHandler(var Message: TMessage); override;

    //* 권한에 따른 버튼 제어
    procedure pGet_BtnCtrl(pi_sUserAuth : String);
    //* Filter Combobox 에 추가
    procedure pSet_Filter;
  public
    { Public declarations }
    //* 검색 실행..
    procedure pSet_Search(pi_cColumn : TColumn; pi_iFlag : Integer);

    //* 단어 사전 Call
    //* Param : 정렬, asc:desc, 한글명, 영문명, 영문약어명, 단어종류
    procedure pGet_QryWordLst(pi_sSort, pi_sChange, pi_sHWord, pi_sEWord, pi_sESWord, pi_sWSrot : String);

    //* DBGrid Setting
    procedure pSet_DBGrid(grid_Obj : TCRDBGrid);

    //* 중복단어 체크 (영문명, 영문약어명, 한글명)
    function fGet_WordDupleCheck(pi_sEFWord, pi_sESWord, pi_sHFWord, pi_sCheck, pi_sWordSort : String) : String;
    //* 표준어 추가
    function fSet_WordAdd(pi_sEFWord, pi_sESWord, pi_sMemo, pi_sHFWord, pi_sWordSort, pi_sWordForm : String) : String;
    //* 표준 수정
    function fSet_WordUp(pi_sESeq, pi_sHSeq, pi_sEFWord, pi_sESWord, pi_sHFWord, pi_sMemo, pi_sWordSort, pi_sWordForm: String) : String;
    //* 동음이의어 추가
    function fSet_SynWordAdd(pi_iFlag : Integer; pi_sESeq, pi_sSynHFWord, pi_sSynWordSort, pi_sSynWordForm, pi_sSynMemo : String) : String;
    //* 동음이의어 수정
    function fSet_SynWordUp(pi_sESeq, pi_sHSeq, pi_sHFWord, pi_sWordSort, pi_sWordForm, pi_sMemo : String) : String;
    //* 표준어 삭제
    function fSet_WordDel(pi_sESeq, pi_sHSeq, pi_sWordSort : String) : String;

  end;

var
  frmWordMg: TfrmWordMg;

implementation
uses uMain, uWordDML, uSave;
{$R *.dfm}

//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//

//****************************************************************************//
//* DBGrid 에서 마우스 휠되게 하기
//****************************************************************************//
procedure TfrmWordMg.MouseWheelHandler(var Message: TMessage);
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
//* 권한에 따른 버튼 제어
//* 잠시 사용중지
//****************************************************************************//
procedure TfrmWordMg.pGet_BtnCtrl(pi_sUserAuth : String);
var
   v_iLoopCnt : Integer;
begin
   for v_iLoopCnt := 0 to ComponentCount - 1 do begin
      if (Components[v_iLoopCnt] is TToolButton) then begin
         if CompareStr(pi_sUserAuth, 'U') = 0 then begin
            if (Components[v_iLoopCnt] as TToolButton).Tag = 5 then begin
               (Components[v_iLoopCnt] as TToolButton).Enabled := False;
            end;
         end else begin
            if (Components[v_iLoopCnt] as TToolButton).Tag = 5 then begin
               (Components[v_iLoopCnt] as TToolButton).Enabled := True;
            end;
         end;
      end;
   end;
end;

//****************************************************************************//
//* Filter Combobox 에 추가
//****************************************************************************//
procedure TfrmWordMg.pSet_Filter;
var
   v_iLoopCnt : Integer;
   v_sStr     : String;
begin
   cmb_WordSort.Clear;
   cmb_WordSort.Items.Add('전  체');
   for v_iLoopCnt := 0 to pb_stMemIns.Count - 1 do begin
      if CompareStr(Copy(pb_stMemIns.Strings[v_iLoopCnt], 1, 3), 'A01') = 0 then begin
         v_sStr := frmMain.fGet_stMemIns(1, IntToStr(v_iLoopCnt));
         v_sStr := Copy(v_sStr, Pos('-', v_sStr)+1, Length(v_sStr));
         cmb_WordSort.Items.Add(v_sStr);
      end;
   end;
   cmb_WordSort.ItemIndex := 0;
end;

//****************************************************************************//
//* DBGrid Setting
//****************************************************************************//
procedure TfrmWordMg.pSet_DBGrid(grid_Obj : TCRDBGrid);
var
   v_iLoopCnt : Integer;
begin
   with grid_Obj do begin
      for v_iLoopCnt := 0 to Columns.Count - 1 do begin
         Columns[v_iLoopCnt].Title.Font.Style := [fsBold];
         Columns[v_iLoopCnt].Title.Alignment  := taCenter;
         with Columns[v_iLoopCnt] do begin
            Case v_iLoopCnt of
               0 : begin
                      Title.Caption := '순번';
                      FieldName     := 'RNUM';
                      Width := 40;
                   end;
               1 : begin
                      Title.Caption := '영문명';
                      FieldName     := 'C_EFWORD';
                      Width := 170;
                   end;
               2 : begin
                      Title.Caption := '영문약어명';
                      FieldName     := 'C_ESWORD';
                      Width := 80;
                   end;
               3 : begin
                      Title.Caption := '한글명';
                      FieldName     := 'C_HFWORD';
                      Width := 170;
                   end;
               4 : begin
                      Title.Caption := '도메인여부';
                      FieldName     := 'C_DOMAINFLAGNM';
                      Alignment     := taCenter;
                      Width := 80;
                   end;
               5 : begin
                      Title.Caption := '단어종류';
                      FieldName     := 'C_WORDSORTNM';
                      Alignment     := taCenter;
                      Width := 70;
                   end;
               6 : begin
                      Title.Caption := '단어형태';
                      FieldName     := 'C_WORDFORMNM';
                      Alignment     := taCenter;
                      Width := 70;
                   end;
               7 : begin
                      Title.Caption := '정 의';
                      FieldName     := 'C_MEMO';
                      Width := 250;
                   end;
            end; // Case..end;
         end; // with..do
      end; // for .. end
   end; // with shg_WordList do
end;

//****************************************************************************//
//* 단어 사전 Call
//* Param : 정렬, asc:desc, 한글명, 영문명, 영문약어명, 단어종류
//****************************************************************************//
procedure TfrmWordMg.pGet_QryWordLst(pi_sSort, pi_sChange, pi_sHWord, pi_sEWord, pi_sESWord, pi_sWSrot : String);
var
   v_sSql : String;
   v_stParam : TStringList;
begin
   v_sSql := 'SELECT A.C_ESEQ                                                               ' + #13 +
       '     , A.C_EFWORD                                                                   ' + #13 +
       '     , A.C_ESWORD                                                                   ' + #13 +
       '     , B.C_HSEQ                                                                     ' + #13 +
       '     , B.C_HFWORD                                                                   ' + #13 +
       '     , A.C_DOMAINFLAG                                                               ' + #13 +
       '     , DECODE(A.C_DOMAINFLAG, ''0'', '''', ''도메인'') C_DOMAINFLAGNM               ' + #13 +
       '     , C_WORDSORT                                                                   ' + #13 +
       '     , fGet_CommonInfo(''1'', ''A01'', B.C_WORDSORT) C_WORDSORTNM                   ' + #13 +
       '     , B.C_WORDFORM                                                                 ' + #13 +
       '     , fGet_CommonInfo(''1'', ''B01'', B.C_WORDFORM) C_WORDFORMNM                   ' + #13 +
       '     , B.C_MEMO                                                                     ' + #13 +
       '     , B.C_REGDATE                                                                  ' + #13 +
       '     , SUBSTR(B.C_REGDATE, 1, 4) || ''년''                                          ' + #13 +
       '    || SUBSTR(B.C_REGDATE, 5, 2) || ''월''                                          ' + #13 +
       '    || SUBSTR(B.C_REGDATE, 7, 2) || ''일 ''                                         ' + #13 +
       '    || SUBSTR(B.C_REGDATE, 9, 2) || ''시''                                          ' + #13 +
       '    || SUBSTR(B.C_REGDATE, 11, 2) || ''분''                                         ' + #13 +
       '    || SUBSTR(B.C_REGDATE, 13, 2) || ''초'' C_REGISTDATE1                           ' + #13 +
       '     , B.C_USEFLAG                                                                  ' + #13 +
       '     , B.C_REGUSERID                                                                ' + #13 +
       '     , B.C_APRUSERID                                                                ' + #13 +
       '     , ROW_NUMBER() OVER(ORDER BY DECODE('+ pi_sSort +', 0, A.C_ESEQ                ' + #13 +
       '                                                       , 1, A.C_EFWORD              ' + #13 +
       '                                                       , 2, A.C_ESWORD              ' + #13 +
       '                                                       , 3, B.C_HFWORD              ' + #13 +
       '                                                       , 4, A.C_DOMAINFLAG          ' + #13 +
       '                                                       , 5, B.C_WORDSORT            ' + #13 +
       '                                                       , 6, B.C_WORDFORM            ' + #13 +
       '                                                       , 7, B.C_MEMO                ' + #13 +
       '                                                       ) ' + pi_sChange + ') RNUM   ' + #13 +
       '  FROM T_EWORD A, T_HWORD B                                                         ' + #13 +
       ' WHERE A.C_ESEQ = B.C_ESEQ                                                          ' + #13 +
       '   AND LOWER(A.C_EFWORD) LIKE ''%''|| LOWER(:c_efword) ||''%''                      ' + #13 +
       '   AND LOWER(A.C_ESWORD) LIKE ''%''|| LOWER(:c_esword) ||''%''                      ' + #13 +
       '   AND B.C_HFWORD LIKE ''%''|| :c_hfword ||''%''                                    ' + #13 +
       '   AND B.C_WORDSORT LIKE :c_wordsort || ''%''                                       ';

   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sEWord);
      v_stParam.Add(pi_sESWord);
      v_stParam.Add(pi_sHWord);
      v_stParam.Add(pi_sWSrot);

      with frmMain do begin
         try
            pGet_QryExec(  0
                         , v_sSql
                         , v_stParam
                         , Qry_WordLst
                         );
            {-- User Define procedure --}
            {-- DBGrid Setting --}
            pSet_DBGrid(shg_WordList);

            {-- Count --}
            if chb_Count.Checked = True then begin
               Qry_WordLst.SpecificOptions.Values['FetchAll'] := 'True';
               chb_Count.Caption    := Format('총 %d 건', [Qry_WordLst.RecordCount]);
            end;
         except
            on E : Exception do begin
               Application.MessageBox(  StrPCopy(pb_arrMessage, fGet_MessageInfo(901, E.Message))
                                      , 'SQL 실패!'
                                      , MB_OK + MB_ICONERROR
                                      );
            end;
         end;
      end;
   finally
      v_stParam.Free;
   end;

end;

//****************************************************************************//
//* 검색 실행..
//* 0 : 컬럼 클릭 하지 않음
//* 1 : 컬럼 클릭 함
//****************************************************************************//
procedure TfrmWordMg.pSet_Search(pi_cColumn : TColumn; pi_iFlag : Integer);
var
   v_sHFWord, v_sEFWord, v_sESWord : String; {-- 검색어 --}
   v_sSort   : String; {-- 단어종류 --}
   v_sChange : String; {-- 정렬 --}
   v_sStrTmp : String; {-- 정렬방식 --}
   v_sStrKey : String; {-- 다시 원위치로 돌아가기 위한 값 --}
begin
   Case cmb_SearchList.ItemIndex of
      0 : v_sHFWord := txt_DataSearch.Text;
      1 : v_sEFWord := txt_DataSearch.Text;
      2 : v_sESWord := txt_DataSearch.Text;
   end;

   {-- 다시 원위치로 돌아가기 위한 값 --}
   v_sStrKey := pi_cColumn.Field.AsString;

   if pi_iFlag = 1 then begin
      if pos('▼', pi_cColumn.Title.Caption) > 0 then begin
         v_sChange := '▲';
         v_sStrTmp := 'DESC';
      end else begin
         v_sChange := '▼';
         v_sStrTmp := 'ASC';
      end;
   end else begin
      v_sStrTmp := 'ASC';
      v_sChange := Copy(pi_cColumn.Title.Caption, pos('▼', pi_cColumn.Title.Caption), 2);
      if CompareStr(v_sChange, '▼') = 0 then v_sStrTmp := 'ASC'
      else if CompareStr(v_sChange, '▲') = 0 then v_sStrTmp := 'DESC'
      else v_sChange := '';
   end;

   {-- Memory Instance --}
   v_sSort := frmMain.fGet_stMemIns(0, 'A01-' + cmb_WordSort.Items[cmb_WordSort.ItemIndex]);

   {-- 단어사전 실행 --}
   pGet_QryWordLst(IntToStr(pi_cColumn.Index), v_sStrTmp, v_sHFWord, v_sEFWord, v_sESWord, v_sSort);

   pi_cColumn.Title.Caption := pi_cColumn.Title.Caption + v_sChange;

   {-- 다시 원위치로 커서 이동하기 --}
   frmMain.pSet_CurLocate(pi_cColumn.FieldName, v_sStrKey, Qry_WordLst);
end;

//****************************************************************************//
//* 중복단어 체크 (영문명, 영문약어명, 한글명)
//****************************************************************************//
function TfrmWordMg.fGet_WordDupleCheck(pi_sEFWord, pi_sESWord, pi_sHFWord, pi_sCheck, pi_sWordSort : String) : String;
var
   v_sSql    : String;
   v_stParam : TStringList;                                    
   v_sTmpStr : String;
   v_sWordSort : String;
begin
   {-- Init --}
   v_sTmpStr := '0';

   if CompareStr(pi_sWordSort, '000') = 0 then v_sWordSort := pi_sWordSort
   else v_sWordSort := '';

   v_stParam := TStringList.Create;
   try
      v_sSql := 'SELECT ''1''                       ' + #13 +
                '  FROM T_EWORD A                   ' + #13 +
                ' WHERE C_EFWORD = :c_efword1       ' + #13 +
                '   AND ROWNUM = 1                  ' + #13 +
                'UNION ALL                          ' + #13 +
                'SELECT ''2''                       ' + #13 +
                '  FROM T_EWORD                     ' + #13 +
                ' WHERE C_ESWORD = :c_esword        ' + #13 +
                '   AND ROWNUM = 1                  ' + #13 +
                'UNION ALL                          ' + #13 +
                'SELECT ''3''                       ' + #13 +
                '  FROM T_HWORD                     ' + #13 +
                ' WHERE C_HFWORD = :c_hfword        ' + #13 +
                '   AND ROWNUM = 1                  ' + #13 +
                'UNION ALL                          ' + #13 +
                'SELECT ''4''                       ' + #13 +
                '  FROM T_EWORD A, T_HWORD B        ' + #13 +
                ' WHERE A.C_ESEQ = B.C_ESEQ         ' + #13 +
                '   AND A.C_ESWORD = :c_esword2     ' + #13 +
                '   AND B.C_WORDSORT = :c_wordsort  ';

      v_stParam.Add(pi_sEFWord);
      v_stParam.Add(pi_sESWord);
      v_stParam.Add(pi_sHFWord);
      v_stParam.Add(pi_sCheck);
      v_stParam.Add(v_sWordSort);

      try
         Qry_Dml.SpecificOptions.Values['FetchAll'] := 'True';
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         if Qry_Dml.RecordCount = 0 then begin
            v_sTmpStr := '0';
         end else begin
            v_sTmpStr := Qry_Dml.Fields[0].AsString;
         end;
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end; // try..except..end;
   finally
      v_stParam.Free;
   end;
   Result := v_sTmpStr;
end;

//****************************************************************************//
//* 표준어 추가
//****************************************************************************//
function TfrmWordMg.fSet_WordAdd(pi_sEFWord, pi_sESWord, pi_sMemo, pi_sHFWord, pi_sWordSort, pi_sWordForm : String) : String;
var
   v_sSql           : String;
   v_stParam        : TStringList;
   v_sEMax, v_sHMax : String; {-- 영문단어 Max, 한글단어 Max --}
begin
   {-- Init --}
   v_stParam := TStringList.Create;
   v_sEMax   := '00000';
   v_sHMax   := '00000';

  try
      frmMain.UniConn.StartTransaction;
      try
         {-- Max 값 구함 --}
         v_sSql := 'SELECT C_ESEQ                                                                           ' + #13 +
                   '     , NVL(( SELECT LTRIM(TO_CHAR(TO_NUMBER(MAX(C_HSEQ)) + 1, ''00009''))                    ' + #13 +
                   '               FROM T_HWORD A                                                            ' + #13 +
                   '              WHERE C_ESEQ = V.C_ESEQ||''''                                             ' + #13 +
                   '            ), ''00001'') C_HSEQ                                                        ' + #13 +
                   '  FROM ( SELECT NVL(( SELECT LTRIM(TO_CHAR(TO_NUMBER(MAX(C_ESEQ)) + 1, ''00009''))           ' + #13 +
                   '                        FROM T_EWORD A                                                  ' + #13 +
                   '                     ), ''00001'') C_ESEQ                                               ' + #13 +
                   '           FROM DUAL                                                                    ' + #13 +
                   '         ) V                                                                            ';

         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         v_sEMax := Qry_Dml.Fields[0].AsString;
         v_sHMax := Qry_Dml.Fields[1].AsString;

         {-- 표준어 영문 입력  --}

         v_sSql := 'INSERT INTO T_EWORD (  C_ESEQ                      ' + #13 +
                   '                     , C_EFWORD                    ' + #13 +
                   '                     , C_ESWORD                    ' + #13 +
                   '                     , C_DOMAINFLAG                ' + #13 +
                   '                     ) VALUES (  :c_eseq           ' + #13 +
                   '                               , :c_efword         ' + #13 +
                   '                               , :c_esword         ' + #13 +
                   '                               , :c_domainflag     ' + #13 +
                   '                               )                   ';

         v_stParam.Clear;
         v_stParam.Add(v_sEMax);
         v_stParam.Add(pi_sEFWord);
         v_stParam.Add(pi_sESWord);
         v_stParam.Add('0');

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         {-- 표준어 한글 입력  --}

         v_sSql := 'INSERT INTO T_HWORD (  C_ESEQ                                                   ' + #13 +
                   '                     , C_HSEQ                                                   ' + #13 +
                   '                     , C_APRUSERID                                              ' + #13 +
                   '                     , C_REGUSERID                                              ' + #13 +
                   '                     , C_HFWORD                                                 ' + #13 +
                   '                     , C_WORDSORT                                               ' + #13 +
                   '                     , C_WORDFORM                                               ' + #13 +
                   '                     , C_USEFLAG                                                ' + #13 +
                   '                     , C_MEMO                                                   ' + #13 +
                   '                     ) VALUES ( :c_eseq                                         ' + #13 +
                   '                              , :c_hseq                                         ' + #13 +
                   '                              , :c_aprserid                                     ' + #13 +
                   '                              , :c_reguserid                                    ' + #13 +
                   '                              , :c_hfword                                       ' + #13 +
                   '                              , LTRIM(TO_CHAR(TO_NUMBER(:c_wordsort), ''009'')) ' + #13 +
                   '                              , LTRIM(TO_CHAR(TO_NUMBER(:c_wordform), ''009'')) ' + #13 +
                   '                              , :c_useflag                                      ' + #13 +
                   '                              , :c_memo                                         ' + #13 +
                   '                              )                                                 ';

         v_stParam.Clear;
         v_stParam.Add(v_sEMax);
         v_stParam.Add(v_sHMax);
         v_stParam.Add('');
         v_stParam.Add(frmMain.fGet_stMemIns(0, 'USERID'));
         v_stParam.Add(pi_sHFWord);
         v_stParam.Add(pi_sWordSort);
         v_stParam.Add(pi_sWordForm);
         v_stParam.Add(frmMain.fGet_stMemIns(0, 'APPFLAG'));
         v_stParam.Add(pi_sMemo);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         frmMain.UniConn.Commit;
      except
         on E : Exception do begin
            frmMain.UniConn.Rollback;
            v_sEMax := '00000';
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end; // try..except..end;
   finally
      v_stParam.Free;
   end;
   Result := v_sEMax;
end;

//****************************************************************************//
//* 표준 수정
//****************************************************************************//
function TfrmWordMg.fSet_WordUp(pi_sESeq, pi_sHSeq, pi_sEFWord, pi_sESWord, pi_sHFWord, pi_sMemo, pi_sWordSort, pi_sWordForm: String) : String;
var
   v_sSql      : String;
   v_stParam   : TStringList;
   v_sDateTime : String;
   v_sMax      : String;
   v_iAffCnt   : Integer;
begin
   {-- Init --}
   v_stParam   := TStringList.Create;
   v_sDateTime := FormatDateTime('YYYYMMDDHHNNSS', NOW);
   v_sMax      := pi_sESeq;
   v_iAffCnt   := 0;

   try
      frmMain.UniConn.StartTransaction;
      try
         {-- 영문 Update --}
         v_sSql := 'UPDATE T_EWORD A                               ' + #13 +
                   '   SET C_EFWORD = :c_efword                    ' + #13 +
                   '     , C_ESWORD = :c_esword                    ' + #13 +
                   ' WHERE C_ESEQ = :c_eseq1                       ' + #13 +
                   '   AND NOT EXISTS ( SELECT ''X''               ' + #13 +
                   '                      FROM T_USEWORD B         ' + #13 +
                   '                     WHERE C_ESEQ = :c_eseq2   ' + #13 +
                   '                    )                          ' + #13 +
                   '   AND ROWNUM = 1                              ';

         v_stParam.Add(pi_sEFWord);
         v_stParam.Add(pi_sESWord);
         v_stParam.Add(v_sMax);
         v_stParam.Add(v_sMax);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );
         v_iAffCnt := Qry_Dml.RowsAffected;

         {-- 한글 Update --}
         v_sSql := 'UPDATE T_HWORD                                                                                 ' + #13 +
                   '   SET C_HFWORD = :c_hfword                                                                    ' + #13 +
                   '     , C_WORDSORT = LTRIM(TO_CHAR(TO_NUMBER(:c_wordsort), ''009''))                            ' + #13 +
                   '     , C_WORDFORM = LTRIM(TO_CHAR(TO_NUMBER(:c_wordform), ''009''))                            ' + #13 +
                   '     , C_REGDATE = :c_editdate                                                                 ' + #13 +
                   '     , C_MEMO     = :c_memo                                                                    ' + #13 +
                   '     , C_USEFLAG  = DECODE(:appflag, ''1'', DECODE(C_USEFLAG, ''0'', ''1'', C_USEFLAG), ''0'') ' + #13 +
                   ' WHERE C_ESEQ = :c_eseq1                                                                       ' + #13 +
                   '   AND C_HSEQ = :c_hseq1                                                                       ' + #13 +
                   '   AND NOT EXISTS ( SELECT ''X''                                                               ' + #13 +
                   '                      FROM T_USEWORD B                                                         ' + #13 +
                   '                     WHERE C_ESEQ = :c_eseq2                                                   ' + #13 +
                   '                       AND C_HSEQ = :c_hseq2                                                   ' + #13 +
                   '                    )                                                                          ';

         v_stParam.Clear;
         v_stParam.Add(pi_sHFWord);
         v_stParam.Add(pi_sWordSort);
         v_stParam.Add(pi_sWordForm);
         v_stParam.Add(v_sDateTime);
         v_stParam.Add(pi_sMemo);
         v_stParam.Add(frmMain.fGet_stMemIns(0, 'APPFLAG'));
         v_stParam.Add(v_sMax);
         v_stParam.Add(pi_sHSeq);
         v_stParam.Add(v_sMax);
         v_stParam.Add(pi_sHSeq);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         v_iAffCnt := v_iAffCnt + Qry_Dml.RowsAffected;

         {-- 용어사전에 사용되었는지 체크 --}
         if v_iAffCnt <> 2  then begin
            v_sMax := '-1';
            frmMain.UniConn.Rollback;
         end else begin
            frmMain.UniConn.Commit;
         end;
      except
         on E : Exception do begin
            frmMain.UniConn.Rollback;
            v_sMax := '00000';
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end; // try..except..end;
   finally
      v_stParam.Free;
   end; // try..finally..end
   Result := v_sMax;
end;

//****************************************************************************//
//* 동음이의어 추가
//****************************************************************************//
function TfrmWordMg.fSet_SynWordAdd(pi_iFlag : Integer; pi_sESeq, pi_sSynHFWord, pi_sSynWordSort, pi_sSynWordForm, pi_sSynMemo : String) : String;
var
   v_sSql           : String;
   v_stParam        : TStringList;
   v_sEMax, v_sHMax : String;
begin
   {-- Init --}
   v_stParam := TStringList.Create;
   v_sEMax   := pi_sESeq;
   v_sHMax   := '00000';
  try

      frmMain.UniConn.StartTransaction;
      try
         {-- Max 값 구함 --}
         v_sSql := 'SELECT NVL(( SELECT LTRIM(TO_CHAR(TO_NUMBER(MAX(C_HSEQ)) + 1, ''00009''))                   ' + #13 +
                   '              FROM T_HWORD A                                                            ' + #13 +
                   '              WHERE C_ESEQ = :c_eseq                                                    ' + #13 +
                   '            ), ''00001'') C_HWSEQ                                                       ' + #13 +
                   '  FROM DUAL                                                                             ';
         v_stParam.Add(v_sEMax);

         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         v_sHMax := Qry_Dml.Fields[0].AsString;

         {-- 동음의어 입력  --}
         v_sSql := 'INSERT INTO T_HWORD (  C_ESEQ                                                    ' + #13 +
                   '                     , C_HSEQ                                                    ' + #13 +
                   '                     , C_APRUSERID                                               ' + #13 +
                   '                     , C_REGUSERID                                               ' + #13 +
                   '                     , C_HFWORD                                                  ' + #13 +
                   '                     , C_WORDSORT                                                ' + #13 +
                   '                     , C_WORDFORM                                                ' + #13 +
                   '                     , C_USEFLAG                                                 ' + #13 +
                   '                     , C_MEMO                                                    ' + #13 +
                   '                     ) VALUES (  :c_eseq                                         ' + #13 +
                   '                               , :c_hseq                                         ' + #13 +
                   '                               , :c_apruserid                                    ' + #13 +
                   '                               , :c_reguserid                                    ' + #13 +
                   '                               , :c_hwordnm                                      ' + #13 +
                   '                               , LTRIM(TO_CHAR(TO_NUMBER(:c_wordsort), ''009'')) ' + #13 +
                   '                               , LTRIM(TO_CHAR(TO_NUMBER(:c_wordform), ''009'')) ' + #13 +
                   '                               , :c_useflag                                      ' + #13 +
                   '                               , :c_memo                                         ' + #13 +
                   '                               )                                                 ';

         v_stParam.Clear;
         v_stParam.Add(v_sEMax);
         v_stParam.Add(v_sHMax);
         v_stParam.Add('');
         v_stParam.Add(frmMain.fGet_stMemIns(0, 'USERID'));
         v_stParam.Add(pi_sSynHFWord);
         v_stParam.Add(pi_sSynWordSort);
         v_stParam.Add(pi_sSynWordForm);
         v_stParam.Add(frmMain.fGet_stMemIns(0, 'APPFLAG'));
         v_stParam.Add(pi_sSynMemo);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );
         frmMain.UniConn.Commit;
      except
         on E : Exception do begin
            frmMain.UniConn.Rollback;
            v_sHMax := '00000';
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end; // try..except..end;
   finally
      v_stParam.Free;
   end;
   Result := v_sHMax;
end;

//****************************************************************************//
//* 동음이의어 수정
//****************************************************************************//
function TfrmWordMg.fSet_SynWordUp(pi_sESeq, pi_sHSeq, pi_sHFWord, pi_sWordSort, pi_sWordForm, pi_sMemo : String) : String;
var
   v_sSql       : String;
   v_stParam    : TStringList;
   v_sDateTime  : String;
   v_sMax, v_sHMax : String;
begin
   {-- Init --}
   v_stParam   := TStringList.Create;
   v_sDateTime := FormatDateTime('YYYYMMDDHHNNSS', NOW);
   v_sMax      := pi_sESeq;
   v_sHMax     := pi_sHSeq;
   try
      frmMain.UniConn.StartTransaction;
      try
         {-- 한글 Update --}
         v_sSql := 'UPDATE T_HWORD                                                                                 ' + #13 +
                   '   SET C_HFWORD = :c_hfword                                                                    ' + #13 +
                   '     , C_WORDSORT = LTRIM(TO_CHAR(TO_NUMBER(:c_wordsort), ''009''))                            ' + #13 +
                   '     , C_WORDFORM = LTRIM(TO_CHAR(TO_NUMBER(:c_wordform), ''009''))                            ' + #13 +
                   '     , C_REGDATE  = :c_regdate                                                                 ' + #13 +
                   '     , C_MEMO     = :c_memo                                                                    ' + #13 +
                   '     , C_USEFLAG  = DECODE(:appflag, ''1'', DECODE(C_USEFLAG, ''0'', ''1'', C_USEFLAG), ''0'') ' + #13 +
                   ' WHERE C_ESEQ = :c_eseq1                                                                       ' + #13 +
                   '   AND C_HSEQ = :c_hseq1                                                                       ' + #13 +
                   '   AND NOT EXISTS ( SELECT ''X''                                                               ' + #13 +
                   '                      FROM T_USEWORD B                                                         ' + #13 +
                   '                     WHERE C_ESEQ = :c_eseq2                                                   ' + #13 +
                   '                       AND C_HSEQ = :c_hseq2                                                   ' + #13 +
                   '                    )                                                                          ' + #13 +
                   '   AND ROWNUM = 1                                                                              ';

         v_stParam.Clear;
         v_stParam.Add(pi_sHFWord);
         v_stParam.Add(pi_sWordSort);
         v_stParam.Add(pi_sWordForm);
         v_stParam.Add(v_sDateTime);
         v_stParam.Add(pi_sMemo);
         v_stParam.Add(frmMain.fGet_stMemIns(0, 'APPFLAG'));
         v_stParam.Add(v_sMax);
         v_stParam.Add(v_sHMax);
         v_stParam.Add(v_sMax);
         v_stParam.Add(v_sHMax);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         {-- 용어사전에 사용되었는지 체크 --}
         if Qry_Dml.RowsAffected = 0 then begin
            v_sHMax := '-1';
            frmMain.UniConn.Rollback;
         end else begin
            frmMain.UniConn.Commit;
         end;
      except
         on E : Exception do begin
            frmMain.UniConn.Rollback;
            v_sHMax := '00000';
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end; // try..except..end;
   finally
      v_stParam.Free;
   end; // try..finally..end
   Result := v_sHMax;
end;

//****************************************************************************//
//* 표준어 삭제
//****************************************************************************//
function TfrmWordMg.fSet_WordDel(pi_sESeq, pi_sHSeq, pi_sWordSort : String) : String;
var
   v_sSql      : String;
   v_stParam   : TStringList;
   v_sDateTime : String;
   v_sMax      : String;
   v_iAffCnt   : Integer;
begin
   {-- Init --}
   v_stParam   := TStringList.Create;
   v_sDateTime := FormatDateTime('YYYYMMDDHHNNSS', NOW);
   v_sMax      := pi_sESeq;
   try
      frmMain.UniConn.StartTransaction;
      try
         v_sSql := 'DELETE                                               ' + #13 +
                   '  FROM T_HWORD                                       ' + #13 +
                   ' WHERE C_ESEQ = :c_eseq1                             ' + #13 +
                   '   AND C_HSEQ = :c_hseq1                             ' + #13 +
                   '   AND NOT EXISTS ( SELECT ''X''                     ' + #13 +
                   '                      FROM T_USEWORD B               ' + #13 +
                   '                     WHERE C_ESEQ = :c_eseq2         ' + #13 +
                   '                       AND C_HSEQ = :c_hseq2         ' + #13 +
                   '                    )                                ' + #13 +
                   '   AND ROWNUM = 1                                    ';

         v_stParam.Add(pi_sESeq);
         v_stParam.Add(pi_sHSeq);
         v_stParam.Add(pi_sESeq);
         v_stParam.Add(pi_sHSeq);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , Qry_Dml
                              );

         v_iAffCnt := Qry_Dml.RowsAffected;
         if CompareStr(pi_sWordSort, '000') = 0 then begin
            v_sSql := 'DELETE                                              ' + #13 +
                      '  FROM T_EWORD                                      ' + #13 +
                      ' WHERE C_ESEQ = :c_eseq1                            ' + #13 +
                      '   AND NOT EXISTS ( SELECT ''X''                    ' + #13 +
                      '                      FROM T_USEWORD B              ' + #13 +
                      '                     WHERE C_ESEQ = :c_eseq2        ' + #13 +
                      '                    )                               ' + #13 +
                      '   AND ROWNUM = 1                                   ';

            v_stParam.Clear;
            v_stParam.Add(pi_sESeq);
            v_stParam.Add(pi_sESeq);

            frmMain.pGet_QryExec(  1
                                 , v_sSql
                                 , v_stParam
                                 , Qry_Dml
                                 );
            v_iAffCnt := v_iAffCnt + Qry_Dml.RowsAffected;
         end else begin
            v_iAffCnt := v_iAffCnt + 1;
         end;

         {-- 용어사전에 사용되었는지 체크 --}
         if v_iAffCnt <> 2 then begin
            v_sMax := '-1';
            frmMain.UniConn.Rollback;
         end else begin
            frmMain.UniConn.Commit;
         end;
      except
         on E : Exception do begin
            frmMain.UniConn.Rollback;
            v_sMax := '00000';
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end;
   finally
      v_stParam.Free;
   end;
   Result := v_sMax;          
end;

//****************************************************************************//
// User Define function, procedure End
//****************************************************************************//

procedure TfrmWordMg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmWordMg.FormDestroy(Sender: TObject);
begin
   TForm(frmWordMg) := nil;
end;

procedure TfrmWordMg.FormCreate(Sender: TObject);
begin
   {-- 권한에 따른 버튼 제어 --}
   //pGet_BtnCtrl(frmMain.fGet_stMemIns(0, 'USERATH'));
   {-- Filter Combobox 에 추가 --}
   pSet_Filter;

   {-- User Define procedure --}
   pGet_QryWordLst('1', 'ASC', '', '', '', '');
   {-- 승인처리 사용여부 --}
   if frmMain.fGet_stMemIns(0, 'APPFLAG') = '1' then tbn_Approval.Enabled := True
   else tbn_Approval.Enabled := False;
end;

procedure TfrmWordMg.shg_WordListDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   v_sFieldValue : String;
begin
   {-- 권한 체크 --}
   if frmMain.fGet_AuthCheck(Qry_WordLst.FieldByName('C_REGUSERID').AsString) = False then begin
      tbn_WordEdit.Enabled := False;
      tbn_WordDel.Enabled  := False;
   end else begin
      tbn_WordEdit.Enabled := True;
      tbn_WordDel.Enabled  := True;
   end;

   //* 조건이 맞는 Cell 에 대한 값에 색 변경
   v_sFieldValue := Qry_WordLst.FieldByName('C_WORDSORT').AsString;
   if CompareStr(v_sFieldValue, '002') = 0 then begin
      (Sender as TCRDBGrid).Canvas.Font.Color  := clRed;
      (Sender as TCRDBGrid).Canvas.Font.Style  := [fsBold];
      (Sender as TCRDBGrid).Canvas.FillRect(Rect);
      (Sender as TCRDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
   end;

   v_sFieldValue := Qry_WordLst.FieldByName('C_WORDSORT').AsString;
   if CompareStr(v_sFieldValue, '001') = 0 then begin
      (Sender as TCRDBGrid).Canvas.Font.Color  := clBlue;
      (Sender as TCRDBGrid).Canvas.Font.Style  := [fsBold];
      (Sender as TCRDBGrid).Canvas.FillRect(Rect);
      (Sender as TCRDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
   end;

   v_sFieldValue := qry_WordLst.FieldByName('C_USEFLAG').AsString;
   if CompareStr(v_sFieldValue, '1') = 0 then begin
      (Sender as TCRDBGrid).Canvas.Font.Color  := clPurple;
      (Sender as TCRDBGrid).Canvas.Font.Style  := [fsBold];
      (Sender as TCRDBGrid).Canvas.FillRect(Rect);
      (Sender as TCRDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
   end;
   {
   with TCRDBGrid(Sender) do begin
      if SelectedRows.CurrentRowSelected then begin //현선택된줄만 색칠하기
         Canvas.Brush.Color := $00CFFAE0;
         Canvas.FillRect(Rect);
         //필드타입에 따라 다시쓰는 위치를 조정하세요. Field.DataType
         canvas.TextRect(Rect, Rect.Left, Rect.Top, Column.Field.AsString);
      end;
   end;

   if gdFocused in State then begin
      me_Clipboard.Text := Column.Field.AsString;
       with (Sender as TCRDBGrid) do begin
          Canvas.Brush.Color := $00CFFAE0;
          Canvas.FillRect(Rect);
          Canvas.TextOut(Rect.Left, Rect.Top, Column.Field.AsString);
          SelectedRows.CurrentRowSelected := True;
      end;
   end;
   }
end;

procedure TfrmWordMg.shg_WordListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {
   with TCRDBGrid(Sender) do begin
      SelectedRows.Clear;
   end;
   }
   {-- CTRL + C --}
   if ((KEY = $43) and (shift = [ssCtrl])) then
      Clipboard.SetTextBuf(PChar(me_Clipboard.Text));
end;

procedure TfrmWordMg.shg_WordListTitleClick(Column: TColumn);
begin
   {-- 검색 실행.. --}
   {-- 0 : 컬럼 클릭 하지 않음 --}
   {-- 1 : 컬럼 클릭 함 --}
   pSet_Search(Column, 1);
end;

procedure TfrmWordMg.cmb_WordSortChange(Sender: TObject);
begin
   {-- 검색 실행.. --}
   {-- 0 : 컬럼 클릭 하지 않음 --}
   {-- 1 : 컬럼 클릭 함 --}
   pSet_Search(shg_WordList.Columns[1], 0);
//   shg_WordListTitleClick(shg_WordList.Columns[5]); {-- 단어 종류 --}
end;

procedure TfrmWordMg.sbtn_DataSearchClick(Sender: TObject);
begin
   {-- 검색 실행.. --}
   {-- 0 : 컬럼 클릭 하지 않음 --}
   {-- 1 : 컬럼 클릭 함 --}
   Case cmb_SearchList.ItemIndex of
      0 : pSet_Search(shg_WordList.Columns[3], 0); {-- 한글명 --}
      1 : pSet_Search(shg_WordList.Columns[1], 0); {-- 영문명 --}
      2 : pSet_Search(shg_WordList.Columns[2], 0); {-- 영문 약어--}
   end;
end;

procedure TfrmWordMg.txt_DataSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      sbtn_DataSearchClick(Sender);
end;

procedure TfrmWordMg.chb_CountClick(Sender: TObject);
begin
   if chb_Count.Checked = True then begin
      Qry_WordLst.SpecificOptions.Values['FetchAll'] := 'True';
      chb_Count.Caption    := Format('총 %d 건', [Qry_WordLst.RecordCount]);
   end else begin
      chb_Count.Caption := '건수보기';
   end;
end;

procedure TfrmWordMg.tbn_ReloadClick(Sender: TObject);
var
   v_sFiedNm, v_sValue : String;
begin
   v_sFiedNm := shg_WordList.SelectedField.FieldName;
   v_sValue  := shg_WordList.SelectedField.AsString;

   {-- User Define procedure --}
   pGet_QryWordLst('1', 'ASC', '', '', '', '');

   {-- 다시 원위치로 커서 이동하기 --}
   frmMain.pSet_CurLocate(  v_sFiedNm
                  , v_sValue
                  , Qry_WordLst
                  );

end;

procedure TfrmWordMg.tbn_CloseClick(Sender: TObject);
begin
   Close;
end;


procedure TfrmWordMg.tbn_WordInsertClick(Sender: TObject);
var
   v_iPIndex : Integer;
begin
   if (CompareStr(Qry_WordLst.FieldByName('C_WORDSORT').AsString, '000') = 0)
      or (Qry_WordLst.RecordCount = 0) then
      v_iPIndex := 0
   else v_iPIndex := 1;
   Case TSpeedButton(Sender).Tag of
      2 : begin {-- 신규 단어 등록 --}
             frmWordDML         := TfrmWordDML.Create(Application);
             frmWordDML.Caption := '단어 등록';
             pv_TpDML           := 'INSERT';
             frmWordDML.Notebook1.PageIndex := v_iPIndex;
             frmWordDML.ShowModal;
          end;
      3 : begin
             frmWordDML          := TfrmWordDML.Create(Application);
             frmWordDML.Caption  := '단어 수정';
             pv_TpDML            := 'UPDATE';
             frmWordDML.Notebook1.PageIndex := v_iPIndex;
             frmWordDML.ShowModal;
          end;
   end;
end;

procedure TfrmWordMg.shg_WordListDblClick(Sender: TObject);
begin
   {-- 권한 체크 --}
   if frmMain.fGet_AuthCheck(Qry_WordLst.FieldByName('C_REGUSERID').AsString) = False then Exit;
   
   if Qry_WordLst.RecordCount = 0 then Exit;
   TSpeedButton(Sender).Tag := 3;
   tbn_WordInsertClick(Sender);
end;

procedure TfrmWordMg.shg_WordListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  {
   with TCRDBGrid(Sender) do begin
      SelectedRows.Clear;
   end;
   }
end;

procedure TfrmWordMg.tbn_WordDelClick(Sender: TObject);
var
   v_sMax : String;
   v_sWordSort, v_sWord : String;
begin
   v_sWordSort := shg_WordList.Fields[5].AsString;
   v_sWord     := shg_WordList.Fields[1].AsString;

   if Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(600, v_sWordSort + ' '
                                                                                    + '"' + v_sWord + '"'
                                                                                    + ' 인 단어를 삭제 하시겠습니까?'
                                                                                ))
                             , '삭제확인!'
                             , MB_YESNO + MB_ICONWARNING
                             ) = 7 then begin

      Exit;
   end;
   v_sMax := fSet_WordDel(  Qry_WordLst.FieldByName('C_ESEQ').AsString
                          , Qry_WordLst.FieldbyName('C_HSEQ').AsString
                          , Qry_WordLst.FieldbyName('C_WORDSORT').AsString
                          );

   if CompareStr(v_sMax, '00000') <> 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  v_sWordSort +  ' '
                                                                                    + '"' + v_sWord + '"'
                                                                                    + ' 인 단어가 삭제 되었습니다.'
                                                                                 ))
                             , '단어삭제!'
                             , MB_OK + MB_ICONINFORMATION
                             );
      {-- Call --}
      tbn_ReloadClick(Sender);
   end else if CompareStr(v_sMax, '-1') = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  v_sWordSort + ' '
                                                                                    + '"' + v_sWord + '"'
                                                                                    + ' 인 단어가 "용어" 에 사용 되었습니다.' + #13
                                                                                    + ' 따라서 "용어" 에 사용된 단어는 삭제 할 수 없습니다.'
                                                                                 ))
                             , '단어삭제오류!'
                             , MB_OK + MB_ICONERROR
                             );
   end;

end;

procedure TfrmWordMg.tbn_DataSaveClick(Sender: TObject);
begin
   frmSave := TfrmSave.Create(Application);
   pb_iSaveFlg := 1;
   frmSave.ShowModal;
end;

end.
