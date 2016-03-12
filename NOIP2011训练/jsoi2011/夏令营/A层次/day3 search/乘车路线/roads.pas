const maxn=100;  maxx=100208; maxw=1020;
var n,k,w,i,s,d,l,t,j,now,p,head,tail,fmin:longint;
    g,le,fe,f:array[1..maxn,0..maxw]of longint;
    q,wei:array[1..maxx]of longint;
    flag:array[1..maxn,0..maxw]of boolean;
begin
assign(input,'roads.in');
reset(input);
assign(output,'roads.out');
rewrite(output);
readln(n,k,w);
for i:=1 to k do
    begin
    readln(s,d,l,t);
    g[s,d]:=1; le[s,d]:=l; fe[s,d]:=t;
    end;
for i:=1 to maxn do
    begin
    for j:=0 to maxw  do
        f[i,j]:=maxlongint;
    end;
head:=1; tail:=1; q[1]:=1; wei[1]:=0;
f[1,0]:=0;
while (head<=tail) do
 begin
 now:=q[head];
 p:=wei[head];
 flag[now,p]:=false;
 for i:=1 to n do
     begin
     if (i<>now)and(g[now,i]=1) then
        begin
        if (p+fe[now,i]<=w)and(f[now,p]+le[now,i]<f[i,p+fe[now,i]]) then
           begin
           f[i,p+fe[now,i]]:=f[now,p]+le[now,i];
           if not flag[i,p+fe[now,i]] then
              begin
              flag[i,p+fe[now,i]]:=true;
              inc(tail);
              q[tail]:=i;
              wei[tail]:=p+fe[now,i];
              end;
           end;
        end;
     end;
 inc(head);
 end;
fmin:=maxlongint;
for i:=0 to w do
    if f[n,i]<fmin then fmin:=f[n,i];
if fmin=maxlongint then writeln('NO')
                   else writeln(fmin);
close(input);
close(output);
end.
