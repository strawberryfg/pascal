var monkey,js,i,m,n:longint;
    a:array[1..200]of longint;
begin
readln(m,n);
for i:=1 to n do
    a[i]:=1;
monkey:=n;
i:=0;
while monkey>1 do
      begin
      i:=i+1;
      if i>n then i:=1;
      if a[i]=1 then js:=js+1;
      if js=m then begin
                   a[i]:=0;
                   js:=0;
                   monkey:=monkey-1;
                   end;
      end;
i:=1;
while a[i]=0 do
      i:=i+1;
writeln(i );
end.