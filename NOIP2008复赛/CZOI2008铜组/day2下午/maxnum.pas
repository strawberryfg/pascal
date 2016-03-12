const maxn=1000;
var i,j,sum:longint;
    a:array[1..maxn]of integer;
procedure endfile;
begin
close(input);
close(output);
end;
function try(m,n:longint):longint;
var r:longint;
begin
             r:=maxlongint;
             while r<>0 do
                   begin
                   r:=m mod n;
                   m:=n;
                   n:=r;
                   end;
             try:=m;
end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=0;
while not eof do
      begin
      inc(i);
      readln(a[i]);
      end;
sum:=a[1];
for j:=2 to i do
    begin
    sum:=try(sum,a[j]);
    if sum=1 then break;
    end;
writeln(sum);
endfile;
end.
