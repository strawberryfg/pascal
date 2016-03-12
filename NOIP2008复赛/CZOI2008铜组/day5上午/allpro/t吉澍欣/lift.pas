const p:array[1..2] of longint=(1,-1);
var i,sum,n,a,b,min:longint;
    l:array[1..200] of longint;
procedure try(dep:longint);
var i,t:longint;
begin
if sum>n then begin writeln('-1');close(input);close(output);halt;end;
if dep=b then begin if sum<min then min:=sum;end
         else for i:=1 to 2 do
              begin
              t:=dep+p[i]*l[dep];
              if (t<=n)and(t>=1)
                 then begin inc(sum);try(t);end;
              end;
dec(sum);
end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
for i:=1 to n do
    read(l[i]);
min:=maxlongint;
try(1);
if min=maxlongint then writeln('-1') else writeln(min);
close(input);
close(output);
end.
