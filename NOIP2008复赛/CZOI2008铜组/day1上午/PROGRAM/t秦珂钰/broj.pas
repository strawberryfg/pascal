program broj(input,output);
var len,t,num,i:longint;
    sum:int64;

function cf(j:longint):longint;
var cj:longint;
begin
  cj:=1;
  for i:=1 to j do
    cj:=cj*10;
  cf:=cj;
end;

begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(num);
  i:=num;
  len:=1;
  while i>10 do
  begin
    i:=i div 10;
    len:=len+1;
  end;
  sum:=0;
  while len>0 do
  begin
    t:=num-cf(len-1)+1;
    sum:=sum+t*len;
    num:=num-t;
    len:=len-1;
  end;
  writeln(sum);
  close(input);
  close(output);
end.