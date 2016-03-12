var i,j:longint;
    a:array[1..100]of longint;
    s:string;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(s);
for i:=1 to 2 do
    a[i]:=0;
i:=0;
while i<=length(s) do
      begin
      inc(i);
      if (s[i-1]=' ')and(a[1]=0) then a[1]:=1
                               else if a[1]=1 then begin delete(s,i,1);dec(i);continue; end
                                              else a[1]:=0;
      if (s[i]='A')or (s[i]='E') or (s[i]='I') or (s[i]='O') or (s[i]='U') then begin delete(s,i,1);dec(i);continue; end;

      if (a[ord(s[i-1])]=1)and(s[i]<>',')and(s[i]<>'.')and(s[i]<>'.') then begin dec(a[ord(s[i])]);delete(s,i,1);dec(i);continue;end
                                                                    else inc(a[ord(s[i])]);
      end;
writeln(s);
close(input);
close(output);
end.
