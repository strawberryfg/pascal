var a:array[0..20,0..20]of longint;
    i,j,n,k,t,d,ti,tj:longint;
begin
read(n);
i:=1;
j:=1;
a[1,n+1]:=1;
a[n+1,n]:=1;
a[n,0]:=1;
d:=1;
for k:=1 to n*n do
    begin
    a[i,j]:=k;
    case d of
         1:begin tj:=j+1; ti:=i; end;
         2:begin ti:=i+1;tj:=j; end;
         3:begin tj:=j-1;ti:=i; end;
         4:begin ti:=i-1;tj:=j; end;
    end;
    if a[ti,tj]=0 then begin i:=ti;j:=tj; end
                  else
                  begin
                  d:=d+1;
                  if d>4 then d:=1;
                  case d of
                       1:j:=j+1;
                       2:i:=i+1;
                       3:j:=j-1;
                       4:i:=i-1;
                  end;
                  end;
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
    writeln;
    end;
end.
