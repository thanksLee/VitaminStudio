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
  SynEditHighlighter, SynHighlighterSQL, SynEdit, cxButtons, MemDS
  ;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    MainActionList: TActionList;
    actWordic: TAction;
    actDBModelAnalyze: TAction;
    actDataQualityMng: TAction;
    actWindow: TAction;
    actAbout: TAction;
    actWindowClose: TAction;
    actDataPump: TAction;
    MainCxImglst: TcxImageList;
    actCascade: TAction;
    actHorizontally: TAction;
    actVertically: TAction;
    actVitaminStudioInfo: TAction;
    Wor1: TMenuItem;
    Data1: TMenuItem;
    Data2: TMenuItem;
    DataPump1: TMenuItem;
    N1: TMenuItem;
    VitaminStudio1: TMenuItem;
    About1: TMenuItem;
    VitaminStudio2: TMenuItem;
    Cascade1: TMenuItem;
    Horizontally1: TMenuItem;
    Vertically1: TMenuItem;
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
    SynEditWordic: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    UniQryTmp: TUniQuery;
    procedure FormCreate(Sender: TObject);
    procedure actSkinChangeExecute(Sender: TObject);
    procedure cxCmbSkinPropertiesChange(Sender: TObject);
    procedure actWindowCloseExecute(Sender: TObject);
    procedure actWordicExecute(Sender: TObject);
  private
    { Private declarations }
    procedure uPCreateTale(pi_Session: String; pi_ObjQry : TUniQuery);
  public
    { Public declarations }

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uConst, ufile, uGlobal, uWordDicMain, uForm, uUnidac;
//************************************************************************//
//* S : User Defined Function, Procedure
//************************************************************************//
procedure TfrmMain.uPCreateTale(pi_Session: String; pi_ObjQry : TUniQuery);
var
   lv_stlParam : TStringList;
   lv_TableExistCnt, lv_LoopCnt : Integer;
begin
   lv_stlParam := TStringList.Create;
   try
      lv_stlParam.Add('T_COMMON');
      ufBackGroundUniSQLExec(1, pb_DBSql[0].rSQLText, pi_Session, lv_stlParam, pi_ObjQry);
      lv_TableExistCnt := UniQryTmp.Fields[0].AsInteger;

      if lv_TableExistCnt = 0 then
      begin
         for lv_LoopCnt := 1 to 48 - 1 do
         begin
            ufBackGroundUniSQLExec(2, pb_DBSql[lv_LoopCnt].rSQLText, pi_Session, lv_stlParam, pi_ObjQry);
         end;
      end;

   finally
      lv_stlParam.Free;
   end;
end;

//************************************************************************//
//* E : User Defined Function, Procedure
//************************************************************************//

procedure TfrmMain.cxCmbSkinPropertiesChange(Sender: TObject);
begin
   actSkinChangeExecute(Sender);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
   lv_dbConnInfo : TArray<String>;
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

   {-- Skin Load --}
   SkinLoad(cxCmbSkin);

   {-- SQL Load --}
   SQLLoad(SynEditWordic);

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

   if ufDBConn(7, UniConnWordic, lv_dbConnInfo) = 'SUCCESS' then
   begin
      uPCreateTale('UniConnWordic', UniQryTmp);
   end;
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
      {-- Project List를 읽어 온다. --}
      frmWordDicMain.Show;
   end;
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
