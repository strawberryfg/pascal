var now,n,m,x,y,i,j,k,l:longint;
    ok:boolean;
    a:array[-1..10,-1..10]of longint;
    x1,y1:array[1..1000]of longint;
procedure print;
var i:longint;
begin
for i:=1 to n*m-1 do
    write('(',x1[i],',',y1[i],')->');
write('(',x1[n*m],',',y1[n*m],')')
end;
procedure slove(x,y,dep:longint);
begin
if dep=n*m then begin ok:=true;print;close(input);close(output);halt; end
	   else begin
                if (x-2>=1)and(y-1>=1) then begin if a[x-2,y-1]=0 then begin a[x-2,y-1]:=dep+1;x1[dep+1]:=x-2;y1[dep+1]:=y-1;slove(x-2,y-1,dep+1);a[x-2,y-1]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                if (x-2>=1)and(y+1<=m) then begin if a[x-2,y+1]=0 then begin a[x-2,y+1]:=dep+1;x1[dep+1]:=x-2;y1[dep+1]:=y+1;slove(x-2,y+1,dep+1);a[x-2,y+1]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                if (x+2<=n)and(y-1>=1) then begin if a[x+2,y-1]=0 then begin a[x+2,y-1]:=dep+1;x1[dep+1]:=x+2;y1[dep+1]:=y-1;slove(x+2,y-1,dep+1);a[x+2,y-1]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                if (x+2<=n)and(y+1<=m) then begin if a[x+2,y+1]=0 then begin a[x+2,y+1]:=dep+1;x1[dep+1]:=x+2;y1[dep+1]:=y+1;slove(x+2,y+1,dep+1);a[x+2,y+1]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                if (x-1>=1)and(y-2>=1) then begin if a[x-1,y-2]=0 then begin a[x-1,y-2]:=dep+1;x1[dep+1]:=x-1;y1[dep+1]:=y-2;slove(x-1,y-2,dep+1);a[x-1,y-2]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                if (x-1>=1)and(y+2<=n) then begin if a[x-1,y+2]=0 then begin a[x-1,y+2]:=dep+1;x1[dep+1]:=x-1;y1[dep+1]:=y+2;slove(x-1,y+2,dep+1);a[x-1,y+2]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                if (x+1<=n)and(y-2>=1) then begin if a[x+1,y-2]=0 then begin a[x+1,y-2]:=dep+1;x1[dep+1]:=x+1;y1[dep+1]:=y-2;slove(x+1,y-2,dep+1);a[x+1,y-2]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                if (x+1<=n)and(y+2<=n) then begin if a[x+1,y+2]=0 then begin a[x+1,y+2]:=dep+1;x1[dep+1]:=x+1;y1[dep+1]:=y+2;slove(x+1,y+2,dep+1);a[x+1,y+2]:=0;x1[dep+1]:=0;y1[dep+1]:=0;end;end;
                end;
end;
begin
assign(input,'knight.in');
assign(output,'knight.out');
reset(input);
rewrite(output);
readln(n,m,x,y);
fillchar(a,sizeof(a),0);
now:=1;
ok:=false;
for i:=-1 to 10 do
    for j:=-1 to 10 do
        if (i>n)or(j>m)or(i<=0)or(j<=0)then a[i,j]:=-1;
a[x,y]:=1;
x1[1]:=x;
y1[1]:=y;
slove(x,y,now);
if ok=false then write('No Answer!');
close(input);
close(output);
end.
