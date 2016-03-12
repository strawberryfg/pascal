{
ID: xiaweiy1
PROG: maze1
LANG: PASCAL
}
const dx:array[1..4]of longint=(-1,0,0,1);
      dy:array[1..4]of longint=(0,-1,1,0);
      maxn=201; maxm=80; maxx=100000;
var i,j,n,m,fmax,fmin,k,l,u,tmp,cnt,tot,now,num:longint;
    map:array[1..maxn,1..maxm]of char;
    app,obt,loc:array[1..maxn,1..maxm]of longint;
    done:boolean;
    opp:array[1..maxn*maxm,1..2]of longint;
    dis,dis1,dis2,key,pos,heap:array[1..maxn*maxm]of longint;
    exist:array[1..maxn*maxm]of boolean;
    spe:array[1..2,1..2]of longint;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
function check(a,b,c,d:longint):boolean;
begin
if (obt[a,b]<>1)and(obt[c,d]<>1) then exit(true) else exit(false);
end;
procedure modify(id,newkey:longint);
var p,tmp:longint;
begin
if newkey<key[id] then
   begin
   key[id]:=newkey;
   p:=pos[id];
   while p div 2>=1 do
     begin
     if key[heap[p]]<key[heap[p div 2]] then
        begin
        tmp:=pos[heap[p]]; pos[heap[p]]:=pos[heap[p div 2]]; pos[heap[p div 2]]:=tmp;
        tmp:=heap[p]; heap[p]:=heap[p div 2]; heap[p div 2]:=tmp;
        p:=p div 2;
        end
     else
        break;
     end;
   end;
end;
procedure extract;
var t1,t2,p,pnum,tmp:longint;
begin
num:=heap[1]; now:=key[num];
pos[heap[1]]:=pos[heap[tot]]; pos[heap[tot]]:=0;
heap[1]:=heap[tot]; heap[tot]:=0;
dec(tot);
exist[num]:=false;
p:=1;
while (p*2<=tot) do
 begin
 t1:=key[heap[p*2]]; if p*2+1<=tot then t2:=key[heap[p*2+1]] else t2:=maxlongint;
 if t1<t2 then pnum:=0 else pnum:=1;
 if key[heap[p]]>key[heap[p*2+pnum]] then
    begin
    tmp:=pos[heap[p]]; pos[heap[p]]:=pos[heap[p*2+pnum]]; pos[heap[p*2+pnum]]:=tmp;
    tmp:=heap[p]; heap[p]:=heap[p*2+pnum]; heap[p*2+pnum]:=tmp;
    p:=p*2+pnum;
    end
 else
    break;
 end;
end;
function dij(st,en,cho:longint):longint;
var i,nx,ny,tx,ty,tmp:longint;
begin
for i:=1 to n*m do
    begin
    pos[i]:=i;
    heap[i]:=i;
    key[i]:=maxlongint;
    exist[i]:=true;
    end;
key[st]:=0;
tot:=n*m;
tmp:=pos[heap[1]]; pos[heap[1]]:=pos[heap[st]]; pos[heap[st]]:=tmp;
tmp:=heap[1]; heap[1]:=heap[st]; heap[st]:=tmp;
while tot>0 do
 begin
 extract;
 if now=maxlongint then break;
 nx:=opp[num,1]; ny:=opp[num,2];
 for i:=1 to 4 do
     begin
     tx:=nx+dx[i]; ty:=ny+dy[i];
     if (tx>=1)and(tx<=n)and(ty>=1)and(ty<=m)and(check(nx,ny,tx,ty)) then
        begin
        if exist[loc[tx,ty]] then
           modify(loc[tx,ty],key[num]+1);
        end;
     end;
 end;
if cho=1 then dis1:=key else dis2:=key;
exit((key[en]+1)div 2);
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
                  tmp:=dij(loc[spe[k,1],spe[k,2]],loc[i,j],k);
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
