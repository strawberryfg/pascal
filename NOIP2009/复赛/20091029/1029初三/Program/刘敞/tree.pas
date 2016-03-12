var n,i:longint;
    value,k:array[1..100]of longint;
    a:array[0..100,0..100]of longint;
function max(x:longint):longint;
        var i,m,z:longint;
        begin
         if value[x]<>0 then exit(value[x]);
         m:=0;
         for i:=1 to k[x] do
                begin
                 z:=max(a[x,i]);
                 if z>m then m:=z;
                end;
         value[x]:=m+a[x,0];
         max:=value[x];
        end;
begin
 assign(input,'tree.in');
 reset(input);
 assign(output,'tree.out');
 rewrite(output);
 readln(n);
 for i:=1 to n do
        begin
         k[i]:=-1;
         while not eoln do
                begin
                 inc(k[i]);
                 read(a[i,k[i]])
                end;
         readln;
        end;
 writeln(max(1));
 close(input);
 close(output);
end.