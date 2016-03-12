var hh:array[1..6,1..2] of char;
c,d:array[1..3]of longint;
jg:array[1..3]of longint;
t:array[1..6,1..2]of longint;
k:char;
a,b,i,j,l,t1,t2,f:longint;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
a:=0;
b:=0;
for i:=1 to 2 do
begin
for l:=1 to 2 do
begin
for j:=1 to 2 do
begin
read(hh[l,j]);
t[l,j]:=ord(ord(hh[l,j])-48);
end;
read(k);
end;
for j:=1 to 2 do
begin
read(hh[l+1,j]);
t[l+1,j]:=ord(ord(hh[l+1,j])-48);
end;
if i=1 then begin
for j:=1 to 3 do
begin
c[j]:=t[j,1]*10+t[j,2];
if j=1 then a:=a+c[j]*3600
else if j=2 then a:=a+c[j]*60
            else a:=a+c[j];
end;
end
else begin
for j:=1 to 3 do
begin
d[j]:=t[j,1]*10+t[j,2];
if j=1 then b:=b+d[j]*3600
else if j=2 then b:=b+d[j]*60
            else b:=b+d[j];
end;
end;
readln;
end;
if a<b then begin
                  for i:=3 downto 1 do
                  begin
                  if d[i]-c[i]>=0 then jg[i]:=d[i]-c[i]
                  else begin jg[i]:=d[i]-c[i]+60;dec(d[i-1])end;
                  end;
                  end
else begin
d[1]:=d[1]+24;
for i:=3 downto 1 do
                  begin
                  if d[i]-c[i]>=0 then jg[i]:=d[i]-c[i]
                  else begin jg[i]:=d[i]-c[i]+60;dec(d[i-1])end;
                  end;
end;
for i:=1 to 2 do
begin
if jg[i]<10 then write('0',jg[i])
else write(jg[i]);
write(':');
end;
if jg[3]<10 then write('0',jg[3])
else write(jg[3]);
close(input);
close(output);
end.