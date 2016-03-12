var a:array [1..10000] of integer;
    n,k,i,m,j:integer;
begin
       assign(input,'knum.in');
       reset(input);
       assign(output,'knum.out');
       rewrite(output);
       read (n,k);
       for i:=1 to n do
       readln(a[i]);
       for i:=1 to n do
       begin
            for j:=i+1 to n do
            if a[i]>a[j] then
            begin
            m:=a[j];
            a[j]:=a[i];
            a[i]:=m;
            end;
       end;
       writeln(a[k]);
       close(input);
       close(output);
end.