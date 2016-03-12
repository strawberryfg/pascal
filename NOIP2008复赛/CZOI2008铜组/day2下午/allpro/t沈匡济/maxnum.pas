var i,n,k,j,s,m:longint;
    a,b:array[1..1000]of longint;
    p:boolean;
function prime(n:longint):boolean;
        var i:longint;
        begin
        prime:=true;
        for i:=1 to trunc(sqrt(n)) do
                begin
                if n mod i=0 then begin prime:=false;exit;end;
                end;
        end;
begin
assign(input,'maxnum.in');reset(input);
assign(output,'maxnum.out');rewrite(output);
i:=0;
while not eoln do
        begin
        inc(i);
        readln(a[i]);
        end;
n:=i;m:=10001;
for i:=1 to n do
        begin
        if prime(a[i]) then begin
                            writeln('1');
                            close(input);
                            close(output);
                            halt;
                            end;
        if a[i]<m then m:=a[i];
        end;
j:=0;
for i:=1 to trunc(sqrt(m)) do
        if m mod i =0 then
                begin inc(j);b[j]:=i;end;
        if i*i=m then begin dec(j);k:=2 end
                 else k:=1;
for i:=1 to j do
        b[j*2-i+k]:=m div b[i];
p:=false;i:=j*2+k;
while not p do
        begin
        p:=true;dec(i);
        for k:=1 to n do
            if a[k] mod b[i]<>0 then begin p:=false;break;end;
        end;
writeln(b[i]);
close(input);
close(output);
end.
