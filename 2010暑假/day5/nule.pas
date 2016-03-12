var i,j,n:longint;
    f,a,f2,f5:array[0..1000,0..1000] of longint;

function min(a,b:longint):longint;
begin
if a<b then exit(a)
        else exit(b);
end;

procedure com(i,j:longint);
var x:longint;
begin
x:=a[i,j];
while x mod 2=0 do begin inc(f2[i,j]);x:=x div 2;end;
x:=a[i,j];
while x mod 5=0 do begin inc(f5[i,j]);x:=x div 5;end;
end;

begin
assign(input,'nule.in');reset(input);
assign(output,'nule.out');rewrite(output);
read(n);
for i:=1 to n do
    for j:=1 to n do
        begin
        read(a[i,j]);
        if a[i,j]<>0 then com(i,j);
        end;
f[1,1]:=1;
for i:=1 to n do
    for j:=1 to n do
        if ((i<>1)or(j<>1))and(a[i,j]<>0) then
                begin
                        if f[i,j-1]=0 then a[i,j-1]:=0;
                        if f[i-1,j]=0 then a[i-1,j]:=0;
                        if (f[i,j-1]=1)and(i=1)and(a[i,j-1]<>0) then begin f[i,j]:=1;f2[i,j]:=f2[i,j]+f2[i,j-1];f5[i,j]:=f5[i,j]+f5[i,j-1];end;
                        if (f[i-1,j]=1)and(j=1)and(a[i-1,j]<>0) then begin f[i,j]:=1;f2[i,j]:=f2[i,j]+f2[i-1,j];f5[i,j]:=f5[i,j]+f5[i-1,j];end;
                        if (f[i,j-1]=1)and(i>1)and(j>1)and(a[i,j-1]<>0)and(a[i-1,j]=0) then begin f[i,j]:=1;f2[i,j]:=f2[i,j]+f2[i,j-1];f5[i,j]:=f5[i,j]+f5[i,j-1];end;
                        if (f[i-1,j]=1)and(i>1)and(j>1)and(a[i-1,j]<>0)and(a[i,j-1]=0) then begin f[i,j]:=1;f2[i,j]:=f2[i,j]+f2[i-1,j];f5[i,j]:=f5[i,j]+f5[i-1,j];end;
                        if (f[i-1,j]=1)and(f[i,j-1]=1)and(i>1)and(j>1)and(a[i-1,j]<>0)and(a[i,j-1]<>0) then
                                                                        begin
                                                                        f[i,j]:=1;
                                                                        f2[i,j]:=f2[i,j]+min(f2[i-1,j],f2[i,j-1]);
                                                                        f5[i,j]:=f5[i,j]+min(f5[i-1,j],f5[i,j-1]);
                                                                        end;
                end;
writeln(min(f2[n,n],f5[n,n]));
close(input);
close(output);
end.