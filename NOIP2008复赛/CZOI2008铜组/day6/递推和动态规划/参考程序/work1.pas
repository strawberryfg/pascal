program ex;
var
  n,m,i,ans:longint;
  a,e:array [1..100] of longint;

begin
  assign(input,'work1.in');
  reset(input);
  assign(output,'work1.out');
  rewrite(output);

  read(n,m);
  for i:=1 to m do
  begin
    read(ans);
    e[ans]:=1;
  end;
  fillchar(a,sizeof(a),0);
  if e[1]=0
  then a[1]:=1;
  if e[2]=0
  then a[2]:=a[1]+1;
  if e[3]=0
  then a[3]:=a[1]+a[2]+1;
  for i:=4 to n do
    if e[i]=0
    then a[i]:=a[i-1]+a[i-2]+a[i-3];
  writeln(a[n]);

  close(input);
  close(output);
end.
