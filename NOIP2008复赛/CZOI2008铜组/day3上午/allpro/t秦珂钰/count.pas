program count(input,output);
var n,i,j:longint;
    a:array[1..10000000] of longint;
    b:array[0..9] of longint;
    s:string;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    a[i]:=i;
  for i:=0 to 9 do
    b[i]:=0;
  for i:=1 to n do
  begin
    str(a[i],s);
    for j:=1 to length(s) do
      inc(b[ord(s[j])-48])
  end;
  for i:=0 to 9 do
    writeln(b[i]);
  close(input);
  close(output);
end.