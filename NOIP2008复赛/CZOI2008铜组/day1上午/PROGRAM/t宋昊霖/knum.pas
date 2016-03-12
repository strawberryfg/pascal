program knum;
 var n,k,t,x,j,i:integer;
     a,b:array[0..100]of integer;
  begin
   assign(input,'knum.in');
   assign(output,'knum.out');
   reset(input);
   rewrite(output);
   read(n,k);
   for i:=1 to n do readln(a[i]);
   i:=0;
   repeat
    i:=i+1;
    t:=a[i];
    for j:=1 to n do
     if t<a[j] then begin
        t:=a[j];
        x:=j;
        end;
    a[x]:=0;
   until i=k;
  writeln(t);
  close(input);
  close(output);
end.


