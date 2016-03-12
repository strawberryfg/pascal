var n,i,h,l,j,mode:longint;
    a:array[1..1000]of longint;
    b:array[1..30,1..30]of longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
read(n);
for i:=1 to n*n do
    a[i]:=i;
h:=1;
l:=1;
i:=1;
mode:=1;
while i<=n*n do
     begin
     if mode=1 then begin
                    if (l<=n)and(b[h,l]=0) then
                       begin b[h,l]:=a[i];inc(i);inc(l);end
                            else
                       begin inc(h);dec(l);mode:=2;end;
                    end
     else if mode=2 then
                    begin
                    if (h<=n)and(b[h,l]=0) then
                       begin b[h,l]:=a[i];inc(i);inc(h);end
                            else
                       begin dec(l);dec(h);mode:=3;end;
                    end
     else if mode=3 then
                    begin
                    if (l>=1)and(b[h,l]=0) then
                       begin b[h,l]:=a[i];inc(i);dec(l);end
                            else
                    begin  dec(h);inc(l);mode:=4;end;
                    end
     else if mode=4 then
                    begin
                    if (h>=1)and(b[h,l]=0)then
                       begin b[h,l]:=a[i];inc(i);dec(h);end
                            else
                    begin  inc(l);inc(h);mode:=1;end;
                    end;

     end;

for i:=1 to n do
    begin
    for j:=1 to n do
        write(b[i,j]:4);
    writeln;
    end;
close(input);
close(output);
end.
