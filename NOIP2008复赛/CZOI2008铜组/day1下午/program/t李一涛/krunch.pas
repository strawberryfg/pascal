var s:string;
    i,j,k,l,t:shortint;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  readln(s);
  l:=length(s); i:=1;
  while i<=l do
  begin
    if (s[i]='A')or(s[i]='E')or(s[i]='I')or(s[i]='O')or(s[i]='U') then
    begin
      dec(l);
      for j:=i to l do s[j]:=s[j+1];
      s[l+1]:=' ';
    end else inc(i);
  end;
  i:=1;
  while i<=l do
  begin
    if (s[i]=' ')and(s[i+1]=' ') then
    begin
      dec(l);
      for j:=i to l do s[j]:=s[j+1];
    end else inc(i);
  end;
  for i:=1 to l do
    begin
      j:=i+1;
      while j<=l do
      begin
        if (s[j]=s[i])and(s[i]<>'.')and(s[i]<>',')and(s[i]<>'?') then
        begin
          dec(l);
          for t:=j to l do s[t]:=s[t+1];
        end else inc(j);
      end;
    end;
  for i:=1 to l do write(s[i]);
  close(input);
  close(output);
end.