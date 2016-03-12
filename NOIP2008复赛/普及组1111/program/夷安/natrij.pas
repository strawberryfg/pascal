var a,b,c:array[1..3] of longint;
    s1,s2:string;
    i,j,k,m,n:longint;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
readln(s1);
readln(s2);
for i:=1 to 8 do
    if i=1 then a[1]:=ord(s1[i])-48
    else if i=2 then a[1]:=a[1]*10+ord(s1[i])-48
    else if i=4 then a[2]:=ord(s1[i])-48
    else if i=5 then a[2]:=a[2]*10+ord(s1[i])-48
    else if i=7 then a[3]:=ord(s1[i])-48
    else if i=8 then a[3]:=a[3]*10+ord(s1[i])-48;
for i:=1 to 8 do
    if i=1 then b[1]:=ord(s2[i])-48
    else if i=2 then b[1]:=b[1]*10+ord(s2[i])-48
    else if i=4 then b[2]:=ord(s2[i])-48
    else if i=5 then b[2]:=b[2]*10+ord(s2[i])-48
    else if i=7 then b[3]:=ord(s2[i])-48
    else if i=8 then b[3]:=b[3]*10+ord(s2[i])-48;
c[1]:=b[1]-a[1];
c[2]:=b[2]-a[2];
c[3]:=b[3]-a[3];
if c[3]<0 then begin c[2]:=c[2]-1;c[3]:=c[3]+60;end;
if c[2]<0 then begin c[1]:=c[1]-1;c[2]:=c[2]+60;end;
if c[1]<0 then c[1]:=c[1]+24;
if c[1] div 10=0 then write('0',c[1],':')
                 else write(c[1],':');
if c[2] div 10=0 then write('0',c[2],':')
                 else write(c[2],':');
if c[3] div 10=0 then write('0',c[3])
                 else write(c[3]);
writeln;
close(input);
close(output);
end.