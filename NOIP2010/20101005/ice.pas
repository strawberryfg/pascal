const x:array[1..4]of longint=(0,-1,0,1);
      y:array[1..4]of longint=(-1,0,1,0);
var l,r,n,i,j,x1,y1,x2,y2,t1,t2:longint;
    a:array[1..1000,1..1000]of longint;
    f:array[1..1000000,1..2]of longint;
    c:array[1..1000000]of longint;
    h:array[1..1000,1..1000]of boolean;
begin
assign(input,'ice.in');reset(input);
assign(output,'ice.out');rewrite(output);
readln(n);
for i:=1 to n do
        begin
        for j:=1 to n do
                read(a[i,j]);
        readln;
        end;
readln(x1,y1);
readln(x2,y2);
if (a[x2-1,y2]=1)and(a[x2+1,y2]=1)and(a[x2,y2+1]=1)and(a[x2,y2-1]=1) then
        begin writeln('impossible');close(input);close(output);halt;end;
h[x1,y1]:=true;
f[1,1]:=x1;
f[1,2]:=y1;
l:=0;r:=1;
while l<r do
        begin
        inc(l);
        for i:=1 to 4 do
                begin
                t1:=f[l,1];
                t2:=f[l,2];
                while a[t1,t2]=0 do
                        begin
                        inc(t1,x[i]);
                        inc(t2,y[i]);
                        end;
                dec(t1,x[i]);
                dec(t2,y[i]);
                if (not h[t1,t2])and((t1<>f[l,1])or(t2<>f[l,2])) then
                        begin
                        inc(r);
                        f[r,1]:=t1;
                        f[r,2]:=t2;
                        c[r]:=c[l]+1;
                        h[t1,t2]:=true;
                        if (t1=x2)and(t2=y2)then
                            begin writeln(c[r]);close(input);close(output);halt;end;
                        end;
                end;
        end;
writeln('impossible');
close(input);
close(output);
end.