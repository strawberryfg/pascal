{
ID: xiaweiy1
PROG: comehome
LANG: PASCAL
}
const maxm=1000000;
      maxn=53;
var que:array[1..maxm]of longint;
    mark:array[0..maxn]of boolean;
    dis:array[0..maxn]of longint;
    i,p,x,y,w,fmin,num:longint;
    s:string;
    edge:array[0..maxn,0..maxn]of longint;
    f:array[0..260]of longint;
    code:integer;
function spfa(st,en:longint):longint;
var i,now,tail,head:longint;
begin
fillchar(que,sizeof(que),0);
fillchar(mark,sizeof(mark),false);
for i:=0 to 53 do dis[i]:=maxlongint;
dis[st]:=0;
que[1]:=st; tail:=1; head:=1;
mark[st]:=true;
while tail<=head do
  begin
  now:=que[tail];
  for i:=1 to 52 do
      begin
      if (edge[now,i]<>0)and(edge[now,i]+dis[now]<dis[i]) then
         begin
         dis[i]:=edge[now,i]+dis[now];
         if not mark[i] then
            begin
            mark[i]:=true;
            inc(head);
            que[head]:=i;
            end;
         end;
      end;
  mark[now]:=false;
  inc(tail);
  end;
exit(dis[en]);
end;
begin
assign(input,'comehome.in');
reset(input);
assign(output,'comehome.out');
rewrite(output);
for i:=1 to 26 do f[i+96]:=i;
for i:=27 to 52 do f[i+38]:=i;
readln(p);
for i:=1 to p do
    begin
    readln(s);
    x:=f[ord(s[1])]; y:=f[ord(s[3])];
    delete(s,1,4); val(s,w,code);
    if x=y then continue;
    if (edge[x,y]=0)or(w<edge[x,y]) then edge[x,y]:=w;
    if (edge[y,x]=0)or(w<edge[y,x]) then edge[y,x]:=w;
    end;
fmin:=maxlongint;
for i:=27 to 51 do
    begin
    if spfa(i,52)<fmin then
       begin
       num:=i;
       fmin:=spfa(i,52);
       end;
    end;
writeln(char(64+num-26),' ',fmin);
close(input);
close(output);
end.
