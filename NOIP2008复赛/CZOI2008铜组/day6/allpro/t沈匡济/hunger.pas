var t,n,i,s,j,ti,tj:longint;
    c,a,b,d:array[1..1000]of integer;
function pan(x,y:longint):boolean;
        var i:longint;
        begin
        pan:=true;
        for i:=1 to y-1 do
                if c[i]=0 then if (a[d[y]]>b[d[i]])or(b[d[y]]<a[d[i]]) then pan:=true
                                                else begin pan:=false;exit;end;
        end;
begin
assign(input,'hunger.in');reset(input);
assign(output,'hunger.out');rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a[i],b[i]);
    c[i]:=abs(a[i]-b[i])+1;
    d[i]:=i;
    end;
for i:=1 to n-1 do
        for j:=i+i to n do
                if c[j]>c[i] then begin t:=c[i];c[i]:=c[j];c[j]:=t;
                                        t:=d[i];d[i]:=d[j];d[j]:=t;end;
j:=c[1];c[i]:=0;
for i:=2 to n do
        if pan(d[i],i) then begin j:=j+c[i];c[i]:=0;end;
writeln(j);
close(input);
close(output);
end.
