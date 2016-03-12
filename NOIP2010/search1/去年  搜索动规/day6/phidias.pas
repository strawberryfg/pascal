const maxn=601;

var w,h,i,n:longint;
    wi,hi:array[1..201]of longint;
    hash:array[0..maxn,0..maxn]of boolean;
    f:array[0..maxn,0..maxn]of longint;

function dfs(x,y:longint):longint;
var i,p,q:longint;
    flag:boolean;
begin
if not hash[x,y] then exit(f[x,y]);
hash[x,y]:=false;
flag:=true;
for i:=1 to n do
    begin
    if (x<wi[i])or(y<hi[i]) then continue;                           {高或宽过大}
    flag:=false;                              
    p:=dfs(x-wi[i],hi[i]) 
       +dfs(x,y-hi[i]);                                              {两种方式铺排}
    q:=dfs(wi[i],y-hi[i])                                             
       +dfs(x-wi[i],y);
    if p<q then begin if p<f[x,y] then f[x,y]:=p; end
           else begin if q<f[x,y] then f[x,y]:=q; end;
    end;
if flag then f[x,y]:=x*y;
exit(f[x,y]);
end;

begin
assign(input,'phidias.in');
reset(input);
assign(output,'phidias.out');
rewrite(output);
readln(w,h);
readln(n);
fillchar(hash,sizeof(hash),true);
fillchar(f,sizeof(f),$7F);
for i:=1 to n do
    begin
    readln(wi[i],hi[i]);
    hash[wi[i],hi[i]]:=false;
    f[wi[i],hi[i]]:=0;
    end;

writeln(dfs(w,h));
close(input);
close(output);
end.
