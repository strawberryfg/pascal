var  a:array[1..1000]of longint;
     i,k,j,m:longint;
     b:boolean;
begin
     assign(input,'primenum.in');
     reset(input);
     assign(output,'primenum.out');
     rewrite(output);
     i:=1;
     while not eof do
     begin
     readln(a[i]);
     inc(i);
     end;
     b:=true;
     for k:=1 to i do
         begin
         for j:=1 to trunc(sqrt(a[i])) do
         if (a[i] mod j =0)then
         begin b:=false;
         exit;
         end;
         if b then inc(m);
         end;
     writeln(m);
     close(input);
     close(output);
end.
