var n,i,max,j:longint;
    v,h:array[1..100]of longint;
    a:array[1..100,1..100]of longint;
function f(k:longint):longint;
        var i,max:longint;
        begin
        if h[k]>0 then exit(h[k]);
        max:=0;
        for i:=1 to n do if a[k,i]=1 then begin if f(i)>max then max:=f(i);end;
        h[k]:=max+v[k];
        exit(max+v[k]);
        end;
begin
assign(input,'tree.in');reset(input);
assign(output,'tree.out');rewrite(output);
readln(n);
for i:=1 to n do
        begin
        read(v[i]);
        while not eoln do
              begin
              read(j);
              inc(a[i,j]);
              end;
        readln;
        end;
max:=0;
for i:=1 to n do if f(i)>max then max:=f(i);
writeln(max);
close(input);
close(output);
end.
