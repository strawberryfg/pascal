var a:array[1..1000]of longint;
    b,start,stop,t:longint;
    j,k,i,s:integer;
begin
  readln(b);
  for j:=2 to b+1 do
  readln(start,stop);
  for j:=1 to b do
  k:=stop-start;
  for i:=1 to b-1 do
  for k:=i+1 to b do
  begin
    if a[i]<a[k] then begin
                      t:=a[k];
                      a[k]:=a[i];
                      a[i]:=t;
                      end;
  end;
  if start<>stop then for i:=1 to b do
  s:=a[i]+a[i+1];
  writeln(s);
  readln;
end.
