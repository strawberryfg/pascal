var n,d,j,i,min:longint;
    s:longint;
    ss:char;
    a,c:array[1..100]of char;
    b:array[1..100]of longint;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
read(n,d);
readln;
for i:=1 to n do
    read(c[i]);
j:=1;
s:=0;
a[1]:=c[1];
for i:=1 to n do
    begin
    ss:=c[i];
    if (a[j]=ss)and(b[j]+1<=d) then inc(b[j])
                               else if (b[j]+1>d)and(s+b[j]+1<>i) then begin s:=i;inc(j);a[j]:=ss;b[j]:=1;end
                                                                  else inc(b[j]);
    if a[j]<>ss then begin dec(b[j]);if b[j]<0 then begin a[j]:=ss;b[j]:=0;end;end;
    end;
min:=j;
j:=1;
for i:=n downto 1 do
    begin
    ss:=c[i];
    if (a[j]=ss)and(b[j]+1<=d) then inc(b[j])
                              else if (b[j]+1>d)and(s+b[j]<>i) then begin s:=i;inc(j);a[j]:=ss;b[j]:=1;end;
    if a[j]<>ss then begin dec(b[j]);if b[j]<0 then begin a[j]:=ss;b[j]:=0;end;end;
    end;
if min>j then writeln(j)
         else writeln(min);
close(input);
close(output);
end.
