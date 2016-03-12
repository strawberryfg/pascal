program maxnum;
var j,k,i,total:longint;
    a:array[1..10000] of integer;
    flag:boolean;
begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  i:=0;
  while not eof do
  begin
    inc(i);
    readln(a[i]);
  end;
  total:=1;
  for j:=1 to a[1] do
      begin
        flag:=true;
        for k:=1 to i do
            if not(a[k] mod j=0) then begin flag:=false;break; end;
        if flag=true then total:=total*j;
      end;
  writeln(total);
  close(input);
  close(output);
end.