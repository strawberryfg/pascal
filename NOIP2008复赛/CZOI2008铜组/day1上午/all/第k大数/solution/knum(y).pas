program knum;
var
  a:array[1..10000] of longint;
  n,k,i:longint;

procedure qsort(s,t:longint);
var
  i ,j,temp,x:longint;
begin
  i:=s;
  j:=t;
  temp:=a[s];
  while i<j do
  begin
    while (i<j) and (a[j]<=temp) do
      dec(j);
    if i<j
    then begin
           x:=a[i];
           a[i]:=a[j];
           a[j]:=x;
           inc(i);
         end;
    while (i<j) and (a[i]>=temp) do
      inc(i);
    if i<j
    then begin
           x:=a[i];
           a[i]:=a[j];
           a[j]:=x;
           dec(j);
         end;
  end;
  if s<j
  then qsort(s,j-1);
  if j<t
  then qsort(j+1,t);
end;

begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);

  readln(n,k);
  for i:=1 to n do
    readln(a[i]);
  qsort(1,n);
  writeln(a[k]);

  close(input);
  close(output);
end.