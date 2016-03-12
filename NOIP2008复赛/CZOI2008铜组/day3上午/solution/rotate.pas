program cup_7;
var i, j, k, n, n1 : integer;
    a : array [1..20, 1..20] of integer;
begin
     assign(input,'rotate.in');
     reset(input);
     readln (n);
     close(input);
     n1:=n div 2;
     k:=1;
     for i:=1 to n1 do
     begin
          for j:=i to n-i do
              begin  a[i,j]:=k;  k:=k+1;  end;
          for j:=i to n-i do
              begin  a[j,n+1-i]:=k;  k:=k+1;  end;
          for j:=n-i+1 downto i+1 do
              begin  a[n+1-i,j]:=k;  k:=k+1;  end;
          for j:=n-i+1 downto i+1 do
              begin a[j, i]:=k;  k:=k+1;  end;
     end;
     if  odd(n) then a[(n+1) div 2, (n+1) div 2]:=k;
     assign(output,'rotate.out');
     rewrite(output);
     for i:=1  to n do
     begin
          for j:=1 to n do write(a[i, j]:4);
          writeln;
     end;
     close(output)
end.
