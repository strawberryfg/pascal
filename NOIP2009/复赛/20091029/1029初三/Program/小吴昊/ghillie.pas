var n,i,t,m,j,k,ls:longint;
    a,x,b:array[1..2000] of longint;
function cf(a,b:longint):longint;
var i,j:longint;
    p:array[1..3] of longint;
begin
  cf:=0;
  i:=0;
  fillchar(p,sizeof(p),0);
  while a<>0 do
    begin
    inc(i);
    p[i]:=a mod 10;
    a:=a div 10;
    end;
  for i:=1 to 3 do
    begin
      t:=1;
      for j:=1 to b do
        t:=t*p[i];
      cf:=cf+t;
    end;
end;

begin
  assign(input,'ghillie.in');
  assign(output,'ghillie.out');
  reset(input);
  rewrite(output);
  readln(n);
  i:=0;
  while not eof do
    begin
      inc(i);
      read(a[i]);
    end;
  m:=i-1;
  for i:=1 to n do
    begin
      for j:=1 to m do
        x[j]:=cf(a[j],i+1);
      for j:=1 to m-1 do
        for k:=1 to m do
          if a[j]=x[k] then
             begin
               a[j]:=-1;
             end;
      fillchar(x,sizeof(x),0);
      for j:=1 to m-1 do
        for k:=j+1 to m do
          if a[j]<a[k] then begin t:=a[j];a[j]:=a[k];a[k]:=t end;
      t:=1;
      while a[t]<>-1 do
        inc(t);
      m:=t-1;
    end;
  for i:=m downto 2 do
    write(a[i],' ');
  writeln(a[1]);
  close(input);
  close(output);
end.
