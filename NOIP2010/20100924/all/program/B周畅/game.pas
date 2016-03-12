var
  i,n,k:longint;
  st:string;
  s:array[1..2]of string[3];
begin
  assign(input,'game.in'); reset(input);
  assign(output,'game.out'); rewrite(output);
  readln(n);
  for i:=1 to n do readln(st);
  randomize;
  s[1]:='Yes';
  s[2]:='No';
  k:=random(2);
  for i:=1 to n do
    if k=1 then writeln(s[1]) else writeln(s[2]);
  close(input); close(output);
end.