program vitaminstudio;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uConst in 'core\uConst.pas',
  ufile in 'core\utility\ufile.pas',
  uGlobal in 'core\uGlobal.pas',
  uForm in 'core\utility\uForm.pas',
  uWordDicMain in 'product\wordic\uWordDicMain.pas' {frmWordDicMain},
  uUnidac in 'core\utility\dbconn\uUnidac.pas',
  udate in 'core\utility\udate.pas',
  ustring in 'core\utility\ustring.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
