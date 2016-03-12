const di:array[1..4] of longint=(1,-1,0,0);
      dj:array[1..4] of longint=(0,0,1,-1);
var a:array[1..60,1..60] of longint;
    m,n,i,j,sum:longint;
    t:char;
function check(i,j:longint):boolean;
var x,y,t:longint;
begin
check:=true;
if (1>i)or(i>m) then begin check:=false;exit;end;
if (1>j)or(j>n) then begin check:=false;exit;end;
if a[i,j]=0 then begin check:=false;exit;end;
end;
procedure find(x,y:longint);
var i,ti,tj:longint;
begin
a[x,y]:=0;
for i:=1 to 4 do
    begin
    ti:=x+di[i];
    tj:=y+dj[i];
    if check(ti,tj) then find(ti,tj);
    end;
end;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(m,n);
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        read(t);
        if t='0'
           then a[i,j]:=0
           else a[i,j]:=1;
        end;
        readln;
    end;
for i:=1 to m do
    for j:=1 to n do
        if a[i,j]<>0 then begin inc(sum);find(i,j);end;
writeln(sum);
close(input);
close(output);
end.
