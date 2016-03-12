{
ID: xiaweiy1
PROG: maze1
LANG: PASCAL
}
const dx:array[1..4]of longint=(-1,0,0,1);
      dy:array[1..4]of longint=(0,-1,1,0);
      maxn=201; maxm=80; maxx=100000;
var i,j,n,m,fmax,fmin,k,l,u,tmp,cnt:longint;
    map:array[1..maxn,1..maxm]of char;
    app,obt,loc:array[1..maxn,1..maxm]of longint;
    done:boolean;
    opp:array[1..maxn*maxm,1..2]of longint;
    que:array[1..maxx]of longint;
    mark:array[1..maxn*maxm]of boolean;
    dis,dis1,dis2:array[1..maxn*maxm]of longint;
    spe:array[1..2,1..2]of longint;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
function check(a,b,c,d:longint):boolean;
begin
if (obt[a,b]<>1)and(obt[c,d]<>1) then exit(true) else exit(false);
end;
function spfa(st,en,cho:longint):longint;
var i,now,tail,head,nx,ny,tx,ty:longint;
begin
fillchar(que,sizeof(que),0);
fillchar(mark,sizeof(mark),false);
for i:=1 to n*m do dis[i]:=maxlongint;
dis[st]:=0;  mark[st]:=true;  que[1]:=st;
tail:=1; head:=1;
while tail<=head do
   begin
   now:=que[tail];
   nx:=opp[now,1]; ny:=opp[now,2];
   for i:=1 to 4 do
       begin
       tx:=nx+dx[i]; ty:=ny+dy[i];
       if (tx>=1)and(tx<=n)and(ty>=1)and(ty<=m) then
          begin
          if check(nx,ny,tx,ty) then
             begin
             if (dis[now]<>maxlongint)and(dis[now]+1<dis[loc[tx,ty]]) then
                begin
                dis[loc[tx,ty]]:=dis[now]+1;
                if not mark[loc[tx,ty]] then
                   begin
                   inc(head);
                   que[head]:=loc[tx,ty];
                   mark[loc[tx,ty]]:=true;
                   end;
                end;
             end;
          end;
       end;
   mark[now]:=false;
   inc(tail);
   end;
if cho=1 then dis1:=dis else dis2:=dis;
exit((dis[en]+1) div 2);
end;
begin
assign(input,'maze1.in');
reset(input);
assign(output,'maze1.out');
rewrite(output);
readln(m,n);
n:=2*n+1;
m:=2*m+1;
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        read(map[i,j]);
        if (map[i,j]='+')or(map[i,j]='-')or(map[i,j]='|') then
           obt[i,j]:=1;        //obstacle  It means here is a fence.
        loc[i,j]:=(i-1)*m+j;   // index use number to hash the location (i,j)
        opp[(i-1)*m+j,1]:=i; opp[(i-1)*m+j,2]:=j;
        end;
    readln;
    end;
for i:=1 to n  do
    begin
    if map[i,1]=' ' then begin inc(cnt); spe[cnt,1]:=i; spe[cnt,2]:=1; end;
    if map[i,m]=' ' then begin inc(cnt); spe[cnt,1]:=i; spe[cnt,2]:=m; end;
    end;
for i:=1 to m do
    begin
    if map[1,i]=' ' then begin inc(cnt); app[1,i]:=1; spe[cnt,1]:=1; spe[cnt,2]:=i; end;
    if map[n,i]=' ' then begin inc(cnt); app[n,i]:=1; spe[cnt,1]:=n; spe[cnt,2]:=i; end;
    end;                       //The aim is to find two exits;
fmax:=0;
done:=false;
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        if (obt[i,j]<>1)and(app[i,j]<>1) then    //not a fence
           begin
           if not done then
              begin
              fmin:=maxlongint;
              for k:=1 to 2 do
                  begin
                  tmp:=spfa(loc[spe[k,1],spe[k,2]],loc[i,j],k);
                  if tmp<fmin then
                     fmin:=tmp;
                  end;
              done:=true;
              if fmin>fmax then
                 fmax:=fmin;
              end
           else begin
                tmp:=min(dis1[loc[i,j]],dis2[loc[i,j]])+1;
                tmp:=tmp div 2;
                if tmp>fmax then fmax:=tmp;
                end;
           end;
        end;

    end;
writeln(fmax);
close(input);
close(output);
end.
