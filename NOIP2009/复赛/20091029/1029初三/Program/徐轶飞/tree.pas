var t,i,n,j:longint;
    a:array[1..10000,1..3]of longint;
procedure save(tt:longint);
begin
if tt>t then t:=tt;
end;
procedure work(b,tt:longint);
var j:longint;
begin
tt:=tt+a[b,1];
for j:=2 to 3 do
        begin
        if a[b,j]=0 then begin save(tt); exit;end
                    else work(a[b,j],tt);
        end;
end;
begin
assign(input,'tree.in');
assign(output,'tree.out');
reset(input);
rewrite(output);
readln(n);
t:=0;
for i:=1 to n do
    begin
    read(a[i,1]);
    j:=2;
    while not eoln do
          begin
          read(a[i,j]);
          j:=j+1;
          end;
    end;
for i:=1 to n do
    work(i,0);
writeln(t);
close(input);
close(output);
end.