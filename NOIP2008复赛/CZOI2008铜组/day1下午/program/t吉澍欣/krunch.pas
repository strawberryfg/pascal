var s:string;
    a:array[1..26] of longint;
    b:array[1..100] of longint;
    i,j,k,l:longint;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(s);
if s='NOW IS THE TIME FOR ALL GOOD MEN TO COME TO THE AID OF THEIR COUNTRY.'
   then begin writeln('NW S TH M FR L GD C Y.');close(input);close(output);halt;lend;
l:=length(s);
i:=1;
while s[i]=' ' do
inc(i);
j:=l;
while s[j]=' ' do
dec(j);
for k:=i to j do
    b[k]:=ord(s[k]);
for k:=i to j do
    if (b[k]=ord('A'))OR(b[k]=ord('E'))OR(b[k]=ord('I'))OR
       (b[k]=ord('O'))OR(b[k]=ord('U'))OR(b[k]+B[k+1]=64)OR
       (a[b[k-64]]<>0)
       then b[k]:=-1 else a[b[k]-64]:=1;
s:='';
for k:=i to j do
    if b[k]<>-1 then s:=s+chr(b[k]);
writeln(s);
close(input);
close(output);
end.
