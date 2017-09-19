unit UnArray;
interface
uses  Classes, SysUtils, Windows, UnDynamicFunction,  Forms;
type TMas = array of array of real;
ClsProcess = class (TPersistent)
  private
    FMas: TMas;     //  массив для хранения данных /
    FProcCount:integer; // количество серий процессов /
    FMemorySize:integer;  // выделенное место в памяти PC /
    FDescription:string;  // описание /
    FTime:extended;      // интервал времени /
    FInitialMeaning:extended;   // начальное значение процесса /
    FDiscretization:integer; // дискретность /
    procedure SetFProcCount(const Value: integer);
    procedure SetFTime(const Value: extended);
    procedure SetFInitialMeaning(const Value: extended);
    procedure SetFDiscretization(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    property Mas:TMas read FMas;
    property MemorySize:integer read FMemorySize;
    property Description:string read FDescription;
    property ProcCount: integer read FProcCount write SetFProcCount;
    property Time: extended read FTime write SetFTime;
    property InitialMeaning: extended read FInitialMeaning write SetFInitialMeaning;
    property Discretization: integer read FDiscretization write SetFDiscretization;
    procedure SetLenMas(RowCount:integer; ColCount:integer);
    procedure SetValueMas(i:integer; j:integer; value:real);
    procedure GenerateProcess(SimpleFunc:TSimpleFunc;accessory_parameter:double);
end;
implementation
Uses UnGauge;
constructor ClsProcess.Create;
begin
  inherited;
end;
destructor ClsProcess.Destroy;
begin
  inherited;
end;

procedure ClsProcess.SetLenMas(RowCount:integer; ColCount:integer);
begin
  FMemorySize:=AllocMemSize;
  setlength(FMas,RowCount,ColCount);
  FMemorySize:=AllocMemSize-FMemorySize;
  FDescription:=' Процесс Xt: ' + chr(13);
  FDescription:=FDescription+'   время : [0, ' +floattostr(FTime)+'] '+ chr(13);
  FDescription:=FDescription+'   дискретность: '+floattostr(FDiscretization)+' '+ chr(13);
  FDescription:=FDescription+'   количество серий: '+floattostr(FProcCount)+' '+ chr(13);
  FDescription:=FDescription+'   выделено памяти: '+inttostr(round(FMemorySize/1024))+'Kb ';
end;

procedure ClsProcess.SetValueMas(i:integer; j:integer; value:real);
begin
  FMas[i,j]:= value
end;

procedure ClsProcess.SetFProcCount(const Value: integer);
begin
  FProcCount := Value;
end;

procedure ClsProcess.SetFTime(const Value: extended);
begin
  FTime := Value;
end;

procedure ClsProcess.SetFInitialMeaning(const Value: extended);
begin
  FInitialMeaning := Value;
end;

procedure ClsProcess.SetFDiscretization(const Value: integer);
begin
  FDiscretization := Value;
end;

procedure ClsProcess.GenerateProcess(SimpleFunc:TSimpleFunc;accessory_parameter:double);
var i:integer;
    j:integer;
    x,y:real;
    k:double;
begin
  FrmGauge.show;
  for j:=1 to FProcCount do
  begin
     if j=1 then SetValueMas(0,0,0);
     SetValueMas(0,j, FInitialMeaning);
     y:=FInitialMeaning;
     k:=accessory_parameter;
     for i:=1 to trunc(FTime*FDiscretization) do
     begin
       x:=i/FDiscretization;
       y:=SimpleFunc.GetValue(y,k);
       if j=1 then SetValueMas(i,0,x);
       SetValueMas(i,j,y);
       FrmGauge.GaugeCurrent.Progress:=Round(100*i/FTime);
       FrmGauge.ProgressBar.Position:=FrmGauge.GaugeCurrent.Progress;
     end;
     FrmGauge.GaugeGlob.Progress:=Round(100*j/FProcCount);
  end;
  FrmGauge.Close;
end;

end.
