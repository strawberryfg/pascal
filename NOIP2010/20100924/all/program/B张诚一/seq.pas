var low,high,n,i,j,t:longint;
    a:array[1..100000]of longint;
begin
  assign(input,'seq.in');
  assign(output,'seq.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do readln(a[i]);
  low:=a[1]*2-a[2];
  high:=a[1];
  for i:=2 to n do
      begin
        t:=low;
        low:=a[i]-high;
        high:=a[i]-t;
        if low<0 then low:=0;
      end;
  writeln(high-low+1);
  close(input);
  close(output);
end.
