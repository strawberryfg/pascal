var   a:array [0..1000] of longint;
      i,j,k,m,r:longint;
begin assign(input,'maxnum.in');
      reset(input);
      assign(output,'maxnum.out');
      rewrite(output);
      i:=1;
      while not eof do
      begin
      readln(a[i]);
      inc(i);
      end;
      for m:=1 to i do
          for j:=m+1 to i do
            if a[j]<a[m] then
            begin a[0]:=a[m];
                  a[m]:=a[j];
                  a[j]:=a[0];
            end;
      for k:=1 to i-1 do
         while a[k]>0 do
         begin
         if a[k]<=a[k+1] then
         r:=a[k+1] mod a[k];
         a[k+1]:=a[k];
         a[k]:=r;
         end;
      writeln(a[i]);
      close(input);
      close(output);
end.
