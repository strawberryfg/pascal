const sm:array[1..9,1..9] of longint=((1,1,1,2,2,2,3,3,3),(1,1,1,2,2,2,3,3,3),(1,1,1,2,2,2,3,3,3),(4,4,4,5,5,5,6,6,6),(4,4,4,5,5,5,6,6,6)
,(4,4,4,5,5,5,6,6,6),(7,7,7,8,8,8,9,9,9),(7,7,7,8,8,8,9,9,9),(7,7,7,8,8,8,9,9,9));
var a:array[1..9,1..9] of longint;
    i,j,k:longint;
procedure print;
var i,j:longint;
begin
for i:=1 to 9 do
    begin
    for j:=1 to 8 do
    write(a[i,j],' ');
    writeln(a[i,9]);
    end;
close(input);
close(output);
HALT;
end;
function pd(k,num,i,j:longint):boolean;
var p,q:longint;
begin
for p:=1 to 9 do
    if (k=a[p,j]) or (k=a[i,p]) then exit(false);
for p:=1 to 9 do
    for q:=1 to 9 do
      if (sm[p,q]=num) and(p<>i) and(q<>j)and(k=a[p,q]) then exit(false);
exit(true);
end;
procedure try(i,j:longint);
var k:longint;
begin
if i>9  then print
        else
                  begin
                  if a[i,j]=0 then
                        begin
                        for k:=1 to 9 do
                                if pd(k,sm[i,j],i,j) then begin a[i,j]:=k; if j<>9 then try(i,j+1) else try(i+1,1); a[i,j]:=0;end;
                        end
                        else if j<>9 then try(i,j+1) else try(i+1,1);
                  end;
end;
begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
for i:=1 to 9 do
    for j:=1 to 9 do
        read(a[i,j]);
try(1,1);
end.
