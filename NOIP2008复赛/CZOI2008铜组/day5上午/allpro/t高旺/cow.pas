type atype=array[0..50]of integer;
var a,b,c,ans:atype;
    i,n,j:longint;
    
procedure bl(var w:atype);
var k:longint;
begin
  for k:=1 to 50 do w[k]:=0;
end;
    
function plus(a,b:atype):atype;
var i,jw,temp:longint;
begin
  for i:=0 to 50 do plus[i]:=0;
  for i:=1 to 50 do
    plus[i]:=a[i]+b[i];
  jw:=0;
  for i:=1 to 50 do
  begin
    temp:=plus[i]+jw;
    jw:=temp div 10;
    plus[i]:=temp mod 10;
  end;
end;

begin
  assign(input,'cow.in');reset(input);
  assign(output,'cow.out');rewrite(output);
  bl(a);bl(b);bl(c);bl(ans);
  readln(n);
  a[1]:=1;
  b[1]:=1;
  c[1]:=1;
  for i:=2 to n do
  begin
    ans:=plus(a,c);
    a:=b;
    b:=c;
    c:=ans;
  end;
  i:=50;
  while a[i]=0 do dec(i);
  for j:=i downto 1 do
    write(a[j]);
  writeln;
  close(input);close(output);
end.
