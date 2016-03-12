program j401;
type str1=string[100];
var line:str1;
    kz:integer;
procedure  reverse(var s:str1);
var i,j:integer;
    t:char;
begin
  i:=1; j:=length(s);
  while (i<j) do
   begin
   t:=s[i]; s[i]:=s[j]; s[j]:=t;
   inc(i);dec(j);
  end;
end;
begin
  writeln('continue? -1 for end.');
  readln(kz);
  while (kz<>-1) do
    begin
     readln(line);
     reverse(line);
     writeln(line);
     writeln('continue? -1 for end.');
     readln(kz);
    end;
end.

