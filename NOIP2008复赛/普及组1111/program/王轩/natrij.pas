var s1,s2:string;
    t1,t2,t3,ans:longint;
function zhuan(s:string):longint;
var i,t:longint;
begin
t:=0;
for i:=1 to length(s) do
    t:=t*10+ord(s[i])-ord('0');
zhuan:=t;
end;
procedure print(n:longint);
var s:string;
    i:longint;
begin
s:='';
str(n,s);
if length(s)<2 then
   for i:=1 to 2-length(s) do
       write(0);
write(s);
end;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
readln(s1);
s1:=s1;
readln(s2);
s2:=s2;
t1:=zhuan(copy(s1,1,2))*3600+zhuan(copy(s1,4,2))*60+zhuan(copy(s1,7,2));
t2:=zhuan(copy(s2,1,2))*3600+zhuan(copy(s2,4,2))*60+zhuan(copy(s2,7,2));
if t2<=t1 then inc(t2,3600*24);
ans:=t2-t1;
print(ans div 3600);
write(':');
print(ans mod 3600 div 60);
write(':');
print(ans mod 60);
writeln;
close(input);
close(output);
end.
