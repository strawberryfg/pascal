const dx:array[1..4]of longint=(-1,0,0,1);
      dy:array[1..4]of longint=(0,1,-1,0);
var i,j,n,m,min,old,nex,oldlen,nexlen,x1,x2,y1,y2,tx,ty,kx,ky:longint;
    c:char;
    a,f:array[0..501,0..501]of longint;
    x,y:array[1..250001]of longint;
    vis:array[0..501,0..501]of boolean;
    pd:boolean;
procedure work;
var tmp,t,i:longint;
begin
if x1>x2 then
   begin
   tmp:=x1; x1:=x2; x2:=tmp;
   tmp:=y1; y1:=y2; y2:=tmp;
   end;
min:=maxlongint;
if y1<y2 then
   begin
   t:=0;
   for i:=x1 to x2-1 do
       if a[i,y1]<>a[i+1,y1] then inc(t,2) else inc(t);
   for i:=y1 to y2-1 do
       if a[x2,i]<>a[x2,i+1] then inc(t,2) else inc(t);
   min:=t;
   t:=0;
   for i:=y1 to y2-1 do
       if a[x1,i]<>a[x1,i+1] then inc(t,2) else inc(t);
   for i:=x1 to x2-1 do
       if a[i,y2]<>a[i+1,y2] then inc(t,2) else inc(t);
   if t<min then min:=t;
   end
else
   begin
   t:=0;
   for i:=y1 downto y2+1 do
       if a[x1,i]<>a[x1,i-1] then inc(t,2) else inc(t);
   for i:=x1 to x2-1 do
       if a[i,y2]<>a[i+1,y2] then inc(t,2) else inc(t);
   min:=t;
   t:=0;
   for i:=x1 to x2-1 do
       if a[i,y1]<>a[i+1,y1] then inc(t,2) else inc(t);
   for i:=y1 downto y2+1 do
       if a[x2,i]<>a[x2,i-1] then inc(t,2) else inc(t);
   if t<min then min:=t;
   end;
end;
begin
assign(input,'gridii.in');
reset(input);
assign(output,'gridii.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        read(c);
        if c='.' then a[i,j]:=1 else a[i,j]:=2;
        end;
    readln;
    end;
readln(x1,y1,x2,y2);
work;
old:=1; nex:=1; oldlen:=1; nexlen:=1;
x[1]:=x1; y[1]:=y1;
pd:=false;
fillchar(f,sizeof(f),1);
f[x1,y1]:=0;
while ((oldlen=nexlen)and(old<=nex))or(oldlen<nexlen) do
  begin
  kx:=x[old];
  ky:=y[old];
  for i:=1 to 4 do
      begin
      tx:=kx+dx[i]; ty:=ky+dy[i];
      if a[tx,ty]=0 then continue;
      if a[tx,ty]=a[kx,ky] then
         begin
         if (f[kx,ky]+1<min)and(f[kx,ky]+1<f[tx,ty]) then
            begin
            f[tx,ty]:=f[kx,ky]+1;
            if (tx=x2)and(ty=y2) then
               begin
               if f[tx,ty]<min then min:=f[tx,ty];
               if min=0 then
                  begin
                  pd:=true;
                  break;
                  end;
               end;
            if vis[tx,ty]=false then
               begin
               vis[tx,ty]:=true;
               inc(nex);
               if nex>250000 then
                  begin inc(nexlen);nex:=1; end;
               x[nex]:=tx;
               y[nex]:=ty;
               end;
            end;
         end
      else
         begin
         if (f[kx,ky]+2<min)and(f[kx,ky]+2<f[tx,ty]) then
            begin
            f[tx,ty]:=f[kx,ky]+2;
            if (tx=x2)and(ty=y2) then
               begin
               if f[tx,ty]<min then min:=f[tx,ty];
               if min=0 then
                  begin
                  pd:=true;
                  break;
                  end;
               end;
            if vis[tx,ty]=false then
               begin
               vis[tx,ty]:=true;
               inc(nex);
               if nex>250000 then
                  begin inc(nexlen);nex:=1; end;
               x[nex]:=tx;
               y[nex]:=ty;
               end;
            end;
         end;
      end;
  vis[kx,ky]:=false;
  if pd=true then break;
  inc(old);
  if old>250000 then begin inc(oldlen);old:=1; end;
  end;
writeln(min);
close(input);
close(output);
end.