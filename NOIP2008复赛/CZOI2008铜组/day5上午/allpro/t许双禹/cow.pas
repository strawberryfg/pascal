var  a,b:array[1..10000000]of int64;
     i,k,j,n:longint;

begin
     assign(input,'cow.in');
     reset(input);
     assign(output,'cow.out');
     rewrite(output);
     readln(n);
     a[1]:=1;
     a[2]:=1;
     a[3]:=1;
     a[4]:=2;
     a[5]:=3;
     for i:=6 to n do
     a[i]:=(a[i-1]+a[i-4]);
     writeln(a[n]);
     close(input);
     close(output);
end.
