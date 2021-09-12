unit uTermMg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, MemDS, DBAccess, ExtCtrls,
  Buttons, StdCtrls, ComCtrls, ToolWin, Clipbrd, CRGrid, Uni;

type
  TfrmTermMg = class(TForm)
    ToolBar1: TToolBar;
    tbn_Reload: TToolButton;
    ToolButton6: TToolButton;
    tbn_TermInsert: TToolButton;
    tbn_TermDel: TToolButton;
    ToolButton4: TToolButton;
    tbn_DataSave: TToolButton;
    ToolButton7: TToolButton;
    tbn_Close: TToolButton;
    Panel1: TPanel;
    sbtn_DataSearch: TSpeedButton;
    Bevel2: TBevel;
    cmb_SearchList: TComboBox;
    txt_DataSearch: TEdit;
    chb_Count: TCheckBox;
    StaticText1: TStaticText;
    me_Clipboard: TMemo;
    schgd_Term: TCRDBGrid;
    oraqry_TermLst: TUniQuery;
    oraQry_Tmp: TUniQuery;
    dts__TermLst: TUniDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure schgd_TermDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure schgd_TermKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure schgd_TermMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure schgd_TermTitleClick(Column: TColumn);
    procedure sbtn_DataSearchClick(Sender: TObject);
    procedure txt_DataSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chb_CountClick(Sender: TObject);
    procedure tbn_CloseClick(Sender: TObject);
    procedure tbn_ReloadClick(Sender: TObject);
    procedure tbn_TermInsertClick(Sender: TObject);
    procedure schgd_TermDblClick(Sender: TObject);
    procedure tbn_TermDelClick(Sender: TObject);
    procedure tbn_DataSaveClick(Sender: TObject);
  private
    { Private declarations }
    //* DBGrid 에서 마우스 휠되게 하기
    procedure MouseWheelHandler(var Message: TMessage); override;

  public
    { Public declarations }
    //* Grid Setting
    procedure pGet_GridSetting(schGrid_Obj : TCRDBGrid);
    //* 용어사전 List
    procedure pGet_TermLst(pi_sSort, pi_sChange, pi_sTheNm, pi_sThgNm : String);
   //* 검색 실행..
   //* 0 : 컬럼 클릭 하지 않음
   //* 1 : 컬럼 클릭 함
   procedure pSet_Search(pi_cColumn : TColumn; pi_iFlag : Integer);

    //* 용어삭제
    function fSet_DelTerm(pi_sthEnm : String; qry_Obj : TUniQuery) : String;
  end;

var
  frmTermMg: TfrmTermMg;

implementation
uses uMain, uWordMg, uTermDML, uSave;
{$R *.dfm}

//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//

//****************************************************************************//
//* DBGrid 에서 마우스 휠되게 하기
//****************************************************************************//
procedure TfrmTermMg.MouseWheelHandler(var Message: TMessage);
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
//* Grid Setting
//****************************************************************************//
procedure TfrmTermMg.pGet_GridSetting(schGrid_Obj : TCRDBGrid);
var
   v_iLoopCnt : Integer;
begin
   with schGrid_Obj do begin
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
                         Title.Caption := '영문 용어명';
                         FieldName     := 'C_THENM';
                         Width := 230;
                      end;
                  2 : begin
                         Title.Caption := '한글 용어명';
                         FieldName     := 'C_THGNM';
                         Width := 230;
                      end;
                  3 : begin
                         Title.Caption := '도메인여부';
                         FieldName     := 'C_TDOMAINFLAGNM';
                         Width := 80;
                      end;
            end;
         end;
      end;
   end;
end;

//****************************************************************************//
//* 용어사전 List
//****************************************************************************//
procedure TfrmTermMg.pGet_TermLst(pi_sSort, pi_sChange, pi_sTheNm, pi_sThgNm : String);
var
   v_sSql    : String;
   v_stParam : TStringList;
begin
   v_sSql    := 'SELECT C_TSEQ                                                             ' + #13 +
                '     , C_ESEQ                                                             ' + #13 +
                '     , C_THGNM                                                            ' + #13 +
                '     , C_THENM                                                            ' + #13 +
                '     , C_TDOMAINFLAG                                                      ' + #13 +
                '     , DECODE(C_TDOMAINFLAG, ''0'', ''사용'', NULL) C_TDOMAINFLAGNM       ' + #13 +
                '     , ROW_NUMBER() OVER(ORDER BY DECODE( ' + pi_sSort + ', 0, C_THENM    ' + #13 +
                '                                                  , 1, C_THGNM            ' + #13 +
                '                                                  , 2, C_TSEQ             ' + #13 +
                '                                                  , 3, C_TDOMAINFLAG      ' + #13 +
                '                                          ) ' + pi_sChange + ') RNUM      ' + #13 +
                '  FROM T_STWORD                                                           ' + #13 +
                ' WHERE C_THGNM LIKE ''%''|| :c_thgnm ||''%''                              ' + #13 +
                '   AND C_THENM LIKE ''%''|| :c_thenm ||''%''                              ';

   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sThgNm);
      v_stParam.Add(pi_sTheNm);
      try
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , oraqry_TermLst
                              );
         {-- Grid Setting --}
         pGet_GridSetting(schgd_Term);
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
//* 검색 실행..
//* 0 : 컬럼 클릭 하지 않음
//* 1 : 컬럼 클릭 함
//****************************************************************************//
procedure TfrmTermMg.pSet_Search(pi_cColumn : TColumn; pi_iFlag : Integer);
var
   v_sENm, v_sHNm : String; {-- 검색어 --}
   v_sChange : String; {-- 정렬 --}
   v_sStrTmp : String; {-- 정렬방식 --}
   v_sStrKey : String; {-- 다시 원위치로 돌아가기 위한 값 --}
begin
   Case cmb_SearchList.ItemIndex of
      0 : v_sHNm := txt_DataSearch.Text;
      1 : v_sENm := txt_DataSearch.Text;
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

   {-- 용어사전 실행 --}
   pGet_TermLst(IntToStr(pi_cColumn.Index), v_sStrTmp, v_sENm, v_sHNm);

   pi_cColumn.Title.Caption := pi_cColumn.Title.Caption + v_sChange;

   {-- 다시 원위치로 커서 이동하기 --}
   frmMain.pSet_CurLocate(pi_cColumn.FieldName, v_sStrKey, oraqry_TermLst);
end;

//****************************************************************************//
//* 용어삭제
//****************************************************************************//
function TfrmTermMg.fSet_DelTerm(pi_sthEnm : String; qry_Obj : TUniQuery) : String;
var
   v_sSql : String;
   v_stParam : TStringList;
   v_iAffRow : Integer;
begin
   v_stParam := TStringList.Create;
   try
      frmMain.UniConn.StartTransaction;
      try
         v_sSql := 'DELETE                                        ' + #13 +
                   '  FROM T_USEWORD                              ' + #13 +
                   ' WHERE C_TSEQ = ( SELECT C_TSEQ               ' + #13 +
                   '                    FROM T_STWORD             ' + #13 +
                   '                   WHERE C_THENM = :c_thenm   ' + #13 +
                   '                     AND ROWNUM = 1           ' + #13 +
                   '                  )                           ';

         v_stParam.Add(pi_sthENm);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , qry_Obj
                              );
         v_iAffRow := qry_Obj.RowsAffected;

         v_sSql := 'DELETE                        ' + #13 +
                   '  FROM T_STWORD               ' + #13 +
                   ' WHERE C_THENM = :c_thenm     ' + #13 +
                   '   AND ROWNUM = 1             ';
         v_stParam.Clear;
         v_stParam.Add(pi_sthENm);

         frmMain.pGet_QryExec(  1
                              , v_sSql
                              , v_stParam
                              , qry_Obj
                              );
         v_iAffRow := v_iAffRow + qry_Obj.RowsAffected;

         if v_iAffRow <= 1 then begin
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

procedure TfrmTermMg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmTermMg.FormDestroy(Sender: TObject);
begin
   TForm(frmTermMg) := nil;
end;

procedure TfrmTermMg.FormCreate(Sender: TObject);
begin
   if frmMain.fGet_stMemIns(0, 'USERATH') = 'U' then
      tbn_TermDel.Enabled := False
   else tbn_TermDel.Enabled := True;
   {-- Term List --}
   pGet_TermLst(  '0', 'ASC', '', '');
end;

procedure TfrmTermMg.schgd_TermTitleClick(Column: TColumn);
begin
   {-- 검색 실행.. --}
   {-- 0 : 컬럼 클릭 하지 않음 --}
   {-- 1 : 컬럼 클릭 함 --}
   pSet_Search(Column, 1);
end;

procedure TfrmTermMg.sbtn_DataSearchClick(Sender: TObject);
begin
   {-- 검색 실행.. --}
   {-- 0 : 컬럼 클릭 하지 않음 --}
   {-- 1 : 컬럼 클릭 함 --}
   Case cmb_SearchList.ItemIndex of
      0 : pSet_Search(schgd_Term.Columns[2], 0); {-- 한글명 --}
      1 : pSet_Search(schgd_Term.Columns[1], 0); {-- 영문명 --}
   end;
end;

procedure TfrmTermMg.txt_DataSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      {-- Call --}
      sbtn_DataSearchClick(Sender);
end;

procedure TfrmTermMg.chb_CountClick(Sender: TObject);
begin
   if chb_Count.Checked = True then begin
      oraqry_TermLst.SpecificOptions.Values['FetchAll'] := 'True';
      chb_Count.Caption       := Format('총 %d 건', [oraqry_TermLst.RecordCount]);
   end else begin
      chb_Count.Caption := '건수보기';
   end;
end;

procedure TfrmTermMg.schgd_TermDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
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

procedure TfrmTermMg.schgd_TermKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmTermMg.schgd_TermMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  {
   with TCRDBGrid(Sender) do begin
      SelectedRows.Clear;
   end;
  }
end;

procedure TfrmTermMg.tbn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmTermMg.tbn_ReloadClick(Sender: TObject);
var
   v_sFiedNm, v_sValue : String;
begin
   v_sFiedNm := schgd_Term.SelectedField.FieldName;
   v_sValue  := schgd_Term.SelectedField.AsString;

   {-- User Define procedure --}
   pGet_TermLst('1', 'ASC', '', '');

   {-- 다시 원위치로 커서 이동하기 --}
   frmMain.pSet_CurLocate(  v_sFiedNm
                          , v_sValue
                          , oraqry_TermLst
                          );


end;

procedure TfrmTermMg.tbn_TermInsertClick(Sender: TObject);
begin
   frmTermDML := TfrmTermDML.Create(Application);
   frmTermDML.Caption := '용어 등록';
   frmTermDML.ShowModal;
end;

procedure TfrmTermMg.schgd_TermDblClick(Sender: TObject);
begin
   //tbn_TermInsertClick(Sender);
   frmTermDML := TfrmTermDML.Create(Application);
   with frmTermDML do begin
      Caption := '용어 등록';
      txt_SearchTerm.Text := oraqry_TermLst.Fields[2].AsString;
      sbtn_TermSearchClick(Sender);
      {
      txt_SearchTerm.Text := oraqry_TermLst.Fields[2].AsString;
      txt_ResultTerm.Text := oraqry_TermLst.Fields[3].AsString;
      txt_resulttbl.Text  := txt_tbljubdo.Text + '_' + txt_ResultTerm.Text + '(' +  txt_SearchTerm.Text + ')';
      txt_resultcol.Text  := txt_coljubdo.Text + '_' + txt_ResultTerm.Text + '(' +  txt_SearchTerm.Text + ')';
      }
      ShowModal;
   end;
end;

procedure TfrmTermMg.tbn_TermDelClick(Sender: TObject);
var
   v_sTmp : String;
begin
   if Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(600, '"' + oraqry_TermLst.FieldByName('C_THGNM').AsString + '"'
                                                                                    + ' 인 용어를 삭제 하시겠습니까?'
                                                                                ))
                             , '삭제확인!'
                             , MB_YESNO + MB_ICONWARNING
                             ) = 7 then begin

      Exit;
   end;

   v_sTmp := fSet_DelTerm(  oraqry_TermLst.FieldByName('C_THENM').AsString
                          , oraQry_Tmp
                          );
   tbn_ReloadClick(Sender);

end;

procedure TfrmTermMg.tbn_DataSaveClick(Sender: TObject);
begin
   frmSave := TfrmSave.Create(Application);
   frmSave.Caption := '용어 사전 저장';
   pb_iSaveFlg := 2;
   frmSave.ShowModal;
end;

end.
