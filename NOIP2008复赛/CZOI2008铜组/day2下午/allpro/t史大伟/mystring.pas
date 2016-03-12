var  a:array[1..150] of string;
     b,c:array[1..150] of longint;
     t,t2,i,j,k:longint;
     s,t1:string;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s);
t:=1;
for i:=1 to 150 do
a[i]:='';
for i:=1 to length(s) do
begin
if s[i]=' ' then begin t:=t+1;i:=i+1;end;
a[t]:=a[t]+s[i];
b[t]:=t;
end;
for j:=1 to t do
    c[j]:=length(a[j]);
for i:=1 to t-1 do
    for j:=1 to t-i do
    if c[j]<c[j+1] then begin
                        t2:=c[j];c[j]:=c[j+1];c[j+1]:=t2;
                        t2:=b[j];b[j]:=b[j+1];b[j+1]:=t2;
                        t1:=a[j];a[j]:=a[j+1];a[j+1]:=t1;
                        end;
for i:=1 to t-1 do
if c[i]<>c[i+1] then break;
for j:=1 to i-1 do
    for k:=1 to i-j do
    if b[k]>b[k+1] then   begin
                        t2:=c[k];c[k]:=c[k+1];c[k+1]:=t2;
                        t2:=b[k];b[k]:=b[k+1];b[k+1]:=t2;
                        t1:=a[k];a[k]:=a[k+1];a[k+1]:=t1;
                        end;
for i:=t downto 2 do
if c[i]<>c[i-1] then break;
for j:=i to t-1 do
    for k:=i to t-j+i-1 do
    if b[k]<b[k+1] then  begin
                        t2:=c[k];c[k]:=c[k+1];c[k+1]:=t2;
                        t2:=b[k];b[k]:=b[k+1];b[k+1]:=t2;
                        t1:=a[k];a[k]:=a[k+1];a[k+1]:=t1;
                        end;
writeln(a[1]);
write(a[t]);
close(input);
close(output);
end.