var ol,ne,m,k,i,u,num,spe,final,fmin,tnum,now,j,t,res,knum:longint;
    a,page,sum,from,toto,be,en:array[0..120]of longint;
    c,f:array[0..120,0..120]of longint;
function max(x,y:longint):longint;
begin
if x>y then exit(x) else exit(y);
end;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
begin
assign(input,'book.in');
reset(input);
assign(output,'book.out');
rewrite(output);
readln(m,spe);
for i:=1 to m do
    begin
    read(page[i]);
    sum[i]:=sum[i-1]+page[i];
    f[i,0]:=maxlongint;
    end;
final:=maxlongint;
num:=0;
for i:=1 to m do
    begin
    f[1,i]:=sum[i];
    c[1,i]:=1;
    end;
for i:=2 to spe do
    begin
    for j:=1 to m do //j benshu
        begin
        fmin:=maxlongint; knum:=0;
        for u:=i-1 to j-1 do
            begin
            t:=sum[j]-sum[u];
            res:=max(f[i-1,u],t);
            if res<fmin then
               begin
               fmin:=res;
               knum:=u;
               end;
            end;
        f[i,j]:=fmin; c[i,j]:=knum+1;
        if (j=m)and(f[i,j]<final) then
           begin
           final:=f[i,j];
           num:=i;
           end;
        end;
    end;
ol:=m; ne:=m;
for i:=spe downto 1 do
    begin
    while (ne>=i-1)and(ne-1>=0)and(sum[ol]-sum[ne-1]<=final) do
        dec(ne);
    be[i]:=ne+1; en[i]:=ol;
    ol:=ne; ne:=ol;
    end;
for i:=1 to spe do writeln(be[i],' ',en[i]);
//for i:=1 to spe do writeln(be[i],' ',en[i],' ',':',sum[en[i]]-sum[be[i]-1]);
close(input);
close(output);
end.
