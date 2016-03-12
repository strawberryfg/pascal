var n,sl,tsl,i,k,sum,j:longint;
        a:array[1..26] of longint;
        s:string;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(s);
a[1]:=1;
k:=1;
sum:=0;
sl:=length(s);
tsl:=sl;
for i:=2 to n do
        begin
        a[i]:=a[i-1]+k;
        inc(k);
        end;
for i:=1 to n do
        sum:=sum+a[i];
for i:=1 to n-(ord(s[j])-ord('A')) do
        sum:=sum-a[i];

writeln(sum);
close(input);
close(output);

end.