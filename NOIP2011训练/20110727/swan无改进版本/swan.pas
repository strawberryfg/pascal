const maxn=1520;   maxx=2310400; maxm=2310400;
      dx:array[1..4]of longint=(0,0,-1,1);
      dy:array[1..4]of longint=(1,-1,0,0);
type rec=record
     nxt,pre,x,y,key:longint; end;
var r,c,sum,tot,i,j,tme,tx,ty,px,py,t,head,tail,ttt:longint;
    g,tg:array[1..maxn,1..maxn]of char;
    hash,fhash:array[1..maxn,1..maxn]of longint;
    spe:array[1..2,1..2]of longint;
    a:array[1..maxx]of rec;
    fa:array[1..maxm]of longint;
    q:array[1..maxx,1..2]of longint;
function getfa(num:longint):longint;
begin
if fa[num]=num then exit(num)
  else begin
       fa[num]:=getfa(fa[num]);
       exit(fa[num]);
       end;
end;
procedure pre;
var i,j,k,x,y:longint;
    pd:boolean;
begin
for i:=1 to r do
    begin
    for j:=1 to c do
        begin
        if g[i,j]='X' then
           begin
           pd:=false;
           for k:=1 to 4 do
               begin
               x:=i+dx[k]; y:=j+dy[k];
               if (x<=0)or(x>r)or(y<=0)or(y>c) then continue;
               if g[x,y]<>'X' then begin pd:=true; break; end;
               end;
           if pd then
              begin
              inc(sum);
              hash[i,j]:=1;
              if sum=1 then begin head:=1; a[sum].x:=i; a[sum].y:=j; end
                 else begin a[sum-1].nxt:=sum; a[sum].pre:=sum-1; a[sum].x:=i; a[sum].y:=j; end;
              end;
           end;
        end;
    end;
tail:=sum;
for i:=1 to r*c do fa[i]:=i;
end;
function check:boolean;
var head,tail,i,j,k,tx,ty,t1,t2,x,y:longint;
begin
for i:=1 to r do
    begin
    for j:=1 to c do
        fa[(i-1)*c+j]:=(i-1)*c+j;
    end;
fillchar(fhash,sizeof(hash),0);
for i:=1 to r do
    begin
    for j:=1 to c do
        begin
        if g[i,j]='X' then continue;
        if fhash[i,j]=1 then continue;
        head:=1; tail:=1; q[1,1]:=i; q[1,2]:=j;
        while head<=tail do
         begin
         x:=q[head,1]; y:=q[head,2];
         for k:=1 to 4 do
             begin
             tx:=x+dx[k]; ty:=y+dy[k];
             if (tx<=0)or(tx>r)or(ty<=0)or(ty>c) then continue;
             if (g[tx,ty]='X') then continue;
             if fhash[tx,ty]=1 then continue;
             inc(tail); q[tail,1]:=tx; q[tail,2]:=ty;
             fhash[tx,ty]:=1;
             t1:=getfa((i-1)*c+j);
             t2:=getfa((tx-1)*c+ty);
             if t1<>t2 then fa[t2]:=t1;
             t1:=getfa((spe[1,1]-1)*c+spe[1,2]);
             t2:=getfa((spe[2,1]-1)*c+spe[2,2]);
             if t1=t2 then
             exit(true);
             end;
         inc(head);
         end;
        end;
    end;
exit(false);
end;
begin
assign(input,'swan.in');
reset(input);
assign(output,'swan.out');
rewrite(output);
readln(r,c);
tot:=0;
for i:=1 to r do
    begin
    for j:=1 to c do
        begin
        read(g[i,j]);
        if g[i,j]='L' then
           begin
           inc(tot); spe[tot,1]:=i; spe[tot,2]:=j;
           end;
        end;
    readln;
    end;
pre;
while true do
  begin
  if check then break;
  inc(tme);
  t:=head;
  tg:=g;
//  ta:=a;
  while t<>0 do
   begin
   if a[t].key=1 then
      begin
      a[t].key:=0;
      t:=a[t].nxt;
      continue;
      end;
   tx:=a[t].x; ty:=a[t].y;
   tg[tx,ty]:='.';   hash[tx,ty]:=0;
   for i:=1 to 4 do
       begin
       px:=tx+dx[i]; py:=ty+dy[i];
       if (px<=0)or(px>r)or(py<=0)or(py>c) then continue;
       if hash[px,py]=1 then continue;
       if g[px,py]='X' then
          begin
          hash[px,py]:=1;
          inc(sum); a[tail].nxt:=sum; a[sum].x:=px; a[sum].y:=py;
          a[sum].key:=1;
          a[sum].pre:=tail;
          tail:=sum;
          ttt:=1;
          end;
       end;
   if a[t].pre=0 then
      begin
      head:=a[t].nxt;
      a[head].pre:=0;
      end
   else if a[t].nxt=0 then
           begin
           tail:=a[t].pre;
           a[tail].nxt:=0;
           end
        else
           begin
           a[a[t].pre].nxt:=a[t].nxt;
           a[a[t].nxt].pre:=a[t].pre;
           end;
   t:=a[t].nxt;
   {if tme=1 then
     begin
     for i:=1 to r do
         begin
         for j:=1 to c do
             write(tg[i,j]);
         writeln;
         end;
     writeln;
     end;}
   end;
  g:=tg;
  if check then break;
  end;
writeln(tme);
close(input);
close(output);
end.
