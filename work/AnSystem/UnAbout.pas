unit UnAbout;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TFrmAbout = class(TForm)
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmAbout: TFrmAbout;
implementation
{$R *.dfm}
procedure TFrmAbout.FormShow(Sender: TObject);
begin
  Label1.Caption:='Copyright '+chr(169)+' 2002-2006 VitaliSoft, Inc'+chr(13)+
  'v5.2 - Jan 2006                     '+chr(13)+
  'Visit http://www.vitali-planet.narod.ru for updates'+chr(13)+
  'ICQ: 333377603     ';
end;
end.
