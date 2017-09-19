unit UnData;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;
type
  TFrmData = class(TForm)
    GroupBoxSave: TGroupBox;
    Label1: TLabel;
    B_Save: TButton;
    LevelEdit: TSpinEdit;
    GroupBox1: TGroupBox;
    BtnLoad: TButton;
    procedure B_SaveClick(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmData: TFrmData;
implementation
{$R *.dfm}
uses UnMain,  UnArithmFun;


procedure TFrmData.B_SaveClick(Sender: TObject);
const  F_NAME: string = '\process\posl.txt';
var  SourceFile: TextFile;
     exepath:string;
     i,j:integer;
      Level:integer;
begin
  exepath:= ExtractFilePath(Application.ExeName);
  AssignFile(SourceFile, exepath+F_NAME);
  Rewrite(SourceFile);
  Writeln(SourceFile, floattostr( process.Time));
  Level:= strtoint(LevelEdit.Text);
  for i:=1 to process.ProcCount do
  begin
    for j:=1 to process.ProcCount do
      Writeln(SourceFile, floattostr( RoundToN(process.mas[j-1,0],Level) )+'#'+floattostr( RoundToN(process.mas[j-1,i],Level) )        );
    Writeln(SourceFile, '*');
  end;
  CloseFile(SourceFile);
end;

procedure TFrmData.BtnLoadClick(Sender: TObject);
const  F_NAME: string = '\process\posl.txt';
var    ti,ti_buf,c,i,j:integer;
       x_file,y_file:real;
       x_str_file,y_str_file:string;
       exepath:string;
       F: TextFile;
       S: string;

begin
    exepath:= ExtractFilePath(Application.ExeName);
    AssignFile(F, exepath+F_NAME);
    Reset(F);
    Readln(F, S);
    process.Time:=strtofloat(s);
    Readln(F, S);
    ti:=1;
    c:=1;
    while not Eof(F) do
    begin
       Readln(F, S);
       if s='*' then
       begin
         Readln(F, S);
         ti_buf:=ti;
         ti:=1;
         if not Eof(F) then c:=c+1;
       end;
       ti:=ti+1;
    end;
    CloseFile(F);
    process.Discretization:=round(ti_buf-1/process.Time);
    process.ProcCount:=c;

    //SetLength(mas,Pixel_count,Proc_count+4);
    process.SetLenMas((trunc(process.Time*process.Discretization)+1),process.ProcCount+4);

    Reset(F);
    Readln(F, S);
    Readln(F, S);
    i:=0;
    j:=1;
    while not Eof(F) do
    begin
       x_str_file:=copy(s,1,pos('#',s)-1);
       y_str_file:=copy(s,pos('#',s)+1,length(s)-length(x_str_file)-1);
       x_file:=strtofloat(x_str_file);
       y_file:=strtofloat(y_str_file);
       //mas[i,0]:=x_file;
       process.SetValueMas(i,0,x_file);
       //mas[i,j]:=y_file;
       process.SetValueMas(i,j,y_file);
       Readln(F, S);
       if s='*' then
       begin
         i:=0;
         j:=j+1;
         if not Eof(F) then Readln(F, S);
       end;
       i:=i+1;
    end;
    CloseFile(F);

end;

end.
