var n,k,i,j,t:integer;
    a:array[1..10000] of integer;
begin
   assign(input,'knum.in');
   reset(input);
   assign(output,'knum.out');
   rewrite(output);
   readln(n,k);
   for i:=1  to n do
     readln(a[i]);
   for i:= 1 to n do
     for j:=i to n do
       if a[i]<a[j] then begin
                           t:=a[i];
                           a[i]:=a[j];
                           a[j]:=t;
                         end;
   writeln(a[k]);
   close(input);
   close(output);
end.
