const dx:array[1..4]of longint=(-1,1,0,0);
      dy:array[1..4]of longint=(0,0,-1,1);
var p,r,c,i,j,tail,head,sx,sy,ex,ey,minn,kx,ky,tx,ty:longint;
    pd,mark:boolean;
    f,hash,hashh:array[1..100,1..100]of longint;
    a:array[1..50,1..50]of char;
    nowx,nowy,time:array[1..10000000]of longint;
    tme:array[0..10000,1..50,1..50]of char;
procedure check;
var i,j,k,x,y,num:longint;
begin
for num:=1 to r*c+10 do
begin
fillchar(hash,sizeof(hash),0);
tme[num]:=tme[num-1];
for i:=1 to r do
    begin
    for j:=1 to c do
        begin
        if (tme[num,i,j]='*')and(hash[i,j]=0) then
           begin
           for k:=1 to 4 do
               begin
               x:=i+dx[k]; y:=j+dy[k];
               if (x<=0)or(x>r)or(y<=0)or(y>c) then continue;
               if (tme[num,x,y]='D')or(tme[num,x,y]='X')or(tme[num,x,y]='*') then continue;
               if hash[x,y]=0 then
                  begin
                  hash[x,y]:=1;
                  tme[num,x,y]:='*';

                  end;
               end;
           end;
        end;
    end;
end;
end;
begin
assign(input,'slikar.in');
reset(input);
assign(output,'slikar.out');
rewrite(output);
readln(r,c);
for i:=1 to r do
    begin
    for j:=1 to c do
        begin
        read(a[i,j]);
        if a[i,j]='S' then
           begin sx:=i; sy:=j; end;
        if a[i,j]='D' then
           begin ex:=i; ey:=j; end;
        f[i,j]:=maxlongint;
        end;
    readln;
    end;
tail:=1; head:=1;
nowx[1]:=sx; nowy[1]:=sy;
f[sx,sy]:=0;
//ta[1]:=a;
pd:=true;
minn:=maxlongint;
tme[0]:=a;
check;
while tail<=head do
  begin
  kx:=nowx[tail]; ky:=nowy[tail];
  p:=time[tail];
  for i:=1 to 4 do
      begin
      tx:=kx+dx[i]; ty:=ky+dy[i];
      if (tx<=0)or(tx>r)or(ty<=0)or(ty>c) then continue;
      if (hashh[tx,ty]=1) then continue;
      hashh[tx,ty]:=1;
      if (a[tx,ty]='X') then continue;
      if tme[p+1,tx,ty]='*' then continue;
      if (f[kx,ky]+1>minn)or(f[kx,ky]+1>f[tx,ty]) then continue;
      inc(head);
      mark:=true;
      if not mark then dec(head)
         else begin
              nowx[head]:=tx; nowy[head]:=ty;
              time[head]:=time[tail]+1;
              f[tx,ty]:=f[kx,ky]+1;
              if (tx=ex)and(ty=ey)and(f[kx,ky]+1<minn) then
                 begin
                 minn:=f[kx,ky]+1;
                 pd:=false;
                 break;
                 end;
              end;
      if not pd then break;
      end;
  inc(tail);
  end;
if pd then writeln('KAKTUS') else writeln(minn);
close(input);
close(output);
end.
