var s1,s2,change:string;
    n1,n2,i,j,t:longint;
    a:array[1..100000]of string;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
  readln(n1,n2);
  readln(s1);
  readln(s2);
  readln(t);
  for i:=1 to n1 do
    a[n1-i+1]:=s1[i]+'1';
  for i:=1 to n2 do
    a[i+n1]:=s2[i]+'2';
  for i:=1 to t do
    begin
      j:=1;
      while j<n1+n2 do
        begin
          if (a[j][2]='1')and(a[j+1][2]='2') then
                                begin
                                  change:=a[j];
                                  a[j]:=a[j+1];
                                  a[j+1]:=change;
                                  j:=j+1;
                                end;
          inc(j);
        end;
    end;
  for i:=1 to n1+n2 do write(a[i][1]);
  writeln;
close(input);
close(output);
end.
