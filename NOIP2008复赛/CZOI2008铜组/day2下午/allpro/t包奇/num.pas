program num;
var a:array[1..1000] of longint;
    n,i,k,q,w,total,max1,max2:integer;
begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do readln(a[i]);
  total:=0;
  for k:=1 to n do
      begin
        max1:=0;
        max2:=0;
        for q:=1 to k do
            if a[q]>a[k] then inc(max1);
        for w:=k to n do
            if a[w]>a[k] then inc(max2);
        if max1=max2 then inc(total);
      end;
  writeln(total);
  close(input);
  close(output);
end.