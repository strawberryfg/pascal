  var x,i,j,l,m,n,u,k,s,total,ans:longint;
    a:array[1..1000,1..2000]of shortint;
    b,c:array[1..2000]of longint;

begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);

    readln(x);
    for i:=1 to x do
        begin
        readln(m,n);
        if n>k then k:=n;
        for j:=m to n do
            a[i,j]:=1;
        end;
    for i:=1 to k do
        begin
        total:=0;
        fillchar(b,sizeof(b),0);
        fillchar(c,sizeof(c),0);
        l:=0;
        for j:=1 to x do
            begin
            total:=total+a[j,i];
            if a[j,i]=1 then begin inc(l); b[l]:=j; end;
            if total>1 then break;
            end;
        if total>1 then begin
                        for j:=1 to l do
                            for u:=1 to k do
                                c[j]:=c[j]+a[b[j],u];
                         for j:=1 to l do
                            for u:=1 to l do
                                if c[u]>c[j] then for s:=1 to k do
                                                       a[b[j],s]:=0;
                        end;
        end;
    ans:=0;
    for i:=1 to x do
        for j:=1 to k do
            ans:=ans+a[i,j];
    writeln(ans);

close(input);
close(output);
end.
