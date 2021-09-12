program WordDic;

{%ToDo 'WordDic.todo'}

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uConnect in 'uConnect.pas' {frmConnect},
  uWordMg in 'uWordMg.pas' {frmWordMg},
  uWordDML in 'uWordDML.pas' {frmWordDML},
  uApprovalMg in 'uApprovalMg.pas' {frmApprovalMg},
  uSave in 'uSave.pas' {frmSave},
  uUserMg in 'uUserMg.pas' {frmUserMg},
  uTermMg in 'uTermMg.pas' {frmTermMg},
  uTermDML in 'uTermDML.pas' {frmTermDML},
  uEnvMg in 'uEnvMg.pas' {frmEnvMg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
