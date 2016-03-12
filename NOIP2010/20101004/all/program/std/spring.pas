program spring;
var i,j,n,m,min:longint;
    past:array[0..50]of boolean;
    a:array[0..50,0..50]of longint;
procedure dfs(q,k,s:longint);
 var i,j:longint;
 begin
  if s>=min then exit;
  if k=0 then
  begin
   if s<min then min:=s;
   exit;
  end;
  for i:=q+1 to n-1 do
   if not past[i] then
    for j:=i+1 to n do
     if not past[j] then
     begin
       past[i]:=true;
       past[j]:=true;
       dfs(i,k-2,s+a[i,j]);
       past[i]:=false;
       past[j]:=false;
     end;
  end;
begin
   assign(input,'spring.in');reset(input);
   assign(output,'spring.out');rewrite(output);
   readln(n);
   for i:=1 to n do
    for j:=1 to n do
    read(a[i,j]);
   fillchar(past,sizeof(past),#0);
   min:=100000000;
   dfs(0,n,0);
   writeln(min);
   close(input);close(output);
end.
