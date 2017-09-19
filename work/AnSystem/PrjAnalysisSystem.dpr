program PrjAnalysisSystem;
uses
  SysUtils,
  Graphics,
  Forms,
  UnDynamicFunction in 'UnDynamicFunction.pas',
  UnArray in 'UnArray.pas',
  UnMain in 'UnMain.pas' {FrmMain},
  UnProcess in 'UnProcess.pas' {FrmProcess},
  UnAnalysis in 'UnAnalysis.pas' {FrmAnalysis},
  UnData in 'UnData.pas' {FrmData},
  UnVisual in 'UnVisual.pas' {FrmVisual},
  UnOptions in 'UnOptions.pas' {FrmOptions},
  UnAbout in 'UnAbout.pas' {FrmAbout},
  UnArithmFun in 'UnArithmFun.pas',
  UnGauge in 'UnGauge.pas' {FrmGauge};

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmProcess, FrmProcess);
  Application.CreateForm(TFrmVisual, FrmVisual);
  Application.CreateForm(TFrmAnalysis, FrmAnalysis);
  Application.CreateForm(TFrmData, FrmData);
  Application.CreateForm(TFrmOptions, FrmOptions);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(TFrmGauge, FrmGauge);
  Application.Run;
end.
