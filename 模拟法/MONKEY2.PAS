var monkey,js,i,m,n,t:longint;
    a:array[1..200]of longint;
begin
readln(m,n);
for i:=1 to n do
    a[i]:=1;
monkey:=n;
i:=0;
t:=1;
while monkey>1 do
      begin
      if t mod 2=1 then i:=i+1 else i:=i-1;
      if i>n then begin i:=n-1;t:=0; end;
      if i<1 then begin i:=2;t:=1; end;
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
writeln(i);
end.
