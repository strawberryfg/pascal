const maxn=1020;
      dx:array[1..2]of longint=(1,0);
      dy:array[1..2]of longint=(0,1);
var a,two,five,hash:array[0..maxn,0..maxn]of longint;
    fmin,i,j,n,t,u,v,w,p,ff:longint;
    f,g:array[1..maxn,1..maxn,1..5]of longint;
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
        while (t<>0)and(t mod 2=0) do begin inc(two[i,j]); t:=t div 2; end;
        while (t<>0)and(t mod 5=0) do begin inc(five[i,j]); t:=t div 5; end;
        end;
    readln;
    end;
fmin:=maxlongint;
hash[1,1]:=1;
   f[1,1,2]:=two[1,1]; f[1,1,5]:=five[1,1];
   g[1,1,2]:=two[1,1]; g[1,1,5]:=five[1,1];
   for i:=1 to n do
       begin
       for j:=1 to n do
           begin
           if a[i,j]=0 then continue;
           if (i*j<>1) then
              begin
              u:=maxlongint; v:=maxlongint; w:=maxlongint; p:=maxlongint;
              if (i-1>=1)and(a[i-1,j]<>0) then begin u:=f[i-1,j,2];v:=f[i-1,j,5]; end;
              if (j-1>=1)and(a[i,j-1]<>0) then begin w:=f[i,j-1,2];p:=f[i,j-1,5]; end;
              if (u=maxlongint)and(w=maxlongint) then
                 begin
                 a[i,j]:=0;
                 continue;
                 end;
              if (u<w)or((u=w)and(v<p)) then
                 begin
                 f[i,j,2]:=u+two[i,j];
                 f[i,j,5]:=v+five[i,j];
                 end
              else
                 begin
                 f[i,j,2]:=w+two[i,j];
                 f[i,j,5]:=p+five[i,j];
                 end;
              u:=maxlongint; v:=maxlongint; w:=maxlongint; p:=maxlongint;
              if (i-1>=1)and(a[i-1,j]<>0) then begin u:=g[i-1,j,2];v:=g[i-1,j,5]; end;
              if (j-1>=1)and(a[i,j-1]<>0) then begin w:=g[i,j-1,2];p:=g[i,j-1,5]; end;
              if (v<p)or((v=p)and(u<w)) then
                 begin
                 g[i,j,2]:=u+two[i,j];
                 g[i,j,5]:=v+five[i,j];
                 end
              else
                 begin
                 g[i,j,2]:=w+two[i,j];
                 g[i,j,5]:=p+five[i,j];
                 end;
              end;
           end;
       end;
   ff:=f[n,n,2]; if f[n,n,5]<ff then ff:=f[n,n,5];
   if ff<fmin then fmin:=ff;
   ff:=g[n,n,2]; if g[n,n,5]<ff then ff:=g[n,n,5];
   if ff<fmin then fmin:=ff;
writeln(fmin);
close(input);
close(output);
end.