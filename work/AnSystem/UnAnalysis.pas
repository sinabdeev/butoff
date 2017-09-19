unit UnAnalysis;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls,Math, ComCtrls, Spin;
type
  TFrmAnalysis = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    mean: TButton;
    Disp: TButton;
    Dif_proc: TButton;
    Uload_sort: TButton;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    Edit_Value: TEdit;
    Button_posled: TButton;
    TabSheet3: TTabSheet;
    LevelEdit: TSpinEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure posled_click(Sender: TObject);
    procedure Uload_sortClick(Sender: TObject);
    procedure meanClick(Sender: TObject);
    procedure DispClick(Sender: TObject);
    procedure Dif_procClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private    { Private declarations }
  public     { Public declarations }
  end;
var
  FrmAnalysis: TFrmAnalysis;
implementation
{$R *.dfm}

uses UnMain, UnArithmFun;

procedure TFrmAnalysis.FormShow(Sender: TObject);
begin
   FrmAnalysis.StringGrid1.Cells[0,0]:='{ t | X(t) = '+Edit_Value.Text+' }';
   FrmAnalysis.StringGrid1.RowCount:=process.ProcCount+1;
end;

procedure TFrmAnalysis.posled_click(Sender: TObject);
var i,j,j_min:integer;
    min,value:real;
     Level:integer;
begin
  Level:= strtoint(LevelEdit.Text);
  value:=strtofloat(Edit_Value.Text);
  for i:=1 to process.ProcCount do
  begin
    min:=1000;
    for j:=0 to (trunc(process.Time*process.Discretization)+1)-1 do
    begin
      if abs(value-process.mas[j,i])<min then
      begin
        min:=abs(value-process.mas[j,i]);
        j_min:=j;
      end;
    end;
//////// нашли наиболее подходящее t /////////////////////////////
    FrmAnalysis.StringGrid1.Cells[0,i]:=floattostr(RoundToN(process.mas[j_min,0],Level));
  end;
end;

procedure TFrmAnalysis.Uload_sortClick(Sender: TObject);
type TMas_v = array of real;
var i,ii:integer;
    mas:TMas_v;// массив для хранения выборки .

    function min_v(k_v:integer):integer;
    var min_e:real; i,i_min :integer;
    begin
     min_e:=1000000;
     for i:=k_v to  FrmAnalysis.StringGrid1.RowCount-1 do
     begin
      if mas[i-1]<=min_e then
      begin
        min_e:=mas[i-1];
        i_min:=i-1
      end;
     end;
      min_v:= i_min;
    end;

    procedure zam(i_v:integer; j_v:integer);
    var buf:real;
    begin
      buf:=mas[j_v];
      mas[j_v]:=mas[i_v];
      mas[i_v]:=buf;
    end;

begin
FrmAnalysis.Memo1.Clear;
SetLength(mas,FrmAnalysis.StringGrid1.RowCount);
if  (process.ProcCount)<>(FrmAnalysis.StringGrid1.RowCount-1) then
begin
 showmessage('Ошибка в анализе данных!')      ;
 exit;
end;
for i:=1 to process.ProcCount do
  mas[i-1]:=strtofloat(FrmAnalysis.StringGrid1.cells[0,i]);
for i:=1 to process.ProcCount do
begin
  ii:=min_v(i);
  zam(i-1,ii);
end;
for i:=1 to process.ProcCount do
  Memo1.Lines.Append(floattostr(RoundTo(mas[i-1],-5)));
end;

procedure TFrmAnalysis.meanClick(Sender: TObject);
var i,j:integer;
    sum:real;
begin
 for i:=0 to trunc(process.Time*process.Discretization) do
 begin
   sum:=0;
   for j:=1 to process.ProcCount do sum:=sum+process.mas[i,j];
   process.SetValueMas(i,(trunc(process.Time*process.Discretization)+1)+1,sum/process.ProcCount);
 end;
end;

procedure TFrmAnalysis.DispClick(Sender: TObject);
var i,j:integer;
    sds:real;
begin
 for i:=0 to trunc(process.Time*process.Discretization) do
 begin
   sds:=0;
   for j:=1 to process.ProcCount do
   sds:=sds+(process.mas[i,j]-process.mas[i,process.ProcCount +1])*(process.mas[i,j]-process.mas[i,process.ProcCount+1]);
   process.SetValueMas(i,process.ProcCount,sds/process.ProcCount);
 end;
end;

procedure TFrmAnalysis.Dif_procClick(Sender: TObject);
var i:longint;
begin
  for i:=1 to (trunc(process.Time*process.Discretization)+1) do
  //mas[i-1,UnMain.Proc_count+3]:=mas[i-1,2]-mas[i-1,1];
  process.SetValueMas(i-1,process.ProcCount+3,process.mas[i-1,2]-process.mas[i-1,1]);
end;

procedure TFrmAnalysis.Button1Click(Sender: TObject);
begin
 Close;
end;

end.
