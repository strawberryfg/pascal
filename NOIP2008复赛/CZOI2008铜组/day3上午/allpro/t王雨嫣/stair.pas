
var k,n,m,i,s:longint;
    a:array[0..30]of longint;
procedure try(k:longint);
begin
if a[k]=1 then
   begin
   if k=n-1 then try(k+1);
   if k=n-2 then begin
                 try(k+1);
                 try(k+2);
                 end;
   if k<=n-3 then begin
                  try(k+1);
                  try(k+2);
                  try(k+3);
                  end;
   end;
if k=n then inc(s);
end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(k);
s:=0;
for i:=0 to n do
    a[i]:=1;
for i:=1 to k do
    begin
    readln(m);
    a[m]:=0;
    end;
try(0);
writeln(s);
close(input);
close(output);
end.
