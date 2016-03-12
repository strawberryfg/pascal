var
    x:integer;
    i,j,n,m,k,l,r,p,ans:longint;
    s,t:string;
    rec:array[1..10] of string;
    num:array[1..10] of longint;
procedure qsort(l,r:longint);
var
    i,j,m:longint;
    x,t:string;
begin
    i:=l;
    j:=r;
    x:=rec[random(j-i+1)+i];
    repeat
        while rec[i]<x do
            inc(i);
        while rec[j]>x do
            dec(j);
        if i<=j then
        begin
            t:=rec[i];
            rec[i]:=t;
            rec[j]:=rec[i];
            m:=num[i];
            num[i]:=num[j];
            num[j]:=m;
            inc(i);
            dec(j);
        end;
    until
        i>j;
    if i<r then
        qsort(i,r);
    if j>l then
        qsort(l,j);
end;
begin
    assign(input,'engzam.in');
    assign(output,'engzam.out');
    reset(input);
    rewrite(output);
    randomize;
    readln(n,m);
    for i:=1 to n do
    begin
        readln(s);
        t:=copy(s,1,pos(' ',s)-1);
        delete(s,1,pos(' ',s));
        val(s,k,x);
        rec[i]:=t;
        num[i]:=k;
    end;
    qsort(1,n);
    for i:=1 to m do
    begin
        readln(s);
        t:=copy(s,1,pos(' ',s)-1);
        delete(s,1,pos(' ',s));
        val(s,k,x);
        j:=n div 2;
        l:=1;
        r:=n;
        while pos(t,rec[j])<>1 do
            if rec[j]>t then
            begin
                r:=j;
                j:=(l+j) div 2;
            end
            else
            begin
                l:=j;
                j:=(j+r) div 2;
            end;
        ans:=0;
        p:=j;
        while pos(t,rec[p])=1 do
        begin
            if num[p]>=k then
                inc(ans);
            dec(p);
            if p<1 then
                break;
        end;
        p:=j;
        while pos(t,rec[p])=1 do
        begin
            if num[p]>=k then
                inc(ans);
            inc(p);
            if p>n then
                break;
        end;
        writeln(ans);
    end;
    close(input);
    close(output);
end.
