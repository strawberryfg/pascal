var n,st,en,m,i,x,y,w,cnt,sum,j,u,v:longint;
    pd,relaxed:boolean;
    edge:array[1..100,1..3]of longint;
    link,value:array[1..100,0..100]of longint;
    key:array[1..100]of longint;
begin
assign(input,'bellmanford.in');
reset(input);
assign(output,'bellmanford.out');
rewrite(output);
readln(n,st,en);
readln(m);
for i:=1 to m do
  begin
  readln(x,y,w);
  cnt:=link[x,0]+1;
  link[x,cnt]:=y;
  inc(link[x,0]);
  value[x,y]:=w;
  inc(sum);
  edge[sum,1]:=x; edge[sum,2]:=y;  edge[sum,3]:=w;
  end;
for i:=1 to n do key[i]:=maxlongint;
key[st]:=0;
for i:=1 to n-1 do
    begin
    relaxed:=false;
    for j:=1 to sum do
        begin
        u:=edge[j,1]; v:=edge[j,2];
        if (key[u]<>maxlongint)and(key[v]>key[u]+value[u,v]) then
           begin relaxed:=true;key[v]:=key[u]+value[u,v]; end;
        end;
    if relaxed=false then break;
    end;
pd:=true;
for i:=1 to sum do
   begin
   u:=edge[i,1]; v:=edge[i,2];
   if key[v]>key[u]+value[u,v] then begin pd:=false; break; end;
   end;
if pd=false then writeln('fuquanhuilu') else writeln(key[en]);
close(input);
close(output);
end.