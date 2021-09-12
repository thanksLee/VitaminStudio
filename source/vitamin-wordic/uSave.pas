unit uSave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Gauges, StdCtrls, ComCtrls, DB, MemDS,
  DBAccess, ActiveX, ComObj, Grids, DBGrids, CRGrid, OleCtrls, Uni;

type
  TfrmSave = class(TForm)
    Gauge1: TGauge;
    Bevel2: TBevel;
    sbtn_Close: TSpeedButton;
    sbtn_Save: TSpeedButton;
    red_SaveLog: TRichEdit;
    Label1: TLabel;
    txt_FilePath: TEdit;
    SchGrid1: TCRDBGrid;
    oraQry_Save: TUniQuery;
    dts_Save: TUniDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_CloseClick(Sender: TObject);
    procedure sbtn_SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    //* Excel 로 저장
    function fSet_ExcelFileSave(pi_sFileDir, pi_sFileName : String) : Boolean;
    //* Data Load
    procedure pGet_DataLst(pi_sHWord, pi_sEWord, pi_sESWord, pi_sWSort : String; qry_Obj : TUniQuery);
    //* 단어사전 Excel 로 저장
    procedure pSet_WordSave;

    //* 용어사전 List
    procedure pGet_TermDataLst(pi_sThENm, pi_sThHNm : String; qry_Obj : TUniQuery);
    //* Term Excel 로 저장
    function fSet_TermExcelSave(pi_sFileDir, pi_sFileName : String) : Boolean;
    //* 용어사전 Excel 로 저장
    procedure pSet_TermSave;
  public
    { Public declarations }
  end;

var
  frmSave: TfrmSave;

implementation
uses uWordMg, uMain, uTermMg;

{$R *.dfm}
//****************************************************************************//
//* User Define procedure, function Start
//****************************************************************************//

//****************************************************************************//
//* Excel 로 저장
//****************************************************************************//
function TfrmSave.fSet_ExcelFileSave(pi_sFileDir, pi_sFileName : String) : Boolean;
var
   v_vaExcelApp, v_vaExcelSheet : Variant;
   v_iIndex, v_iLoopCnt  : Integer;
begin
   {-- Direcotry Setting --}
   if not DirectoryExists(pi_sFileDir) then
      if not CreateDir(pi_sFileDir) then
         raise Exception.Create('Cannot create Directory ' + pi_sFileDir);

   red_SaveLog.Lines.BeginUpdate;

   red_SaveLog.Lines.Add('-------------------------');
   red_SaveLog.Lines.Add('   저장을 시작 합니다.   ');
   red_SaveLog.Lines.Add('-------------------------');

   red_SaveLog.Lines.EndUpdate;

   v_vaExcelApp := CreateOleObject('Excel.Application');

   try
      try
         {-- Excel 파일을 생성 및 오픈 --}
         v_vaExcelApp.DisplayAlerts := False;
         v_vaExcelApp.Visible       := False;
         v_vaExcelApp.Caption       := pi_sFileName;
         v_vaExcelSheet             := v_vaExcelApp.Workbooks.Add;

         with SchGrid1 do begin
            DataSource.DataSet.Last;
            DataSource.DataSet.First;

            v_iLoopCnt := 1;
            while not DataSource.DataSet.Eof do begin
               for v_iIndex := 0 to FieldCount - 1 do begin
                  {-- 저장할 Filed Setting --}
                  if v_iLoopCnt = 1 then begin
                     v_vaExcelApp.Range[  v_vaExcelApp.Cells.Item[v_iLoopCnt, v_iIndex+1]
                                        , v_vaExcelApp.Cells.Item[v_iLoopCnt, v_iIndex+1]
                                        ].font.Bold := True;
                     //v_vaExcelApp.Cells.Item[v_iLoopCnt, v_iIndex+1].Style.NumberFormatLocal := '@';
                     v_vaExcelApp.Cells.Item[v_iLoopCnt, v_iIndex+1] := Columns[v_iIndex].Title.Caption;
                  end;
                  //v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1].Style.NumberFormatLocal := '@';
                  v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1] := Fields[v_iIndex].AsString;
                  {-- 실 데이터 Setting --}
                  if CompareStr(Fields[5].AsString, '금칙어') = 0 then begin
                     v_vaExcelApp.Range[  v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        , v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        ].font.color := clRed;
                     v_vaExcelApp.Range[  v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        , v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        ].font.Bold := True;
                  end;
                  if CompareStr(Fields[5].AsString, '이음동의어') = 0 then begin
                     v_vaExcelApp.Range[  v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        , v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        ].font.color := clBlue;
                     v_vaExcelApp.Range[  v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        , v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1]
                                        ].font.Bold := True;
                  end;
               end;
               Gauge1.Progress := (v_iLoopCnt * 100) div DataSource.DataSet.RecordCount;
               Inc(v_iLoopCnt);
               DataSource.DataSet.Next;
            end;
         end;
        Result := True;
      except
         on E : Exception do begin
            Result := False;
         end;
      end;
   finally
      v_vaExcelSheet.SaveAs(pi_sFileDir + pi_sFileName);
      v_vaExcelSheet.Close;
      v_vaExcelSheet := Unassigned;
      v_vaExcelApp.Quit;
      v_vaExcelApp   := unassigned;

      red_SaveLog.Lines.BeginUpdate;

      red_SaveLog.Lines.Add('총 ' + FormatFloat('#,##0', v_iLoopCnt) + ' 개');
      red_SaveLog.Lines.Add('-------------------');
      red_SaveLog.Lines.Add(pi_sFileDir + pi_sFileName + '  저장이 완료 되었습니다.');
      red_SaveLog.Lines.Add('-------------------');

      red_SaveLog.Lines.EndUpdate;
   end;
end;

//****************************************************************************//
//* Data Load
//****************************************************************************//
procedure TfrmSave.pGet_DataLst(pi_sHWord, pi_sEWord, pi_sESWord, pi_sWSort : String; qry_Obj : TUniQuery);
var
   v_sSql    : String;
   v_stParam : TStringList;
begin
   v_sSql := frmWordMg.Qry_WordLst.SQL.Text;
   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sEWord);
      v_stParam.Add(pi_sESWord);
      v_stParam.Add(pi_sHWord);
      v_stParam.Add(pi_sWSort);

      try
         qry_Obj.SpecificOptions.Values['FetchAll'] := 'True';
         frmMain.pGet_QryExec(  0
                      , v_sSql
                      , v_stParam
                      , qry_Obj
                      );

         frmWordMg.pSet_DBGrid(SchGrid1);
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
//* 단어사전 Excel 로 저장
//****************************************************************************//
procedure TfrmSave.pSet_WordSave;
var
   v_sHFWord, v_sEFWord, v_sESWord, v_sSort : String;
begin
   with frmWordMg do begin
      Case cmb_SearchList.ItemIndex of
         0 : v_sHFWord := txt_DataSearch.Text;
         1 : v_sEFWord := txt_DataSearch.Text;
         2 : v_sESWord := txt_DataSearch.Text;
      end;
      {-- Memory Instance --}
      v_sSort := frmMain.fGet_stMemIns(0, 'A01-' + cmb_WordSort.Items[cmb_WordSort.ItemIndex]);
      {-- Data Load Call --}
      pGet_DataLst(  v_sHFWord
                   , v_sEFWord
                   , v_sESWord
                   , v_sSort
                   , oraQry_Save
                   );
   end;

   if fSet_ExcelFileSave(  txt_FilePath.Text
                         , frmWordMg.cmb_WordSort.Text + '_단어사전_' + FormatDateTime('YYYYMMDDHHNNSS', Now) + '.xls'
                         ) = False then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  'Excel 파일 저장에 실패 하였습니다.!'
                                                                                 ))
                             , '저장실패!'
                             , MB_OK + MB_ICONERROR
                             );
   end;
end;

//****************************************************************************//
//* Term Excel 로 저장
//****************************************************************************//
function TfrmSave.fSet_TermExcelSave(pi_sFileDir, pi_sFileName : String) : Boolean;
var
   v_vaExcelApp, v_vaExcelSheet : Variant;
   v_iIndex, v_iLoopCnt  : Integer;
begin
   {-- Direcotry Setting --}
   if not DirectoryExists(pi_sFileDir) then
      if not CreateDir(pi_sFileDir) then
         raise Exception.Create('Cannot create Directory ' + pi_sFileDir);

   red_SaveLog.Lines.BeginUpdate;

   red_SaveLog.Lines.Add('-------------------------');
   red_SaveLog.Lines.Add('   저장을 시작 합니다.   ');
   red_SaveLog.Lines.Add('-------------------------');

   red_SaveLog.Lines.EndUpdate;

   v_vaExcelApp := CreateOleObject('excel.Application');

   try
      try
         {-- Excel 파일을 생성 및 오픈 --}
         v_vaExcelApp.DisplayAlerts := False;
         v_vaExcelApp.Visible       := False;
         v_vaExcelApp.Caption       := pi_sFileName;
         v_vaExcelSheet             := v_vaExcelApp.Workbooks.Add;

         with SchGrid1 do begin
            DataSource.DataSet.Last;
            DataSource.DataSet.First;

            v_iLoopCnt := 1;
            while not DataSource.DataSet.Eof do begin
               for v_iIndex := 0 to FieldCount - 1 do begin
                  {-- 저장할 Filed Setting --}
                  if v_iLoopCnt = 1 then begin
                     v_vaExcelApp.Cells.Item[v_iLoopCnt, v_iIndex+1].Style.NumberFormatLocal := '@';
                     v_vaExcelApp.Cells.Item[v_iLoopCnt, v_iIndex+1] := Columns[v_iIndex].Title.Caption;
                  end;
                  {-- 실 데이터 Setting --}
                  v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1].Style.NumberFormatLocal := '@';
                  v_vaExcelApp.Cells.Item[v_iLoopCnt+1, v_iIndex+1] := Fields[v_iIndex].AsString;
               end;
               Gauge1.Progress := (v_iLoopCnt * 100) div DataSource.DataSet.RecordCount;
               Inc(v_iLoopCnt);
               DataSource.DataSet.Next;
            end;
         end;
        Result := True;
      except
         on E : Exception do begin
            Result := False;
         end;
      end;
   finally
      v_vaExcelSheet.SaveAs(pi_sFileDir + pi_sFileName);
      v_vaExcelSheet.Close;
      v_vaExcelSheet := Unassigned;
      v_vaExcelApp.Quit;
      v_vaExcelApp   := unassigned;

      red_SaveLog.Lines.BeginUpdate;

      red_SaveLog.Lines.Add('총 ' + FormatFloat('#,##0', v_iLoopCnt) + ' 개');
      red_SaveLog.Lines.Add('-------------------');
      red_SaveLog.Lines.Add(pi_sFileDir + pi_sFileName + '  저장이 완료 되었습니다.');
      red_SaveLog.Lines.Add('-------------------');

      red_SaveLog.Lines.EndUpdate;
   end;
end;

//****************************************************************************//
//* 용어사전 List
//****************************************************************************//
procedure TfrmSave.pGet_TermDataLst(pi_sThENm, pi_sThHNm : String; qry_Obj : TUniQuery);
var
   v_sSql : String;
   v_stParam : TStringList;
begin
   v_sSql := frmTermMg.oraqry_TermLst.SQL.Text;
   v_stParam := TStringList.Create;
   try
      v_stParam.Add(pi_sThENm);
      v_stParam.Add(pi_sThHNm);

      try
         qry_Obj.SpecificOptions.Values['FetchAll'] := 'True';
         frmMain.pGet_QryExec(  0
                      , v_sSql
                      , v_stParam
                      , qry_Obj
                      );

        frmTermMg.pGet_GridSetting(SchGrid1);
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
//* 용어사전 Excel 로 저장
//****************************************************************************//
procedure TfrmSave.pSet_TermSave;
var
   v_sENm, v_sHNm : String; {-- 검색어 --}
begin
   with frmTermMg do begin
      Case cmb_SearchList.ItemIndex of
         0 : v_sHNm := txt_DataSearch.Text;
         1 : v_sENm := txt_DataSearch.Text;
      end;
   end;
   {-- 용어사전 실행 --}
   pGet_TermDataLst(v_sENm, v_sHNm, oraQry_Save);

   if fSet_TermExcelSave(  txt_FilePath.Text
                         , '용어사전_' + FormatDateTime('YYYYMMDDHHNNSS', Now) + '.xls'
                         ) = False then begin
      Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901,  'Excel 파일 저장에 실패 하였습니다.!'
                                                                                 ))
                             , '저장실패!'
                             , MB_OK + MB_ICONERROR
                             );
   end;

end;
//****************************************************************************//
//* User Define procedure, function End
//****************************************************************************//

procedure TfrmSave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSave.FormDestroy(Sender: TObject);
begin
   TForm(frmSave) := nil;
end;

procedure TfrmSave.sbtn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSave.FormActivate(Sender: TObject);
var
   v_sFileDir : String;
begin
   v_sFileDir        := ExtractFilePath(ParamStr(0));
   txt_FilePath.Text := v_sFileDir + 'SaveList\';
   red_SaveLog.Clear;
end;

procedure TfrmSave.sbtn_SaveClick(Sender: TObject);
var
   v_iLoopCnt : Integer;
begin
   v_iLoopCnt := 0;
   Case pb_iSaveFlg of
      1 : begin
             while 7 <> v_iLoopCnt do begin
                SchGrid1.Columns.Add;
                Inc(v_iLoopCnt);
             end;
             pSet_WordSave;
          end;
      2 : begin
             while 3 <> v_iLoopCnt do begin
                SchGrid1.Columns.Add;
                Inc(v_iLoopCnt);
             end;
             pSet_TermSave;
          end;
   end;
end;

end.
