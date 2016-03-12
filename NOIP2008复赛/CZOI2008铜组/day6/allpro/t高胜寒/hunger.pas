var total,i,j,jiao,count:longint;
    pd:boolean;
    a,b:array[1..1000]of integer;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(total);
  for i:=1 to total do
      readln(a[i],b[i]);
  for i:=1 to total-1 do
      for j:=2 to total do
          if b[j]-a[j]>b[j-1]-a[j-1] then
          begin
            jiao:=a[j];
            a[j]:=a[j-1];
            a[j-1]:=jiao;
            jiao:=b[j];
            b[j]:=b[j-1];
            b[j-1]:=jiao;
          end;
  for i:=1 to total do
  begin
    pd:=false;
    for j:=i-1 downto 1 do
        if (a[i]<=b[j])and(b[i]>=b[j])or(b[i]>=a[j])and(a[i]<=a[j])then
        begin pd:=true; break; end;
    if pd=false then count:=count+b[i]-a[i]+1;
  end;
  writeln(count);
  close(input);
  close(output);
end.
