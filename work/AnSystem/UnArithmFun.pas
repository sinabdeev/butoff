unit UnArithmFun;

interface
function RoundToN(x:real; N:integer):real;

implementation
function RoundToN(x:real; N:integer):real;
var i:integer;
    round_buf:real;
    multi:integer;
begin
  multi:=1;
  for i:=1 to N do multi:=multi*10;
  round_buf:=round(x*multi);
  RoundToN:= round_buf/ multi;
end;
end.
