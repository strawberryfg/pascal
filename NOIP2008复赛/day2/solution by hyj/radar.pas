var i,j,k:longint;
    a,b,c,tot,out:longint;
    num:array[1..1000]of longint;
procedure setup;
begin
  assign(input,'radar.in');
  reset(input);
  assign(output,'radar.out');
  rewrite(output);
end;
procedure endit;
begin
  close(input);
  close(output);
end;
begin
  setup;
  readln(a,b,c);
  for i:=1 to c do
    read(num[i]);
  for i:=1 to c do
    if (num[i]>b) or (num[i]<a)
        then inc(out)
        else inc(tot,num[i]);
  if (out/c)-0.1>1e-9 then writeln('0.0')
                      else writeln(tot/(c-out):0:4);
  endit;
end.
