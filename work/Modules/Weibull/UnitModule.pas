unit UnitModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, Series, Menus;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Memo1: TMemo;
    Series1: TLineSeries;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Series2: TLineSeries;
    N3: TMenuItem;
    Weibull: TButton;
    Close: TButton;
    par_b: TEdit;
    par_c: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure fun_distr(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure WeibullClick(Sender: TObject);
    procedure Clear(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.fun_distr(Sender: TObject);
var i,j:integer;
    max_point:integer;
    sum:integer;
begin
  sum:=0;
  max_point:=trunc(strtofloat(Memo1.Lines.Strings[Memo1.Lines.Count-1]))+1;
  chart1.Series[0].AddXY(0,sum,'',clred);
  for i:=0 to max_point do
  begin
    sum:=0;
    for j:=0 to Memo1.Lines.Count-1 do
    if strtofloat(Memo1.Lines.Strings[j])<i then sum:=sum+1;
    chart1.Series[0].AddXY(i,sum/(Memo1.Lines.Count),'',clred);
  end;
end;
procedure TForm1.N2Click(Sender: TObject);
begin
 chart1.Series[0].Clear;
 chart1.Series[1].Clear
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 chart1.Title.Text.Text:='';
 chart1.Title.Text.Text:='';
end;

procedure TForm1.N3Click(Sender: TObject);
const d=25;
var j:integer;
    i_s,i_po:real;
    max_point:integer;
    sum:integer;
begin
  sum:=0;
  chart1.Series[0].Clear;
  max_point:=trunc(strtofloat(Memo1.Lines.Strings[Memo1.Lines.Count-1]))+1;
  chart1.Series[0].AddXY(0,sum,'',clred);
  i_s:=0;
  i_po:=max_point/d;
  while i_po <= max_point do
  begin
    sum:=0;
    for j:=0 to Memo1.Lines.Count-1 do
    if (strtofloat(Memo1.Lines.Strings[j])<=i_po)and(strtofloat(Memo1.Lines.Strings[j])>i_s) then sum:=sum+1;

    chart1.Series[1].AddXY(round((i_po+i_s)/2),sum,'',clblue);
    i_s:=i_po;
    i_po:=i_po+max_point/d;
  end;
end;

procedure TForm1.CloseClick(Sender: TObject);
begin
halt
end;

procedure TForm1.WeibullClick(Sender: TObject);
var max_point:integer;
    i_po,b,c,x,a:real;
    a_c,f:extended;
begin
  chart1.Series[1].Clear;
  b:= strtofloat(form1.par_b.Text);
  c:= strtofloat(form1.par_c.Text);
  chart1.Series[1].AddXY(0,0,'',clblue);
  x:=0.1  ;
  max_point:=trunc(strtofloat(Memo1.Lines.Strings[Memo1.Lines.Count-1]))+1;
  while x <= max_point do
  begin
    a:=x/b; // получаем основание "а"
    a_c:=exp(c*ln(a));  // возводим "a" в степень "с"
    f:=1-exp(-a_c); // Функция рапределения Вейбула f[x] = Wei(b,c)[x]
    chart1.Series[1].AddXY(x,f,'',clblue);
    x:=x+0.1;
  end;

end;

procedure TForm1.Clear(Sender: TObject);
begin
 chart1.Series[0].Clear;
 chart1.Series[1].Clear
end;

end.
