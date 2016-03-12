var t:array[1..2,1..3] of longint;
    i:longint;
    s:string[8];
begin
assign(input,'natrij.in');
reset(input);
readln(s);
for i:=1 to 3 do
    t[1,i]:=ord(s[i*3-2])*10+ord(s[i*3-1])-528;
readln(s);
close(input);
for i:=1 to 3 do
    begin
    t[2,i]:=ord(s[i*3-2])*10+ord(s[i*3-1])-528;
    t[2,i]:=t[2,i]-t[1,i];
    end;
for i:=3 downto 2 do
    if t[2,i]<0
       then begin
            t[2,i]:=t[2,i]+60;
            dec(t[2,i-1])
            end;
if t[2,1]<0
   then t[2,1]:=t[2,1]+24;
assign(output,'natrij.out');
rewrite(output);
for i:=1 to 2 do
    if t[2,i]<10
       then write('0',t[2,i],':')
       else write(t[2,i],':');
if t[2,3]<10
   then writeln('0',t[2,3])
   else writeln(t[2,3]);
close(output);
end.
