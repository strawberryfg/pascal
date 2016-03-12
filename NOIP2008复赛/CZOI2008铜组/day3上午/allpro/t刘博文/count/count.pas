var n,i,leng,j,k,temp:longint;
    s:string;
    a:array[0..9] of longint;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  readln(n);
  for j:=1 to n do
  begin
    str(j,s);
    leng:=length(s);
    for k:=1 to leng do
    begin
      val(s[k],temp);
      inc(a[temp]);
    end;
  end;
  for i:=0 to 9 do writeln(a[i]);
  close(input);
  close(output);
end.
