{
ID: xiaweiy1
PROG: milk
LANG: PASCAL
}
const maxn=5000;
type arr=array[1..maxn]of longint;
var i,j,n,m,max,q:longint;
    p,a,b:arr;
procedure print;
var i,total:longint;
begin
total:=0;
for i:=1 to m do
    begin
    total:=total+p[i]*b[i];
    if (i<m)and(total>max)and(max<>0) then break;
    end;
if (max=0)or(total<max) then max:=total;
end;
procedure try(dep:longint);
var i,j,s:longint;
begin
s:=0;
if dep>m then print
         else begin
              for j:=0 to a[dep] do
                  begin
                  if dep=m then break;
                  b[dep]:=j;
                  try(dep+1);
                  end;
              if dep=m then begin
                            for i:=1 to dep-1 do
                                s:=s+b[i];
                            if ((n-s)<=a[dep])and(n-s>=0) then begin b[dep]:=n-s;try(dep+1);end;
                            end
                       else try(dep+1);
              end;
end;
begin
assign(input,'milk.in');
reset(input);
assign(output,'milk.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    readln(p[i],a[i]);
q:=1;
for i:=1 to m do
    if (a[i]=n) then begin if (q=1)or(p[i]*a[i]<max) then begin max:=p[i]*a[i];end;
                                  inc(q); end;
if q>1 then begin writeln(max);close(input);close(output);exit;end
       else if m<>0 then try(1);
writeln(max);
close(input);
close(output);
end.