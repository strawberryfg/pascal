const maxn=50020; maxm=100200; maxx=1000200;
type rec=record u,v,w,nxt:longint; end;
     re=record fir,last:longint; end;
var tot,n,m,a,b,c,i,j,tt:longint;
    q:array[1..maxx]of longint;
    h:array[1..maxm]of rec;
    edge:array[1..maxn]of re;
    value:array[1..maxn]of longint;
    dis:array[1..maxn]of qword;
    mark:array[1..maxn]of boolean;
    flag:boolean;
    ans:qword;
procedure addedge(x,y,vv:longint);
begin
inc(tot); h[tot].u:=x; h[tot].v:=y; h[tot].w:=vv;
if edge[x].fir=0 then
   begin
   edge[x].fir:=tot;
   edge[x].last:=tot;
   end
else
   begin
   h[edge[x].last].nxt:=tot;
   edge[x].last:=tot;
   end;
end;
procedure spfa;
var head,tail,t,now,tmp:longint;
begin
dis[1]:=0;
for i:=2 to n do dis[i]:=1844674407370955555;
head:=1; tail:=1; q[1]:=1;
fillchar(mark,sizeof(mark),false);
mark[1]:=true;
while head<=tail do
 begin
 now:=q[head];
 t:=edge[now].fir;
 while t<>0 do
   begin
   tmp:=h[t].v;
   if qword(dis[now])+qword(h[t].w)<qword(dis[tmp]) then
      begin
      dis[tmp]:=qword(dis[now])+qword(h[t].w);
      if not mark[tmp] then
         begin
         inc(tail);
         q[tail]:=tmp;
         mark[tmp]:=true;
         end;
      end;
   t:=h[t].nxt;
   end;
 inc(head);
 mark[now]:=false;
 end;
end;
begin
assign(input,'chris.in');
reset(input);
assign(output,'chris.out');
rewrite(output); 
tt:=1;
for j:=1 to tt do
    begin
    readln(n,m);
    for i:=1 to n do
        begin
        read(value[i]);
        edge[i].fir:=0;
        end;
    if (n=0) then
       begin
       writeln(0);
       continue;
       end;
    tot:=0;
    for i:=1 to m do
        begin
        readln(a,b,c);
        addedge(a,b,c);
        addedge(b,a,c);
        end;
    spfa;
    flag:=true;
    ans:=0;
    for i:=2 to n do
        begin
        if dis[i]=1844674407370955555 then begin flag:=false; break; end;
        ans:=qword(ans)+qword(dis[i])*qword(value[i]);
        end;
    if not flag then writeln('No Answer')
       else writeln(ans);
    end;
close(input);
close(output);
end.