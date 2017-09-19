unit UnMain;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math,
  ComCtrls, Gauges, Menus, ToolWin, ImgList, UnDynamicFunction, UnArray;
type
  TFrmMain = class(TForm)
    MainMenu: TMainMenu;
    Image1: TImage;
    Panel1: TPanel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    TlBtn1: TToolButton;
    M11: TMenuItem;
    M2: TMenuItem;
    M21: TMenuItem;
    M3: TMenuItem;
    M31: TMenuItem;
    M32: TMenuItem;
    M4: TMenuItem;
    M41: TMenuItem;
    M5: TMenuItem;
    M51: TMenuItem;
    M6: TMenuItem;
    M61: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure ProcessClick(Sender: TObject);
    procedure AnalysisClick(Sender: TObject);
    procedure WeibullClick(Sender: TObject);
    procedure DataClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure OptionsClick(Sender: TObject);
    procedure VisualClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PROCEDURE WMGetMinMaxInfo(VAR M: TWMGetMinMaxInfo); MESSAGE WM_GetMinMaxInfo;
  end;
var  FrmMain: TFrmMain;
     process:ClsProcess;

implementation
uses  UnProcess, UnAnalysis, UnOptions, UnVisual, UnAbout,  UnData;
{$R *.dfm}

procedure TFrmMain.WMGetMinMaxInfo(VAR M: TWMGetMinMaxInfo);
begin
  inherited;
  M.MinMaxInfo^.PTMinTrackSize.X := 600;
  M.MinMaxInfo^.PTMinTrackSize.Y := 450;
end;

procedure TFrmMain.FormResize(Sender: TObject);
begin
  Image1.Top:=Panel1.Height;
  Image1.Width:=FrmMain.ClientWidth;
  Image1.Height:=FrmMain.ClientHeight-Panel1.Height;
  Panel1.Width:=FrmMain.ClientWidth+1;
  ToolBar1.Width:=Panel1.Width;
  Image1.Canvas.FillRect(Rect(0,0,Image1.Width,Image1.Height));
end;

procedure TFrmMain.ProcessClick(Sender: TObject);
begin
  FrmProcess.Show
end;

procedure TFrmMain.AnalysisClick(Sender: TObject);
begin
  FrmAnalysis.Show
end;

procedure TFrmMain.WeibullClick(Sender: TObject);
begin
  Winexec('..\Modules\Weibull\ProjectModule.exe',SW_Hide)
end;

procedure TFrmMain.DataClick(Sender: TObject);
begin
  UnData.FrmData.Show
end;

procedure TFrmMain.AboutClick(Sender: TObject);
begin
  FrmAbout.Show
end;

procedure TFrmMain.OptionsClick(Sender: TObject);
begin
  FrmOptions.Show
end;

procedure TFrmMain.VisualClick(Sender: TObject);
begin
  FrmVisual.Show
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Application.Title:=chr(171)+'Analysis System'+chr(187)+' '+chr(174)
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
 FrmMain.FormResize(Sender)
end;

end.
