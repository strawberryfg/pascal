program base(input,output);
type arr=array[1..35] of boolean;
var a:arr;
    total,m,n,x,y,num,i,j,s:longint;

procedure del(var a:arr);
var i:integer;
begin
  for i:=1 to 35 do
    a[i]:=false;
end;

function cf(z:longint):longint;
begin
  cf:=1;
  for i:=1 to z-1 do
    cf:=cf*10;
end;

function hw(num:longint):boolean;
var i,str,len:longint;
begin
  hw:=false;
  len:=1;
  while num>10 do
  begin
    num:=num div 10;
    len:=len+1;
  end;
  i:=1;
  str:=0;
  while num>10 do
  begin
    str:=str+(num mod 10)*cf(len-i+1);
    num:=num div 10;
    i:=i+1;
  end;
  str:=str+num;
  if num=str then hw:=true;
end;

function zh(num,t:longint):longint;
var a:array[1..100000] of integer;
    i,n:longint;
begin
  if t=10 then zh:=num;
  for i:=1 to 100000 do
    a[i]:=0;
  zh:=0;
  i:=1;
  n:=1;
  while num>t do
  begin
    a[i]:=num mod t;
    num:=num div t;
    n:=n+1;
  end;
  for i:=1 to n do
    zh:=zh+a[i]*cf(i-1);
end;

begin
  assign(input,'base.in');
  reset(input);
  assign(output,'base.out');
  rewrite(output);
  readln(m,n,x,y);
  total:=0;
  for i:=trunc(sqrt(m)) to trunc(sqrt(n)) do
  begin
    s:=0;
    for j:=x to y do
      if hw(zh(i*i,j)) then begin
                              s:=s+1;
                              if s>1 then break;
                            end;
    if s=1 then total:=total+1;
  end;
  writeln(total);
  close(input);
  close(output);
end.
