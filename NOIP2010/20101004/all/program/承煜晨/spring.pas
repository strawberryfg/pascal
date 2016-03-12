var n,i,j,pd,min,k:longint;
    f:array[0..18,-1..19,1..2] of longint;
procedure spring(x,y,dep:longint);
begin
pd:=-1;
if dep>=min then exit;
if x=y then exit;
for i:=1 to n do
                       begin
                       f[x,i,2]:=-1;
                       f[i,y,2]:=-1;
                       end;
for i:=1 to n do
    if (f[i,1,2]<>-1)or(f[1,i,2]<>-1)or(f[n,i,2]<>-1)or(f[i,n,2]<>-1) then pd:=1;
if pd=-1 then
   if dep<min
      then min:=dep;
if f[x+1,y+1,2]<>-1 then begin
                   for i:=1 to n do
                       begin
                       f[x+1,i,2]:=-1;
                       f[i,y+1,2]:=-1;
                       end;
                   spring(x+1,y+1,dep+f[x+1,y+1,1]);
                   f[x+1,y+1,2]:=0;
                   end;
if f[x+1,y-1,2]<>-1 then begin
                   for i:=1 to n do
                       begin
                       f[x+1,i,2]:=-1;
                       f[i,y-1,2]:=-1;
                       end;
                   spring(x+1,y-1,dep+f[x+1,y-1,1]);
                   f[x+1,y-1,2]:=0;
                   end;
if f[x-1,y+1,2]<>-1 then begin
                   for i:=1 to n do
                       begin
                       f[x-1,i,2]:=-1;
                       f[i,y+1,2]:=-1;
                       end;
                   spring(x-1,y+1,dep+f[x-1,y+1,1]);
                   f[x-1,y+1,2]:=0;
                   end;
if f[x-1,y-1,2]<>-1 then begin
                   for i:=1 to n do
                       begin
                       f[x-1,i,2]:=-1;
                       f[i,y-1,2]:=-1;
                       end;
                   spring(x-1,y-1,dep+f[x-1,y-1,1]);
                   f[x-1,y-1,2]:=0;
                   end;
if f[x+1,y-2,2]<>-1 then begin
                   for i:=1 to n do
                       begin
                       f[x+1,i,2]:=-1;
                       f[i,y-2,2]:=-1;
                       end;
                   spring(x+1,y-2,dep+f[x+1,y-2,1]);
                   f[x+1,y-2,2]:=0;
                   end;
if f[x+1,y+2,2]<>-1 then begin
                   for i:=1 to n do
                       begin
                       f[x+1,i,2]:=-1;
                       f[i,y+2,2]:=-1;
                       end;
                   spring(x+1,y+2,dep+f[x+1,y+2,1]);
                   f[x+1,y+2,2]:=0;
                   end;
end;
begin
assign(input,'spring.in');
reset(input);
assign(output,'spring.out');
rewrite(output);
min:=maxlongint;
pd:=-1;
readln(n);
for i:=0 to 18 do
    for j:=-1 to 19 do
        f[i,j,2]:=-1;
for i:=1 to n do
    for j:=1 to n do
        f[i,j,2]:=1;
for i:=1 to n do
    begin
    for j:=1 to n do
        read(f[i,j,1]);
    readln;
    end;
for i:=1 to n do
    f[i,i,2]:=-1;
for k:=2 to n do
    spring(1,k,f[1,k,1]);
writeln(min);
close(input);
close(output);
end.

