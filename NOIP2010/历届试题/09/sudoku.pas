const score:array[1..5]of longint=(10,9,8,7,6);
var i,j,a,b,res,fmax,tx,ty:longint;
    f,hashi,hashj,nine,belong,hash:array[0..9,0..9]of longint;
    st,en,pt,pn:array[0..9]of longint;
procedure work(start,len,now:longint);
var i,j:longint;
begin
for i:=start to start+len-1 do
    begin
    belong[i,start]:=score[now];
    belong[i,start+len-1]:=score[now];
    end;
for j:=start to start+len-1 do
    begin
    belong[start,j]:=score[now];
    belong[start+len-1,j]:=score[now];
    end;
end;
function getnine(nowi,nowj:longint):longint;
var i:longint;
begin
for i:=1 to 9 do
    begin
    if (nowi>=st[i])and(nowi<=en[i])
       and(nowj>=pt[i])and(nowj<=pn[i]) then
        exit(i);
    end;
end;
procedure check(num:longint);
var i,j,sum:longint;
begin

if num>fmax then
  fmax:=num;
end;
procedure handlenine(x,y:longint);
var a,b:longint;
begin
a:=x div 3;
if x mod 3<>0 then inc(a);
b:=y div 3;
if y mod 3<>0 then inc(b);
hash[nine[x,y],f[x,y]]:=1;
end;
procedure ahead(x,y,num:longint);
begin
if y+1<=9 then begin ty:=ty+1; end
   else begin
        if x+1<=9 then begin tx:=tx+1; ty:=1; end
           else begin tx:=0; ty:=0; end;
        end;
if (tx=0)and(ty=0) then
    begin
    check(num);
    end;
end;
procedure dfs(x,y,now:longint);
var i:longint;
begin
if f[x,y]<>0 then
   begin
   tx:=x; ty:=y;
   ahead(tx,ty,now);
   if (tx=0)and(ty=0) then
   exit;
   dfs(tx,ty,now);
   end
else begin

     for i:=1 to 9 do
         begin
         if hashi[x,i]=1 then continue;
         if hashj[y,i]=1 then continue;
         if hash[nine[x,y],i]=1 then continue;
         hashi[x,i]:=1;
         hashj[y,i]:=1;
         hash[nine[x,y],i]:=1;
         tx:=x; ty:=y;
         ahead(tx,ty,now+belong[x,y]*i);
         if (tx=0)and(ty=0) then
            begin
            hashi[x,i]:=0;
            hashj[y,i]:=0;
            hash[nine[x,y],i]:=0;
            f[x,y]:=0;
            continue;
            end;
         f[x,y]:=i;
        dfs(tx,ty,now+belong[x,y]*i);
        hashi[x,i]:=0;
         hashj[y,i]:=0;
         hash[nine[x,y],i]:=0;
         f[x,y]:=0;
         end;
     end;
end;
begin
assign(input,'sudoku.in');
reset(input);
assign(output,'sudoku.out');
rewrite(output);
work(5,1,1);
work(4,3,2);
work(3,5,3);
work(2,7,4);
work(1,9,5);
for i:=1 to 9 do
    begin
    a:=i div 3;
    if i mod 3<>0 then inc(a);
    b:=i mod 3;
    if b=0 then b:=3;
    st[i]:=(a-1)*3+1;
    en[i]:=st[i]+3-1;
    pt[i]:=(b-1)*3+1;
    pn[i]:=pt[i]+3-1;
    end;
for i:=1 to 9 do
    begin
    for j:=1 to 9 do
        begin
        nine[i,j]:=getnine(i,j);
        end;
    end;
res:=0;
for i:=1 to 9 do
    begin
    for j:=1 to 9 do
        begin
        read(f[i,j]);
        hashi[i,f[i,j]]:=1;
        hashj[j,f[i,j]]:=1;
        handlenine(i,j);
        res:=res+belong[i,j]*f[i,j];
        end;
    readln;
    end;
fmax:=res;
dfs(1,1,res);
if fmax=res then writeln(-1) else writeln(fmax);
close(input);
close(output);
end.
