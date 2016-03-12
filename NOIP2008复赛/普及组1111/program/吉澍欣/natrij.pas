type arr=array[1..3] of longint;
var t1,t2,t:string;
    a,b:arr;
    i:longint;
    code:integer;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(t1);
readln(t2);
i:=pos(':',t1);
t:=copy(t1,1,2);
val(t,a[1],code);
t:=copy(t1,i+1,2);
val(t,a[2],code);
delete(t1,1,i+3);
val(t1,a[3],code);
i:=pos(':',t2);
t:=copy(t2,1,2);
val(t,b[1],code);
t:=copy(t2,i+1,2);
val(t,b[2],code);
delete(t2,1,i+3);
val(t2,b[3],code);
for i:=3 downto 2 do
    if b[i]<a[i] then begin dec(b[i-1]);inc(b[i],60);end;
if a[1]>b[1] then inc(b[1],24);
for i:=1 to 3 do
    dec(b[i],a[i]);
for i:=1 to 2 do
    if b[i]<10 then write('0',b[i],':')
               else write(b[i],':');
if b[3]<10 then write('0',b[3])
           else write(b[3]);
close(input);
close(output);
end.
