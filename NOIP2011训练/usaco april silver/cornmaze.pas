const maxn=300; maxm=300;  maxx=1000000;
      dx:array[1..4]of longint=(-1,0,0,1);
      dy:array[1..4]of longint=(0,-1,1,0);
var i,j,n,m,t,tail,head,x,y,tx,ty,nx,ny,ex,ey:longint;
    hash:array[1..27,1..2]of longint;
    a:array[1..maxn,1..maxm]of char;
    spe,nowx,nowy,f:array[1..maxx]of longint;
    h:array[1..maxn,1..maxm]of longint;
    g:array[1..maxn,1..maxm,1..2]of longint;
begin
assign(input,'cornmaze.in');
reset(input);
assign(output,'cornmaze.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        read(a[i,j]);
        if a[i,j]='@' then begin a[i,j]:='.'; nx:=i; ny:=j; end;
        if a[i,j]='=' then begin ex:=i; ey:=j; end;
        if (a[i,j]>='A')and(a[i,j]<='Z') then
           begin
           t:=ord(a[i,j])-ord('A')+1;
           if (hash[t,1]*hash[t,2]<>0) then
              begin
              g[hash[t,1],hash[t,2],1]:=i;
              g[hash[t,1],hash[t,2],2]:=j;
              g[i,j,1]:=hash[t,1];
              g[i,j,2]:=hash[t,2];
              end
           else begin
                hash[t,1]:=i;
                hash[t,2]:=j;
                end;
           end;
        end;
    readln;
    end;
tail:=1; head:=1;
nowx[1]:=nx; nowy[1]:=ny;
f[1]:=0;
while tail<=head do
  begin
  x:=nowx[tail]; y:=nowy[tail];
  if spe[tail]=1 then
     begin
     inc(head);
     nowx[head]:=g[x,y,1];
     nowy[head]:=g[x,y,2];
     f[head]:=f[tail];
     end
  else
  begin
  for i:=1 to 4 do
      begin
      tx:=x+dx[i]; ty:=y+dy[i];
      if (tx>=1)and(tx<=n)and(ty>=1)and(ty<=m)and(a[tx,ty]<>'#') then
         begin
         if (h[tx,ty]=0)or(f[tail]+1<h[tx,ty]) then
            begin
            h[tx,ty]:=f[tail]+1;
            inc(head);
            nowx[head]:=tx; nowy[head]:=ty;
            if (a[tx,ty]<>'.')and(a[tx,ty]<>'=') then spe[head]:=1;
            f[head]:=f[tail]+1;
            end;
         end;
      end;
  end;
  inc(tail);
  end;
writeln(h[ex,ey]);
close(input);
close(output);
end.