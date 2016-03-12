var a:array[1..1000] of longint;
    i,n,total:integer;
function ok(i:integer):boolean;
var t,s,j:integer;
begin
   t:=0;
   s:=0;
   for j:=1 to n-1 do if a[j]>a[i] then inc(t);
   for j:=i+1 to n do if a[j]>a[i] then inc(s);
   if t=s then ok:=true else ok:=false;
end;

begin
   assign(input,'num.in');
   reset(input);
   assign(output,'num.out');
   rewrite(output);
   readln(n);
   for i:=1 to n do readln(a[i]);
   for i:=1 to n do if ok(i) then inc(total);
   writeln(total);
   close(input);
   close(output);
end.
