unit UnDynamicFunction;
interface
uses  Classes, SysUtils, Windows;
const
  LIBRARY_NAME: string = 'dynamicfunction';
  SOURCE_LIBRARY_NAME: string = 'dynamicfunction.pas';
  BIN_LIBRARY_NAME: string = 'dynamicfunction.dll';
  FUNCTION_NAME: string = 'F';
type
TFunc = function(x: double; var k:double): double;
TFText = array[0..99] of string;
TSimpleFunc = class (TPersistent)
  private
    FCompilerPath: string;
    FText:TFText;
    FText_Count:integer;
    FLibrary: THandle;
    FFunc: TFunc;
    procedure SetFText(const Value: TFText);
    procedure SetFText_Count(const Value: integer);
    procedure SetCompilerPath(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Text: TFText read FText write SetFText;
    property Text_Count: integer read FText_Count write SetFText_Count;
    property CompilerPath: string read FCompilerPath write SetCompilerPath;
    function Build: boolean;
    function GetValue(x: double; var k:double): double;
end;
implementation
Function LaunchAndWaitThemReturn(Command: String):Word;
var
  Si:TStartupInfo;
  Pi:TProcessInformation;
begin
  ZeroMemory(@Si, SizeOf(Si));
  with Si do
   begin
    cb := SizeOf(Si);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow:=SW_HIDE;
   end;
  if CreateProcess(Nil, PChar(Command), Nil, Nil, True,
                   CREATE_NEW_PROCESS_GROUP, Nil, Nil, Si, Pi)
    then
     begin
      CloseHandle(Pi.hThread);
      WaitForSingleObject(Pi.hProcess, INFINITE);
      CloseHandle(Pi.hProcess);
      Result:=0;
     end
      else Result:=107;
end;

function TSimpleFunc.Build: boolean;
var
  SourceFile: TextFile;
  TmpStr: string;
  i:integer;
begin
  Result := true;
  FreeLibrary(FLibrary);
  try
    DeleteFile(PChar(FCompilerPath + SOURCE_LIBRARY_NAME));
    DeleteFile(PChar(FCompilerPath + BIN_LIBRARY_NAME));
    try
      AssignFile(SourceFile, FCompilerPath + SOURCE_LIBRARY_NAME);
      Rewrite(SourceFile);
      Writeln(SourceFile, 'library ' + LIBRARY_NAME + ';');
      Writeln(SourceFile, ' ');
      Writeln(SourceFile, 'Function ' + FUNCTION_NAME + '(x: double; var k:double):double;');
      Writeln(SourceFile, ' ');
      Writeln(SourceFile, ' function  dWiner(n:integer):real;');
      Writeln(SourceFile, ' var dx:integer;');
      Writeln(SourceFile, ' begin');
      Writeln(SourceFile, '   if random < 1/2 then dx:=1 else dx:=-1;');
      Writeln(SourceFile, '   dWiner:=dx/sqrt(n);');
      Writeln(SourceFile, ' end;');
      Writeln(SourceFile, ' ');
      Writeln(SourceFile, ' function  dPoisson(a:integer; n:integer):integer;');
      Writeln(SourceFile, ' var dx:integer;');
      Writeln(SourceFile, ' begin');
      Writeln(SourceFile, '   if random < a/n then dx:=1 else dx:=0;');
      Writeln(SourceFile, '   dPoisson:=dx;');
      Writeln(SourceFile, ' end;');
      Writeln(SourceFile, ' ');
      for i:=1 to FText_Count do Writeln(SourceFile, FText[i-1]);
      Writeln(SourceFile, 'Exports');
      Writeln(SourceFile, '  ' + FUNCTION_NAME + ';');
      Writeln(SourceFile, '');
      Writeln(SourceFile, 'begin');
      Writeln(SourceFile, 'end.');
    finally
      CloseFile(SourceFile);
    end;
  except
  end;
  TmpStr := GetCurrentDir;
  ChDir(FCompilerPath);
  if FileExists(FCompilerPath + SOURCE_LIBRARY_NAME) then
    begin
      LaunchAndWaitThemReturn(PChar(FCompilerPath + 'servis.exe ' +
                              FCompilerPath + SOURCE_LIBRARY_NAME));
    end
      else
        Result := false;
  ChDir(TmpStr);
  DeleteFile(PChar(FCompilerPath + SOURCE_LIBRARY_NAME));
  If FileExists(FCompilerPath + BIN_LIBRARY_NAME) then
    begin
      FLibrary := LoadLibrary(PChar(FCompilerPath + BIN_LIBRARY_NAME));
      FFunc := GetProcAddress(FLibrary, PChar(FUNCTION_NAME));
      if @FFunc = nil then
        Result := False;
    end
      else
        Result := False;
end;

constructor TSimpleFunc.Create;
begin
  inherited;
  randomize;
end;
destructor TSimpleFunc.Destroy;
begin
  FreeLibrary(FLibrary);
  FFunc := nil;
  inherited;
end;
function TSimpleFunc.GetValue(x: double; var k:double): double;
begin
  Result := FFunc(x,k);
end;

procedure TSimpleFunc.SetCompilerPath(const Value: string);
begin
  FCompilerPath := Value;
end;

procedure TSimpleFunc.SetFText(const Value: TFText);
begin
  FText := Value;
end;

procedure TSimpleFunc.SetFText_Count(const Value: integer);
begin
  FText_Count := Value;
end;

end.
