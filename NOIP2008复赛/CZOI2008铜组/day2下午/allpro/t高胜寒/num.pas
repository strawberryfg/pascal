var i,total,j,front,back,count:longint;
    a:array[1..1000]of longint;
begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);
  readln(total);
  for i:=1 to total do
      readln(a[i]);
  for i:=1 to total do
  begin
    front:=0;
    back:=0;
    for j:=1 to i-1 do
        if a[j]>a[i] then inc(front);
    for j:=i+1 to total do
        if a[j]>a[i] then inc(back);
    if front=back then count:=count+1;
  end;
  writeln(count);
  close(input);
  close(output);
end.
