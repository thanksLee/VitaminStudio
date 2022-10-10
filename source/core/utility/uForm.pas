unit uForm;

interface
uses System.SysUtils, Vcl.Forms, Inifiles, System.Classes, Winapi.Windows,
   cxDropDownEdit, cxLookAndFeelPainters, dxSkinsDefaultPainters, dxSkinsForm,
   dxSkinsCore, Graphics,
  {-- S : Skin --}
  dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsLookAndFeelPainter,
  {-- E : Skin --}
  {-- S : SynEditor --}
   SynEdit,
  {-- E : SynEditor --}
  dxDockControl, dxBar
;

procedure uPFormSetting(pi_Flg : Integer; pi_ObjFrm : TForm);
function ufActiveFrom(pi_Flg : Integer; pi_Caption : String) : TForm;
procedure uPSkinLoad(pi_SelectSkin: String; pi_objCmb : TcxComboBox);
procedure uPSQLLoad(pi_ObjSynEd : TSynEdit);

implementation

//*****************************************************************************


uses uGlobal;


//****************************************************************************//
//* Form 을 Setting 한다.
//****************************************************************************//
procedure uPFormSetting(pi_Flg : Integer; pi_ObjFrm : TForm);
begin
  with pi_ObjFrm do
  begin
    Font.Size  := 9;
    Font.Name := '굴림체';
    KeyPreview  := True;
    case pi_Flg of
      0 : begin
            FormStyle   := fsMDIForm;
            Position    := poScreenCenter;
            Caption     := VERSION;
            Menu        := nil; // DB Connection 이 된후 Menu를 결정.
          end;
      1 : begin
            FormStyle   := fsMDIChild;
            Position    := poMainFormCenter;
          end;
    end;
    KeyPreview  := True;
    WindowState := wsMaximized;
  end;
end;


//*****************************************************************************
//* Active 된 form 찾기
//* Parameter : pi_Flg     - 0 : Active 된 Child Form 닫기
//*                        - 1 : Form 활성화 시키기
//*                        - 2 : Close 시키기
//*             pi_Caption - FormCaption
//*****************************************************************************
function ufActiveFrom(pi_Flg : Integer; pi_Caption : String) : TForm;
var
   lv_LoopCnt : Integer;
   lv_RetVal  : TForm;
begin
   lv_RetVal := nil;
   case pi_flg of
      0, 9 :
         begin
            for lv_LoopCnt := 0 to Screen.FormCount - 1 do
            begin
               if pi_Flg = 9 then
               begin
                  if CompareStr(Screen.Forms[lv_LoopCnt].Name, pi_caption) = 0 then
                  begin
                     lv_RetVal := Screen.Forms[lv_LoopCnt];
                     Break;
                  end;
               end else
               begin
                  if CompareStr(Screen.Forms[lv_LoopCnt].Caption, pi_caption) = 0 then
                  begin
                     lv_RetVal := Screen.Forms[lv_LoopCnt];
                     Break;
                  end;
               end;
            end;
         end;
      else  // 100 ~
         begin
            for lv_LoopCnt := 0 to Screen.ComponentCount - 1 do
            begin
               if (Screen.Components[lv_LoopCnt] is TForm) then
               begin
                  if (Screen.Components[lv_LoopCnt] as TForm).Name = pi_caption then
                  begin
                     lv_RetVal := (Screen.Components[lv_LoopCnt] as TForm);
                     Break;
                  end;
               end;
            end;
         end;
   end;
   Result := lv_RetVal;
end;

//************************************************************************//
//* Skin List Load
//************************************************************************//
procedure uPSkinLoad(pi_SelectSkin: String; pi_objCmb : TcxComboBox);
var
   lv_LoopCnt : Integer;
   lv_tmpStr : String;
begin
   // uses dxSkinsLookAndFeelPainter
   pi_objCmb.Properties.Items.Clear;
   pi_objCmb.Properties.Items.BeginUpdate;
   try
      pi_objCmb.Properties.Items.Add('<Random>');
      for lv_LoopCnt := 1 to cxLookAndFeelPaintersManager.Count - 1 do
      begin
         if cxLookAndFeelPaintersManager.Items[lv_LoopCnt] is TdxSkinLookAndFeelPainter then
         begin
            lv_tmpStr := cxLookAndFeelPaintersManager.Items[lv_LoopCnt].LookAndFeelName;
            pi_objCmb.Properties.Items.Add(cxLookAndFeelPaintersManager.Items[lv_LoopCnt].LookAndFeelName);
         end;
      end;
      pi_objCmb.ItemIndex := 0;
   finally
      pi_objCmb.Text := pi_SelectSkin;
      pi_objCmb.Properties.Items.EndUpdate;
   end;
end;

//****************************************************************************//
// SQL을 관리
//****************************************************************************//
procedure uPSQLLoad(pi_ObjSynEd : TSynEdit);
var
   lv_LoopCnt, lv_Idx : Integer;
   lv_tmpStr, lv_Key, lv_Value : String;

   function lfGetSQL(pi_LoopCnt : Integer) : String;
   var
      lpv_LoopCnt : Integer;
      lpv_RetVal, lpv_tmpStr : String;
      lpv_stlSQL : TStringList;
   begin
      lpv_stlSQL := TStringList.Create;
      lpv_stlSQL.StrictDelimiter := True;
      try
         for lpv_LoopCnt := pi_LoopCnt to pi_ObjSynEd.Lines.Count - 1 do
         begin
            lpv_tmpStr := Trim(pi_ObjSynEd.Lines.Strings[lpv_LoopCnt]);

            if CompareStr('[', Copy(lpv_tmpStr, 1, 1)) = 0 then Break;

            lpv_tmpStr := Copy(lpv_tmpStr, Pos('=', lpv_tmpStr) + 1, Length(lpv_tmpStr));
            lpv_stlSQL.Add(lpv_tmpStr);
         end;
      finally
         lpv_RetVal := lpv_stlSQL.Text;
         FreeAndNil(lpv_stlSQL);
      end;
      Result := lpv_RetVal;
   end;
begin
   lv_Idx := 0;
   for lv_LoopCnt := 0 to pi_ObjSynEd.Lines.Count - 1 do
   begin
      lv_tmpStr := Trim(pi_ObjSynEd.Lines.Strings[lv_LoopCnt]);

      if (CompareStr(lv_tmpStr, '') = 0) then Continue;

      if CompareStr('[', Copy(lv_tmpStr, 1, 1)) = 0 then
      begin
         SetLength(pb_DBSQL, Length(pb_DBSQL)+1);
         pb_DBSQL[lv_Idx].rSQLId := Copy(lv_tmpStr, 1, Pos(']', lv_tmpStr) - 1);
      end else
      begin
         lv_Key   := Copy(lv_tmpStr, 1, Pos('=', lv_tmpStr) - 1);
         lv_Value := Copy(lv_tmpStr, Pos('=', lv_tmpStr) + 1, Length(lv_tmpStr));

         if CompareStr(lv_Key, 'sql_desc') = 0 then
         begin
            pb_DBSQL[lv_Idx].rSQLDesc := lv_Value;
         end else if CompareStr(lv_Key, 'sql_param_cnt') = 0 then
         begin
            pb_DBSQL[lv_Idx].rSQLParamCnt := lv_Value;
            pb_DBSQL[lv_Idx].rSQLText     := lfGetSQL(lv_LoopCnt+1);
            Inc(lv_Idx);
         end;
      end;
      //Inc(lv_LoopCnt);
   end; // while..end
end;


end.
