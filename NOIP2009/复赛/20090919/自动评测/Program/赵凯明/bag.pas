var a,b,c:array[1..5] of longint;
    n,i:longint;

begin
assign(input,'bag.in');
reset(input);
assign(output,'bag.out');
rewrite(output);
 readln(n);
 b[1]:=1;
 b[2]:=0;
 b[3]:=0;
 b[4]:=0;
 b[5]:=0;
 for i:=1 to n do
     begin
      c[1]:=(b[5]+b[2]+b[3]+b[1]+a[1]) mod 997;
      c[2]:=(b[3]+b[1]) mod 997;
      c[3]:=(b[2]+b[1]) mod 997;
      c[5]:=(b[4]+b[1]) mod 997;
      c[4]:=(b[5]) mod 997;
      a:=b;
      b:=c;
     end;
 writeln(c[1]);
close(input);
close(output);
end.