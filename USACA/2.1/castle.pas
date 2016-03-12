{
ID: xiaweiy1
PROG: castle
LANG: PASCAL
}
type arr=array[0..51,0..51]of longint;
var i,j,k,t,m,n,sum,max,maxx,ww,ss,tt:longint;
    p,canw,cane,cann,cans,south,east,west,north,hash,belong:arr;
    link:array[1..2500,1..2500]of integer;
    v:array[1..2505]of longint;
procedure find(x,y:longint);
var k:longint;
begin
k:=p[x,y];
if (canw[x,y]=1)and(link[k,k-1]=1)and(hash[x,y-1]=0) then
   begin
   v[sum]:=v[sum]+1;
   hash[x,y]:=1; hash[x,y-1]:=1;
   belong[x,y]:=sum; belong[x,y-1]:=sum;
   find(x,y-1);
   end;
if (cane[x,y]=1)and(link[k,k+1]=1)and(hash[x,y+1]=0) then
   begin
   v[sum]:=v[sum]+1;
   hash[x,y]:=1; hash[x,y+1]:=1;
   belong[x,y]:=sum; belong[x,y+1]:=sum;
   find(x,y+1);
   end;
if (cann[x,y]=1)and(link[k,k-m]=1)and(hash[x-1,y]=0) then
   begin
   v[sum]:=v[sum]+1;
   hash[x,y]:=1; hash[x-1,y]:=1;
   belong[x,y]:=sum; belong[x-1,y]:=sum;
   find(x-1,y);
   end;
if (cans[x,y]=1)and(link[k,k+m]=1)and(hash[x+1,y]=0) then
   begin
   v[sum]:=v[sum]+1;
   hash[x,y]:=1; hash[x+1,y]:=1;
   belong[x,y]:=sum; belong[x+1,y]:=sum;
   find(x+1,y);
   end;
end;
begin
assign(input,'castle.in');
reset(input);
assign(output,'castle.out');
rewrite(output);
readln(m,n);
for i:=1 to n do
    for j:=1 to m do
        begin
        read(t);
        p[i,j]:=(i-1)*m+j;
        case t of
         1:west[i,j]:=1;
         2:north[i,j]:=1;
         3:begin west[i,j]:=1; north[i,j]:=1; end;
         4:east[i,j]:=1;
         5:begin west[i,j]:=1; east[i,j]:=1; end;
         6:begin north[i,j]:=1; east[i,j]:=1; end;
         7:begin north[i,j]:=1; west[i,j]:=1; east[i,j]:=1; end;
         8:south[i,j]:=1;
         9:begin west[i,j]:=1; south[i,j]:=1; end;
         10:begin south[i,j]:=1; north[i,j]:=1; end;
         11:begin west[i,j]:=1; north[i,j]:=1; south[i,j]:=1; end;
         12:begin east[i,j]:=1; south[i,j]:=1; end;
         13:begin west[i,j]:=1; east[i,j]:=1; south[i,j]:=1; end;
         14:begin north[i,j]:=1; south[i,j]:=1; east[i,j]:=1; end;
         15:begin west[i,j]:=1; south[i,j]:=1; north[i,j]:=1; east[i,j]:=1; end;
         end;
        cann[i,j]:=1; cans[i,j]:=1; canw[i,j]:=1; cane[i,j]:=1;
        end;
cann[1,1]:=0; canw[1,1]:=0; cann[1,m]:=0; cane[1,m]:=0;
canw[n,1]:=0; cans[n,1]:=0; cane[n,m]:=0; cans[n,m]:=0;
for i:=2 to n-1 do
    begin
    canw[i,1]:=0;
    cane[i,m]:=0;
    end;
for i:=2 to m-1 do
    begin
    cann[1,i]:=0;
    cans[n,i]:=0;
    end;
for i:=1 to n do
    for j:=1 to m do
        begin
        k:=p[i,j];
        if (cann[i,j]=1)and(north[i,j]=0) then link[k,k-m]:=1;
        if (cans[i,j]=1)and(south[i,j]=0) then link[k,k+m]:=1;
        if (canw[i,j]=1)and(west[i,j]=0) then link[k,k-1]:=1;
        if (cane[i,j]=1)and(east[i,j]=0) then link[k,k+1]:=1;
        end;
for i:=1 to n do
    for j:=1 to m do
        if hash[i,j]=0 then begin inc(sum);v[sum]:=1;belong[i,j]:=sum;find(i,j); end;
writeln(sum);
for i:=1 to sum do if v[i]>max then max:=v[i];
writeln(max);
ww:=m+1; ss:=0;
for i:=1 to n do
    for j:=1 to m do
        begin
        if (cans[i,j]=1)and(south[i,j]=1)and(belong[i,j]<>belong[i+1,j]) then
           begin
           maxx:=max;
           if v[belong[i+1,j]]+v[belong[i,j]]>=maxx then maxx:=v[belong[i+1,j]]+v[belong[i,j]] else maxx:=0;
           if maxx=max then
              begin
              if j<ww then begin ww:=j;ss:=i+1; tt:=2; max:=maxx; end;
              if j=ww then if i+1>ss then begin ss:=i+1;tt:=2; max:=maxx; end;
              end;
           if maxx>max then
              begin
              ss:=i+1; ww:=j; tt:=2; max:=maxx;
              end;
           end;
        if (cane[i,j]=1)and(east[i,j]=1)and(belong[i,j]<>belong[i,j+1]) then
           begin
           maxx:=max;
           if v[belong[i,j+1]]+v[belong[i,j]]>=maxx then maxx:=v[belong[i,j+1]]+v[belong[i,j]] else maxx:=0;
           if maxx=max then
              begin
              if j<ww then begin ww:=j;ss:=i; tt:=3; max:=maxx; end;
              if j=ww then if i>ss then begin ss:=i;tt:=3; max:=maxx; end;
              end;
           if maxx>max then
              begin
              ss:=i;
              ww:=j;
              max:=maxx;
              end;
           end;
        end;
writeln(max);
write(ss,' ',ww,' ');
if tt=2 then write('N') else write('E');
writeln;
close(input);
close(output);
end.
