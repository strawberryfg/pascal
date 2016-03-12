program krunch;
var i,n,j,temp,k:longint;
    s:string;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  readln(s);
  n:=length(s);
  if s[1]=' ' then begin for i:=1 to n do s[i]:=s[i+1];n:=n-1;end;
  if s[n]=' ' then n:=n-1;
  for i:=1 to n do
      if  (ord(s[i])>ord('a'))and( ord(s[i])<ord('z'))then begin temp:=i;for j:=temp to n-1 do s[j]:=s[j+1];dec(n)end;
      if (s[i]='A')or(s[i]='E')or(s[i]='I')or(s[i]='O')or(s[i]='U') then begin
                                                                           temp:=i;
                                                                           for j:=temp to n-1 do
                                                                               s[j]:=s[j-1];
                                                                           dec(n);
                                                                         end;
      if ((s[i]='.')or(s[i]='?')or(s[i]=','))and(s[i-1]=' ') then begin
                                                                    temp:=i-1;
                                                                    for j:=temp to n-1 do
                                                                        s[j]:=s[j+1];
                                                                    dec(n)
                                                                   end;
      if (s[i]=' ')and(s[i-1]=' ') then begin
                                          temp:=i-1;
                                          for j:=temp to n-1 do
                                              s[j]:=s[j+1];
                                          dec(n);
                                        end;
  for i:=1 to n do
      for j:=1 to n do
          if s[i]=s[j] then begin
                              temp:=j;
                              for k:=temp to n-1 do
                                  s[k]:=s[k+1];
                              dec(n)
                            end;
  for i:=1 to n do
      write(s[i]);
  close(input);
  close(output);
end.
