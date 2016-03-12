var a:array[0..31]of longint;
    n,i,t,s,k:longint;
procedure work(n,l:longint);
        var j,t,ti,i:longint;
        begin
        if l=n then inc(s)
               else if l>n then exit
                           else for i:=1 to 3 do
                                        begin
                                        t:=l;
                                        l:=l+i;
                                        if a[l]<>0 then work(n,l);
                                        l:=t;
                                        end;
        end;
begin
assign(input,'stair.in');reset(input);
assign(output,'stair.out');rewrite(output);
readln(n);
readln(k);
s:=0;
for i:=1 to n do
        a[i]:=i;
for i:=1 to k do
        begin
        readln(t);
        a[t]:=0;
        end;
s:=0;
work(n,0);
writeln(s);
close(input);
close(output);
end.