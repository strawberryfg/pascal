var y,edge:array[1..400,1..3]of longint;
    n,i,j,k,l,m,tot,u,v,w,min,minnum,now,up,final:longint;
    time:array[1..30,1..30]of longint;
    f:array[0..400,0..1,0..30]of longint;
    hash:array[0..400,0..1,0..30,0..30]of longint;
begin
assign(input,'spring.in');
reset(input);
assign(output,'spring.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(time[i,j]);
        if (i<j) then
           begin
           inc(tot);
           edge[tot,1]:=i; edge[tot,2]:=j; edge[tot,3]:=time[i,j];
           end;
        end;
    end;
for i:=1 to n do for j:=0 to 1 do for k:=1 to n do f[i,j,k]:=maxlongint;
f[1,1,1]:=edge[1,3]; hash[1,1,1,edge[1,1]]:=1; hash[1,1,1,edge[1,2]]:=1;
f[1,0,0]:=0;
final:=maxlongint;
for i:=2 to tot do
    begin
         //nowstate
    for j:=0 to 1 do
        begin
        up:=i-1+j;
        if up>n div 2 then up:=n div 2;
        for m:=1 to up do
        begin
          min:=maxlongint; minnum:=0;
        for k:=0 to i-1 do
            begin
            for l:=0 to 1 do
                begin
                    if (j<>1)and(k=0) then continue;
                    if m-j>k then continue;
                    if m-j<0 then continue;
                    if f[k,l,m-j]=maxlongint then continue;
                    if (j=0)and(f[k,l,m-j]<min) then begin min:=f[k,l,m-j];minnum:=k;now:=l; end;
                    u:=edge[i,1]; v:=edge[i,2]; w:=edge[i,3];
                    if (j=1)and(hash[k,l,m-j,u]=0)and(hash[k,l,m-j,v]=0)and(f[k,l,m-j]+w<min) then
                       begin min:=f[k,l,m-j]+w; minnum:=k; now:=l; end;
                    end;
                end;
             f[i,j,m]:=min;//f[minnum,now,m-j];
            u:=edge[i,1]; v:=edge[i,2]; w:=edge[i,3];
            hash[i,j,m]:=hash[minnum,now,m-now];
            if j=1 then
             begin
           //f[i,j,m]:=f[i,j,m]+edge[i,3];
             hash[i,j,m,u]:=1;
             hash[i,j,m,v]:=1;
             end;
            if m=n div 2 then
               begin
               if f[i,j,m]<final then final:=f[i,j,m];
               end;
            end;

        end;

    end;
writeln(final);
close(input);
close(output);
end.
