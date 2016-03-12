var i,j,k,n,m,s,r,l:longint;
    t:array[1..200] of longint;
    tt:array[1..200] of boolean;
    a:array[1..200,1..3] of longint;
procedure work(x,k:longint);
  var i,j:longint;
  begin
  while x<100 do
        x:=x*10;
  if x<100 then x:=x*10;
  for i:=3 downto 1 do
      begin a[k,i]:=x mod 10; x:=x div 10; end;
  end;
begin
assign(input,'ghillie.in');
reset(input);
assign(output,'ghillie.out');
rewrite(output);
read(m);
while not eof do
      begin
      inc(n);
      read(t[n]);
      end;
dec(n);
for i:=1 to n do
    tt[i]:=true;
for i:=1 to n-1 do
    for j:=i+1 to n do
        if t[i]>t[j] then begin s:=t[i]; t[i]:=t[j]; t[j]:=s; end;
for i:=1 to n do
    work(t[i],i);
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        if tt[j] then
           begin
           s:=0;
           for k:=1 to 3 do
               begin
               r:=a[j,k];
               for l:=1 to i do
                   r:=r*a[j,k];
               s:=s+r;
               end;
           for k:=1 to n do
              if s=t[k] then tt[k]:=false;
           end;
        end;
    end;
i:=1;
while tt[i]=false do
      inc(i);
write(t[i]);

for j:=i+1 to n do
    if tt[j] then write(' ',t[j]);
writeln;
close(input);
close(output);
end.
