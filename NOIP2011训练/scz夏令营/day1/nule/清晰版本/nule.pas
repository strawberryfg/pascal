const maxn=1210;
var i,j,n,t,fmin,ff:longint;
    a,two,five:array[1..maxn,1..maxn]of longint;
    f,g:array[1..maxn,1..maxn,1..2]of longint;
begin
assign(input,'nule.in');
reset(input);
assign(output,'nule.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(a[i,j]);
        t:=a[i,j];
        if t=0 then continue;
        while t mod 2=0 do begin inc(two[i,j]);  t:=t div 2; end;
        while t mod 5=0 do begin inc(five[i,j]); t:=t div 5; end;
        end;
    readln;
    end;
f[1,1,1]:=two[1,1]; f[1,1,2]:=five[1,1];
g[1,1,1]:=two[1,1]; g[1,1,2]:=five[1,1];
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        if (a[i,j]<>0)and(i*j<>1) then
           begin
           if i=1 then
              begin
              if (a[i,j-1]<>0) then
                 begin
                 f[i,j,1]:=f[i,j-1,1]+two[i,j];
                 f[i,j,2]:=f[i,j-1,2]+five[i,j];
                 g[i,j,1]:=g[i,j-1,1]+two[i,j];
                 g[i,j,2]:=g[i,j-1,2]+five[i,j];
                 end
              else a[i,j]:=0;
              end;
           if j=1 then
              begin
              if (a[i-1,j]<>0) then
                 begin
                 f[i,j,1]:=f[i-1,j,1]+two[i,j];
                 f[i,j,2]:=f[i-1,j,2]+five[i,j];
                 g[i,j,1]:=g[i-1,j,1]+two[i,j];
                 g[i,j,2]:=g[i-1,j,2]+five[i,j];
                 end
              else a[i,j]:=0;
              end;
           if (i>1)and(j>1) then
              begin
              if (a[i-1,j]=0)and(a[i,j-1]=0) then a[i,j]:=0
                 else if a[i-1,j]=0 then
                         begin
                         f[i,j,1]:=f[i,j-1,1]+two[i,j];
                         f[i,j,2]:=f[i,j-1,2]+five[i,j];
                         g[i,j,1]:=g[i,j-1,1]+two[i,j];
                         g[i,j,2]:=g[i,j-1,2]+five[i,j];
                         end
                      else if a[i,j-1]=0 then
                              begin
                              f[i,j,1]:=f[i-1,j,1]+two[i,j];
                              f[i,j,2]:=f[i-1,j,2]+five[i,j];
                              g[i,j,1]:=g[i-1,j,1]+two[i,j];
                              g[i,j,2]:=g[i-1,j,2]+five[i,j];
                              end
                           else begin
                                if (f[i-1,j,1]<f[i,j-1,1])or((f[i-1,j,1]=f[i,j-1,1])and(f[i-1,j,2]<f[i,j-1,2])) then
                                   begin
                                   f[i,j,1]:=f[i-1,j,1]+two[i,j];
                                   f[i,j,2]:=f[i-1,j,2]+five[i,j];
                                   end
                                else
                                   begin
                                   f[i,j,1]:=f[i,j-1,1]+two[i,j];
                                   f[i,j,2]:=f[i,j-1,2]+five[i,j];
                                   end;
                                if (g[i-1,j,2]<g[i,j-1,2])or((g[i-1,j,2]=g[i,j-1,2])and(g[i-1,j,1]<g[i,j-1,1])) then
                                   begin
                                   g[i,j,1]:=g[i-1,j,1]+two[i,j];
                                   g[i,j,2]:=g[i-1,j,2]+five[i,j];
                                   end
                                else
                                   begin
                                   g[i,j,1]:=g[i,j-1,1]+two[i,j];
                                   g[i,j,2]:=g[i,j-1,2]+five[i,j];
                                   end;
                                end;
              end;
           end;
        end;
    end;
   fmin:=maxlongint;
   ff:=f[n,n,1]; if f[n,n,2]<ff then ff:=f[n,n,2];
   if ff<fmin then fmin:=ff;
   ff:=g[n,n,1]; if g[n,n,2]<ff then ff:=g[n,n,2];
   if ff<fmin then fmin:=ff;
   writeln(fmin);
close(input);
close(output);
end.