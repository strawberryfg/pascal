var s:string;
    i,j,m,t,max,min,l:integer;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  readln(s);
  j:=0;
  max:=0;
  min:=251;
  for i:=1 to length(s) do
  begin
    if (s[i]=' ') then begin if j>max then begin max:=j;m:=i;end;
                          if  j<min then begin min:=j;t:=i;end;
                                        j:=0;
                                        end
          else inc(j);
  end;
  l:=length(s);
  if s[length(s)]=' ' then dec(l);
  for i:=l downto 1 do if s[i]=' ' then break;
  j:=l-i;
  i:=l+1;
  if j>max then begin max:=j;m:=i;end;
  if  j<min then begin min:=j;t:=i;end;
  for i:=m-max to m-1 do write(s[i]);
  writeln;
  for i:=t-min to t-1 do write(s[i]);
  writeln;
  close(input);
  close(output);
end.
