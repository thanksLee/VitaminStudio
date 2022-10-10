unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  cxImageList, cxGraphics, System.Actions, Vcl.ActnList, Vcl.Menus, dxBevel,
  dxSkinsCore, dxSkinsDefaultPainters, cxClasses, cxLookAndFeels, dxSkinsForm,
  cxControls, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit,
  cxGroupBox, Vcl.StdCtrls, Data.DB, DBAccess, Uni, UniProvider, SQLiteUniProvider,
  SynEditHighlighter, SynHighlighterSQL, SynEdit, cxButtons, MemDS,
  dxDockControl, dxBar, cxPC, dxDockPanel, SynEditMiscClasses, SynEditSearch,
  Vcl.ComCtrls, Winapi.ShlObj, cxShellCommon, dxBarBuiltInMenu, cxShellComboBox,
  Vcl.Grids, Vcl.ExtCtrls,
  {-- 수학함수를 쓰기 위해서.. --}
    Math,
  {-- S : Edit Match --}
    SynTokenMatch, SynHighlighterWebMisc, ToolWin, Clipbrd, SynEditKeyCmds, SynEditTypes, cxTL,
  cxSplitter
  {-- E : Edit Match --}
  ;


type
  TfrmMain = class(TForm)
    MainActionList: TActionList;
    actWordic: TAction;
    actDBModelAnalyze: TAction;
    actDataQualityMng: TAction;
    actWindow: TAction;
    actAbout: TAction;
    actWindowClose: TAction;
    actDataPump: TAction;
    MainCxImglst_16: TcxImageList;
    actCascade: TAction;
    actHorizontally: TAction;
    actVertically: TAction;
    actVitaminStudioInfo: TAction;
    dxBevel1: TdxBevel;
    cxCmbSkin: TcxComboBox;
    dxSkinController: TdxSkinController;
    cxBtnSkinChange: TcxButton;
    actSkinChange: TAction;
    cxBtnWordic: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    dxBevel2: TdxBevel;
    cxButton4: TcxButton;
    dxBevel3: TdxBevel;
    UniConnWordic: TUniConnection;
    SQLiteUniProvider1: TSQLiteUniProvider;
    UniQryTmp: TUniQuery;
    dxDockingMng_Main: TdxDockingManager;
    actSetting: TAction;
    MainMenu: TMainMenu;
    MMWordDic: TMenuItem;
    MMDBModelAnalyze: TMenuItem;
    MMDataQualityMng: TMenuItem;
    MMDataPump: TMenuItem;
    MMProductInfo: TMenuItem;
    MMAbout: TMenuItem;
    MMWindow: TMenuItem;
    MMCascade: TMenuItem;
    MMHorizontally: TMenuItem;
    MMVertically: TMenuItem;
    MMWindowClose: TMenuItem;
    cxButton5: TcxButton;
    SynEd_PopupMenu: TPopupMenu;
    PM_ColSelect: TMenuItem;
    PM_DisColSelect: TMenuItem;
    N31: TMenuItem;
    PM_Undo: TMenuItem;
    PM_Redo: TMenuItem;
    MenuItem3: TMenuItem;
    PM_AllSelect: TMenuItem;
    PM_Cut: TMenuItem;
    PM_Copy: TMenuItem;
    PM_Paste: TMenuItem;
    N8: TMenuItem;
    PM_TextFind: TMenuItem;
    ShiftCtrlH1: TMenuItem;
    MenuItem8: TMenuItem;
    PM_Clean: TMenuItem;
    PMS_BlankClean: TMenuItem;
    PMS_FBlankClean: TMenuItem;
    PMS_BBlankClean: TMenuItem;
    N15: TMenuItem;
    PM_CaseChng: TMenuItem;
    PMS_Upper: TMenuItem;
    PMS_Lower: TMenuItem;
    PM_LineCopy: TMenuItem;
    PM_LineMerge: TMenuItem;
    PM_LineSplit: TMenuItem;
    PM_Injection: TMenuItem;
    PMS_LineCmt: TMenuItem;
    PMS_MultiCmt: TMenuItem;
    PMS_Date: TMenuItem;
    PMS_Time: TMenuItem;
    PM_TBmk: TMenuItem;
    PMS_TBmk0: TMenuItem;
    PMS_TBmk1: TMenuItem;
    PMS_TBmk2: TMenuItem;
    PMS_TBmk3: TMenuItem;
    PMS_TBmk4: TMenuItem;
    PMS_TBmk5: TMenuItem;
    PMS_TBmk6: TMenuItem;
    PMS_TBmk7: TMenuItem;
    PMS_TBmk8: TMenuItem;
    PMS_TBmk9: TMenuItem;
    PM_GBmk: TMenuItem;
    PMS_GBmk0: TMenuItem;
    PMS_GBmk1: TMenuItem;
    PMS_GBmk2: TMenuItem;
    PMS_GBmk3: TMenuItem;
    PMS_GBmk4: TMenuItem;
    PMS_GBmk5: TMenuItem;
    PMS_GBmk6: TMenuItem;
    PMS_GBmk7: TMenuItem;
    PMS_GBmk8: TMenuItem;
    PMS_GBmk9: TMenuItem;
    PM_Wordwrap: TMenuItem;
    PM_WordCount: TMenuItem;
    N7: TMenuItem;
    Font1: TMenuItem;
    SynSQL_HH1: TSynSQLSyn;
    ActionListEdit: TActionList;
    actColSelect: TAction;
    actLineSelect: TAction;
    actUndo: TAction;
    actRedo: TAction;
    actAllSelect: TAction;
    actCut: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actFind: TAction;
    actReplace: TAction;
    actDelLineBlank: TAction;
    actDelFrontBlank: TAction;
    actDelBackBlank: TAction;
    actUpperCase: TAction;
    actLowerCase: TAction;
    actLineCopy: TAction;
    actLineMerge: TAction;
    actLineSplit: TAction;
    actLineComment: TAction;
    actBlockComment: TAction;
    actBMark0: TAction;
    actBMark1: TAction;
    actBMark2: TAction;
    actBMark3: TAction;
    actBMark4: TAction;
    actBMark5: TAction;
    actBMark6: TAction;
    actBMark7: TAction;
    actBMark8: TAction;
    actBMark9: TAction;
    actGoBmark0: TAction;
    actGoBmark1: TAction;
    actGoBmark2: TAction;
    actGoBmark3: TAction;
    actGoBmark4: TAction;
    actGoBmark5: TAction;
    actGoBmark6: TAction;
    actGoBmark7: TAction;
    actGoBmark8: TAction;
    actGoBmark9: TAction;
    actWordwrap: TAction;
    actWordCount: TAction;
    actInsertDay: TAction;
    actInsertTime: TAction;
    actFont: TAction;
    SynEd_ImgBookMark: TImageList;
    FontDlg: TFontDialog;
    FindDlg: TFindDialog;
    ReplaceDlg: TReplaceDialog;
    SynED_Main: TSynEdit;
    ed_SynEd_Main_Pos2: TEdit;
    ed_SynEd_Main_Pos1: TEdit;
    SgrdIniParam: TStringGrid;
    N2: TMenuItem;
    dxDockSiteLogConsole: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxDockPanel1: TdxDockPanel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    dxBevel6: TdxBevel;
    lblLogCount: TLabel;
    SGrd_LogFileList: TStringGrid;
    cxShellCmb_LogDir: TcxShellComboBox;
    cxPagCtl_LogConsole: TcxPageControl;
    procedure FormCreate(Sender: TObject);
    procedure actSkinChangeExecute(Sender: TObject);
    procedure actWindowCloseExecute(Sender: TObject);
    procedure actWordicExecute(Sender: TObject);
    procedure cxCmbSkinPropertiesChange(Sender: TObject);
    procedure SynED_MainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SynED_MainStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure SynED_MainPaintTransient(Sender: TObject; Canvas: TCanvas;
      TransientType: TTransientType);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SGrd_LogFileListDblClick(Sender: TObject);
    procedure SGrd_LogFileListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxShellCmb_LogDirPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    {-- Editor 단어 강조 --}
    lf_FConfigMode   : TSynWebWordMarkerMode;
    lf_FWordMarkers  : array[TSynWebWordMarkerMode] of TSynWebWordMarker;
    lf_SynEdit       : TSynEdit;

    procedure uPCreateTale(pi_ObjQry : TUniQuery);
    procedure uPFileList(pi_Flg : Integer; pi_FilePath : String; pi_SGrid : TStringGrid);
  public
    { Public declarations }

    function ufWorddicDbConn(pi_ObjUniConn : TUniConnection) : String;
    procedure uPSynEditOptionRead(pi_Flg : Integer; pi_ObjSynEd : TSynEdit);
    procedure uPBlock(pi_Flg : Integer; pi_ObjSynEd : TSynEdit; pi_Pos1, pi_Pos2 : String);
    procedure uPSynEdtFind(pi_Flg : Integer; pi_ObjFindDlg : TFindDialog; pi_ObjSynEdt : TSynEdit);
    procedure uPSynEdtFindNext(pi_Flg : Integer; pi_ObjFindDlg : TFindDialog; pi_ObjSynEdt : TSynEdit);
    procedure uPSynEdtFindPre(pi_Flg : Integer; pi_ObjFindDlg : TFindDialog; pi_ObjSynEdt : TSynEdit);
    procedure uPSetEditorOptSave(pi_Flg : Integer; pi_ObjSGrd : TStringGrid; pi_ObjSynEd : TSynEdit);
    procedure uPSetSynEditorOption(pi_Flg : Integer; pi_ObjSynEd : TSynEdit);
    procedure upCreateLogConsole(pi_Flg : Integer; pi_Param1, pi_Param2 : String);

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uConst, ufile, uGlobal, uWordDicMain, uForm, uUnidac, udate,
  uDockLogConsole, ustring;
//************************************************************************//
//* S : User Defined Function, Procedure
//************************************************************************//
{--
   @date : 2022.10.09
   @author : thanksLee
   @description
      - Word Dic DBConnection
      - Return:
         > SUCCESS, FAIL
--}
function TfrmMain.ufWorddicDbConn(pi_ObjUniConn : TUniConnection) : String;
var
   lv_dbConnInfo : TArray<String>;
   lv_uniQry : TUniQuery;
   lv_retVal : String;
begin
   {-- Wordic Database Setting --}
   SetLength(lv_dbConnInfo, 9);
   lv_dbConnInfo[0] := 'SQLite';  // db_provider
   lv_dbConnInfo[1] := '';        // db_host
   lv_dbConnInfo[2] := '';        // db_port
   lv_dbConnInfo[3] := '';        // db_user_id
   lv_dbConnInfo[4] := '';        // db_user_pwd
   lv_dbConnInfo[5] := 'UniConnWordic';    // db_name
   lv_dbConnInfo[6] := getWordicDBPath();  // db_service_name
   lv_dbConnInfo[7] := '';        // db_character_set

   lv_retVal := ufDBConn(7, pi_ObjUniConn, lv_dbConnInfo);
   if lv_retVal = 'SUCCESS' then
   begin
      lv_uniQry := TUniQuery.Create(nil);
      try
         lv_uniQry.Connection := pi_ObjUniConn;
         uPCreateTale(lv_uniQry);
      finally
         FreeAndNil(lv_uniQry);
      end;
   end;
   Result := lv_retVal;
end;

{--
   @date : 2022.10.09
   @author : thanksLee
   @description
      - Word Dic Table Creeate, Common Code Insert
      - Return:
         > SUCCESS, FAIL
--}
procedure TfrmMain.uPCreateTale(pi_ObjQry : TUniQuery);
var
   lv_stlParam : TStringList;
   lv_TableExistCnt, lv_LoopCnt : Integer;
begin
   lv_stlParam := TStringList.Create;
   lv_stlParam.StrictDelimiter := True;
   try
      lv_stlParam.Add('T_COMN_CD');
      ufBackGroundUniSQLExec(1, pb_DBSql[0].rSQLText, lv_stlParam, pi_ObjQry);
      lv_TableExistCnt := pi_ObjQry.Fields[0].AsInteger;

      if lv_TableExistCnt = 0 then
      begin
         for lv_LoopCnt := 1 to 48 - 1 do
         begin
            ufBackGroundUniSQLExec(2, pb_DBSql[lv_LoopCnt].rSQLText, lv_stlParam, pi_ObjQry);
         end;
      end;

   finally
      lv_stlParam.Free;
   end;
end;

//************************************************************************//
//* SynEdit Option
//* show line number, zero start, font, editor color, highlighter, word wrap
//* Parameter : pi_Flg : 예비
//*             pi_SynEdit : SynMemo
//************************************************************************//
procedure TfrmMain.uPSynEditOptionRead(pi_Flg : Integer; pi_ObjSynEd : TSynEdit);
var
   {-- SynEditor Setting iniFile 을 가져온다. --}
   lv_iniPath, lv_SectionNm : String;
   {-- Inifile에서 Editor Option을 가져오기 위한 변수 --}
   lv_stlOption, lv_stlStyle : TStringList;

   lv_FontStyle : TFontStyles;

   lv_LoopCnt : Integer;
   lv_Tmp, lv_KeyNm, lv_Value : String;
begin
   {-- Variable Initialized --}
   lv_iniPath :=  getBasePath() + CONFIGDIR + '\' + CONFIGFILENM;
   {-- Search Engine을 생성하여 각 에디터마다 할당한다. --}
   pi_ObjSynEd.SearchEngine := TSynEditSearch.Create(pi_ObjSynEd);

   with pi_ObjSynEd do
   begin
      Lines.Clear;
      Highlighter                    := SynSQL_HH1;
      PopupMenu                      := SynEd_PopupMenu;
      BookMarkOptions.BookmarkImages := SynEd_ImgBookMark;
      Options                        := SynED_Main.Options;

      {-- Keystroker --}
      Keystrokes       := SynED_Main.Keystrokes;

      {-- Event 할당 --}
      //OnDropFiles      := SynED_Main_ SynEd_Qry_0DropFiles;
      if pi_Flg = 0 then
         OnKeyDown        := SynED_MainKeyDown;

      OnPaintTransient := SynED_MainPaintTransient;
      //OnStatusChange   := SynED_MainStatusChange;
   end;

   if FileExists(lv_iniPath) = False then
   begin
     with pi_ObjSynEd do
     begin
       {-- Keystroker --}
       Keystrokes := SynED_Main.Keystrokes;

       {-- Etc Editor Option --}
       Color                          := SynED_Main.Color;
       Font.Name                      := SynED_Main.Font.Name;
       Font.Size                      := SynED_Main.Font.Size;
       Gutter.Font.Name               := SynED_Main.Font.Name;
       Gutter.Font.Size               := SynED_Main.Font.Size;
       Gutter.ShowLineNumbers         := SynED_Main.Gutter.ShowLineNumbers;
       Gutter.ZeroStart               := SynED_Main.Gutter.ZeroStart;
       WantTabs                       := SynED_Main.WantTabs;
       ActiveLineColor                := SynED_Main.ActiveLineColor;
       ExtraLineSpacing               := SynED_Main.ExtraLineSpacing;
       TabWidth                       := SynED_Main.TabWidth;
       WordWrap                       := SynED_Main.WordWrap;
       Options := [eoAutoIndent, eoDragDropEditing, eoDropFiles, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces];
       {
         eoTabIndent : 블록을 지정하고 탭을 누르면 Ctrl + i 와 같은 효과
         eoScrollPastEol : 커서를 맨 앞으로 이동시키지 않고, 마우스 클릭한 곳에 커서를 위치시킨다.
                           컬럼 단위로 Select 할때 사용
       }

       with SynSQL_HH1 do {-- Highlight Setting --}
       begin
         {
           0 : Comment
           1 : ConditionalComment
           2 : DataType
           3 : DefaultPackage
           4 : DelimitedIdenifier
           5 : Exception
           6 : Function
           7 : Identifier
           8 : Number
           9 : PLSQL-ReservedWord
          10 : ReservedWord
          11 : Space
          12 : SQLPlus-Command
          13 : String
          14 : Symbol
          15 : TableName
          16 : Variable
         }
         for lv_LoopCnt := 0 to Highlighter.AttrCount - 1 do
         begin
            case lv_LoopCnt of
              0 :
                 begin
                   Highlighter.Attribute[lv_LoopCnt].Foreground := clGreen;
                 end;
              5,8 :
                 begin
                   Highlighter.Attribute[lv_LoopCnt].Foreground := clMaroon;
                 end;
              13 :
                 begin
                   Highlighter.Attribute[lv_LoopCnt].Foreground := clFuchsia;
                 end;
              14,10 :
                 begin
                   Highlighter.Attribute[lv_LoopCnt].Foreground := clBlue;
                 end;
              15 :
                 begin
                   Highlighter.Attribute[lv_LoopCnt].Foreground := clOlive;
                 end;
              2,6 :
                 begin
                   Highlighter.Attribute[lv_LoopCnt].Foreground := clPurple;
                 end;
              9 :
                 begin
                   Highlighter.Attribute[lv_LoopCnt].Foreground := clRed;
                 end;
            end; // Case..end;
         end; // for..end
       end; // with SynSQL_HH1 end...
       Refresh;

       {-- Setting 된 Editor 정보를 저장한다. --}
       upSetEditorOptSave(0, SgrdIniParam, pi_ObjSynEd);
     end; // with pi_ObjSynEd end..
   end else //if FileExists(lv_iniPath) = False end... True Start
   begin
     {-- Ini File에서 Editor Option을 가져오기 위한 변수 선언--}
     lv_stlOption := TStringList.Create;
     try
       {-- Editor에 해당하는 option을 읽어 들인다. --}
       lv_SectionNm := 'EDITOROPTION';
       ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);
       for lv_LoopCnt := 0 to lv_stlOption.Count - 1 do
       begin
         with pi_ObjSynEd do
         begin
           lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
           lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
           lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

           if CompareStr(lv_KeyNm, 'EDITORCOLOR')          = 0 then Color                   := StringToColor(lv_Value);
           if CompareStr(lv_KeyNm, 'WORDWRAP')             = 0 then WordWrap                := StrToBool(lv_Value);
           if CompareStr(lv_KeyNm, 'EDITORFONT')           = 0 then Font.Name               := lv_Value;
           if CompareStr(lv_KeyNm, 'EDITORFONTSIZE')       = 0 then Font.Size               := StrToInt(lv_Value);
           if CompareStr(lv_KeyNm, 'LINENUMBER')           = 0 then Gutter.ShowLineNumbers  := StrToBool(lv_Value);
           if CompareStr(lv_KeyNm, 'LINENUMBERZEROSTART')  = 0 then Gutter.ZeroStart        := StrToBool(lv_Value);
           if CompareStr(lv_KeyNm, 'WANTTAB')              = 0 then WantTabs                := StrToBool(lv_Value);
           if CompareStr(lv_KeyNm, 'ACTIVELINECOLOR')      = 0 then ActiveLineColor         := StringToColor(lv_Value);
           if CompareStr(lv_KeyNm, 'EXTRACTLINESPACE')     = 0 then ExtraLineSpacing        := StrToInt(lv_Value);
           if CompareStr(lv_KeyNm, 'TABWIDTH')             = 0 then TabWidth                := StrToInt(lv_Value);
         end;
       end; // for..end

       {-- Section Name : HIGHLIGHTERCOLOR1 --}
       lv_stlOption.Clear;
       lv_SectionNm := 'HIGHLIGHTERCOLOR1';
       ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);

       for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
       begin
         lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
         lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
         lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

         pi_ObjSynEd.Highlighter.Attribute[lv_LoopCnt].Foreground := StringToColor(lv_Value);
       end;

       {-- Section Name : HIGHLIGHTERCOLOR2 --}
       lv_stlOption.Clear;
       lv_SectionNm := 'HIGHLIGHTERCOLOR2';
       ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);

       for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
       begin
         lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
         lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
         lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

         pi_ObjSynEd.Highlighter.Attribute[lv_LoopCnt].Background := StringToColor(lv_Value);
       end;

       {-- Section Name : HIGHLIGHTERSTYLE --}
       lv_stlOption.Clear;
       lv_SectionNm := 'HIGHLIGHTERSTYLE';
       ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);

       lv_FontStyle := [];
       lv_stlStyle := TStringList.Create;
       try
         for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
         begin
           lv_stlStyle.Clear;

           lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
           lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
           lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

           ExtractStrings(  [',']
                          , [' ']
                          , pChar(lv_Value)
                          , lv_stlStyle
                          );

           lv_FontStyle := [];

           if CompareStr(lv_stlStyle.Strings[0], 'fsBold')      = 0 then Include(lv_FontStyle, fsBold);
           if CompareStr(lv_stlStyle.Strings[1], 'fsItalic')    = 0 then Include(lv_FontStyle, fsItalic);
           if CompareStr(lv_stlStyle.Strings[2], 'fsUnderline') = 0 then Include(lv_FontStyle, fsUnderline);
           if CompareStr(lv_stlStyle.Strings[3], 'fsStrikeOut') = 0 then Include(lv_FontStyle, fsStrikeOut);

           pi_ObjSynEd.Highlighter.Attribute[lv_LoopCnt].Style := lv_FontStyle;
         end;
       finally
         lv_stlStyle.Free;
       end;
     finally
       lv_stlOption.Free;
     end;
   end;
end;

//****************************************************************************//
//* Ctrl + [, ] or Ctrl + Shift + [ ,] 사용
//* Parameger : pi_Flg : 0 - 이동, [
//*                      1 - 이동, ]
//*                      2 - block [
//*                      3 - block ]
//*             pi_ObjSynEd : Editor
//****************************************************************************//
procedure TfrmMain.uPBlock(pi_Flg : Integer; pi_ObjSynEd : TSynEdit; pi_Pos1, pi_Pos2 : String);
var
   lv_EdX1, lv_EdY1, lv_EdX2, lv_EdY2 : Integer;
   lv_EdCurrentX, lv_EdCurrentY       : Integer;
   lv_BlStart, lv_BlEnd               : TBufferCoord;
   lv_Flg                             : Integer;
begin
   {-- Local Variable Initialize  --}
   lv_Flg  := 0;
   lv_EdX1 := 0;
   lv_EdY1 := 0;
   lv_EdX2 := 0;
   lv_EdY2 := 0;

   lv_EdCurrentX := 0;
   lv_EdCurrentY := 0;

   lv_EdX1 := StrtoInt(Copy(pi_Pos1, 1, Pos('-', pi_Pos1)-1));
   lv_EdY1 := StrToInt(Copy(pi_Pos1, Pos('-', pi_Pos1)+1, Length(pi_Pos1)));
   lv_EdX2 := StrtoInt(Copy(pi_Pos2, 1, Pos('-', pi_Pos2)-1));
   lv_EdY2 := StrToInt(Copy(pi_Pos2, Pos('-', pi_Pos2)+1, Length(pi_Pos2)));
   lv_EdCurrentX := pi_ObjSynEd.CaretX;
   lv_EdCurrentY := pi_ObjSynEd.CaretY;


   if pi_Flg = 0 then
   begin
      if (lv_EdCurrentY = lv_EdY1) and (lv_EdCurrentX = lv_EdX1) then lv_Flg := 0
      else if (lv_EdCurrentY = lv_EdY2) and (lv_EdCurrentX >= lv_EdX2) then lv_Flg := 1;
   end else
   begin
      if (lv_EdCurrentY = lv_EdY1) and (lv_EdCurrentX in [lv_EdX1-1..lv_EdX1]) then lv_Flg := 2
      else if (lv_EdCurrentY = lv_EdY2) and (lv_EdCurrentX = lv_EdX2) then lv_Flg := 3;
   end;

   case lv_Flg of
      0 :
        begin
           pi_ObjSynEd.GotoLineAndCenter(lv_EdY2);
           pi_ObjSynEd.CaretX := lv_EdX2;
        end;
      1 :
        begin
           pi_ObjSynEd.GotoLineAndCenter(lv_EdY1);
           pi_ObjSynEd.CaretX := lv_EdX1;
        end;
      2, 3 :
        begin
           lv_BlStart.Char := lv_EdX1+1;
           lv_BlStart.Line := lv_EdY1;
           lv_BlEnd.Char   := lv_EdX2;
           lv_BlEnd.Line   := lv_EdY2;

           pi_ObjSynEd.BlockBegin := lv_BlStart;
           pi_ObjSynEd.BlockEnd   := lv_BlEnd;
        end;
   end;
end;

//****************************************************************************//
//* SynEditor Find Text
//****************************************************************************//
procedure TfrmMain.uPSynEdtFind(pi_Flg : Integer; pi_ObjFindDlg : TFindDialog; pi_ObjSynEdt : TSynEdit);
var
   lv_Dlg : TFindDialog;
   lv_EdtSearchOption : TSynSearchOptions;
   lv_SearchStr : String;
begin
   lv_Dlg := pi_ObjFindDlg;
   lv_SearchStr := lv_Dlg.FindText;
   if Length(lv_SearchStr) = 0 then
   begin
      Beep;
   end else
   begin
      lv_EdtSearchOption := [ssoPrompt];
      if not (frDown in lv_Dlg.Options) then Include(lv_EdtSearchOption, ssoBackwards);
      if frMatchCase in lv_Dlg.Options  then Include(lv_EdtSearchOption, ssoMatchCase);
      if frWholeWord in lv_Dlg.Options  then Include(lv_EdtSearchOption, ssoWholeWord);
      if pi_ObjSynEdt.SearchReplace(lv_SearchStr, '', lv_EdtSearchOption) = 0 then Beep;
   end;
end;

//****************************************************************************//
//* SynEditor에서 찾고자 하는 다음 Text를 찾는다.
//****************************************************************************//
procedure TfrmMain.uPSynEdtFindNext(pi_Flg : Integer; pi_ObjFindDlg : TFindDialog; pi_ObjSynEdt : TSynEdit);
begin
   pi_ObjFindDlg.Options := pi_ObjFindDlg.Options + [frDown];
   upSynEdtFind(0, pi_ObjFindDlg, pi_ObjSynEdt);
   pi_ObjSynEdt.SetFocus;
end;

//****************************************************************************//
//* Editor에서 찾고자 하는 이전 Text를 찾는다.
//****************************************************************************//
procedure TfrmMain.uPSynEdtFindPre(pi_Flg : Integer; pi_ObjFindDlg : TFindDialog; pi_ObjSynEdt : TSynEdit);
begin
   pi_ObjFindDlg.Options := pi_ObjFindDlg.Options - [frDown];
   upSynEdtFind(0, pi_ObjFindDlg, pi_ObjSynEdt);
   pi_ObjSynEdt.SetFocus;
end;

//************************************************************************//
//* Editor Option Save
//************************************************************************//
procedure TfrmMain.uPSetEditorOptSave(pi_Flg : Integer; pi_ObjSGrd : TStringGrid; pi_ObjSynEd : TSynEdit);
var
   lv_IniPath   : String;
   lv_SectionNm, lv_FontStyle : String;

   lv_Tmp, lv_KeyNm, lv_Value : String;
   lv_LoopCnt : Integer;
begin
   lv_IniPath   := getBasePath + CONFIGDIR + '\' + CONFIGFILENM;
   lv_SectionNm := 'EDITOROPTION';

   {-- Inifile에 쓰기위하여 String Grid를 Clear 한다. --}
   upSGrdClear(pi_ObjSGrd);

   {-- Editor Color --}
   pi_ObjSGrd.RowCount := 10;

   for lv_LoopCnt := 0 to pi_ObjSGrd.RowCount - 1 do
   begin
      case lv_LoopCnt of
         0 :
           begin
              lv_KeyNm := 'EDITORCOLOR';
              lv_Value := ColorToString(pi_ObjSynEd.Color);
           end;
         1 :
           begin
              lv_KeyNm := 'WORDWRAP';
              lv_Value := BoolToStr(pi_ObjSynEd.WordWrap);
           end;
         2 :
           begin
              lv_KeyNm := 'EDITORFONT';
              lv_Value := pi_ObjSynEd.Font.Name;
           end;
         3 :
           begin
              lv_KeyNm := 'EDITORFONTSIZE';
              lv_Value := IntToStr(pi_ObjSynEd.Font.Size);
           end;
         4 :
           begin
              lv_KeyNm := 'LINENUMBER';
              lv_Value := BoolToStr(pi_ObjSynEd.Gutter.ShowLineNumbers);
           end;
         5 :
           begin
              lv_KeyNm := 'LINENUMBERZEROSTART';
              lv_Value := BoolToStr(pi_ObjSynEd.Gutter.ZeroStart);
           end;
         6 :
           begin
              lv_KeyNm := 'WANTTAB';
              lv_Value := BoolToStr(pi_ObjSynEd.WantTabs);
           end;
         7 :
           begin
              lv_KeyNm := 'ACTIVELINECOLOR';
              lv_Value := ColorToString(pi_ObjSynEd.ActiveLineColor);
           end;
         8 :
           begin
              lv_KeyNm := 'EXTRACTLINESPACE';
              lv_Value := IntToStr(pi_ObjSynEd.ExtraLineSpacing);
           end;
         9 :
           begin
              lv_KeyNm := 'TABWIDTH';
              lv_Value := IntToStr(pi_ObjSynEd.TabWidth);
           end;
      end;
      pi_ObjSGrd.Cells[0, lv_LoopCnt] := lv_SectionNm;
      pi_ObjSGrd.Cells[1, lv_LoopCnt] := lv_KeyNm;
      pi_ObjSGrd.Cells[2, lv_LoopCnt] := lv_Value;
   end;
   ufWriteINI(lv_IniPath, pi_ObjSGrd);

   {-- Highlighter Color1 Setting --}
   upSGrdClear(pi_ObjSGrd);

   for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
   begin
      lv_Tmp := IntToStr(lv_LoopCnt);

      {-- Highlighter Color 1 --}
      lv_SectionNm := 'HIGHLIGHTERCOLOR1';
      lv_KeyNm     := lv_Tmp;
      lv_Value     := ColorToString(pi_ObjSynEd.Highlighter.Attribute[StrToInt(lv_Tmp)].Foreground);

      pi_ObjSGrd.Cells[0, lv_LoopCnt] := lv_SectionNm;
      pi_ObjSGrd.Cells[1, lv_LoopCnt] := lv_KeyNm;
      pi_ObjSGrd.Cells[2, lv_LoopCnt] := lv_Value;
   end;
   pi_ObjSGrd.RowCount := lv_LoopCnt;
   ufWriteINI(lv_IniPath, pi_ObjSGrd);

   {-- Highlighter Color2 Setting --}
   upSGrdClear(pi_ObjSGrd);
   for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
   begin
      lv_Tmp := IntToStr(lv_LoopCnt);
      {-- Highlighter Color 2 --}
      lv_SectionNm := 'HIGHLIGHTERCOLOR2';
      lv_KeyNm     := lv_Tmp;
      lv_Value     := ColorToString(pi_ObjSynEd.Highlighter.Attribute[StrToInt(lv_Tmp)].Background);

      pi_ObjSGrd.Cells[0, lv_LoopCnt] := lv_SectionNm;
      pi_ObjSGrd.Cells[1, lv_LoopCnt] := lv_KeyNm;
      pi_ObjSGrd.Cells[2, lv_LoopCnt] := lv_Value;
   end;
   pi_ObjSGrd.RowCount := lv_LoopCnt;
   ufWriteINI(lv_IniPath, pi_ObjSGrd);

   {-- Highlighter Style Setting --}
   upSGrdClear(pi_ObjSGrd);

   for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
   begin
      lv_Tmp := IntToStr(lv_LoopCnt);
      {-- Highlighter Style --}
      lv_FontStyle := 'fsNone';

      if (fsBold      in pi_ObjSynEd.Highlighter.Attribute[StrToInt(lv_Tmp)].Style) then lv_FontStyle := 'fsBold';
      if (fsItalic    in pi_ObjSynEd.Highlighter.Attribute[StrToInt(lv_Tmp)].Style) then lv_FontStyle := lv_FontStyle + ',fsItalic' else lv_FontStyle := lv_FontStyle + ',fsNone';
      if (fsUnderline in pi_ObjSynEd.Highlighter.Attribute[StrToInt(lv_Tmp)].Style) then lv_FontStyle := lv_FontStyle + ',fsUnderline' else lv_FontStyle := lv_FontStyle + ',fsNone';
      if (fsStrikeOut in pi_ObjSynEd.Highlighter.Attribute[StrToInt(lv_Tmp)].Style) then lv_FontStyle := lv_FontStyle + ',fsStrikeOut' else lv_FontStyle := lv_FontStyle + ',fsNone';

      lv_SectionNm := 'HIGHLIGHTERSTYLE';
      lv_KeyNm     := lv_Tmp;
      lv_Value     := lv_FontStyle;

      pi_ObjSGrd.Cells[0, lv_LoopCnt] := lv_SectionNm;
      pi_ObjSGrd.Cells[1, lv_LoopCnt] := lv_KeyNm;
      pi_ObjSGrd.Cells[2, lv_LoopCnt] := lv_Value;
   end;
   pi_ObjSGrd.RowCount := lv_LoopCnt;
   ufWriteINI(lv_IniPath, pi_ObjSGrd);

   uPSetSynEditorOption(0, pi_ObjSynEd);
end;

//****************************************************************************//
//* SynEditor Option Setting
//****************************************************************************//
procedure TfrmMain.uPSetSynEditorOption(pi_Flg : Integer; pi_ObjSynEd : TSynEdit);
var
  {-- SynEditor Setting iniFile 을 가져온다. --}
  lv_iniPath, lv_SectionNm : String;
  {-- Inifile에서 Editor Option을 가져오기 위한 변수 --}
  lv_stlOption, lv_stlStyle : TStringList;

  lv_FontStyle : TFontStyles;

  lv_LoopCnt : Integer;
  lv_Tmp, lv_KeyNm, lv_Value : String;
begin
  {-- Variable Initialized --}
  lv_iniPath :=  getBasePath() + CONFIGDIR + '\' + CONFIGFILENM;
  {-- Search Engine을 생성하여 각 에디터마다 할당한다. --}
  pi_ObjSynEd.SearchEngine := TSynEditSearch.Create(pi_ObjSynEd);

  with pi_ObjSynEd do
  begin
    Lines.Clear;
    Highlighter                    := SynSQL_HH1;
    PopupMenu                      := SynEd_PopupMenu;
    BookMarkOptions.BookmarkImages := SynEd_ImgBookMark;
    Options                        := SynED_Main.Options;

    {-- Keystroker --}
    Keystrokes       := SynED_Main.Keystrokes;

    {-- Event 할당 --}
    //OnDropFiles      := SynED_Main_ SynEd_Qry_0DropFiles;
    if pi_Flg = 0 then
       OnKeyDown        := SynED_MainKeyDown;

    OnPaintTransient := SynED_MainPaintTransient;
    //OnStatusChange   := SynED_MainStatusChange;
  end;

  if FileExists(lv_iniPath) = False then
  begin
    with pi_ObjSynEd do
    begin
      {-- Keystroker --}
      Keystrokes := SynED_Main.Keystrokes;

      {-- Etc Editor Option --}
      Color                          := SynED_Main.Color;
      Font.Name                      := SynED_Main.Font.Name;
      Font.Size                      := SynED_Main.Font.Size;
      Gutter.Font.Name               := SynED_Main.Font.Name;
      Gutter.Font.Size               := SynED_Main.Font.Size;
      Gutter.ShowLineNumbers         := SynED_Main.Gutter.ShowLineNumbers;
      Gutter.ZeroStart               := SynED_Main.Gutter.ZeroStart;
      WantTabs                       := SynED_Main.WantTabs;
      ActiveLineColor                := SynED_Main.ActiveLineColor;
      ExtraLineSpacing               := SynED_Main.ExtraLineSpacing;
      TabWidth                       := SynED_Main.TabWidth;
      WordWrap                       := SynED_Main.WordWrap;
      Options := [eoAutoIndent, eoDragDropEditing, eoDropFiles, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces];
      {
        eoTabIndent : 블록을 지정하고 탭을 누르면 Ctrl + i 와 같은 효과
        eoScrollPastEol : 커서를 맨 앞으로 이동시키지 않고, 마우스 클릭한 곳에 커서를 위치시킨다.
                          컬럼 단위로 Select 할때 사용
      }

      with SynSQL_HH1 do {-- Highlight Setting --}
      begin
        {
          0 : Comment
          1 : ConditionalComment
          2 : DataType
          3 : DefaultPackage
          4 : DelimitedIdenifier
          5 : Exception
          6 : Function
          7 : Identifier
          8 : Number
          9 : PLSQL-ReservedWord
         10 : ReservedWord
         11 : Space
         12 : SQLPlus-Command
         13 : String
         14 : Symbol
         15 : TableName
         16 : Variable
        }
        for lv_LoopCnt := 0 to Highlighter.AttrCount - 1 do
        begin
           case lv_LoopCnt of
             0 :
                begin
                  Highlighter.Attribute[lv_LoopCnt].Foreground := clGreen;
                end;
             5,8 :
                begin
                  Highlighter.Attribute[lv_LoopCnt].Foreground := clMaroon;
                end;
             13 :
                begin
                  Highlighter.Attribute[lv_LoopCnt].Foreground := clFuchsia;
                end;
             14,10 :
                begin
                  Highlighter.Attribute[lv_LoopCnt].Foreground := clBlue;
                end;
             15 :
                begin
                  Highlighter.Attribute[lv_LoopCnt].Foreground := clOlive;
                end;
             2,6 :
                begin
                  Highlighter.Attribute[lv_LoopCnt].Foreground := clPurple;
                end;
             9 :
                begin
                  Highlighter.Attribute[lv_LoopCnt].Foreground := clRed;
                end;
           end; // Case..end;
        end; // for..end
      end; // with SynSQL_HH1 end...
      Refresh;

      {-- Setting 된 Editor 정보를 저장한다. --}
      upSetEditorOptSave(0, SgrdIniParam, pi_ObjSynEd);
    end; // with pi_ObjSynEd end..
  end else //if FileExists(lv_iniPath) = False end... True Start
  begin
    {-- Ini File에서 Editor Option을 가져오기 위한 변수 선언--}
    lv_stlOption := TStringList.Create;
    try
      {-- Editor에 해당하는 option을 읽어 들인다. --}
      lv_SectionNm := 'EDITOROPTION';
      ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);
      for lv_LoopCnt := 0 to lv_stlOption.Count - 1 do
      begin
        with pi_ObjSynEd do
        begin
          lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
          lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
          lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

          if CompareStr(lv_KeyNm, 'EDITORCOLOR')          = 0 then Color                   := StringToColor(lv_Value);
          if CompareStr(lv_KeyNm, 'WORDWRAP')             = 0 then WordWrap                := StrToBool(lv_Value);
          if CompareStr(lv_KeyNm, 'EDITORFONT')           = 0 then Font.Name               := lv_Value;
          if CompareStr(lv_KeyNm, 'EDITORFONTSIZE')       = 0 then Font.Size               := StrToInt(lv_Value);
          if CompareStr(lv_KeyNm, 'LINENUMBER')           = 0 then Gutter.ShowLineNumbers  := StrToBool(lv_Value);
          if CompareStr(lv_KeyNm, 'LINENUMBERZEROSTART')  = 0 then Gutter.ZeroStart        := StrToBool(lv_Value);
          if CompareStr(lv_KeyNm, 'WANTTAB')              = 0 then WantTabs                := StrToBool(lv_Value);
          if CompareStr(lv_KeyNm, 'ACTIVELINECOLOR')      = 0 then ActiveLineColor         := StringToColor(lv_Value);
          if CompareStr(lv_KeyNm, 'EXTRACTLINESPACE')     = 0 then ExtraLineSpacing        := StrToInt(lv_Value);
          if CompareStr(lv_KeyNm, 'TABWIDTH')             = 0 then TabWidth                := StrToInt(lv_Value);
        end;
      end; // for..end

      {-- Section Name : HIGHLIGHTERCOLOR1 --}
      lv_stlOption.Clear;
      lv_SectionNm := 'HIGHLIGHTERCOLOR1';
      ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);

      for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
      begin
        lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
        lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
        lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

        pi_ObjSynEd.Highlighter.Attribute[lv_LoopCnt].Foreground := StringToColor(lv_Value);
      end;

      {-- Section Name : HIGHLIGHTERCOLOR2 --}
      lv_stlOption.Clear;
      lv_SectionNm := 'HIGHLIGHTERCOLOR2';
      ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);

      for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
      begin
        lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
        lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
        lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

        pi_ObjSynEd.Highlighter.Attribute[lv_LoopCnt].Background := StringToColor(lv_Value);
      end;

      {-- Section Name : HIGHLIGHTERSTYLE --}
      lv_stlOption.Clear;
      lv_SectionNm := 'HIGHLIGHTERSTYLE';
      ufReadSectionKeyValue(lv_iniPath, lv_SectionNm, lv_stlOption);

      lv_FontStyle := [];
      lv_stlStyle := TStringList.Create;
      try
        for lv_LoopCnt := 0 to SynSQL_HH1.AttrCount - 1 do
        begin
          lv_stlStyle.Clear;

          lv_Tmp   := lv_stlOption.Strings[lv_LoopCnt];
          lv_KeyNm := Copy(lv_Tmp, 1, Pos('=', lv_Tmp)-1);
          lv_Value := Copy(lv_Tmp, Pos('=', lv_Tmp)+1, Length(lv_Tmp));

          ExtractStrings(  [',']
                         , [' ']
                         , pChar(lv_Value)
                         , lv_stlStyle
                         );

          lv_FontStyle := [];

          if CompareStr(lv_stlStyle.Strings[0], 'fsBold')      = 0 then Include(lv_FontStyle, fsBold);
          if CompareStr(lv_stlStyle.Strings[1], 'fsItalic')    = 0 then Include(lv_FontStyle, fsItalic);
          if CompareStr(lv_stlStyle.Strings[2], 'fsUnderline') = 0 then Include(lv_FontStyle, fsUnderline);
          if CompareStr(lv_stlStyle.Strings[3], 'fsStrikeOut') = 0 then Include(lv_FontStyle, fsStrikeOut);

          pi_ObjSynEd.Highlighter.Attribute[lv_LoopCnt].Style := lv_FontStyle;
        end;
      finally
        lv_stlStyle.Free;
      end;
    finally
      lv_stlOption.Free;
    end;
  end;
end;

//************************************************************************//
//* Log Console Form 만들기
//************************************************************************//
procedure TfrmMain.upCreateLogConsole(pi_Flg : Integer; pi_Param1, pi_Param2 : String);
var
   lv_ComponentCnt : String;
   lv_logFile : TextFile;
   lv_FileDir, lv_FileNm : String;
   lv_MenuItem : TMenuItem;
   lv_Form : TForm;
begin
   frmDockLogConsole := TfrmDockLogConsole.Create(Application);
   lv_ComponentCnt   := ufDateFormat(4, now);
   with frmDockLogConsole do
   begin
      lv_Form := frmDockLogConsole;
      ManualDock(cxPagCtl_LogConsole);
      Name := LogTabNm + lv_ComponentCnt;
      if pi_Flg in [0, 9] then
      begin
         {-- Log file 저장 : Start --}
         lv_FileDir := getBasePath() + LOGSDIR + '\';
         setLogFileNm(ufDateFormat(7, now));
         lv_FileNm  := getLogFileNm();

         {-- Active Log Form Name : Log를 넣기 위해서. --}
         pb_ActiveLogFilePath := lv_FileDir + lv_FileNm;

         if ufCreateDir(1, lv_FileDir) = 'SUCCESS' then
         begin
            AssignFile(lv_logFile, lv_FileDir + lv_FileNm);
            if FileExists(lv_FileDir + lv_FileNm) = False then
            begin
              Rewrite(lv_logFile);
              CloseFile(lv_logFile);
            end;
            Caption := 'Active Log Console - ' + lv_FileNm;
         end;
         cxTxtEd_FilePath.Text := lv_FileDir + lv_FileNm;

         cxBtnLogWrite.Enabled := False;
         cxBtnLogPause.Enabled := True;

         lv_MenuItem := TMenuItem.Create(MainMenu);
         lv_MenuItem.Caption := Caption;
         lv_MenuItem.Tag := 505;
         lv_MenuItem.OnClick := N2Click;
         if pi_Flg = 0 then
            MMWindow.Add(lv_MenuItem);

      end else
      begin
         Caption := pi_Param2;
         cxTxtEd_FilePath.Text := pi_Param1 + '\' + pi_Param2;
      end;
      Show;
   end;
   cxPagCtl_LogConsole.ActivePageIndex := cxPagCtl_LogConsole.PageCount - 1;
   if pi_Param2 <> '' then
      TfrmDockLogConsole(lv_Form).upUTF8ReadFile(0, TfrmDockLogConsole(lv_Form).cxTxtEd_FilePath.Text);
end;

//****************************************************************************//
//* StringGrid 에 File 정보를 Add한다.
//****************************************************************************//
procedure TfrmMain.uPFileList(pi_Flg : Integer; pi_FilePath : String; pi_SGrid : TStringGrid);
var
  lv_Sr : TSearchRec;
  lv_SgrdRowCnt : Integer;
  lv_Flg : String;
  lv_LoopCnt : Integer;
begin
  // Grid 초기화
  pi_SGrid.RowCount := 1;

  pi_SGrid.Cells[0, 0] := '#No';
  pi_SGrid.Cells[1, 0] := 'File 명';
  pi_SGrid.Cells[2, 0] := 'Size(kb)';
  lv_SgrdRowCnt := 1;

  if FindFirst(pi_FilePath + '\*.log', faAnyFile, lv_Sr) = 0 then
  begin
    repeat
      if (lv_Sr.Attr <> faDirectory) then
      begin
         lv_SgrdRowCnt := pi_SGrid.RowCount;

         pi_SGrid.Cells[0, lv_SgrdRowCnt] := IntToStr(lv_SgrdRowCnt);
         pi_SGrid.Cells[1, lv_SgrdRowCnt] := lv_Sr.Name;
         pi_SGrid.Cells[2, lv_SgrdRowCnt] := ufNumberFormat(1, Ceil(lv_Sr.Size / 1024));

         pi_SGrid.RowCount := lv_SgrdRowCnt + 1;
      end;
    until FindNext(lv_Sr) <> 0;
    FindClose(lv_Sr);
  end;

  if (lv_SgrdRowCnt > 1) then pi_SGrid.FixedRows := 1;


end;


//************************************************************************//
//* E : User Defined Function, Procedure
//************************************************************************//

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   { -- Skin Color을 저장 한다. -- }
   ufWriteINI(getBasePath() + CONFIGDIR + '\' + CONFIGFILENM, 'SKIN', 'COLOR', cxCmbSkin.Text);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
   lv_SelectSkin : String;
begin
   {-- Application이 실행되는 위치를 Base Path로 인식  --}
   setBasePath(ExtractFilePath(ParamStr(0)));
   setWordicDbPath(getBasePath() + DBDIR + '\' + WORDIC_DB);
   setSqliteLibPath(getBasePath() + 'lib\sqlite\sqlite3.dll');

   {-- Vitamin Studio에 필요한 디렉토리를 생성 --}
   UfCreateDir(1, getBasePath() + LOGSDIR);    // logs
   ufCreateDir(1, getBasePath() + CONFIGDIR);  // Config
   ufCreateDir(1, getBasePath() + DBDIR);      // Database
   ufCreateDir(1, getBasePath() + DATADIR);    // Database

   {-- Vitamin Studio에서 사용하는 모든 SQL을 저장한다. --}
   if FileExists(getBasePath() + CONFIGDIR + '\' + VITAMIN_SQL_FILE) = False then
      SynED_Main.Lines.SaveToFile(getBasePath() + CONFIGDIR + '\' + VITAMIN_SQL_FILE);

   {-- Read Log --}
   cxShellCmb_LogDir.Text := getBasePath() + LOGSDIR;

   {-- Skin Load --}
   lv_SelectSkin := ufReadINI(getBasePath() + CONFIGDIR + '\' + CONFIGFILENM, 'SKIN', 'COLOR', '');
   {-- 사용할 Skin Color을 Setting 한다. --}
   if lv_SelectSkin = '' then lv_SelectSkin := '<Random>';
   uPSkinLoad(lv_SelectSkin, cxCmbSkin);

   {-- Edit Option 적용 --}
   SynSQL_HH1.TableNames.Clear;
   SynSQL_HH1.FunctionNames.Clear;

   ed_SynEd_Main_Pos1.Text := '0-0';
   ed_SynEd_Main_Pos2.Text := '0-0';

   uPSynEditOptionRead(0, SynED_Main);

   {-- SQL Load --}
   SynED_Main.Lines.LoadFromFile(getBasePath() + CONFIGDIR + '\' + VITAMIN_SQL_FILE);
   uPSQLLoad(SynED_Main);

   {-- Debug mode 일때만 로그를 보여준다. --}
   upCreateLogConsole(0, '', '');
   setDebugMode(True);
   if getDebugMode() = False then dxDockSiteLogConsole.Visible := False;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
   lv_LoopCnt : Integer; { MDI Childform }
   lv_Mode    : TSynWebWordMarkerMode;
begin
   {-- 구문강조 해제 --}
   for lv_Mode := Low(TSynWebWordMarkerMode) to High(TSynWebWordMarkerMode) do
      FreeAndNil(lf_FWordMarkers[lv_Mode]);
   {-- MDI Child Form Resource를 반환 --}
   for lv_LoopCnt := 0 to frmMain.MDIChildCount - 1 do
      TForm(Sender) := nil;
end;

procedure TfrmMain.N2Click(Sender: TObject);
var
   lv_tmpStr : String;
begin
   if TMenuItem(Sender).Tag = 505 then
   begin
      lv_tmpStr := TMenuItem(Sender).Caption;
      lv_tmpStr := Copy(lv_tmpStr, 2, Length(lv_tmpStr));
      if ufActiveFrom(0, lv_tmpStr) = nil then
         upCreateLogConsole(9, '', '');
   end;
end;

procedure TfrmMain.SGrd_LogFileListDblClick(Sender: TObject);
var
   lv_CurrCol, lv_CurrRow : Integer;
   lv_tmpStr : String;
   lv_form : TForm;
   lv_cxPageCtl : TcxPageControl;

   lv_LoopCnt : Integer;
   lv_bCheck : Boolean;

   lv_Rect : TRect;
begin
  lv_CurrCol := 1;
  lv_CurrRow := SGrd_LogFileList.Row;
  lv_tmpStr  := SGrd_LogFileList.Cells[lv_CurrCol, lv_CurrRow];

  lv_bCheck := False;
  for lv_LoopCnt := 0 to cxPagCtl_LogConsole.PageCount - 1 do
  begin
     if Pos(lv_tmpStr, cxPagCtl_LogConsole.Pages[lv_LoopCnt].Caption) > 0 then
     begin
        lv_bCheck := True;
        cxPagCtl_LogConsole.ActivePageIndex := lv_LoopCnt;
        Break;
     end;
  end;

  if lv_bCheck = False then
  begin
     lv_form  := ufActiveFrom(0, lv_tmpStr);
     if lv_form  = nil then
     begin
        upCreateLogConsole(1, cxShellCmb_LogDir.Path, lv_tmpStr);
     end else lv_form.Show;
  end;
end;

procedure TfrmMain.SGrd_LogFileListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   lv_CopyStr : String;
   lv_ItemIdx, lv_ColIdx : Integer;
   i, j : Integer;
   lv_sRec : TGridRect;
begin
   if (Shift = [ssCtrl]) and (Key = 67)then
   begin
      lv_CopyStr := '';
      lv_sRec := TStringGrid(Sender).Selection;
      //클립보드 복사(Ctrl+C)
      for i := lv_sRec.Top to lv_sRec.Bottom do
      begin
         for j := lv_sRec.Left to lv_sRec.Right Do
         begin
            lv_CopyStr := lv_CopyStr + TStringGrid(Sender).Cells[j, i] +#9;
         end;
         lv_CopyStr := lv_CopyStr + #13#10;
      end;
      Clipboard.SetTextBuf(PChar(lv_CopyStr));
   end;
end;

procedure TfrmMain.SynED_MainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lv_Pos1, lv_Pos2 : String;
begin
   lv_Pos1 := ed_SynEd_Main_Pos1.Text;
   lv_Pos2 := ed_SynEd_Main_Pos2.Text;

   lf_SynEdit := TSynEdit(Sender);

   if (Key = 221) and (Shift = [ssCtrl]) then
   begin
      uPBlock(0, lf_SynEdit, lv_Pos1, lv_Pos2);
   end else if (Key = 221) and (Shift = [ssCtrl, ssShift]) then
   begin
      uPBlock(1, lf_SynEdit, lv_Pos1, lv_Pos2);
   end else if ((Key = Ord('F')) and (Shift = [ssCtrl])) then     // Search
   begin
      FindDlg.FindText := lf_SynEdit.SelText;
      FindDlg.Execute;
   end else if ((Key = VK_F3) and (Shift = [ssShift])) then
   begin
      if lf_SynEdit = nil then Exit;
      uPSynEdtFindPre(0, FindDlg, lf_SynEdit);
   end else if (Key = VK_F3) then
   begin
      if lf_SynEdit = nil then Exit;
      uPSynEdtFindNext(0, FindDlg, lf_SynEdit);
   end else if ((Key = Ord('H')) and (Shift = [ssCtrl])) then     // Search
   begin
      ReplaceDlg.FindText := lf_SynEdit.SelText;
      ReplaceDlg.Execute;
   end;
end;

procedure TfrmMain.SynED_MainPaintTransient(Sender: TObject; Canvas: TCanvas;
  TransientType: TTransientType);
var
  lv_Editor : TSynEdit;
  lv_Pix    : TPoint;
  lv_Match  : TSynTokenMatched;
  lv_I      : Integer;

  function lf_CharToPixels(P: TBufferCoord): TPoint;
  begin
    Result := lv_Editor.RowColumnToPixels(lv_Editor.BufferToDisplayPos(P));
  end;

  procedure lp_ClipViewRect;
  var
    lView       : TRect;
    lMarginLeft : Integer;
    lClipH      : HRGN;
  begin
    if lv_Editor.Gutter.Visible then
      lMarginLeft := lv_Editor.Gutter.RealGutterWidth(lv_Editor.CharWidth) + 2
    else
      lMarginLeft := 2;

    lView := lv_Editor.ClientRect;
    lView.Left := lMarginLeft;

    lClipH := CreateRectRgn(lView.Left, lView.Top, lView.Right, lView.Bottom);
    if lClipH <> 0 then
    begin
      SelectClipRgn(lv_Editor.Canvas.Handle, lClipH);
      DeleteObject(lClipH);
    end;
  end;
begin
   if pb_FPaintUpdating then Exit;

   lv_Editor := TSynEdit(Sender);

   if TransientType = ttBefore then
   begin
      lv_I := SynEditGetMatchingTokenEx(lv_Editor, lv_Editor.CaretXY, SQLTokens, lv_Match);

      if lv_I = 0 then
      begin
         if pb_FMatchPainted then
            lv_Editor.Invalidate;

         Exit;
      end;
      pb_FPaintUpdating := True;

      if lv_I <> -1 then
         lv_Editor.InvalidateLines(lv_Match.OpenTokenPos.Line, lv_Match.OpenTokenPos.Line);
      if lv_I <> 1 then
         lv_Editor.InvalidateLines(lv_Match.CloseTokenPos.Line, lv_Match.CloseTokenPos.Line);
      pb_FPaintUpdating := False;

      Exit;
   end;

   if lv_Editor.SelAvail then Exit;

   lv_I := SynEditGetMatchingTokenEx(lv_Editor, lv_Editor.CaretXY, SQLTokens, lv_Match);
   if lv_I = 0 then Exit;

   Canvas.Brush.Style := bsSolid;

   if Abs(lv_I) = 2 then
      Canvas.Brush.Color := clAqua // matched color
   else
      Canvas.Brush.Color := clYellow; // unmatched color

   pb_FMatchPainted := False;
   try
     if lv_I <> -1 then
     begin
        lp_ClipViewRect;
        lv_Pix := lf_CharToPixels(lv_Match.OpenTokenPos);
        Canvas.Font.Color := lv_Editor.Font.Color;
        Canvas.Font.Style := lv_Match.TokenAttri.Style;
        Canvas.TextOut(lv_Pix.X, lv_Pix.Y, lv_Match.OpenToken);
        ed_SynEd_Main_Pos1.Text := (IntToStr(lv_Match.OpenTokenPos.Char) + '-'
                                         + IntToStr(lv_Match.OpenTokenPos.Line));
        pb_FMatchPainted := True;
     end;

     if lv_I <> 1 then
     begin
        lp_ClipViewRect;
        lv_Pix := lf_CharToPixels(lv_Match.CloseTokenPos);
        Canvas.Font.Color := lv_Editor.Font.Color;
        Canvas.Font.Style := lv_Match.TokenAttri.Style;
        Canvas.TextOut(lv_Pix.X, lv_Pix.Y, lv_Match.CloseToken);
        ed_SynEd_Main_Pos2.Text := (IntToStr(lv_Match.CloseTokenPos.Char) + '-'
                                         + IntToStr(lv_Match.CloseTokenPos.Line));
        pb_FMatchPainted := True;
     end;
   finally
     // Clear clip region for canvas
     if pb_FMatchPainted then
        SelectClipRgn(lv_Editor.Canvas.Handle, 0);
   end;
end;

procedure TfrmMain.SynED_MainStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
var
  lv_EditMode : TSynWebWordMarkerMode;
begin
  if scSelection in Changes then
    for lv_EditMode := Low(TSynWebWordMarkerMode) to High(TSynWebWordMarkerMode) do
      lf_FWordMarkers[lv_EditMode].NotifySelChanged;
end;

procedure TfrmMain.actWindowCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmMain.actWordicExecute(Sender: TObject);
begin
   if ufActiveFrom(9, 'frmWordDicMain') = nil then
   begin
      frmWordDicMain := TfrmWordDicMain.Create(Application);
      uPFormSetting(1, frmWordDicMain);
      ufWorddicDbConn(UniConnWordic);
      {-- Project List를 읽어 온다. --}
      with frmWordDicMain do
      begin
         Show;
      end;
   end;
end;

procedure TfrmMain.cxCmbSkinPropertiesChange(Sender: TObject);
begin
   actSkinChangeExecute(Sender);
end;

procedure TfrmMain.cxShellCmb_LogDirPropertiesEditValueChanged(Sender: TObject);
begin
   {-- Log 정보를 읽어들이기 위한 Key 값을 Setting --}
   uPFileList(0, cxShellCmb_LogDir.Text, SGrd_LogFileList);
   lblLogCount.Caption := '총 : ' + ufNumberFormat(1, SGrd_LogFileList.RowCount-1) + ' 개';
end;

procedure TfrmMain.actSkinChangeExecute(Sender: TObject);
var
  select_skin: String;
begin
   select_skin := cxCmbSkin.Text;
   if CompareStr(select_skin, '<Random>') = 0 then
   begin
      select_skin := cxCmbSkin.Properties.Items.Strings[Random(cxCmbSkin.Properties.Items.Count)];
   end;

   with dxSkinController do
   begin
      NativeStyle := False;
      SkinName := select_skin;
      UseSkins := True;
      Refresh;
   end;
end;

end.
