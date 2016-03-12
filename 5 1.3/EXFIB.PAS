var a,b,c,i,n:longint;
begin
read(n);
a:=1;
b:=2;
while i<n-2 do
      begin
      c:=a+b;
      a:=b;
      b:=c;
      i:=i+1
      end;
writeln(c);
end.