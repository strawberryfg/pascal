var n,s1,t,s,i,l,m:longint;
    a:array[1..100]of longint;
    ok:boolean;
begin
assign(input,'broj.in');
assign(output,'broj.out');
reset(input);
rewrite(output);
read(n);
t:=0;
s1:=1;
s:=0;
while n>(s1*10) do
      begin
      inc(t);
      s1:=s1*10;
      a[t]:=s1-1;
      for i:=t-1 downto 1 do
          begin
          a[t]:=a[t]-a[i];
          end;
      a[t]:=t*a[t];
    end;
inc(t);
a[t]:=t*(n-s1+1);
for i:=1 to t do
    begin
    s:=s+a[i];
    end;
ok:=true;
l:=n;
while l>=10 do
      begin
      m:=l mod 10;
      l:=l div 10;
      if m<>0 then ok:=false;
      end;
if l<>1 then ok:=false;
if ok=true then inc(s);
write(s);
close(input);
close(output);
end.
