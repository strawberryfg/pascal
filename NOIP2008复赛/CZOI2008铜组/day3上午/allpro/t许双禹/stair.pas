var  a,b:array[1..1000] of longint;
     k,i,n,j,sum:longint;
begin
     assign(input,'stair.in');
     reset(input);
     assign(output,'stair.out');
     rewrite(output);
     readln(n);
     readln(k);
     for i:=1 to k do
     begin
     readln(b[k]);
     end;
     for i:=1 to n do
     begin
     a[i]:=1;
     end;
     for j:=2 to n do
       begin
       i:=j;
       while i<>1 do
       begin
       a[j]:=a[j]*2;
       dec(i);
       end;
       end;
     sum:=sum+a[n];
     for i:=1 to k do
     begin
     sum:=sum-a[b[k]];
     end;
     writeln(sum);
     close(input);
     close(output);
end.
