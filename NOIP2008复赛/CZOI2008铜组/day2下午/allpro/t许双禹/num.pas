var   a:array [1..1000]of integer;
      b:array [1..1000]of integer;
      c:array [1..1000]of integer;
      n,m,i,j:longint;
begin
      assign(input,'num.in');
      reset(input);
      assign(output,'num.out');
      rewrite(output);
      readln(n);
      for i:=1 to n do
      readln(a[i]);
      m:=0;
      for i:=1 to n do
         for j:=1 to i do
             if a[j]>a[i] then
             inc(b[i]);
      for i:=1 to n do
         for j:=i to n do
             if a[j]>a[i] then
             inc(c[i]);
      for i:=1 to n do
             if b[i]=c[i] then
             inc(m);
      writeln(m);
      close(input);
      close(output);
end.
