var a:array[1..4] of longint;
    t,i,n,j:longint;
begin
read(n);
while n<>6174 do
      begin
      a[4]:=n mod 10;
      n:=n div 10;
      a[3]:=n mod 10;
      n:=n div 10;
      a[2]:=n mod 10;
      n:=n div 10;
      a[1]:=n mod 10;
      for i:=1 to 3 do
      begin
          for j:=i+1 to 4 do
              if a[i]<a[j] then begin t:=a[i];a[i]:=a[j];a[j]:=t; end;
      end;
      t:=0;
      n:=0;
      for i:=4 downto 1 do
          t:=t*10+a[i];
      for i:=1 to 4 do
          n:=n*10+a[i];
      writeln(n,'-',t,'=',n-t);
      n:=n-t;
      end;
end.