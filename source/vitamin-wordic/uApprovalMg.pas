unit uApprovalMg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons;

type
  TfrmApprovalMg = class(TForm)
    Panel1: TPanel;
    ListView1: TListView;
    ListView2: TListView;
    Panel2: TPanel;
    sbtn_Close: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApprovalMg: TfrmApprovalMg;

implementation

{$R *.dfm}

procedure TfrmApprovalMg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmApprovalMg.FormDestroy(Sender: TObject);
begin
   TForm(frmApprovalMg) := nil;
end;

procedure TfrmApprovalMg.sbtn_CloseClick(Sender: TObject);
begin
   Close;
end;

end.
