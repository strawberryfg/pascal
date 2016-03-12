var n,m,i,t:longint;str:string;
    a,s:array[0..26]of longint;

begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(str);
for i:=n downto 1 do
        if i=n then a[i]:=1
                else if i=n-1 then a[i]:=2
            else a[i]:=a[i+1]+a[i+2]+1;
s[1]:=1;
for i:=2 to n do
        s[i]:=s[i-1]+a[i-1];
m:=0;
a[0]:=1;
for i:=1 to length(str) do
        m:=m+s[ord(str[i])-ord('A')+1-i]+1;
writeln(m);
close(input);
close(output);
end.