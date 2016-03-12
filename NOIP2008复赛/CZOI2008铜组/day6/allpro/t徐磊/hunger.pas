var a:array[1..1000,1..3]of longint;
    ans,i,j,n:longint;
function max(a,b:longint):longint;
begin
  if a>b then max:=a
         else max:=b;
end;

begin
  assign(input,'hunger.in');reset(input);
  assign(output,'hunger.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[i,1],a[i,2]);
  a[1,3]:=a[1,2]-a[1,1]+1;
  for i:=2 to n do
  begin
    a[i,3]:=a[i,2]-a[i,1]+1;
    for j:=1 to i do
      if(a[j,2]<a[i,1])or(a[i,2]<a[j,1]) then a[i,3]:=max(a[i,3],a[j,3]+a[i,2]-a[i,1]+1);
  end;
  ans:=0;
  for i:=1 to n do
    ans:=max(ans,a[i,3]);
  writeln(ans);
  close(input);
  close(output);
end.
