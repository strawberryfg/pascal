var n,m,t,dep,i,tt:longint;
        a:array[1..1000000]of char;
        aa:array[1..1000000]of longint;
        ttt:char;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n,m);
for i:=1  to n do
        read(a[n-i+1]);
readln;
for i:=1 to m do
        begin
        read(a[i+n]);
        aa[i+n]:=1;
        end;
readln(t);
dep:=1;
while dep<=t do
        begin
        i:=1;
        while i<=(m+n) do
            if (aa[i]=0)and(aa[i+1]=1) then begin
                                          tt:=aa[i];aa[i]:=aa[i+1];aa[i+1]:=tt;
                                          ttt:=a[i];a[i]:=a[i+1];a[i+1]:=ttt;
                                          i:=i+2;
                                          end
                                        else inc(i);
        inc(dep);
        end;
for i:=1 to n+m do
        write(a[i]);
writeln;
close(input);
close(output);
end.