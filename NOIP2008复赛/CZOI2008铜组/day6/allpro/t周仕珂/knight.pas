var  a:array[-50..50,-50..50]of longint;
     m,n,x,y:longint;
     sp,cz:array[1..8]of longint;
procedure print;
var i,j,s:longint;
        pd:boolean;
begin
pd:=true;
for i:=1 to n do
        for j:=1 to m do
                if a[i,j]=0 then begin pd:=false;break; end;
s:=0;
if pd then
while s<>n*m do
        begin
        inc(s);
                for i:=1 to n do
                        for j:=1 to m do
                                if (a[i,j]=s)and(s<>n*m) then write('(',i,',',j,')','->')
                                else if (a[i,j]=s)and(s=n*m) then write('(',i,',',j,')');

        end;
writeln;
close(input);
close(output);
halt;
end;
procedure try(dep,x,y:longint);
var tx,ty,i:longint;
begin
if dep>n*m then print
                else for i:=1 to 8 do
                begin
                tx:=x+sp[i];
                ty:=y+cz[i];
                if (a[tx,ty]=0)and(tx<=n)and(ty<=m)and(tx>0)and(ty>0) then
                        begin
                        a[tx,ty]:=dep;
                        try(dep+1,tx,ty);
                        end;

               
                end;
a[x,y]:=0;

end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
sp[1]:=1;sp[2]:=1;sp[3]:=-1;sp[4]:=-1;sp[5]:=2;sp[6]:=2;sp[7]:=-2;sp[8]:=-2;
cz[1]:=2;cz[2]:=-2;cz[3]:=2;cz[4]:=-2;cz[5]:=1;cz[6]:=-1;cz[7]:=1;cz[8]:=-1;
readln(n,m,x,y);
a[x,y]:=1;
try(2,x,y);
writeln('No Answer!');
close(input);
close(output);
end.
