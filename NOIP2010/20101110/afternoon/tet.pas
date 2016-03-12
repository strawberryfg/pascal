// 13:05;
const maxn=20020;
type rec=record d,s,h,x,y:longint; end;
var lend,lens,n,i,j,ans,height,x1,x2,x3,x4,y1,y2,y3,y4:longint;
    a:array[1..maxn]of rec;
    nx,ny,tx,ty:array[1..2]of longint;
    v:array[1..maxn]of longint;
    px,py,flag:boolean;
begin
assign(input,'tet.in');
reset(input);
assign(output,'tet.out');
rewrite(output);
readln(lend,lens,n);
for i:=1 to n do
    begin
    readln(a[i].d,a[i].s,a[i].h,a[i].x,a[i].y);
    end;
for i:=1 to n do
    begin
    height:=0;
    for j:=1 to i-1 do
        begin
        {x1:=a[j].x; x2:=a[j].x+a[j].d; x3:=a[i].x; x4:=a[i].x+a[i].d;
        y1:=a[j].y; y2:=a[j].y+a[j].s; y3:=a[i].y; y4:=a[i].y+a[i].s;}
        if not((a[j].x+a[j].d<=a[i].x)or(a[j].x>=a[i].x+a[i].d)or(a[j].y+a[j].s<=a[i].y)or(a[j].y>=a[i].y+a[i].s)) then
           if (v[j]+a[j].h>height) then height:=v[j]+a[j].h;
        end;
    v[i]:=height;
    if v[i]+a[i].h>ans then ans:=v[i]+a[i].h;
    end;
writeln(ans);
close(input);
close(output);
end.
