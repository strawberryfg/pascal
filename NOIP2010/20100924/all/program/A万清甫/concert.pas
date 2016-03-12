var i,n,t1,t2,j,k,l,max:longint;
    boy,girl,sumb,sumg:array[-1..301]of longint;
    can:array[0..301,0..301]of boolean;
    f:array[0..301,0..301]of longint;
begin
assign(input,'concert.in');
reset(input);
assign(output,'concert.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(girl[i]);
    sumg[i]:=sumg[i-1]+girl[i];
    end;
for i:=1 to n do
    begin
    readln(boy[i]);
    sumb[i]:=sumb[i-1]+boy[i];
    end;
can[0,0]:=true;
for i:=1 to n+1 do
    for j:=1 to n+1 do
        begin
        f[i,j]:=-2147483648;
        for k:=0 to i-1 do
            for l:=0 to j-1 do
                begin
                if can[k,l]=true then
                   begin
                   t1:=sumb[i-1]-sumb[k];
                   t2:=sumg[j-1]-sumg[l];
                   if f[k,l]-t1*t1-t2*t2+boy[i]*girl[j]>f[i,j] then
                      f[i,j]:=f[k,l]-t1*t1-t2*t2+boy[i]*girl[j];
                   if f[i,j]>max then max:=f[i,j];
                   can[i,j]:=true;
                   end;
                end;
        end;
writeln(f[n+1,n+1]);
close(input);
close(output);
end.
