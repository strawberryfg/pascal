const maxn=50000;
var n1,n2,j1,j2,i,sum:longint;
procedure try(dep:longint);
var j,a,y,k,l:longint;
    we:array[1..maxn] of longint;
begin
if dep<=n2 then begin
                a:=0;
                if (trunc(sqrt(dep)))*(trunc(sqrt(dep)))=dep then
                   for j:=j1 to j2 do
                       begin
                       inc(a);
                       y:=dep; k:=0;
                       while y>0 do
                             begin
                             inc(k);
                             we[k]:=y mod j;
                             y:=y div j;
                             end;
                       for l:=1 to k div 2 do
                           if we[l]<>we[k-l+1] then begin dec(a);break;end;
                       end;
                if a=1 then sum:=sum+1;
                end;
try(dep+1);
end;
begin
assign(input,'base.in');
assign(output,'base.out');
reset(input);
rewrite(output);
readln(n1,n2,j1,j2);
sum:=0;
try(n1);
writeln(sum);
close(input);
close(output);
end.
