program stair;
var
  a,b:array[1..30] of longint;
  n,m,i,x:longint;

begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);

  readln(n);
  readln(m);
  fillchar(a,sizeof(a),0);
  for i:=1 to m do
  begin
    readln(x);
    a[x]:=1;
  end;
  fillchar(b,sizeof(b),0);
  if a[1]=0
  then b[1]:=1;
  if a[2]=0
  then b[2]:=b[1]+1;
  if a[3]=0
  then b[3]:=b[1]+b[2]+1;
  for i:=4 to n do
    if a[i]=0
    then b[i]:=b[i-1]+b[i-2]+b[i-3];
  writeln(b[n]);

  close(input);
  close(output);
end.