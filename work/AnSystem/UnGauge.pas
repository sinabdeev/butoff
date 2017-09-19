unit UnGauge;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Gauges, ExtCtrls;
type
  TFrmGauge = class(TForm)
      ProgressBar: TProgressBar;
      GaugeGlob: TGauge;
      GaugeCurrent: TGauge;
    private    { Private declarations }
    public     { Public declarations }
  end;
var  FrmGauge: TFrmGauge;
implementation
{$R *.dfm}
end.
