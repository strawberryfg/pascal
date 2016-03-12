var s,s1:string;
    a,b:array[1..26] of char;
    i,j,m,n,t,p:longint;
procedure change(i,j:longint);
var c:char;
begin
c:=s1[i];
s1[i]:=s1[j];
s1[j]:=c;
c:=s[i];
s[i]:=s[j];
s[j]:=c;
end;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    read(a[i]);
readln;
for j:=1 to m do
    read(b[j]);
readln(t);
for i:=n downto 1 do
    begin
    s:=s+a[i];
    s1:=s1+'1';
    end;
for j:=1 to m do
    begin
    s:=s+b[j];
    s1:=s1+'0';
    end;
for j:=1 to t do
    for i:=1 to n+m do
        if (p=0)and(s1[i]='1')and(s1[i+1]='0')or(s1[i]='0')and(s1[i+1]='1') then
                                                                    begin
                                                                    change(i,i+1);
                                                                    p:=1;
                                                                    end
                                                                    else p:=0;
writeln(s);
close(input);
close(output);
end.
