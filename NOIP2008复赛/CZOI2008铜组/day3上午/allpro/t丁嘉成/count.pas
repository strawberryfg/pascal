var n:longint;
    total:array[0..9]of longint;

procedure start;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
end;

procedure endit;
begin
close(input);
close(output);
end;

procedure intt;
begin
readln(n);
end;

procedure outt;
var i:longint;
begin
for i:=0 to 9 do
 writeln(total[i]);
end;

procedure try(x:longint);
var j,temp:longint;
    a:array[1..50]of longint;
begin

temp:=0;
j:=0;

for j:=1 to 10 do
  a[j]:=0;

j:=0;

while x<>0 do
  begin
    inc(j);
    a[j]:=x mod 10;
    x:=x div 10;
    inc(temp);
  end;

for j:=1 to temp do
  begin
  if a[j]=0 then begin
                   inc(total[0]);
                   continue;
                 end;
  if a[j]=1 then begin
                   inc(total[1]);
                   continue;
                 end;
  if a[j]=2 then begin
                   inc(total[2]);
                   continue;
                 end;
  if a[j]=3 then begin
                   inc(total[3]);
                   continue;
                 end;
  if a[j]=4 then begin
                   inc(total[4]);
                   continue;
                 end;
  if a[j]=5 then begin
                   inc(total[5]);
                   continue;
                 end;
  if a[j]=6 then begin
                   inc(total[6]);
                   continue;
                 end;
  if a[j]=7 then begin
                   inc(total[7]);
                   continue;
                 end;
  if a[j]=8 then begin
                   inc(total[8]);
                   continue;
                 end;
  if a[j]=9 then begin
                   inc(total[9]);
                   continue;
                 end;
  end;

end;

procedure runit;
var i:longint;
begin

for i:=1 to n do
  try(i);

end;

begin
start;
intt;
runit;
outt;
endit;
end.
