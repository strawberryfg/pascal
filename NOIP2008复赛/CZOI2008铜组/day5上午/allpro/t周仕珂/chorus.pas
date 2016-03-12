var n,least,i,s,s1,s2:longint;
        h:array[1..100]of longint;
function left(a:longint):longint;
var i,j:longint;
begin
s2:=0;
for i:=a downto 2 do
        if (h[i]>h[a])or(h[i]>h[i+1]) then inc(s2);
left:=s2;
end;
function right(b:longint):longint;
var i,j:longint;
begin
s1:=0;
for i:=b to n-1 do

                if (h[i]>h[i-1])or(h[i]>h[b]) then inc(s1);
right:=s1;
end;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
least:=maxlongint;
for i:=1 to n do
        read(h[i]);
for i:=2 to n-1 do
        begin
        s:=left(i)+right(i);
        if (s<least)and(i-s2<>1)and(s2<>0)and(n-i-s1<>0) then least:=s;
        s:=0;
        end;
writeln(least);
close(input);
close(output);
end.
