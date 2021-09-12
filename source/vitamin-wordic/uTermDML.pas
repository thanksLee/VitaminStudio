unit uTermDML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB, MemDS, DBAccess, Uni;

type
  TfrmTermDML = class(TForm)
    Bevel1: TBevel;
    txt_SearchTerm: TEdit;
    StaticText1: TStaticText;
    sbtn_TermSearch: TSpeedButton;
    txt_ResultTerm: TEdit;
    StaticText2: TStaticText;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lstv_SearchWord: TListView;
    lstv_UseTerm: TListView;
    Panel4: TPanel;
    sbtn_Close: TSpeedButton;
    sbtn_TermDel: TSpeedButton;
    sbtn_TermSave: TSpeedButton;
    txt_resulttbl: TEdit;
    txt_resultcol: TEdit;
    txt_tbljubdo: TEdit;
    txt_coljubdo: TEdit;
    txt_resultfk: TEdit;
    txt_tbljubmi: TEdit;
    txt_resultpk: TEdit;
    oraQry_DML: TUniQuery;
    oraQry_Term: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_CloseClick(Sender: TObject);
    procedure sbtn_TermSearchClick(Sender: TObject);
    procedure txt_SearchTermKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtn_TermSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lstv_SearchWordDblClick(Sender: TObject);
    procedure lstv_UseTermClick(Sender: TObject);
    procedure sbtn_TermDelClick(Sender: TObject);
    procedure lstv_UseTermKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    //* 용어 및 단어 검색
    procedure pGet_SearchResult(pi_sHWord, pi_sParam, pi_sWords : String; qry_Obj : TUniQuery);
    //* 단어 Split
    function fGet_Split(pi_sWords : String) : String;
    //* 중복 체크
    function fGet_DupleCheck(pi_iFlag : Integer; pi_sThENm : String) : String;

    //* 사용된 용어 List
    procedure pSet_AddUseTerm;
    //* 사용된 단어 List
    //* 0 : 최초
    //* 1 : List Click 시
    procedure pSet_AddUseWord(pi_iFlag : Integer; pi_sWords : String; qry_Obj : TUniQuery);

    //* 용어등록
    function fSet_AddTerm(pi_sESeq, pi_sThhNm, pi_sTheNm, pi_sWord : String; qry_Obj : TUniQuery) : String;
  public
    { Public declarations }
  end;

var
  frmTermDML: TfrmTermDML;
implementation
uses uMain, Math, uTermMg, uWordDml;

{$R *.dfm}
//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//

//****************************************************************************//
//* 단어 Split
//****************************************************************************//
function TfrmTermDML.fGet_Split(pi_sWords : String) : String;
var
   v_stSplit  : TStringList;
   v_iLoopCnt : Integer;
   v_sTmp     : String;
begin
   v_sTmp    := '';
   v_stSplit := TStringList.Create;
   try
      ExtractStrings(  [' ']
                     , [' ']
                     , PChar(pi_sWords)
                     , v_stSplit
                     );
      for v_iLoopCnt := 0 to v_stSplit.Count - 1 do begin
         v_sTmp :=  v_sTmp + ', ''' + v_stSplit.Strings[v_iLoopCnt] + '''';
      end;
      v_sTmp := Copy(v_sTmp, 3, Length(v_sTmp));
      Result := v_sTmp;
   finally
      v_stSplit.Free;
   end;
end;



//****************************************************************************//
//* 용어 및 단어 검색
//****************************************************************************//
procedure TfrmTermDML.pGet_SearchResult(pi_sHWord, pi_sParam, pi_sWords : String; qry_Obj : TUniQuery);
var
   v_sSql    : String;
   v_stParam : TStringList;
begin
   v_sSql    := 'SELECT ROW_NUMBER() OVER(ORDER BY C_THGNM) RNUM                                            ' + #13 +
                '     , C_TSEQ                                                                              ' + #13 +
                '     , C_THGNM                                                                             ' + #13 +
                '     , C_THENM                                                                             ' + #13 +
                '     , '''' C_ESEQ                                                                         ' + #13 +
                '     , '''' C_HSEQ                                                                         ' + #13 +
                '     , '''' C_HFWORD                                                                       ' + #13 +
                '     , '''' C_EFWORD                                                                       ' + #13 +
                '     , '''' C_ESWORD                                                                       ' + #13 +
                '     , '''' C_WORDSORT                                                                     ' + #13 +
                '     , '''' C_WORDSORTNM                                                                   ' + #13 +
                '     , ''1'' C_FLAG                                                                        ' + #13 +
                '  FROM T_STWORD                                                                            ' + #13 +
                ' WHERE REPLACE(C_THGNM, '' '', '''') LIKE ''%'' || REPLACE(:c_thgnm, '' '', '''') || ''%'' ' + #13 +
                '   AND ''1'' = :c_param1                                                                   ' + #13 +
                'UNION ALL                                                                                  ' + #13 +
                'SELECT ROWNUM RNUM                                                                         ' + #13 +
                '     , ''''                                                                                ' + #13 +
                '     , ''''                                                                                ' + #13 +
                '     , ''''                                                                                ' + #13 +
                '     , DECODE(B.C_DOMAINFLAG, ''1'', A.C_ESEQ, NULL)                                       ' + #13 +
                '     , DECODE(B.C_DOMAINFLAG, ''1'', A.C_HSEQ, NULL)                                       ' + #13 +
                '     , A.C_HFWORD                                                                          ' + #13 +
                '     , B.C_EFWORD                                                                          ' + #13 +
                '     , B.C_ESWORD                                                                          ' + #13 +
                '     , A.C_WORDSORT                                                                        ' + #13 +
                '     , fGet_CommonInfo(''1'', ''A01'', A.C_WORDSORT) C_WORDSORTNM                          ' + #13 +
                '     , ''2''                                                                               ' + #13 +
                '  FROM T_HWORD A, T_EWORD B                                                                ' + #13 +
                ' WHERE A.C_ESEQ = B.C_ESEQ                                                                 ' + #13 +
                '   AND A.C_HFWORD IN (' + fGet_Split(pi_sWords) + ')                                       ' + #13 +
                '   AND :c_param2 IN (''1'', ''2'')                                                         ';

   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sHWord);
      v_stParam.Add(pi_sParam);
      v_stParam.Add(pi_sParam);
      try
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , qry_Obj
                              );
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;

//****************************************************************************//
//* 중복 체크
//****************************************************************************//
function TfrmTermDML.fGet_DupleCheck(pi_iFlag : Integer; pi_sThENm : String) : String;
var
   v_sSql : String;
   v_stParam : TStringList;
begin
   v_sSql := 'SELECT COUNT(*) C_CNT                                    ' + #13 +
             '  FROM (SELECT ''1'' CNT                                 ' + #13 +
             '          FROM T_STWORD                                  ' + #13 +
             '         WHERE C_THENM = :c_thenm                        ' + #13 +
             '           AND ROWNUM = 1                                ' + #13 +
             '        UNION ALL                                        ' + #13 +
             '        SELECT ''2''                                     ' + #13 +
             '          FROM DUAL                                      ' + #13 +
             '         WHERE INSTR(:c_thenm, ''XXXXX'', 1, 1) <> 0     ' + #13 +
             '        )                                                ';


   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sThENm);
      try
         oraQry_DML.SpecificOptions.Values['FetchAll'] := 'True';
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , oraQry_DML
                              );
         if oraQry_DML.Fields[0].AsInteger = 0 then Result := '0'
         else Result := '1';
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
            Result := '-1';
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;

//****************************************************************************//
//* 사용된 용어 List
//****************************************************************************//
procedure TfrmTermDML.pSet_AddUseTerm;
var
   v_lstiUseTerm : TListItem;
begin
   lstv_UseTerm.Items.BeginUpdate;
   try
      v_lstiUseTerm := lstv_UseTerm.Items.Add;
      v_lstiUseTerm.Caption := '-';
      v_lstiUseTerm.SubItems.Add(txt_SearchTerm.Text);
      v_lstiUseTerm.SubItems.Add(txt_ResultTerm.Text);
      with oraQry_Term do begin
         First;
         while not Eof do begin
            if CompareStr('1', FieldByName('C_FLAG').AsString) = 0 then begin
               v_lstiUseTerm := lstv_UseTerm.Items.Add;
               v_lstiUseTerm.Caption := FieldByName('RNUM').AsString;
               v_lstiUseTerm.SubItems.Add(FieldByName('C_THGNM').AsString);
               v_lstiUseTerm.SubItems.Add(FieldByName('C_THENM').AsString);
            end;
            Next;
         end;
      end;
   finally
      lstv_UseTerm.Items.EndUpdate;
   end;
end;

//****************************************************************************//
//* 사용된 단어 List
//* 0 : 최초
//* 1 : List Click 시
//****************************************************************************//
procedure TfrmTermDML.pSet_AddUseWord(pi_iFlag : Integer; pi_sWords : String; qry_Obj : TUniQuery);
var
   v_lstiUseWord : TListItem;
   v_stSplit     : TStringList;
   v_iLoopCnt    : Integer;
   v_sTmp        : String;
begin
   v_stSplit := TStringList.Create;
   try
      ExtractStrings(  [' ']
                     , [' ']
                     , pChar(pi_sWords)
                     , v_stSplit
                     );
      lstv_SearchWord.Items.BeginUpdate;
      v_sTmp := '';
      try
         for v_iLoopCnt := 0 to v_stSplit.Count - 1 do begin
            with qry_Obj do begin
               First;
               while not Eof do begin
                  if CompareStr('2', FieldByName('C_FLAG').AsString) = 0 then begin
                     if CompareStr(v_stSplit.Strings[v_iLoopCnt], FieldByName('C_HFWORD').AsString) = 0 then begin
                        v_lstiUseWord := lstv_SearchWord.Items.Add;
                        v_lstiUseWord.Caption := IntToStr(v_iLoopCnt);
                        v_lstiUseWord.SubItems.Add(FieldByName('C_HFWORD').AsString);
                        v_lstiUseWord.SubItems.Add(FieldByName('C_EFWORD').AsString);
                        v_lstiUseWord.SubItems.Add(FieldByName('C_ESWORD').AsString);
                        v_lstiUseWord.SubItems.Add(FieldByName('C_WORDSORTNM').AsString);
                        v_sTmp := v_sTmp + '_' + FieldByName('C_ESWORD').AsString;
                        Break;
                     end;
                  end;
                  Next;
               end;
               if qry_Obj.Eof = True then begin
                  v_lstiUseWord := lstv_SearchWord.Items.Add;
                  v_lstiUseWord.Caption := IntToStr(v_iLoopCnt);
                  v_lstiUseWord.SubItems.Add(v_stSplit.Strings[v_iLoopCnt]);
                  v_lstiUseWord.SubItems.Add('XXXXX');
                  v_lstiUseWord.SubItems.Add('XXXXX');
                  v_lstiUseWord.SubItems.Add('XXXXX');
                  v_sTmp := v_sTmp + '_' + 'XXXXX';
               end;
            end;
         end;
         txt_ResultTerm.Text := Copy(v_sTmp, 2, Length(v_sTmp));
         txt_resulttbl.Text  := txt_tbljubdo.Text + txt_ResultTerm.Text + txt_tbljubmi.Text + '(' + txt_SearchTerm.Text + ')';
         txt_resultcol.Text  := txt_coljubdo.Text + txt_ResultTerm.Text + '(' + txt_SearchTerm.Text + ')';
         txt_resultpk.Text   := 'pk_' + txt_resulttbl.Text;
         txt_resultfk.Text   := 'fk_' + txt_ResultTerm.Text + '(' + txt_SearchTerm.Text + ')';
      finally
         lstv_SearchWord.Items.EndUpdate;
      end;
   finally
      v_stSplit.Free;
   end;
end;

//****************************************************************************//
//* 용어등록
//****************************************************************************//
function TfrmTermDML.fSet_AddTerm(pi_sESeq, pi_sThhNm, pi_sTheNm, pi_sWord : String; qry_Obj : TUniQuery) : String;
var
   v_sSql    : String;
   v_stParam : TStringList;
   v_sTMax, v_sUMax : String;
   v_iRowAff : Integer;
begin
   v_sSql    := 'SELECT NVL((SELECT LTRIM(TO_CHAR(TO_NUMBER(MAX(C_TSEQ)) + 1, ''0000000009''))    ' + #13 +
                '              FROM T_STWORD A                                               ' + #13 +
                '            ), ''0000000001'') C_TSEQ                                       ' + #13 +
                '     , NVL(( SELECT LTRIM(TO_CHAR(TO_NUMBER(MAX(C_USEQ)) + 1, ''0000000009''))   ' + #13 +
                '               FROM T_USEWORD A                                             ' + #13 +
                '            ), ''0000000001'') C_USEQ                                       ' + #13 +
                '  FROM DUAL                                                                 ';

   v_stParam := TStringList.Create;
   v_iRowAff := 0;
   try
      frmMain.UniConn.StartTransaction;
      try
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , qry_Obj
                              );
         v_sTMax := qry_Obj.Fields[0].AsString;
         v_sUMax := qry_Obj.Fields[1].AsString;

         v_sSql := 'INSERT INTO T_STWORD(  C_TSEQ                        ' + #13 +
                   '                     , C_ESEQ                        ' + #13 +
                   '                     , C_THGNM                       ' + #13 +
                   '                     , C_THENM                       ' + #13 +
                   '                     , C_TDOMAINFLAG                 ' + #13 +
                   '                     ) VALUES (  :c_tseq             ' + #13 +
                   '                               , :c_eseq             ' + #13 +
                   '                               , :c_thgnm            ' + #13 +
                   '                               , :c_thenm            ' + #13 +
                   '                               , :c_tdomainflag      ' + #13 +
                   '                               )                     ';
         v_stParam.Clear;
         v_stParam.Add(v_sTMax);
         v_stParam.Add(pi_sESeq);
         v_stParam.Add(pi_sThhNm);
         v_stParam.Add(pi_sTheNm);
         v_stParam.Add('1');

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , qry_Obj
                              );

         v_iRowAff := qry_Obj.RowsAffected;

         v_sSql := 'INSERT INTO T_USEWORD(  C_USEQ                                              ' + #13 +
                   '                      , C_ESEQ                                              ' + #13 +
                   '                      , C_HSEQ                                              ' + #13 +
                   '                      , C_TSEQ                                              ' + #13 +
                   '                      ) (SELECT TRIM(TO_CHAR(TO_NUMBER(''' + v_sUMax + ''') + ROWNUM, ''0000000009''))' + #13 +
                   '                              , C_ESEQ                                      ' + #13 +
                   '                              , C_HSEQ                                      ' + #13 +
                   '                              , ''' + v_sTMax + '''                         ' + #13 +
                   '                           FROM T_HWORD                                     ' + #13 +
                   '                          WHERE C_HFWORD IN (' + fGet_Split(pi_sWord) + ') ' + #13 +
                   '                         )                                                  ';


         v_stParam.Clear;

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , qry_Obj
                              );

         v_iRowAff := v_iRowAff + qry_Obj.RowsAffected;
         if v_iRowAff <= 1 then begin
            frmMain.UniConn.Rollback;
            Result := '0';
         end else begin
            frmMain.UniConn.Commit;
            Result := '1';
         end;

      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL 실패!'
                                   , MB_OK + MB_ICONERROR
                                   );
            frmMain.UniConn.Rollback;
            Result := '-1';
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;

//****************************************************************************//
// User Define function, procedure End
//****************************************************************************//


procedure TfrmTermDML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmTermDML.FormDestroy(Sender: TObject);
begin
   TForm(frmTermDML) := nil;
end;

procedure TfrmTermDML.sbtn_CloseClick(Sender: TObject);
begin
   frmTermMg.tbn_ReloadClick(Sender);
   Close;
end;

procedure TfrmTermDML.FormActivate(Sender: TObject);
begin
   if frmMain.fGet_stMemIns(0, 'USERATH') = 'U' then
      sbtn_TermDel.Enabled := False
   else sbtn_TermDel.Enabled := True;
end;

procedure TfrmTermDML.sbtn_TermSearchClick(Sender: TObject);
begin
   if frmMain.fGet_ValCheck(txt_SearchTerm, '검색할 용어를 입력하세요!') = False then Exit;
   
   lstv_SearchWord.Clear;
   lstv_UseTerm.Clear;
   txt_ResultTerm.Clear;

   {-- 용어 및 단어 검색 --}
   pGet_SearchResult(  txt_SearchTerm.Text
                     , '1'
                     , txt_SearchTerm.Text
                     , oraQry_Term
                     );
   {-- 단어 List --}
   pSet_AddUseWord(0, txt_SearchTerm.Text, oraQry_Term);
   {-- 용어 List --}
   pSet_AddUseTerm;

   {-- 중복 체크 --}
   if CompareStr('0', fGet_DupleCheck(0, txt_ResultTerm.Text)) = 0 then
      sbtn_TermSave.Enabled := True
   else sbtn_TermSave.Enabled := False;

   {-- 접두어 비교 --}
   if (CompareStr(pb_sTblJubdo, txt_tbljubdo.Text) <> 0) or
      (CompareStr(pb_sTblJubmi, txt_tbljubmi.Text) <> 0) or
      (CompareStr(pb_sColJubdo, txt_coljubdo.Text) <> 0) then Begin
      with frmMain do begin
         pSet_IniFiles('Prepared', 'STable',  txt_tbljubdo.Text);
         pSet_IniFiles('Prepared', 'ETable',  txt_tbljubmi.Text);
         pSet_IniFiles('Prepared', 'Column', txt_coljubdo.Text);
         pb_sTblJubdo := txt_tbljubdo.Text;
         pb_sTblJubmi := txt_tbljubmi.Text;
         pb_sColJubdo := txt_coljubdo.Text;
      End;
   End;
   
end;

procedure TfrmTermDML.txt_SearchTermKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      {-- Call --}
      sbtn_TermSearchClick(Sender);
end;

procedure TfrmTermDML.sbtn_TermSaveClick(Sender: TObject);
var
   v_sTmp : String;
begin
   if frmMain.fGet_ValCheck(txt_SearchTerm, '검색할 용어를 입력하세요!') = False then Exit;

   {-- 중복 체크 --}
   if CompareStr('1', fGet_DupleCheck(0, txt_ResultTerm.Text)) = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  '"' + txt_SearchTerm.Text + '"'
                                                                                    + ' 인 용어가 중복 되었습니다.'
                                                                                ))
                             , '용어중복!'
                             , MB_OK + MB_ICONERROR
                             );
      txt_SearchTerm.SetFocus;
      Exit;
   end;
   
   {-- 용어등록 --}
   v_sTmp := fSet_AddTerm(  oraQry_Term.FieldByName('C_ESEQ').AsString
                          , txt_SearchTerm.Text
                          , txt_ResultTerm.Text
                          , txt_SearchTerm.Text
                          , oraQry_DML
                          );
   if CompareStr('1', v_sTmp) = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  '"' + txt_SearchTerm.Text + '"'
                                                                                    + ' 용어가 등록 되었습니다.'
                                                                                 ))
                             , '용어 등록!'
                             , MB_OK + MB_ICONINFORMATION
                             );
      frmTermMg.tbn_ReloadClick(Sender);
   end else if CompareStr('0', v_sTmp) = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(900,  '"' + txt_SearchTerm.Text + '"'
                                                                                    + ' 용어 등록에 실패 하였습니다.'
                                                                                 ))
                             , '용어 등록 실패!'
                             , MB_OK + MB_ICONERROR
                             );
      txt_SearchTerm.SetFocus;
   end;

end;


procedure TfrmTermDML.lstv_SearchWordDblClick(Sender: TObject);
var
   v_lstiSearchTerm : TListItem;
begin
   v_lstiSearchTerm := lstv_SearchWord.Items[lstv_SearchWord.ItemIndex];

   if v_lstiSearchTerm = nil then Exit;

   if CompareStr('XXXXX', v_lstiSearchTerm.SubItems[2]) = 0 then begin
      frmWordDML         := TfrmWordDML.Create(Application);
      frmWordDML.Caption := '단어 등록';
      pv_TpDML           := 'INSERT';
      frmWordDML.Notebook1.PageIndex := 0;
      frmWordDML.txt_HFWord.Text := v_lstiSearchTerm.SubItems[0];
      frmWordDML.ShowModal;
      sbtn_TermSearchClick(Sender);
   end;
end;

procedure TfrmTermDML.lstv_UseTermClick(Sender: TObject);
var
   v_lstiUseTerm : TListItem;
begin
   v_lstiUseTerm := lstv_UseTerm.Items[lstv_UseTerm.ItemIndex];
   if v_lstiUseTerm = nil then Exit;

   lstv_SearchWord.Clear;

   if CompareStr('-', v_lstiUseTerm.Caption) = 0 then
      sbtn_TermDel.Enabled := False
   else sbtn_TermDel.Enabled := True;
   
   txt_SearchTerm.Text := v_lstiUseTerm.SubItems[0];
   txt_ResultTerm.Text := v_lstiUseTerm.SubItems[1];

   {-- 용어 및 단어 검색 --}
   pGet_SearchResult(  txt_SearchTerm.Text
                     , '2'
                     , txt_SearchTerm.Text
                     , oraQry_DML
                     );
   {-- 단어 List --}
   pSet_AddUseWord(0, txt_SearchTerm.Text, oraQry_DML);
   {-- 중복 체크 --}
   if CompareStr('0', fGet_DupleCheck(0, txt_ResultTerm.Text)) = 0 then
      sbtn_TermSave.Enabled := True
   else sbtn_TermSave.Enabled := False;
end;

procedure TfrmTermDML.sbtn_TermDelClick(Sender: TObject);
var
   v_sTmp : String;
   v_lstiUseTerm : TListItem;
begin
   v_lstiUseTerm := lstv_UseTerm.Items[lstv_UseTerm.ItemIndex];
   if v_lstiUseTerm = nil then Exit;
   
   if Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(600, '"' + txt_SearchTerm.Text + '"'
                                                                                    + ' 인 용어를 삭제 하시겠습니까?'
                                                                                ))
                             , '삭제확인!'
                             , MB_YESNO + MB_ICONWARNING
                             ) = 7 then begin

      Exit;
   end;

   {-- 용어 삭제 --}
   v_sTmp := frmTermMg.fSet_DelTerm(  txt_ResultTerm.Text
                                    , oraQry_DML
                                    );
   if CompareStr('1', v_sTmp) = 0 then begin
      txt_SearchTerm.Clear;
      txt_ResultTerm.Clear;
      lstv_UseTerm.Items[lstv_UseTerm.ItemIndex].Delete;
      lstv_SearchWord.Clear;
      frmTermMg.tbn_ReloadClick(Sender);
      lstv_UseTerm.SetFocus;
   end else if CompareStr('0', v_sTmp) = 0 then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(100,  '"' + txt_SearchTerm.Text + '"'
                                                                                    + ' 용어 삭제에 실패 하였습니다.'
                                                                                 ))
                             , '용어 삭제 실패!'
                             , MB_OK + MB_ICONINFORMATION
                             );
      txt_SearchTerm.SetFocus;
   end;
end;

procedure TfrmTermDML.lstv_UseTermKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_DELETE) then
      {-- Call --}
      sbtn_TermDelClick(Sender);
end;

procedure TfrmTermDML.FormCreate(Sender: TObject);
begin
   txt_tbljubdo.Text := pb_sTblJubdo;
   txt_tbljubmi.Text := pb_sTblJubmi;
   txt_coljubdo.Text := pb_sColJubdo;
end;

end.
