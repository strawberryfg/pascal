var
  str,str1:string;
  i,j,n:longint;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  readln(str);
    for i:=1 to length(str) do
    begin
      for j:=1 to n do
        if str[i+n]=str[i] then str[i]:=' ';
    end;
    if (str[i]='A') or (str[i]='E') or (str[i]='I') or (str[i]='O') or (str[i]='U') then
       begin str[i]:=' ';
             str1[i]:=str[i];
       end;
    if str[i]=' ' then begin str[i]:='_';
                             str1[i]:=str[i];
                       end;
    writeln(str1);
    close(input);
    close(output);
end.



