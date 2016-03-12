var k,n,i,m,j:longint;
    a,h,b:array[1..1000]of longint;
function work(a,n:longint):longint;
        var i,b,j,k:longint;
        begin
        b:=0;
        while a>0 do
                begin
                k:=a mod 10;
                for i:=1 to n-1 do k:=k*k;
                b:=b+k;
                if b>255 then exit(256);
                a:=a div 10;
                end;
        exit(b);
        end;
begin
assign(input,'ghillie.in');reset(input);
assign(output,'ghillie.out');rewrite(output);
readln(n);
while not eoln do begin inc(i);read(a[i]);inc(h[a[i]]);end;
readln;
m:=i;
for j:=1 to n do
    for i:=1 to m do
        begin
        k:=work(a[i],j+1);
        if h[k]>0 then h[k]:=-1;
        end;
for i:=1 to m do if h[a[i]]>0 then inc(b[a[i]]);
for i:=1 to 255 do if b[i]<>0 then begin b[i]:=0;write(i);break;end;
for i:=1 to 255 do if b[i]<>0 then write(' ',i);
writeln;
close(input);
close(output);
end.
