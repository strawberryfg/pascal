const x=1000;
      y=2000;
var b,i,j,k,l:longint;
    a:array[0..x,1..2] of longint;
    c:array[0..y] of longint;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(b);
  for i:=1 to b do read(a[i,1],a[i,2]);
  for i:=1 to b-1 do
  for j:=i+1 to b do
  if a[i,1]>a[j,1] then begin
                          a[0]:=a[i];
                          a[i]:=a[j];
                          a[j]:=a[0];
                        end;
  fillchar(c,sizeof(c),0);
  for i:=1 to b do
  begin
    k:=0;
    for j:=0 to a[i,1]-1 do if c[j]>k then k:=c[j];
    l:=k+a[i,2]-a[i,1]+1;
    if l>c[a[i,2]] then c[a[i,2]]:=l;
  end;
  k:=0;
  for j:=0 to y do
  if c[j]>k then k:=c[j];
  writeln(k);
  close(input);
  close(output);
end.