var n,i,j,k,q,p,c:byte;
    g,s,t:packed array[1..200]of integer;
begin
assign(input,'ghillie.in');
assign(output,'ghillie.out');
rewrite(output);
reset(input);
readln(n);
while not eoln do
      begin inc(q); read(g[q]);end;
c:=q;
s:=g;
for i:=1 to n do
    begin
    for j:=1 to q do
        begin
        while g[j]<>0 do
              begin
              t[j]:=t[j]+(g[j] mod 10)*(g[j] mod 10);
              g[j]:=g[j] div 10;
              end;
        for k:=1 to q do if t[j]=s[k] then s[k]:=-1;
        end;
    p:=0;
    for j:=1 to q do if t[j]<>-1 then begin inc(p); g[p]:=t[j]; end;
    q:=p;
    end;
for i:=1 to c-1 do
    for j:=i+1 to c do
        if s[i]>s[j] then begin s[i]:=s[i]+s[j]; s[j]:=s[i]-s[j]; s[i]:=s[i]-s[j]; end;
for i:=1 to c-1 do if s[i]<>-1 then write(s[i],' ');
writeln(s[c]);
close(input);
close(output);
end.
