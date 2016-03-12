var
a:array[0..350,0..100000] of longint;
l,c:array [0..350] of longint;
i,j,n,m:longint;
d:longint;
function max(x,y:longint):longint;
begin
if x=maxint then max:=y
    else
      if x>y then max:=x
             else max:=y;
end;
function min(x,y:longint):longint;
begin
if x<y then min:=x
         else min:=y;
end;
begin
assign(input,'plumb.in');reset(input);
assign(output,'plumb.out');rewrite(output);
read(d,n);
for i:=0 to d do a[0,i]:=maxint;
for i:=1 to n do
    read(l[i],c[i]);
for i:=1 to n do
    for j:=1 to d do
      begin
        if j-l[i]=0 then m:=c[i]
          else
            if j-l[i]>0 then
              m:=min(c[i],a[i-1,j-l[i]]);
        a[i,j]:=max(a[i-1,j],m);
      end;
writeln(a[n,d]);
close(input);
close(output);
end.