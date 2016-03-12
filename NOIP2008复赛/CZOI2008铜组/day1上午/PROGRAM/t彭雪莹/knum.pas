var n,k,i,j,temp:longint;
    a:array[1..10000] of longint;
begin
 assign(input,'knum.in');
 reset(input);
 assign(output,'knum.out');
 rewrite(output);
 readln(n,k);
 for i:=1 to n do readln(a[i]);
 for i:=1 to n-1 do
   for j:=i to n do
     if a[i]<a[j] then begin
                    temp:=a[i];
                    a[i]:=a[j];
                    a[j]:=temp;
                    end;
     j:=1;
     for i:=2 to n do if a[i]<>a[i-1] then begin if j=k then begin writeln(a[i-1]);break; end else inc(j); end;
     close(input);
     close(output);
 end.
