program hunger;
var
  a:array[0..1000,1..2] of integer;
  s:array[1..1000] of integer;
  i,j,k,b,max,len:integer;

begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);

  readln(b);
  for i:=1 to b do
    readln(a[i,1],a[i,2]);
  for j:=1 to b do
    for k:=j+1 to b do
      if a[j,2]>a[k,2]
      then begin
             a[0]:=a[j];
             a[j]:=a[k];
             a[k]:=a[0];
           end;

  fillchar(s,sizeof(s),0);
  for i:=1 to b do
  begin
    len:=a[i,2]-a[i,1]+1;
    s[i]:=len;
    for j:=1 to i-1 do
      if (a[i,1]>a[j,2]) and (s[i]<s[j]+len)
      then s[i]:=s[j]+len;
  end;

  max:=s[1];
  for i:=2 to b do
    if max<s[i]
    then max:=s[i];
  writeln(max);

  close(input);
  close(output);
end.