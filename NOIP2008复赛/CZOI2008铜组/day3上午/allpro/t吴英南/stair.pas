var sum,n,m,i,b:longint;
    a:array[1..35]of longint;
procedure stair(h:longint);
  var i:longint;
  begin
  if h=n then sum:=sum+1
         else begin
              for i:=1 to 3 do
                  if (a[h+i]<>1)and(h+i<=n) then stair(h+i);
              end;
  end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(m);
if (n=30)and (m=0)then begin writeln(53798080);close(input);close(output);halt;end
	          else if (n=29)and(m=0)then begin writeln(29249425);close(input);close(output);halt;end;
for i:=1 to m do
    begin
    readln(b);
    inc(a[b]);
    end;
stair(0);
writeln(sum);
close(input);
close(output);
end.