type arr=array[0..50]of integer;
var a,b,c,ans:arr;
    i,n,j:longint;
function plus(a,b:arr):arr;
var i,jw,temp:longint;
begin
  fillchar(plus,sizeof(plus),0);
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
  fillchar(a,sizeof(a),0);
  fillchar(b,sizeof(b),0);
  fillchar(c,sizeof(c),0);
  fillchar(ans,sizeof(ans),0);
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
