var n,i,j,s:longint;
    p,p2:boolean;
    a:array[1..1000]of integer;
begin
assign(input,'chorus.in');reset(input);
assign(output,'chorus.out');rewrite(output);
readln(n);s:=0;
for i:=1 to n do
        read(a[i]);
readln;i:=1;p:=false;p2:=false;
while not p do
        begin
        inc(i);
        if a[i]<=a[i-1] then begin if p2 then
                                         begin p:=true;break;end;a[i]:=a[i-1];inc(s);end
                       else p2:=true;
        end;
for j:=i to n do
        if a[j]>=a[j-1] then begin a[i]:=a[i-1];inc(s);end;
writeln(s);
close(input);
close(output);
end.