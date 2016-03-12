{
ID: xiaweiy1
PROG: dualpal
LANG: PASCAL
}
var total,t,n,k,s,i,j,l,m,b:longint;
    p,final,tmp,q:string;
    a:array[1..15,2..10]of boolean;
begin
assign(input,'dualpal.in');
reset(input);
assign(output,'dualpal.out');
rewrite(output);
readln(n,s);
i:=s+1;
total:=1;
repeat
begin
for j:=2 to 10 do
    begin
    t:=0;
    p:='';
    k:=i;
    q:='';
    while k div j<>0 do
          begin
          str(k mod j,tmp);
          p:=tmp+p;
          k:=k div j;
          end;
    str(k,tmp);
    p:=tmp+p;
    for m:=length(p) downto 1 do
        q:=q+p[m];
    if q=p then a[total,j]:=true else a[total,j]:=false;
    end;
for l:=2 to 10 do
    if a[total,l]=true then inc(t);
if t>=2 then begin
             inc(total);
             writeln(i);
             end;
inc(i);
end;
until total-1=n;
end.