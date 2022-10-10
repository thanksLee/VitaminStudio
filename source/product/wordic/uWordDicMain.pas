unit uWordDicMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, dxBevel,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxButtons, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, DBAccess, Uni, MemDS, System.ImageList,
  Vcl.ImgList, cxImageList, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxContainer, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLabel;

type
  TfrmWordDicMain = class(TForm)
    dxBevel1: TdxBevel;
    WordicActionList: TActionList;
    cxBtn_WordDicLogin: TcxButton;
    act_Login: TAction;
    cxGrd_WordListDBTableView1: TcxGridDBTableView;
    cxGrd_WordListLevel1: TcxGridLevel;
    cxGrd_WordList: TcxGrid;
    cxImgLst_WordicMain: TcxImageList;
    UniQry_WordLst: TUniQuery;
    UniDts_WordLst: TUniDataSource;
    act_Reload: TAction;
    cxBtn_Reload: TcxButton;
    cxBtn_NewWord: TcxButton;
    cxBtn_WordModify: TcxButton;
    cxBtn_WordDelete: TcxButton;
    cxBtn_WaitApproval: TcxButton;
    cxBtn_Export: TcxButton;
    act_NewWord: TAction;
    act_WordModify: TAction;
    act_WordDelete: TAction;
    act_WaitApproval: TAction;
    act_Save: TAction;
    act_Close: TAction;
    cxBtn_Close: TcxButton;
    dxBevel2: TdxBevel;
    dxBevel3: TdxBevel;
    dxBevel4: TdxBevel;
    dxBevel5: TdxBevel;
    cxGrd_WordListDBTableView1Column1: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column2: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column3: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column4: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column5: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column6: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column7: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column8: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column9: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column10: TcxGridDBColumn;
    cxStyleRepo_WordLst: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    dxBevel6: TdxBevel;
    cxChk_RowSelect: TcxCheckBox;
    act_RowSelect: TAction;
    cxGrd_WordListDBTableView1Column11: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column12: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column13: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column14: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column15: TcxGridDBColumn;
    cxGrd_WordListDBTableView1Column16: TcxGridDBColumn;
    dxBevel7: TdxBevel;
    cxCmb_Cate: TcxComboBox;
    cxLabel1: TcxLabel;
    dxBevel8: TdxBevel;
    cxChk_Eng: TcxCheckBox;
    cxChk_EngAbv: TcxCheckBox;
    cxChk_Han: TcxCheckBox;
    cxTxt_Search: TcxTextEdit;
    cxBtn_Search: TcxButton;
    act_Search: TAction;
    cxGrd_WordListDBTableView1Column17: TcxGridDBColumn;
    procedure act_LoginExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure act_CloseExecute(Sender: TObject);
    procedure act_ReloadExecute(Sender: TObject);
    procedure cxGrd_WordListDBTableView1Column5CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure act_RowSelectExecute(Sender: TObject);
    procedure cxGrd_WordListDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure uPWordList;
  end;

var
  frmWordDicMain: TfrmWordDicMain;

implementation

{$R *.dfm}

uses uMain, uWordDicLogin, uForm, uUnidac, uGlobal;

//************************************************************************//
//* S : User Defined Function, Procedure
//************************************************************************//
procedure TfrmWordDicMain.uPWordList;
var
   lv_stlParam : TStringList;
begin
   lv_stlParam := TStringList.Create;
   lv_stlParam.StrictDelimiter := True;
   UniQry_WordLst.DisableControls;
   try
      lv_stlParam.Add('%');
      lv_stlParam.Add('%');
      lv_stlParam.Add('%');
      lv_stlParam.Add('%');
      lv_stlParam.Add('%');
      with UniQry_WordLst do
      begin
         Active := False;
         Connection := frmMain.UniConnWordic;
         SpecificOptions.Values['FetchAll'] := 'False';
         FetchRows := 100;
         //UniDirectional := True;
         ufBackGroundUniSQLExec(1, pb_DBSQL[50].rSQLText, lv_stlParam, UniQry_WordLst);

         cxGrd_WordListDBTableView1Column1.DataBinding.FieldName  := Fields[0].FieldName;
         cxGrd_WordListDBTableView1Column2.DataBinding.FieldName  := Fields[1].FieldName;
         cxGrd_WordListDBTableView1Column3.DataBinding.FieldName  := Fields[2].FieldName;
         cxGrd_WordListDBTableView1Column4.DataBinding.FieldName  := Fields[3].FieldName;
         cxGrd_WordListDBTableView1Column5.DataBinding.FieldName  := Fields[4].FieldName;
         cxGrd_WordListDBTableView1Column6.DataBinding.FieldName  := Fields[5].FieldName;
         cxGrd_WordListDBTableView1Column7.DataBinding.FieldName  := Fields[6].FieldName;
         cxGrd_WordListDBTableView1Column8.DataBinding.FieldName  := Fields[7].FieldName;
         cxGrd_WordListDBTableView1Column9.DataBinding.FieldName  := Fields[8].FieldName;
         cxGrd_WordListDBTableView1Column10.DataBinding.FieldName := Fields[9].FieldName;
      end;
   finally
      UniQry_WordLst.EnableControls;
      FreeAndNil(lv_stlParam);
   end;
end;

//************************************************************************//
//* E : User Defined Function, Procedure
//************************************************************************//


procedure TfrmWordDicMain.act_CloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmWordDicMain.act_LoginExecute(Sender: TObject);
begin
   if ufActiveFrom(9, 'frmWordDicLogin') = nil then
   begin
      frmWordDicLogin := TfrmWordDicLogin.Create(Application);
      {-- Project List를 읽어 온다. --}
      with frmWordDicLogin do
      begin
         cxCmb_DbmsTypePropertiesChange(Sender);
         uPInitialClear;
         uPLoadDB;
         Show;
      end;
   end;
end;

procedure TfrmWordDicMain.act_ReloadExecute(Sender: TObject);
begin
   uPWordList;
end;

procedure TfrmWordDicMain.act_RowSelectExecute(Sender: TObject);
begin
   if cxChk_RowSelect.Checked = True then
   begin
      cxGrd_WordListDBTableView1.OptionsSelection.CellMultiSelect := False;
      cxGrd_WordListDBTableView1.OptionsSelection.MultiSelect := True;
   end else
   begin
      cxGrd_WordListDBTableView1.OptionsSelection.CellMultiSelect := True;
      cxGrd_WordListDBTableView1.OptionsSelection.MultiSelect := True;
   end;
end;

procedure TfrmWordDicMain.cxGrd_WordListDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   //ShowMessage(ACellViewInfo.GridRecord.Values[7] + '^' + ACellViewInfo.GridRecord.Values[8] + '^' + ACellViewInfo.GridRecord.Values[9]);
end;

procedure TfrmWordDicMain.cxGrd_WordListDBTableView1Column5CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if AViewInfo.GridRecord.Values[4] = '이음동의어' then
   begin
      ACanvas.Font.Color := clBlue;
   end else if AViewInfo.GridRecord.Values[4] = '금칙어' then
   begin
      ACanvas.Font.Color := clRed;
   end;

end;

procedure TfrmWordDicMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmWordDicMain.FormDestroy(Sender: TObject);
begin
   Self := nil;
end;

end.
