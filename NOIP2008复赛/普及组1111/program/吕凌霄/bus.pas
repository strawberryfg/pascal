var n,d,i,i1,j,k,t:longint;
    a:array[1..2500]of longint;
    s:string;
    b:array[1..25,1..25]of longint;
begin
assign(input,'bus.in');reset(input);
assign(output,'bus.out');rewrite(output);
readln(n,d);
readln(s);
for i:=1 to n do if s[i]='H' then a[i]:=1
                             else a[i]:=-1;
for i:=1 to n do for j:=1 to n do b[i,j]:=983513928;
for i:=1 to n do
    begin
    for j:=k+1 to n do
         begin
          t:=0;
          for i1:=k+1 to j do t:=t+a[i1];
          if ((t>=-d)and(t<=d))or(abs(t)=n-k) then b[i,j]:=t;
         end;
    for k:=n downto 1 do if b[i,k]<>983513928 then break;
    if k=n then break;
    end;
writeln(i);
close(input);close(output);
end.