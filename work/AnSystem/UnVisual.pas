unit UnVisual;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Gauges, ExtCtrls;
type
  TFrmVisual = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Edit8: TEdit;
    Edit11: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox6: TGroupBox;
    Label33: TLabel;
    Label41: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StaticText4: TStaticText;
    StaticText3: TStaticText;
    CheckBox6: TCheckBox;
    ColorDialog1: TColorDialog;
    CheckBox9: TCheckBox;
    BtnInput: TButton;
    BtnClear: TButton;
    BtnGrid: TButton;
    BtnSeries: TButton;
    EditProcFirst: TEdit;
    EditProcLast: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Margins: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    Panel2: TPanel;
    GaugeCurrent: TGauge;
    GaugeGlob: TGauge;
    ProgressBar: TProgressBar;
    procedure BtnInputClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnGridClick(Sender: TObject);
    procedure BtnSeriesClick(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
    procedure StaticText2Click(Sender: TObject);
    procedure StaticText3Click(Sender: TObject);
    procedure StaticText4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVisual: TFrmVisual;
  MarginHor:integer;    // отступ горизонтальный .
  MarginVer:integer;    // отступ вертикальный .
  zoom:real;            // коэфицент вывода на Image .
  nachalo:integer;      // начало координат по Y.

implementation
uses UnMain;
{$R *.dfm}

procedure TFrmVisual.BtnInputClick(Sender: TObject);
var height_i:integer; // высота видимой части .
    height_r:real; // высота задаваемая пользователем .
begin
 MarginHor:=strtoint(Edit1.Text);
 MarginVer:=strtoint(Edit4.Text);
 height_i:=UnMain.FrmMain.Image1.Height-2*MarginVer;
 height_r:=strtofloat(Edit2.Text)-strtofloat(Edit3.Text);
 zoom:=height_i/height_r;
 nachalo:=round(strtofloat(Edit2.Text)*height_i/height_r)+MarginVer;
end;

procedure TFrmVisual.BtnClearClick(Sender: TObject);    // Очистить .
begin
 FrmMain.Image1.Canvas.Brush.Color:= FrmVisual.StaticText3.Color;
 FrmMain.Image1.Canvas.FillRect(Rect(0,0,FrmMain.Image1.Width,FrmMain.Image1.Height));
end;

procedure TFrmVisual.BtnGridClick(Sender: TObject);
var wid,yr,i:integer;
    xr,ytext:real;
begin
      Wid:=FrmMain.Image1.Width-2*MarginHor;
      yr:=nachalo;
      i:=0;
      i:=i+1;
      ytext:=0;
      FrmMain.Image1.Canvas.Font.Color:= FrmVisual.StaticText4.color;
      FrmMain.Image1.Canvas.TextOut(3,yr,floattostr(ytext));
      FrmMain.Image1.Canvas.MoveTo(MarginHor+1,yr);
      FrmMain.Image1.Canvas.Pen.Color:=FrmVisual.StaticText2.color;
      FrmMain.Image1.Canvas.Pen.Style:=psDot;
      FrmMain.Image1.Canvas.LineTo(MarginHor+wid,yr);
      yr:=nachalo-round(strtofloat(FrmVisual.Edit11.Text)*zoom*i);
      ytext:=ytext+strtofloat(FrmVisual.Edit11.Text);
      i:=i+1;
      while i<round(( FrmMain.Image1.Height-2*MarginVer)/strtofloat(FrmVisual.Edit11.Text)) do
      begin
       if yr>MarginVer-1 then
       begin
         FrmMain.Image1.Canvas.TextOut(3,yr,floattostr(ytext));
         FrmMain.Image1.Canvas.MoveTo(MarginHor+1,yr);
         FrmMain.Image1.Canvas.LineTo(MarginHor+wid,yr);
       end;

       if 2*nachalo-yr<=FrmMain.Image1.Height-MarginVer then
       begin
         FrmMain.Image1.Canvas.TextOut(3,2*nachalo-yr,'-'+floattostr(ytext));
         FrmMain.Image1.Canvas.MoveTo(MarginHor+1,2*nachalo-yr);
         FrmMain.Image1.Canvas.LineTo(MarginHor+wid,2*nachalo-yr);
       end;

       yr:=nachalo-round(strtofloat(FrmVisual.Edit11.Text)*zoom*i);
       ytext:=ytext+strtofloat(FrmVisual.Edit11.Text);
       i:=i+1;
      end;
      FrmMain.Image1.Canvas.Pen.Style:=psSolid;

      xr:=0;
      while xr<= process.Time+1/1000 do
      begin
       FrmMain.Image1.Canvas.TextOut(round(wid*xr/process.Time)+MarginHor,FrmMain.Image1.Height-15,floattostr(xr));
       FrmMain.Image1.Canvas.MoveTo(round(wid*xr/process.Time)+MarginHor,FrmMain.Image1.Height-MarginVer,);
       FrmMain.Image1.Canvas.Pen.Color:=FrmVisual.StaticText2.color;
       FrmMain.Image1.Canvas.Pen.Style:=psDot;
       FrmMain.Image1.Canvas.LineTo(round(wid*xr/process.Time)+MarginHor,MarginVer+1);
       FrmMain.Image1.Canvas.Pen.Style:=psSolid;
       xr:=xr+strtofloat(FrmVisual.Edit8.Text);
      end;
       FrmMain.Image1.Canvas.TextOut(round(wid*process.Time/process.Time)+MarginHor,FrmMain.Image1.Height-15,floattostr(process.Time));
       FrmMain.Image1.Canvas.MoveTo(round(wid*process.Time/process.Time)+MarginHor,FrmMain.Image1.Height-MarginVer,);
       FrmMain.Image1.Canvas.Pen.Color:=FrmVisual.StaticText2.color;
       FrmMain.Image1.Canvas.Pen.Style:=psDot;
       FrmMain.Image1.Canvas.LineTo(round(wid*process.Time/process.Time)+MarginHor,MarginVer+1);
       FrmMain.Image1.Canvas.Pen.Style:=psSolid;
      xr:=0;
      while xr<= process.Time+1/1000 do
      begin
       FrmMain.Image1.Canvas.TextOut(round(wid*xr/process.Time)+MarginHor,FrmMain.Image1.Height-15,floattostr(xr));
       xr:=xr+strtofloat(FrmVisual.Edit8.Text);
      end;
      FrmMain.Image1.Canvas.TextOut(round(wid*process.Time/process.Time)+MarginHor,FrmMain.Image1.Height-15,floattostr(process.Time));
end;

procedure TFrmVisual.BtnSeriesClick(Sender: TObject);
const cveta : array[1..13] of TColor = (clBlack,
                                        clMaroon,
                                        clGreen,
                                        clOlive,
                                        clNavy,
                                        clPurple,
                                        clTeal,
                                        clRed,
                                        clLime,
                                        clYellow,
                                        clBlue,
                                        clFuchsia,
                                        clAqua);
var i,x,y,ti:integer;
    ColorCurrent:TColor;

  function OrdinateValue(y:real):integer;
  begin
    OrdinateValue:=nachalo-round(y*zoom)
  end;

  function AbscissValue(x:real):integer;
  begin
    AbscissValue:=round(MarginHor+((FrmMain.Image1.Width-2*MarginHor)*x/process.Time));
  end;

  function CheckContainsLimitArea(y:integer):boolean;
  begin
    CheckContainsLimitArea:=(y>MarginVer-1)and(y<=FrmMain.Image1.Height-MarginVer)
  end;

begin
  GaugeGlob.Visible:=true;
  GaugeCurrent.Visible:=true;
  ProgressBar.Visible:=true;
  for i:=strtoint(FrmVisual.EditProcFirst.Text) to  strtoint(FrmVisual.EditProcLast.Text)  do
  begin
    if FrmVisual.CheckBox6.Checked then ColorCurrent:=cveta[random(13)+1]
                                   else ColorCurrent:=FrmVisual.StaticText1.color;
    FrmMain.Image1.Canvas.Pen.Color:=ColorCurrent;
    for ti:=0 to trunc(process.Time*process.Discretization) do
    begin
      x:=AbscissValue(process.mas[ti,0]);
      y:=OrdinateValue(process.mas[ti,i]);
      if FrmVisual.CheckBox9.Checked and CheckContainsLimitArea(y) then FrmMain.Image1.Canvas.Pixels[x,y]:=ColorCurrent
      else
      begin
        if ti>0 then FrmMain.Image1.Canvas.LineTo(x,y);
        FrmMain.Image1.Canvas.MoveTo(x,y);
      end;
      GaugeCurrent.Progress:=Round(100*ti/trunc(process.Time*process.Discretization));
      ProgressBar.Position:=GaugeCurrent.Progress;
    end;
    GaugeGlob.Progress:=Round(100*i/(strtoint(FrmVisual.EditProcLast.Text)-strtoint(FrmVisual.EditProcFirst.Text)+1));
  end;
  GaugeGlob.Visible:=false;
  GaugeCurrent.Visible:=false;
  ProgressBar.Visible:=false;
  GaugeCurrent.Progress:=0;
  GaugeGlob.Progress:=0;
  ProgressBar.Position:=0;
end;

procedure TFrmVisual.StaticText1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then FrmVisual.StaticText1.Color:=ColorDialog1.Color
end;

procedure TFrmVisual.StaticText2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then FrmVisual.StaticText2.Color:=ColorDialog1.Color
end;

procedure TFrmVisual.StaticText3Click(Sender: TObject);
begin
  if ColorDialog1.Execute then FrmVisual.StaticText3.Color:=ColorDialog1.Color
end;

procedure TFrmVisual.StaticText4Click(Sender: TObject);
begin
  if ColorDialog1.Execute then FrmVisual.StaticText4.Color:=ColorDialog1.Color
end;

end.
