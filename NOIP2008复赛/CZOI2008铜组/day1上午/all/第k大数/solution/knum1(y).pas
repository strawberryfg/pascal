program knum;
var
  a:array[-40000..40000] of longint;
  n,k,i,t,x:longint;

begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);

  readln(n,k);
  fillchar(a,sizeof(a),0);
  for i:=1 to n do
  begin
    readln(x);
    inc(a[x]);
  end;
  t:=0;
  i:=40000;
  while t<k do
  begin
    dec(i);
    t:=t+a[i];
  end;
  writeln(i);

  close(input);
  close(output);
end.