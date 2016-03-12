var n,i,total:longint;
    a:array[0..1001]of shortint;
procedure try(k,number:longint);
  var before,after:longint;
  begin
  before:=0; after:=0;
  for i:=number-1 to 0 do
      if a[i]>k then inc(before);
  for i:=number+1 to n+1 do
      if a[i]>k then begin inc(after); if after>before then break;end;
  if before=after then inc(total);
  if number<=n then try(a[number+1],number+1);
  end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i]);
a[i+1]:=0;
a[0]:=0;
total:=0;
try(a[1],1);
writeln(total);
close(input);
close(output);
end.