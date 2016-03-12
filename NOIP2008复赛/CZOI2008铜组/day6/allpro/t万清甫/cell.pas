var i,j,m,n,sum:longint;
    a:array[0..62]of string[62];
    pd:boolean;
procedure try;
var i,j,iu,ju,il,jl,ir,jr,id,jd:longint;
begin
for i:=1 to m do
    for j:=1 to n do
        begin
        pd:=false;
        iu:=i-1; ju:=j;
        il:=i; jl:=j-1;
        ir:=i; jr:=j+1;
        id:=i+1; jd:=j;
        if (iu>=0)and(iu<=m)and(a[iu,ju]<>'0')
        and(a[i,j]<>'0')then pd:=true else
           if ((iu=0)or(iu<>0)and(a[iu,ju]<>'0'))and(a[i,j]<>'0') then pd:=true else
           continue;
        if (il>0)and(jl>=0)and(jl<=n+1)and(a[il,jl]<>'0')
        and(a[i,j]<>'0')then pd:=true else
           if ((il=0)or(il<>0)and(a[il,jl]<>'0'))and(a[i,j]<>'0') then pd:=true else
           continue;
        if (jr>=0)and(jr<=n+1)and(a[ir,jr]<>'0')
        and(a[i,j]<>'0')then pd:=true else
           continue;
        if (id>=0)and(id<=m+1)and(a[id,jd]<>'0')and(jd<n)
        and(a[i,j]<>'0')then pd:=true else
           continue;
        if pd=true then begin
                        writeln('i=',i,' j=',j);
                        inc(sum);
                        end;
        end;
end;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(m,n);
for i:=1 to m do
    begin
    readln(a[i]);
    end;
for i:=1 to n do begin a[0]:=a[0]+'9';a[m+1]:=a[m+1]+'9'; end;
for i:=1 to m do a[i]:=a[i]+'9';
try;
writeln(sum);
close(input);
close(output);
end.
