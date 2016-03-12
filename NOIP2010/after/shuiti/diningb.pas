var i,n,v:longint;
    t:array[1..2]of longint;
begin
readln(n);
for i:=1 to n do
   begin
    readln(v);
    case v of
    1:inc(t[1]);
    2:begin
      if t[1]+1>t[2]+1 then t[2]:=t[1]+1 else t[2]:=t[2]+1;
      end;
    end;
   end;
if t[1]>t[2] then writeln(n-t[1]) else writeln(n-t[2]);
end.