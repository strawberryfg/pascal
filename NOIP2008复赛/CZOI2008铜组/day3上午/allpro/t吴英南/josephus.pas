var n,k,i:longint;
procedure j(s:longint);
  var d:longint;
  begin
  d:=0;
  while n<>0 do
     begin
     d:=d+s;
     if d>k+n then d:=d mod (k+n);
     if d=0 then d:=n+k;
     if d<=k then exit;
     dec(n);
     dec(d);
     end;
  writeln(s);
  close(input);
  close(output);
  halt;
  end;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(k);
n:=k;
for i:=k+1 to maxlongint do
    begin
    n:=k;
    j(i);
    end;
end.