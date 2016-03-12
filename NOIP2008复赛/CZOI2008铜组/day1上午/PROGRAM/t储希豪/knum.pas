program knum;
const maxn=10000;
var n,k,i,j:integer;
    a:array[1..maxn] of integer;
begin
   assign(input,'knum.in');
   reset(input);
   assign(output,'knum,out');
   rewrite(output);
   readln(n,k);
   for i:=1 to n do then read(a[i]);

   close(input);
   close(output);
end.