const di:array[1..8] of longint=(1,-1,-1,1,2,-2,-2,2);
      dj:array[1..8] of longint=(-2,2,-2,2,1,-1,1,-1);
var x,y,n,m:longint;
    a:array[1..10,1..10] of longint;
    b:array[1..100,1..2] of longint;
procedure print;
var i:longint;
begin
for i:=1 to n*m-1 do
    write('(',b[i,1],',',b[i,2],')->');
writeln('(',b[n*m,1],',',b[n*m,2],')');
close(input);
close(output);
halt;
end;
function check(x,y:longint):boolean;
var i:longint;
begin
check:=true;
if (x<1)or(x>n)
   then begin
        check:=false;
        exit;
        end;
if (y<1)or(y>m)
   then begin
        check:=false;
        exit;
        end;
end;
procedure try(dep,x,y:longint);
var i,ti,tj:longint;
begin
b[dep,1]:=x;
b[dep,2]:=y;
a[x,y]:=-1;
if dep=n*m then print
           else for i:=1 to 8 do
                begin
                ti:=x+di[i];
                tj:=y+dj[i];
                if (check(ti,tj))and(a[ti,tj]<>-1)
                   then try(dep+1,ti,tj);
                end;
b[dep,1]:=0;
b[dep,2]:=0;
a[x,y]:=0;
end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
readln(n,m,x,y);
try(1,x,y);
writeln('No Answer!');
close(input);
close(output);
end.
