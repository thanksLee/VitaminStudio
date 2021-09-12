unit uEnvMg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, jpeg, Gauges, DB,
  MemDS, DBAccess, ElCLabel, ElURLLabel, Uni;

type
  TfrmEnvMg = class(TForm)
    trv_Env: TTreeView;
    Panel1: TPanel;
    Notebook1: TNotebook;
    Label1: TLabel;
    ried_Install: TRichEdit;
    txt_HostName: TEdit;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    txt_Servicename: TEdit;
    StaticText2: TStaticText;
    txt_Port: TEdit;
    StaticText4: TStaticText;
    txt_DBUserId: TEdit;
    txt_DBUserPass: TEdit;
    StaticText5: TStaticText;
    Bevel1: TBevel;
    sbtn_Install: TSpeedButton;
    sbtn_Close: TSpeedButton;
    RichEdit1: TRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Gauge1: TGauge;
    oraqry_tmp: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_CloseClick(Sender: TObject);
    procedure trv_EnvClick(Sender: TObject);
  private
    { Private declarations }
    //* DB Connect �� �Ѵ�.
    function fGet_ConnInfo(pi_sDBUserID, pi_sDBUserPw, pi_sDBInfo : String) : Boolean;
    //* Tablespace �� �����.
    function fSet_TableSpace : Boolean;
    //* ����ڸ� �����.
    function fSet_User : Boolean;
    //* Table�� ����
    function fSet_Table : Boolean;

    //* ���� ������ ���н� ����
    function fSet_Delete : Boolean;


  public
    { Public declarations }
  end;

var
  frmEnvMg: TfrmEnvMg;

implementation
uses uMain;
{$R *.dfm}
//****************************************************************************//
// User Define function, procedure Start
//****************************************************************************//

//****************************************************************************//
//* ���� ������ ���н� ����
//****************************************************************************//
function TfrmEnvMg.fSet_Delete : Boolean;
begin
end;

//****************************************************************************//
//* Tablespace �� �����.
//****************************************************************************//
function TfrmEnvMg.fSet_TableSpace : Boolean;
var
   v_sSql    : String;
   v_stParam : TStringList;
   v_sTBDir  : String;
begin
   v_sSql := 'SELECT SUBSTR(FILE_NAME, 1, INSTR(FILE_NAME, ''SYSTEM'', 1,1)-1) FILE_NAME ' + #13 +
             '  FROM DBA_DATA_FILES                     ' + #13 +
             ' WHERE tablespace_name like ''SYSTEM''    ' + #13 +
             '   AND ROWNUM = 1                         ';

   v_stParam := TStringList.Create;
   try
      try
         frmMain.pGet_QryExec(  0
                              , v_sSql
                              , v_stParam
                              , oraqry_tmp
                              );
         v_sTBDir := oraQry_Tmp.Fields[0].AsString;



         Result := True;
      except
         on E : Exception do begin
            Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                   , 'SQL ����!'
                                   , MB_OK + MB_ICONERROR
                                   );
            Result := false;
         end;
      end;
   finally
      v_stParam.Free;
   end;
end;
//****************************************************************************//
//* ����ڸ� �����.
//****************************************************************************//
function TfrmEnvMg.fSet_User : Boolean;
begin
end;
//****************************************************************************//
//* Table�� ����
//****************************************************************************//
function TfrmEnvMg.fSet_Table : Boolean;
begin
end;

//****************************************************************************//
//* DB Connect �� �Ѵ�.
//****************************************************************************//
function TfrmEnvMg.fGet_ConnInfo(pi_sDBUserID, pi_sDBUserPw, pi_sDBInfo : String) : Boolean;
begin
   try
      with frmMain do begin
         {-- Login Info --}
         UniConn.Username  := pi_sDBUserID;
         UniConn.Password  := pi_sDBUserPw;
         UniConn.Server    := pi_sDBInfo;

         {-- Connect Info --}
         UniConn.Connected := True;
         {-- Editor �� Log ���� --}
         ried_Install.Clear;
         ried_Install.Lines.Add(pi_sDBUserID + ' ����ڷ� �α��� �Ǿ����ϴ�.');
      end;
   except
      on E : Exception do begin
         Application.MessageBox(  StrPCopy(pb_arrMessage, frmMain.fGet_MessageInfo(901, E.Message))
                                , 'WordDic DB ���� ����!'
                                , MB_OK + MB_ICONERROR
                                );
         pb_bConnStatus := False;
         Result         := False;
      end;
   end;
end;

//****************************************************************************//
// User Define function, procedure End
//****************************************************************************//

procedure TfrmEnvMg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmEnvMg.FormDestroy(Sender: TObject);
begin
   TForm(frmEnvMg) := nil;
end;

procedure TfrmEnvMg.sbtn_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmEnvMg.trv_EnvClick(Sender: TObject);
begin
   if trv_Env.Selected = nil then Exit;
   if CompareStr('Install', trv_Env.Items[trv_Env.Selected.AbsoluteIndex].Text) = 0 then begin
      Notebook1.PageIndex := 0;
   end;
   if CompareStr('Info', trv_Env.Items[trv_Env.Selected.AbsoluteIndex].Text) = 0 then begin
      Notebook1.PageIndex := 2;
   end;
end;

end.
