const tx:array[1..8] of longint=(2,-2,1,-1,2,-2,1,-1);
      ty:array[1..8] of longint=(1,1,2,2,-1,-1,-2,-2);
var  x,y,n,m:longint;
     a1,a2:array[1..101] of longint;
     a:array[1..10,1..10] of longint;
procedure print;
var i:longint;
begin
for i:=2 to m*n do
    write('(',a1[i],',',a2[i],')->');
write('(',a1[m*n+1],',',a2[m*n+1],')');
close(input);
close(output);
halt;
end;
procedure try(x,y,dep:longint);
var i:longint;
begin
a[y,x]:=dep-1;
a1[dep]:=x;
a2[dep]:=y;
if dep>m*n then print
           else for i:=1 to 8 do
                if (x+tx[i]<=n)and(x+tx[i]>0)and(y+ty[i]<=m)and(y+ty[i]>0)and(a[y+ty[i],x+tx[i]]=0)
                                                                       then try(x+tx[i],y+ty[i],dep+1);
a[y,x]:=0;
                                                                       end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output); 
read(n,m);
read(x,y);
try(x,y,2);
write('No Answer!');
close(input);
close(output);
end.
