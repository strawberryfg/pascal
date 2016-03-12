{
ID: xiaweiy1
PROG: nocows
LANG: PASCAL
}
var n,k,m,i,j,l,p,q,down1,up1,down2,up2:longint;
    two:array[0..8]of integer;
    f:array[1..200,0..100]of longint;
function choose(n,dowhat:longint):longint;
var i:longint;
begin
if n=1 then exit(1);
if dowhat=1 then
   begin
   for i:=0 to 7 do
       if (n>two[i])and(n<=two[i+1]) then exit(i+2)
   end
else
  exit((n+1)div 2);
end;
procedure work(ta,cen1,tb,cen2,nownum,nowcen:longint);
var t:longint;
begin
t:=f[ta,cen1]*f[tb,cen2];
t:=t mod 9901;
inc(t,f[nownum,nowcen]);
t:=t mod 9901;
f[nownum,nowcen]:=t;
end;
begin
assign(input,'nocows.in');
reset(input);
assign(output,'nocows.out');
rewrite(output);
readln(n,k);
f[1,1]:=1;
f[3,2]:=1;
f[5,3]:=2;
if f[n,k]<>0 then begin writeln(f[n,k]);close(input);close(output);halt; end;
two[0]:=1;
for i:=1 to 8 do
    two[i]:=two[i-1] shl 1;
for i:=1 to 8 do
    inc(two[i],two[i-1]);
for i:=7 to n do
 begin
if i mod 2=0 then continue;
  for j:=1 to i-2 do
    begin
    if j mod 2=0 then continue;
    if i-j-1 mod 2=0 then continue;
    down1:=choose(j,1); down2:=choose(i-j-1,1);  up1:=choose(j,2); up2:=choose(i-j-1,2);
    if down1>k-1 then down1:=maxlongint;
    if up1>k-1 then up1:=k-1;
    if down2>k-1 then begin down1:=maxlongint; down2:=maxlongint; end;
    if up2>k-1 then up2:=k-1;
    for p:=down1 to up1 do
        begin
        for q:=down2 to up2 do
            begin
            l:=p; if q>l then l:=q;
            work(j,p,i-j-1,q,i,l+1);
            end;
        end;
    end;
  end;
writeln(f[n,k]);
close(input);
close(output);
end.
