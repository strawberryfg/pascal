var n,i,j,s:longint;
    a:array[1..10,1..10] of longint;
    b:array[1..10] of string;
procedure wide(dep:longint);
var t,f,i,j:longint;
begin
t:=1;
     while t<=n do
     begin
     f:=0;
     for i:=t to n do
         if (a[dep,i]<>2)and(a[dep,i]<>5) then BEGIN a[dep,i]:=1;break;END
                                          ELSE BEGIN f:=1;BREAK;end;
     IF F=0 THEN BEGIN
     for j:=i+1 to n do
     if a[dep,j]<>5 then a[dep,j]:=2
                    else break;
     for j:=dep+1 to  n do
     if a[j,i]<>5 then a[j,i]:=2
                  else break;
     for j:=dep-1 downto 1 do
     if a[j,i]<>5 then a[j,i]:=2
                  else break;
     END;
     t:=i+1;
     end;
end;
procedure try(dep:longint);
begin
    if dep>n then exit
              else begin
                   wide(dep);
                   try(dep+1);
                   end;
end;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
readln(b[i]);
for i:=1 to n do
    for j:=1 to n do
    if b[i,j]='.' then a[i,j]:=0
                   else a[i,j]:=5;
try(1);
for i:=1 to n do
    for j:=1 to n do
    if a[i,j]=1 then s:=s+1;
writeln(s);
close(input);
close(output);
end.
