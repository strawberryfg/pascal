var n,h,i,j,down,up,k,fmax,res,high:longint;
    catch,decline,sum,t:array[0..1000]of longint;
    sigma:array[1..1000,0..1000]of longint;
    f:array[1..1000,0..1000]of longint;
begin
assign(input,'fish.in');
reset(input);
assign(output,'fish.out');
rewrite(output);
readln(n);
readln(h);
for i:=1 to n do read(catch[i]);
for i:=1 to  n do
    begin
    read(decline[i]);
    if decline[i]=0 then up:=h*12
                    else begin
                         up:=(catch[i] div decline[i])+1;
                         end;
    sigma[i,1]:=catch[i];
    for j:=2 to up do
        begin
        sigma[i,j]:=sigma[i,j-1]+catch[i]-(j-1)*decline[i];
        end;
    end;
for i:=1 to n-1 do
    begin
    read(t[i]);
    sum[i]:=sum[i-1]+t[i];
    end;
i:=1;
    if decline[i]=0 then up:=h*12
                    else begin
                         up:=(catch[i] div decline[i])+1;
                         end;
for i:=1 to up do
    begin
    f[1,i]:=sigma[1,i];
    if f[1,i]>fmax then fmax:=f[1,i];
    end;
for i:=0 to up do
    begin
    f[1,i]:=sigma[1,i];
    if f[1,i]>fmax then fmax:=f[1,i];
    end;
for i:=2 to n do
    begin
    down:=sum[i-1]; up:= h*12;
    for j:=down to up do
        begin
            if decline[i]=0 then high:=h*12
                    else begin
                         high:=(catch[i] div decline[i])+1;
                         end;
        for k:=1 to high do
           begin
           if j-k<sum[i-1] then continue;
           //if j-k-t[i-1]<sum[i-2] then continue;
           //if j-k<t[i-1] then continue;
           res:=f[i-1,j-k-t[i-1]]+sigma[i,k];

           if res>f[i,j] then f[i,j]:=res;
           if f[i,j]>fmax then fmax:=f[i,j];
           end;
        end;
    end;
writeln(fmax);
close(input);
close(output);
end.