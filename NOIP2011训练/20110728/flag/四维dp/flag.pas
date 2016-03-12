const maxn=21; maxm=42;
var n,m,ans:longint;
    f:array[0..maxn,0..maxn,0..maxm,1..2]of longint;
function calc(i,j,k,l:longint):longint;
var t1,t2:longint;
begin
if (i<0)or(j<0)or(k<0) then exit(0);                //actually it does not matter;
if ((i=1)and(j=0))or((i=0)and(j=1)) then
    begin
    if k<>0 then exit(0) else exit(1);              //the first flag  only one flag if k<>0 then exit(0) else exit(1);
    end;
if f[i,j,k,l]<>0 then exit(f[i,j,k,l]);             //memory
if l=2 then
   begin
   t1:=0;
   if (j-1>0) then t1:=calc(i,j-1,k,2);             //22   j-1>0
   t2:=0;
   if (i>0) then t2:=calc(i,j-1,k-1,1);             //12   i>0
   f[i,j,k,l]:=t1+t2;
   exit(f[i,j,k,l]);
   end
else
   begin
   t1:=0;
   if (i-1>0) then t1:=calc(i-1,j,k,1);             //11   i-1>0
   t2:=0;
   if (j>0) then t2:=calc(i-1,j,k-1,2);             //21   j>0
   f[i,j,k,l]:=t1+t2;
   exit(f[i,j,k,l]);
   end;
end;
begin
assign(input,'flag.in');
reset(input);
assign(output,'flag.out');
rewrite(output);
readln(n,m);
ans:=calc(n,n,m,1)+calc(n,n,m,2);
writeln(ans);
close(input);
close(output);
end.