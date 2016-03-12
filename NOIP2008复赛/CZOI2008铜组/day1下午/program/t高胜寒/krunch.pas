var str,s:string;
    i,c:longint;
    o:array[1..26]of boolean;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  readln(str);
  for i:=1 to length(str) do
  begin
    if (str[i]='A')or(str[i]='E')or(str[i]='I')or(str[i]='O')or(str[i]='U')
       or(o[ord(str[i])-64])
    then continue;
    c:=c+1;
    s:=s+str[i];
    o[ord(str[i])-64]:=true;
  end;
  writeln(s);
  close(input);
  close(output);
end.