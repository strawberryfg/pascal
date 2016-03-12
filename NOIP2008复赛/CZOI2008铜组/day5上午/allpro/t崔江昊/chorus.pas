var i,n,min:longint; a,b:array[1..1000] of longint;
procedure try(i:longint);
   var s,j,k:longint;
    begin
    b[i]:=0;
    s:=a[i];
    for j:=i-1 downto 1 do
       begin
       if a[j]>=s then b[i]:=b[i]+1
       else s:=a[j];
       end;
       s:=a[i];
    for j:=i+1 to n do
     begin
     if a[j]>=s then b[i]:=b[i]+1
     else s:=a[j];
     end;
    end;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
for i:=1 to n do
   read(a[i]);
for i:=1 to n do
 try(i);
 min:=b[1];
 for i:=2 to n do
 if b[i]<min then min:=b[i];
 writeln(min);
 close(input);
 close(output);
end.