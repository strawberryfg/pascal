var x,y:set of byte;
   n:longint; a:array [1..17] of longint;
procedure print;
   var i:longint;
   begin
   for i:=1 to n-1 do
   write(a[i],' ');
   write(a[n]);
   writeln;
   end;
procedure try(dep:longint);
   var i:longint;
   begin
   if (dep>n) and ((a[1]+a[n]) in x)then print
            else for i:=1 to n do
                 if (i in y) and ((a[dep-1]+i) in x) then
                 begin
                 a[dep]:=i;
                 y:=y-[i];
                 try(dep+1);
                 y:=y+[i];
                 end;
   end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
readln(n);
y:=[2..n];
x:=[2,3,5,7,11,13,17,19,23,29,31];
a[1]:=1;
try(2);
close(input);
close(output);
end.
