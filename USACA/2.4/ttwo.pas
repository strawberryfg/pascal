{
ID: xiaweiy1
PROG: ttwo
LANG: PASCAL
}
const dx:array[1..4]of longint=(-1 , 0, 1 ,  0);
      dy:array[1..4]of longint=(0  , 1, 0 , -1);
var i,j,tme,fdir,cdir,fx,fy,tx,ty,cx,cy,px,py:longint;
    pd:boolean;
    map:array[1..10,1..10]of char;
    hash:array[1..10,1..10,1..10,1..10,1..4,1..4]of longint;
begin
assign(input,'ttwo.in');
reset(input);
assign(output,'ttwo.out');
rewrite(output);
for i:=1 to 10 do
    begin
    for j:=1 to 10 do
        begin
        read(map[i,j]);
        if map[i,j]='F' then
           begin
           fx:=i; fy:=j;
           end
        else if map[i,j]='C' then
                begin
                cx:=i; cy:=j;
                end;
        end;
    readln;
    end;
hash[fx,fy,cx,cy,1,1]:=1;
tme:=1;  //nowtime;
pd:=true;
fdir:=1; cdir:=1;
while pd do
 begin
 tx:=fx+dx[fdir]; ty:=fy+dy[fdir];
 if (tx<=0)or(tx>10)or(ty<=0)or(ty>10)or(map[tx,ty]='*') then
    begin
    tx:=fx; ty:=fy;
    fdir:=fdir+1; if fdir=5 then fdir:=1;  //1:up 2:right 3:down 4:left
    end;
 px:=cx+dx[cdir]; py:=cy+dy[cdir];
 if (px<=0)or(px>10)or(py<=0)or(py>10)or(map[px,py]='*') then
    begin
    px:=cx; py:=cy;
    cdir:=cdir+1; if cdir=5 then cdir:=1;  //1:up 2:right 3:down 4:left
    end;
 if hash[tx,ty,px,py,fdir,cdir]=0 then
    begin
    if (tx=px)and(ty=py) then break;
    inc(tme);
    hash[tx,ty,px,py,fdir,cdir]:=1;
    end
 else pd:=false;
 fx:=tx; fy:=ty; cx:=px; cy:=py;
 end;
if not pd then
   writeln(0)
else
   writeln(tme);
close(input);
close(output);
end.