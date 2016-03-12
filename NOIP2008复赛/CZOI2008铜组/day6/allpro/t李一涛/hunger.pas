var a:array[1..1000,1..3]of integer;
    i,j,b,s:integer;
function max(i,j:integer):integer;
begin
  if i>j then max:=i else max:=j;
end;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(b); s:=0;
  for i:=1 to b do begin readln(a[i,1],a[i,2]); a[i,3]:=a[i,2]-a[i,1]+1; end;
  for i:=1 to b do
    for j:=1 to i do if (a[i,1]>a[j,2])or(a[i,3]-a[j,2]+a[j,1]>a[j,3])
    then s:=s+max(a[i,3],a[i,3]-a[j,2]+a[j,1]);
  writeln(s+a[1,3]);
  close(input); close(output);
end.