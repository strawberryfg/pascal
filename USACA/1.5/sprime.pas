{
ID: xiaweiy1
PROG: sprime
LANG: PASCAL
}
const shou:array[1..4]of integer=(2,3,5,7);
      spe:array[1..4]of integer=(1,3,7,9);
var n,i,tot:longint;
    v:array[1..8]of longint;
    c:array[1..1000]of longint;
function pd(t:longint):boolean;
var i:longint;
begin
pd:=true;
for i:=2 to trunc(sqrt(t)) do if t mod i=0 then begin pd:=false;exit; end;
end;
procedure pro(dep:longint);
var i,j,k:longint;
begin
if dep>n then begin inc(tot);for i:=1 to n do c[tot]:=c[tot]*10+v[i];exit; end;
if dep=1 then for i:=1 to 4 do
                  begin
                  v[1]:=shou[i];
                  pro(dep+1);
                  v[1]:=0;
                  end
         else for i:=1 to 4 do
                  begin
                  v[dep]:=spe[i];
                  k:=0;
                  for j:=1 to dep do k:=k*10+v[j];
                  if pd(k)=true then pro(dep+1);
                  v[dep]:=0;
                  end;
end;
begin
assign(input,'sprime.in');
reset(input);
assign(output,'sprime.out');
rewrite(output);
readln(n);
pro(1);
for i:=1 to tot do writeln(c[i]);
close(input);
close(output);
end.
