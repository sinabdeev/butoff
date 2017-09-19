program ProjectModule;

uses
  Forms,
  UnitModule in 'UnitModule.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Module';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
