type typ=array[0..20]of longint;
     typ1=array[0..100,0..100]of integer;
var i,j,n,fmin,x,y:longint;
    a,b,c,d,final,belong:array[1..20]of longint;
    finish,res:typ;
    mark:typ1;
function ok(i:longint;finish:typ):boolean;
var be,en,line,j,t:longint;
begin
be:=b[i]; en:=d[i]; line:=a[i];
j:=be;
while j<=en do
      begin
      t:=mark[a[i],j];
      if finish[t]=0 then exit(false);
      t:=d[t]+1;
      j:=t;
      end;
exit(true);
end;
procedure try(dep,step,lastc:longint;finish:typ);
var i,j,t:longint;
    tmp:typ;
begin
if step>fmin then exit;
if dep=n then
   begin
   if step<fmin then
      fmin:=step;
   exit;
   end;
tmp:=finish;
for i:=1 to n do
    begin
    finish:=tmp;
    if finish[i]=1 then continue;
    if (ok(i,finish))or(a[i]=0) then
       begin
       t:=belong[i];
       finish[i]:=1;
       res[dep]:=i;
       if lastc=t then try(dep+1,step,lastc,finish)
          else try(dep+1,step+1,t,finish);
       res[dep]:=0;
       end;
    end;
end;
begin
assign(input,'paint.in');
reset(input);
assign(output,'paint.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a[i],b[i],c[i],d[i],final[i]);
    if c[i]>x then x:=c[i];
    if d[i]>y then y:=d[i];
    belong[i]:=final[i];
    for j:=b[i] to d[i] do begin mark[c[i],j]:=i; end;
    end;
fmin:=maxlongint;
try(0,0,0,finish);
writeln(fmin);
close(input);
close(output);
end.
