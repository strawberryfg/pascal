var n,i:integer;
    str:string;
    total:longint;
procedure sou(m:string);
VAR I:INTEGER;
begin
  if m=str then begin writeln(total);halt;end;
  for i:=(ord(m[length(m)])-ord('A')+2) to n do
  begin
    total:=total+1;
    sou(m+chr(i+ord('A')-1));
  end;
end;

begin
  assign(input,'charcom.in');reset(input);
  assign(output,'charcom.out');rewrite(output);
  total:=1;
  readln(n);
  READLN(STR);
  for i:=1 to n do
    sou(chr(ord('A')+i-1));
  close(input);
  close(output);
end.
