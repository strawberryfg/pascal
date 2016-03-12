var a:array[1..30]of longint;
    b:array[1..30]of boolean;
    n,m,i,temp:longint;
begin
  assign(input,'stair.in');reset(input);
  assign(output,'stair.out');rewrite(output);
  readln(n);
  readln(m);
  fillchar(a,sizeof(a),0);
  fillchar(b,sizeof(b),true);
  for i:=1 to m do
  begin
    readln(temp);
    b[temp]:=false;
  end;
  if b[1]then a[1]:=1;
  if b[2]then a[2]:=2;
  if b[3]then a[3]:=4;
  for i:=4 to n do
    if b[i] then a[i]:=a[i-1]+a[i-2]+a[i-3];
  writeln(a[n]);
  close(input);
  close(output);
end.
