program S404;
const n=12;
  ch2:array[0..12] of char
    =('q','A','S','O','R','T','E','X','A','M','P','L','E');
var k:integer;
    ch:array[0..12] of char;
procedure  shift(k,n:integer);
var v:char;
    j:integer;
begin
  v:=ch[k]; j:=k+k;
  while (j<=n) do
    begin
      if (j<n) and (ord(ch[j])<ord(ch[j+1])) then inc(j);
      if (ord(v)<ord(ch[j])) then
        begin ch[j div 2]:=ch[j]; j:=j*2; end
      else
        exit;
      ch[j div 2]:=v;
    end;
end;
procedure hpsrt;
var k:integer;
    tmp:char;
begin
  for k:=n div 2 downto 1 do  shift(k,n);
  write('No.1: ');
  for k:=1 to n do  write(ch[k]);
  writeln;
  for k:=n downto 1 do
   begin
     tmp:=ch[1]; ch[1]:=ch[k]; ch[k]:=tmp;
     shift(1,k-1);
   end;
end;
begin
  for k:=0 to n do ch[k]:=ch2[k];
  hpsrt;
  write('No.2: ');
  for k:=1 to n do write(ch[k]);
  writeln;
end.





