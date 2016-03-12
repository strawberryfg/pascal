var a:array[0..21,0..21] of longint;
    i,n,t,j,x,y:longint;
procedure dir(var x,y:longint);
var i,k:longint;
begin
k:=1212;
if t=0 then begin inc(y);k:=1;if a[x,y]<>0 then begin inc(t);dec(y);end;end;
if t=1 then begin inc(x);if a[x,y]<>0 then begin inc(t);dec(x);end;end;
if t=2 then begin dec(y);if a[x,y]<>0 then begin inc(t);inc(y);end;end;
if t=3 then begin dec(x);if a[x,y]<>0 then begin t:=0;inc(x);end;end;
if (t=0)and(k<>1) then begin inc(y);if a[x,y]<>0 then begin inc(t);dec(y);end;end;
end;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
a[0,1]:=-1;
a[1,n+1]:=-1;
a[n+1,n]:=-1;
a[n,0]:=-1;
x:=1;
for i:=1 to n*n do
    begin
    dir(x,y);
    a[x,y]:=i;
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
        writeln;
    end;
close(input);
close(output);
end.
