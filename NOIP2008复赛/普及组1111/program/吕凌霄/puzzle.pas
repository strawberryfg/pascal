var i,j:longint;
    a:array[0..10,0..10]of longint;
    b:array[0..10,0..10]of boolean;
    j1,j2:array[1..9]of set of 0..10;
procedure tian(x,y:longint);
var i,j:longint;
begin
if (x>9)and(y>9) then for i:=1 to 9 do begin for j:=1 to 8 do write(a[i,j],' ');writeln(a[i,9]);
                                             close(input);close(output);halt;end
else if (y>9)and(x<=9) then tian(x+1,1)
        else if b[x,y]=true then tian(x,y+1) else
             begin
             for i:=1 to 9 do
                 if (not(i in j1[x]))and(not(i in j2[y])) then begin
                                                               j1[x]:=j1[x]+[i];j2[y]:=j2[y]+[i];
                                                               a[x,y]:=i;
                                                               tian(x,y+1);
                                                               j1[x]:=j1[x]-[i];j2[y]:=j2[y]-[i];
                                                               END;
             end;
end;
begin
assign(input,'puzzle.in');reset(input);
assign(output,'puzzle.out');rewrite(output);
fillchar(b,sizeof(b),false);
for i:=1 to 9 do
    for j:=1 to 9 do
        begin
        read(a[i,j]);
        j1[i]:=j1[i]+[a[i,j]];j2[j]:=j2[j]+[a[i,j]];
        if a[i,j]<>0 then b[i,j]:=true;
        end;
tian(1,1);
end.