unit UnProcess;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, Menus, Grids, Gauges, UnDynamicFunction,
  ImgList, UnArray;
type
  TFrmProcess = class(TForm)
    PageControl1: TPageControl;
    Model: TTabSheet;
    BtnCreate: TButton;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Variables: TTabSheet;
    ParamGrid: TStringGrid;
    Parameters: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    BtnGeneration: TButton;
    Label2: TLabel;
    Label1: TLabel;
    Edit4: TEdit;
    Edit1: TEdit;
    Label7: TLabel;
    Label50: TLabel;
    Label13: TLabel;
    Edit9: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    ImageList1: TImageList;
    BtnFree: TButton;
    BtnGetModel: TButton;
    procedure BtnCreateClick(Sender: TObject);
    procedure Load_modelClick(Sender: TObject);
    procedure Save_modelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddParamClick(Sender: TObject);
    procedure DelParamClick(Sender: TObject);
    procedure BtnGenerationClick(Sender: TObject);
    procedure BtnFreeClick(Sender: TObject);
    procedure BtnGetModelClick(Sender: TObject);
  private   { Private declarations }
  public    { Public declarations  }
  end;
var
  FrmProcess:TFrmProcess;
  ParamCount:integer; // кол-во параметорв .
  accessory_parameter:double; // вспомогательный параметр .
  SimpleFunc:TSimpleFunc; // динамическая функция .

implementation
{$R *.dfm}
uses UnMain;

procedure TFrmProcess.BtnCreateClick(Sender: TObject);
begin
 process:=ClsProcess.Create;
 process.Discretization:=strtoint(Edit5.Text);
 process.Time:=strtofloat(Edit6.Text);
 process.ProcCount:=strtoint(Edit9.Text);
 process.SetLenMas(trunc(process.Time*process.Discretization)+1,process.ProcCount+4);
 process.InitialMeaning:=strtofloat(Edit1.Text);
 accessory_parameter:=strtofloat(Edit4.Text);
end;

procedure TFrmProcess.Load_modelClick(Sender: TObject);
begin
  If OpenDialog1.Execute then Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrmProcess.Save_modelClick(Sender: TObject);
begin
  If SaveDialog1.Execute then Memo1.Lines.SaveToFile(SaveDialog1.FileName+'.mdl');
end;

procedure TFrmProcess.FormCreate(Sender: TObject);
begin
 ParamGrid.Cells[0,0]:='      Переменная';
 ParamGrid.Cells[1,0]:='        Значение';
 ParamCount:=1;
end;

procedure TFrmProcess.AddParamClick(Sender: TObject);
begin
 paramgrid.RowCount:=paramgrid.RowCount+1;
 ParamCount:=ParamCount+1;
end;

procedure TFrmProcess.DelParamClick(Sender: TObject);
begin
 if paramgrid.RowCount = 2 then exit;
 paramgrid.RowCount:=paramgrid.RowCount-1;
 ParamCount:=ParamCount-1;
end;

procedure TFrmProcess.BtnGenerationClick(Sender: TObject);
begin
  process.GenerateProcess(SimpleFunc,accessory_parameter);
  FrmMain.Image1.Hint:=process.Description;
end;

procedure TFrmProcess.BtnFreeClick(Sender: TObject);
begin
 process.Free
end;

procedure TFrmProcess.BtnGetModelClick(Sender: TObject);
var  Memo_index:integer;
     Memo_text: TFText; // текст функции  .

    function  replace_param(str:string):string;
    const param_n='n';
          param_T='T';
          Hbook=['a'..'z'];
          Lbook=['A'..'Z'];
          digits=['0'..'9'];
    var s:string;
        sign:string;
        i,j:integer;
    begin
     s:='';
     sign:='';
     for i:=1 to length(str) do
     begin
       s:=s+str[i];
       if (str[i] in Hbook)or(str[i] in Lbook)or(str[i] in digits) then sign:=sign+str[i]
       else
       begin
         if sign = param_n then
         begin
           delete(s,length(s)-length(sign), length(sign)+1);
           s:=s+inttostr(strtoint(Edit5.Text))+str[i];
         end;
         if sign = param_T then
         begin
           delete(s,length(s)-length(sign), length(sign)+1);
           s:=s+floattostr(strtofloat(Edit6.Text))+str[i];
         end;
         for j:=1 to ParamCount do
         begin
           if (sign = FrmProcess.ParamGrid.Cells[0,j]) and
              (sign<>'') then
           begin
            delete(s,length(s)-length(sign), length(sign)+1);
            s:=s+FrmProcess.ParamGrid.Cells[1,j]+str[i];
            break;
           end;
         end;
         sign:='';
       end;
     end;
     replace_param:=s;
    end;
begin
 for Memo_index:=1 to FrmProcess.Memo1.Lines.Count do
 Memo_text[Memo_index-1]:=replace_param(FrmProcess.Memo1.Lines[Memo_index-1]);
 SimpleFunc.free;
 SimpleFunc:=TSimpleFunc.Create;
 SimpleFunc.CompilerPath:=ExtractFilePath(Application.ExeName)+ 'shell\';
 SimpleFunc.Text:=Memo_text;
 SimpleFunc.Text_Count:=FrmProcess.Memo1.Lines.Count;
 if not(SimpleFunc.Build) then showmessage('Не удалось создать модель!');
end;

end.
