var a:array[0..9] of longint;
     c:array[1..1000000] of longint;
    n,i,j:longint;
function f(a:longint):integer;
begin
  f:=0;
  while a<>0 do
    begin
      f:=f+1;
      a:=a div 10;
    end;
end;
procedure check(r:longint);
begin
 a[r]:=a[r]+1;
end;
begin
    assign(input,'count.in');
    reset(input);
    assign(output,'count.out');
    rewrite(output);
   readln(n);
   for i:=0 to 9 do
   a[i]:=0;
   for i:=1 to n do
    c[i]:=i;
     for i:=1 to n do
       for j:=1 to f(c[i]) do
           begin
           check(c[i] mod 10);
           c[i]:=c[i]  div 10;
           end;
   for i:=0 to 9 do
   writeln(a[i]);
   close(input);
   close(output);
end.
