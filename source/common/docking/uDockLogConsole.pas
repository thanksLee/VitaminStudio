unit uDockLogConsole;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, SynEdit,
  cxGroupBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.AppEvnts,
  cxTextEdit, cxLabel,
  {-- S : add --}
  FileCtrl,
  {-- 수학함수를 쓰기 위해서.. --}
  Math,
  {-- S : Edit Match --}
  SynTokenMatch, SynHighlighterWebMisc, ToolWin, Clipbrd, SynEditKeyCmds, SynEditTypes, cxTL,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, cxImageList
  {-- E : Edit Match --}
  {-- E : add --}
  ;

type
  TfrmDockLogConsole = class(TForm)
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxBtnLogWrite: TcxButton;
    cxBtnLogPause: TcxButton;
    cxBtnLogClear: TcxButton;
    Bevel1: TBevel;
    cxBtn_LogNewWindow: TcxButton;
    cxBtn_Close: TcxButton;
    cxBtn_DockWindow: TcxButton;
    cxTxtEd_FilePath: TcxTextEdit;
    cxGrpBox_ReadProgress: TcxGroupBox;
    cxLbl_UseTime: TcxLabel;
    cxBtnRecCntStop: TcxButton;
    Bevel2: TBevel;
    cxBtn_Reload: TcxButton;
    cxLbl_ReadLine: TcxLabel;
    Bevel3: TBevel;
    cxLbl_LastUpdate: TcxLabel;
    timer_LogRead: TTimer;
    actLst_LogConsole: TActionList;
    cxImglst_LogConsole: TcxImageList;
    act_StartLogWrite: TAction;
    act_StopLogWrite: TAction;
    act_LogClear: TAction;
    act_docking: TAction;
    act_undocking: TAction;
    act_LogReload: TAction;
    act_LogReadStop: TAction;
    SynEd_Log: TSynEdit;
    act_WordicClose: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SynEd_LogDropFiles(Sender: TObject; X, Y: Integer;
      AFiles: TStrings);
    procedure timer_LogReadTimer(Sender: TObject);
    procedure SynEd_LogStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure act_StartLogWriteExecute(Sender: TObject);
    procedure act_StopLogWriteExecute(Sender: TObject);
    procedure act_LogClearExecute(Sender: TObject);
    procedure act_undockingExecute(Sender: TObject);
    procedure act_dockingExecute(Sender: TObject);
    procedure act_LogReloadExecute(Sender: TObject);
    procedure act_LogReadStopExecute(Sender: TObject);
    procedure act_WordicCloseExecute(Sender: TObject);
  private
    { Private declarations }
    //* Loop 도중에 Break을 하기 위하여 사용.
    pb_ReadBreak : Boolean;
    pb_ReadTotalCnt : Integer;
    {-- Editor 단어 강조 --}
    lf_FConfigMode   : TSynWebWordMarkerMode;
    lf_FWordMarkers  : array[TSynWebWordMarkerMode] of TSynWebWordMarker;
    //************************************************************************//
    //* 동적으로 Editor 구문강조 생성
    //************************************************************************//
    procedure upDynamicWordMarkersCreate(pi_Flg : Integer; pi_ObjSynEdt : TSynEdit);
  public
    { Public declarations }
    //************************************************************************//
    //* File Read
    //************************************************************************//
    procedure upReadFile(pi_Flg : Integer; pi_Param1 : String);
    procedure upUTF8ReadFile(pi_Flg : Integer; pi_Param1 : String);
    procedure upAnsiReadFile(pi_Flg : Integer; pi_Param1 : String);
  end;

var
  frmDockLogConsole: TfrmDockLogConsole;

implementation
uses uMain, ufile, udate, ustring, uForm;
{$R *.dfm}

//****************************************************************************//
//* Start : User Define Function, Procedure
//****************************************************************************//

//************************************************************************//
//* File Read
//************************************************************************//
procedure TfrmDockLogConsole.upReadFile(pi_Flg : Integer; pi_Param1 : String);
var
   lv_TmpFile : TextFile;
   lv_TmpStr  : String;
   lv_LoopCnt, i : Integer;
   lv_sDate : TDateTime;
begin
   cxGrpBox_ReadProgress.Visible := True;
   SynEd_Log.Lines.BeginUpdate;
   SynEd_Log.Lines.Clear;
   FileMode := fmOpenRead or fmShareDenyNone;
   AssignFile(lv_TmpFile, pi_Param1);
   Reset(lv_TmpFile);
   try
      lv_LoopCnt := 0;
      i := 0;
      lv_sDate := Now;
      while not Eof(lv_TmpFile) do
      begin
         Readln(lv_TmpFile, lv_TmpStr);
         SynEd_Log.Lines.Add(lv_TmpStr);
         if i = 1000 then
         begin
            i := 0;
            cxLbl_UseTime.Caption := 'Elapsed : ' + ufQueryElapsedTime(0, lv_sDate, Now);
            cxLbl_ReadLine.Caption := 'Total Read Line : ' + ufNumberFormat(1, lv_LoopCnt);
            Application.ProcessMessages;
         end;
         if pb_ReadBreak = True then Break;

         Inc(i);
         Inc(lv_LoopCnt);
      end;
   finally
      CloseFile(lv_TmpFile);
      SynEd_Log.Lines.EndUpdate;
      cxLbl_UseTime.Caption    := 'Elapsed : ' + ufQueryElapsedTime(0, lv_sDate, Now);
      cxLbl_ReadLine.Caption := 'Total Read Line : ' + ufNumberFormat(1, lv_LoopCnt);
      cxLbl_LastUpdate.Caption := 'Last Update : ' + ufDateFormat(5, Now);

      pb_ReadTotalCnt := lv_LoopCnt;
   end;
end;


//************************************************************************//
//* File Read
//************************************************************************//
procedure TfrmDockLogConsole.upUTF8ReadFile(pi_Flg : Integer; pi_Param1 : String);
var
   lv_fileStream : TFileStream;
   lv_TmpFile : TStreamReader;
   lv_TmpStr  : String;
   lv_LoopCnt, i, lv_ReadTotal : Integer;
   lv_sDate : TDateTime;
   lv_bExcept : Boolean;
begin
   lv_bExcept := False;
   lv_ReadTotal := pb_ReadTotalCnt;

   SynEd_Log.Lines.BeginUpdate;

   lv_fileStream := TFileStream.Create(pi_Param1, fmOpenRead or fmShareDenyNone);
   lv_TmpFile := TStreamReader.Create(lv_fileStream, TEncoding.UTF8, True);
   try
      try
         lv_LoopCnt := 0;
         i := 0;
         lv_sDate := Now;
         case pi_Flg of
            0 :  // 최초 생성시 or Refresh 시 사용
               begin
                  cxGrpBox_ReadProgress.Visible := True;
                  SynEd_Log.Lines.Clear;

                  while (not lv_TmpFile.EndOfStream) do
                  begin
                     //* 현재 읽어들인 내용보다 클 경우.
                     lv_TmpStr := lv_TmpFile.ReadLine;
                     SynEd_Log.Lines.Add(lv_TmpStr);
                     if i = 2000 then
                     begin
                        SynEd_Log.Lines.EndUpdate;
                        i := -1;
                        cxLbl_UseTime.Caption := 'Elapsed : ' + ufQueryElapsedTime(0, lv_sDate, Now);
                        cxLbl_ReadLine.Caption := 'Total Read Line : ' + ufNumberFormat(1, lv_LoopCnt);
                        SynEd_Log.Lines.BeginUpdate;
                        Application.ProcessMessages;
                     end;

                     if pb_ReadBreak = True then Break;
                     Inc(i);
                     Inc(lv_LoopCnt);
                  end;
                  cxLbl_UseTime.Caption    := 'Elapsed : ' + ufQueryElapsedTime(0, lv_sDate, Now);
                  cxLbl_ReadLine.Caption := 'Total Read Line : ' + ufNumberFormat(1, lv_LoopCnt);
                  pb_ReadTotalCnt := lv_LoopCnt;
                  cxLbl_LastUpdate.Caption := 'Last Update : ' + ufDateFormat(5, Now);
               end;
            1 :
               begin
                  cxGrpBox_ReadProgress.Visible := False;
                  while (not lv_TmpFile.EndOfStream) do
                  begin
                     //* 현재 읽어들인 내용보다 클 경우.
                     lv_TmpStr := lv_TmpFile.ReadLine;
                     if ((lv_ReadTotal-1) < lv_LoopCnt) then
                     begin
                        SynEd_Log.Lines.Add(lv_TmpStr);
                        if i = 2000 then
                        begin
                           SynEd_Log.Lines.EndUpdate;
                           i := -1;
                           SynEd_Log.Lines.BeginUpdate;
                           Application.ProcessMessages;
                        end;
                        Inc(i);
                     end;
                     Inc(lv_LoopCnt);
                  end;
                  pb_ReadTotalCnt := lv_LoopCnt;
                  cxLbl_LastUpdate.Caption := 'Last Update : ' + ufDateFormat(5, Now);
               end;
         end;
      except
        on E : Exception do
        begin
           lv_bExcept := True;
           uPLogFileWrite(0, E.Message);
        end;
      end;
   finally
      lv_TmpFile.Free;
      lv_fileStream.Free;
      SynEd_Log.Lines.EndUpdate;

      {-- Ansi Read --}
      if lv_bExcept = True then
      begin
         //upReadFile(0, pi_Param1);
         upAnsiReadFile(pi_Flg, pi_Param1);
      end;

      if pi_Flg = 1 then
         SynEd_Log.GotoLineAndCenter(SynEd_Log.Lines.Count);
   end;
end;

procedure TfrmDockLogConsole.upAnsiReadFile(pi_Flg : Integer; pi_Param1 : String);
var
   lv_fileStream : TFileStream;
   lv_TmpFile : TStreamReader;
   lv_TmpStr  : String;
   lv_LoopCnt, i, lv_ReadTotal : Integer;
   lv_sDate : TDateTime;
   lv_bExcept : Boolean;
begin
   lv_bExcept := False;
   lv_ReadTotal := pb_ReadTotalCnt;

   cxGrpBox_ReadProgress.Visible := True;
   SynEd_Log.Lines.BeginUpdate;

   if pi_Flg = 0 then SynEd_Log.Lines.Clear;

   lv_fileStream := TFileStream.Create(pi_Param1, fmOpenRead or fmShareDenyNone);
   lv_TmpFile := TStreamReader.Create(lv_fileStream, TEncoding.Default);
   try
      try
         lv_LoopCnt := 0;
         i := 0;
         lv_sDate := Now;
         case pi_Flg of
            0 :
               begin
                  while (not lv_TmpFile.EndOfStream) do
                  begin
                     //* 현재 읽어들인 내용보다 클 경우.
                     lv_TmpStr := lv_TmpFile.ReadLine;
                     SynEd_Log.Lines.Add(lv_TmpStr);
                     if i = 2000 then
                     begin
                        SynEd_Log.Lines.EndUpdate;
                        i := -1;
                        cxLbl_UseTime.Caption := 'Elapsed : ' + ufQueryElapsedTime(0, lv_sDate, Now);
                        cxLbl_ReadLine.Caption := 'Total Read Line : ' + ufNumberFormat(1, lv_LoopCnt);
                        SynEd_Log.Lines.BeginUpdate;
                        Application.ProcessMessages;
                     end;

                     if pb_ReadBreak = True then Break;
                     Inc(i);
                     Inc(lv_LoopCnt);
                  end;
                  cxLbl_UseTime.Caption    := 'Elapsed : ' + ufQueryElapsedTime(0, lv_sDate, Now);
                  cxLbl_ReadLine.Caption := 'Total Read Line : ' + ufNumberFormat(1, lv_LoopCnt);
                  pb_ReadTotalCnt := lv_LoopCnt;
                  cxLbl_LastUpdate.Caption := 'Last Update : ' + ufDateFormat(5, Now);

               end;
            1 :
               begin
                  cxGrpBox_ReadProgress.Visible := False;
                  while (not lv_TmpFile.EndOfStream) do
                  begin
                     //* 현재 읽어들인 내용보다 클 경우.
                     lv_TmpStr := lv_TmpFile.ReadLine;
                     if ((lv_ReadTotal - 1) < lv_LoopCnt) then
                     begin
                        SynEd_Log.Lines.Add(lv_TmpStr);
                        if i = 2000 then
                        begin
                           SynEd_Log.Lines.EndUpdate;
                           i := -1;
                           SynEd_Log.Lines.BeginUpdate;
                           Application.ProcessMessages;
                        end;
                        Inc(i);
                     end;
                     if pb_ReadBreak = True then Break;
                     Inc(lv_LoopCnt);
                  end;
                  pb_ReadTotalCnt := lv_LoopCnt;
                  cxLbl_LastUpdate.Caption := 'Last Update : ' + ufDateFormat(5, Now);
               end;
         end;
      except
        on E : Exception do
        begin
           lv_bExcept := True;
           upLogFileWrite(0, E.Message);
        end;
      end;
   finally
      lv_TmpFile.Free;
      lv_fileStream.Free;
      SynEd_Log.Lines.EndUpdate;
   end;
end;

//************************************************************************//
//* 동적으로 Editor 구문강조 생성
//************************************************************************//
procedure TfrmDockLogConsole.upDynamicWordMarkersCreate(pi_Flg : Integer; pi_ObjSynEdt : TSynEdit);
var
  {-- Edit 단어 강조에 필요한 변수  --}
  lv_EditMode : TSynWebWordMarkerMode;
begin
  {-- Edit 구문강조 --}
  case pi_Flg of
    0 :
      begin
        for lv_EditMode := Low(TSynWebWordMarkerMode) to High(TSynWebWordMarkerMode) do
        begin
          lf_FWordMarkers[lv_EditMode] := TSynWebWordMarker.Create(pi_ObjSynEdt);
          lf_FWordMarkers[lv_EditMode].Mode := lv_EditMode;
        end;

        lf_FConfigMode := swwmSelectedWord;
        lf_FWordMarkers[swwmSelectedWord].BGColor   := clYellow;
        lf_FWordMarkers[swwmSelectedWord].FGColor   := clBlack;
        lf_FWordMarkers[swwmSelectedWord].PaintMode := swwpFillRect;
      end;
  end;
end;

//****************************************************************************//
//* End : User Define Function, Procedure
//****************************************************************************//

procedure TfrmDockLogConsole.act_dockingExecute(Sender: TObject);
begin
   ManualDock(frmMain.cxPagCtl_LogConsole);
   cxBtn_LogNewWindow.Enabled := True;
   cxBtn_DockWindow.Enabled   := False;
   cxBtn_Close.Visible        := False;
end;

procedure TfrmDockLogConsole.act_LogClearExecute(Sender: TObject);
begin
   SynEd_Log.Lines.Clear;
end;

procedure TfrmDockLogConsole.act_LogReadStopExecute(Sender: TObject);
begin
   pb_ReadBreak := True;
   cxGrpBox_ReadProgress.Visible := False;
end;

procedure TfrmDockLogConsole.act_LogReloadExecute(Sender: TObject);
begin
   pb_ReadBreak    := False;
   pb_ReadTotalCnt := -1;
   if cxTxtEd_FilePath.Text <> '' then
   begin
      upUTF8ReadFile(0, cxTxtEd_FilePath.Text);
   end;
end;

procedure TfrmDockLogConsole.act_StartLogWriteExecute(Sender: TObject);
begin
   timer_LogRead.Enabled := True;
   cxBtnLogWrite.Enabled := False;
   cxBtnLogPause.Enabled := True;
end;

procedure TfrmDockLogConsole.act_StopLogWriteExecute(Sender: TObject);
begin
   timer_LogRead.Enabled := False;
   cxBtnLogWrite.Enabled := True;
   cxBtnLogPause.Enabled := False;
end;

procedure TfrmDockLogConsole.act_undockingExecute(Sender: TObject);
var
   lv_Top, lv_Left : Integer;
begin
   ManualFloat(Rect(0, 0, 985, 585));
   frmDockLogConsole.Position := poScreenCenter;
   cxBtn_LogNewWindow.Enabled := False;
   cxBtn_DockWindow.Enabled   := True;
   cxBtn_Close.Visible        := True;
end;

procedure TfrmDockLogConsole.act_WordicCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmDockLogConsole.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmDockLogConsole.FormCreate(Sender: TObject);
begin
   SynEd_Log.Lines.Clear;
   upDynamicWordMarkersCreate(0, SynEd_Log);
   frmMain.upSetSynEditorOption(0, SynEd_Log);

   pb_ReadBreak    := False;
   pb_ReadTotalCnt := -1;
end;

procedure TfrmDockLogConsole.FormDestroy(Sender: TObject);
var
   lv_Mode : TSynWebWordMarkerMode;
begin
   {-- 구문강조 해제 --}
   for lv_Mode := Low(TSynWebWordMarkerMode) to High(TSynWebWordMarkerMode) do
   begin
     FreeAndNil(lf_FWordMarkers[lv_Mode]);
   end;
   frmDockLogConsole := nil;
end;

procedure TfrmDockLogConsole.SynEd_LogDropFiles(Sender: TObject; X, Y: Integer;
  AFiles: TStrings);
var
   lv_Drive : Char;
   lv_TmpStr, lv_FilePath, lv_FileNm : String;
begin
   lv_TmpStr := AFiles.Strings[0];
   ProcessPath(lv_TmpStr, lv_Drive, lv_FilePath, lv_FileNm);
   if ufActiveFrom(0, lv_FileNm) = nil then
     frmMain.upCreateLogConsole(1, lv_Drive + ':' + lv_FilePath, lv_FileNm);
end;

procedure TfrmDockLogConsole.SynEd_LogStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
var
  lv_EditMode : TSynWebWordMarkerMode;
begin

  if scSelection in Changes then
    for lv_EditMode := Low(TSynWebWordMarkerMode) to High(TSynWebWordMarkerMode) do
      lf_FWordMarkers[lv_EditMode].NotifySelChanged;

end;

procedure TfrmDockLogConsole.timer_LogReadTimer(Sender: TObject);
begin
   upUTF8ReadFile(1, cxTxtEd_FilePath.Text);
end;

end.
