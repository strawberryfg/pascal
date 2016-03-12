var a:array[1..310,1..310] of longint;
    num,d:array[1..310] of longint;
    q:array[1..300000] of longint;
    n,m,x,y,p,i,j,k,s,t,w,l,r:longint;

begin
assign(input,'escape.in');
reset(input);
assign(output,'escape.out');
rewrite(output);
    readln(n,m);
    for i:=1 to n do
        read(num[i]);
    for i:=1 to m do
        begin
        read(x,y); inc(x); inc(y);
        readln(a[x,y]); a[y,x]:=a[x,y];
        end;
    readln(p);
    for k:=1 to p do
        begin
        readln(s,t,w); inc(s); inc(t);
        fillchar(d,sizeof(d),0);
        for i:=1 to n do
            d[i]:=a[s,i];
        for i:=1 to n do
            if (d[i]<>0)and((num[i]<=w))or(i=t) then
               for j:=1 to n do
                   if (a[i,j]<>0)and(s<>j)and((num[j]<=w)or(j=t))
                      then begin
                           if (d[i]+a[i,j]<d[j])or(d[j]=0)
                              then d[j]:=d[i]+a[i,j];
                           end;
        if d[t]=0 then writeln(-1) else writeln(d[t]);
        end;
close(input);close(output);
end.
