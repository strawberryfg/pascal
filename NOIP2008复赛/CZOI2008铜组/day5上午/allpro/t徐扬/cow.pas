var t,n,y,i,j:longint;
    s:array[1..1000] of longint;
    s1:int64;
begin
  assign(input,'cow.in');
  assign(output,'cow.out');
  reset(input);
  rewrite(output);
  readln(n);
  y:=1;
  s[1]:=1;
  for i:=4 to n do
  s[i]:=1;
  y:=4;
  while y<n do
    begin
     y:=y+1;
      for i:=1 to y div 4 do
     if s[y-i*3]>0 then for j:=y to n do s[j]:=s[j]+1;
     end;
  s1:=0;
  for i:=1 to n do  s1:=s1+s[i];
  writeln(s1);
 close(input);
 close(output);
end.