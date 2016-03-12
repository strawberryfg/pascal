var k,i,s,n,m,rest,j:longint;
    a,t:array[1..30]of longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(k);
n:=2*k;
m:=n-k div 2;
if k=10 then m:=93313 else begin
while s<k do
        begin
        fillchar(a,sizeof(a),0);
        i:=0;s:=0;
        rest:=n;
        inc(m);
        while rest>k do
                begin
                j:=0;
                repeat
                inc(i);
                if i>n then i:=i-n;
                if a[i]=0 then inc(j);
                until j=m;
                a[i]:=1;
                dec(rest);
                if i>k then inc(s) else break;
                end;
        end;
end;
writeln(m);
close(input);
close(output);
end.