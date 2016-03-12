type atype=array[0..1000,0..1000]of integer;
var a:atype;
    i,j,m,n,total,s,x:longint;

procedure paiduan(a:atype;i,j:longint);
begin
  if a[i-1,j]<>0 then paiduan(a,i-1,j);
  if a[i+1,j]<>0 then paiduan(a,i+1,j);
  if a[i,j-1]<>0 then paiduan(a,i,j-1);
  if a[i,j+1]<>0 then paiduan(a,i,j+1);
  a[i,j]:=0;
end;

begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);
  read(n,m);
  total:=0;
  for i:=1 to n do
    for j:=1 to m do
      read(a[i,j]);
  for i:=1 to n do
    for j:=1 to m do
    begin
    s:=i;
    x:=j;
  if a[s,x]<>0
  then begin
         inc(total);
         paiduan(a,s,x);
       end;
  end;
  write(total);
  close(input);
  close(output);
end.
