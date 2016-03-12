var stair,no,bad,i:longint;
    o:array[1..30]of boolean;
    count:array[1..30]of longint;
begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);
  readln(stair);
  readln(no);
  for i:=1 to no do
  begin
    readln(bad);
    o[bad]:=true;
  end;
  if o[1]=false then count[1]:=1;
  if o[2]=false then count[2]:=2;
  if o[3]=false then count[3]:=4;
  for i:=4 to stair do
  begin
    if o[i-1]=false then count[i]:=count[i]+count[i-1];
    if o[i-2]=false then count[i]:=count[i]+count[i-2];
    if o[i-3]=false then count[i]:=count[i]+count[i-3];
  end;
  writeln(count[stair]);
  close(input);
  close(output);
end.