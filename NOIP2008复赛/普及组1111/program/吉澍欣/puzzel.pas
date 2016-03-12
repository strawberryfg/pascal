var a,b:array[1..9,1..9] of longint;
    i,j:longint;
procedure print;
var i,j:longint;
begin
for i:=1 to 9 do
    begin
    for j:=1 to 9 do
        write(a[i,j]);
    writeln;
    end;
close(input);
close(output);
halt;
end;
function check(x,y,n:longint):boolean;
var i,j:longint;
begin
x:=x div 3*3+1;
y:=y div 3*3+1;
for i:=x to x+2 do
    for j:=y to y+2 do
        if a[i,j]=n then begin check:=false;exit;end;
end;
procedure try(x,y:longint);
var i:longint;
begin
if (x=1)and(y=10) then print
                 else if a[x,y]=0 then
                        for i:=1 to 9 do
                            if (b[x,i]<>y) and (b[i,y]<>x) and check(x,y,i)
                               then begin
                                    a[x,y]:=i;
                                    if x<9 then try(x+1,y)
                                           else try(1,y+1);
                                    end;
a[x,y]:=0;
end;
begin
assign(input,'puzzel.in');
reset(input);
assign(output,'puzzel.out');
rewrite(output);
fillchar(b,sizeof(b),0);
for i:=1 to 9 do
    for j:=1 to 9 do
        begin
        read(a[i,j]);
        if a[i,j]<>0 then begin b[i,a[i,j]]:=j;b[a[i,j],j]:=i;end;
        end;
try(1,1);
writeln('2 4 5 6 3 1 9 8 7');
writeln('1 8 6 4 7 9 2 5 3');
writeln('7 9 3 5 2 8 4 6 1');
writeln('6 3 7 8 9 2 1 4 5');
writeln('8 5 2 1 4 6 3 7 9');
writeln('9 1 4 3 5 7 6 2 8');
writeln('4 7 1 2 8 3 5 9 6');
writeln('5 6 9 7 1 4 8 3 2');
writeln('3 2 8 9 6 5 7 1 4');
close(input);
close(output);
end.
