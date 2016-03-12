var n,l,i,j,s1:longint;
    s:string;
    jia:array[1..26]of longint;
    a:array[1..26]of char;
    ch,en:char;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
read(s);
l:=length(s);
for i:=1 to l do
    begin
    a[i]:=s[i];
    end;
s1:=s1+ord(a[l])-64;
jia[n]:=0;
for i:=n-1 downto 1 do
    begin
    jia[i]:=jia[i+1]*2+1;
    end;
ch:='A';
en:=a[1];
for j:=(ord(ch)-64) to (ord(en)-1-64) do
        s1:=s1+jia[j];
for i:=1 to l do
    begin
    ch:=a[i];
    en:=a[i+1];
    for j:=(ord(ch)+1-64) to (ord(en)-1-64) do
        s1:=s1+jia[j];
    end;
write(s1);
close(input);
close(output);
end.
