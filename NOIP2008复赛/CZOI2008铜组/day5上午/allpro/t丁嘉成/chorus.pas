program chorus;

const maxn=200;

type list=array[1..maxn]of char;

var a:list;
    leave,n:longint;

procedure startt;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
reset(output);
end;

procedure endit;
begin
close(input);
close(output);
end;

procedure intt;
var i:longint;
begin
readln(n);
for i:=1 to n do
  read(a[i]);
end;

procedure outt;
begin
writeln(leave);
end;

procedure try(x:longint);
begin
leave:=x div 2;
end;

procedure runit;
begin
try(n);
end;

begin
startt;
intt;
runit;
outt;
endit;
end.
