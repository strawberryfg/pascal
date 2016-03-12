const maxn=100;
var
     i,n,k,s:longint;
     a:array[0..9] of longint;
begin
     assign(input,'count.in');
     assign(output,'count.out');
     reset(input);
     rewrite(output);
     readln(n);
     for i:=1 to n do
         begin
         k:=i;
         while k>0 do
               begin
               s:=k mod 10;
               inc(a[s]);
               k:=k div 10;
               end;
         end;
     for i:=0 to 9 do
         writeln(a[i]);
     close(input);
     close(output);
end.
