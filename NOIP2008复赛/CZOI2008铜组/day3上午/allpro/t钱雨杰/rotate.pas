var a:array[1..20,1..20] of longint;
    num,i,j,dep,n:longint;

begin
assign(input,'rotate.in');
reset(input);
assign(output,'rorate.out');
rewrite(output);

    readln(n);
    num:=1;
    dep:=0;
    while num<=n*n do
      begin
      for i:=dep+1 to n-dep do
          begin
          a[dep+1,i]:=num;
          inc(num);
          end;
      for i:=dep+2 to n-dep do
          begin
          a[i,n-dep]:=num;
          inc(num);
          end;
      for i:=n-dep-1 downto dep+1 do
          begin
          a[n-dep,i]:=num;
          inc(num);
          end;
      for i:=n-dep-1 downto dep+2 do
          begin
          a[i,dep+1]:=num;
          inc(num);
          end;
      inc(dep);
      end;
      for i:=1 to n do
          begin
          for j:=1 to n do
              write(a[i,j]:4);
          writeln;
          end;

close(input);
close(output);
end.