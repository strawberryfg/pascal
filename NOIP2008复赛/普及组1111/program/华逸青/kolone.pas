var i,j,k,n1,n2,t,n:longint;
    h:array['A'..'Z'] of longint;
    s,s1,s2:string;
    c:char;
begin
    assign(input,'kolone.in');reset(input);
    assign(output,'kolone.out');rewrite(output);
    readln(n1,n2);
    readln(s1);readln(s2);
    readln(t);
    for i:=1 to n1 do
    begin
        s:=s+s1[n1-i+1];
        h[s1[i]]:=1;
    end;
    for i:=1 to n2 do
    begin
        s:=s+s2[i];
        h[s2[i]]:=2
    end;
    n:=n1+n2;
    for i:=1 to t do
    begin
        j:=1;
        while j<=n-1 do
        begin
            if (h[s[j]]=1) and (h[s[j+1]]=2) then
               begin c:=s[j];s[j]:=s[j+1];s[j+1]:=c;inc(j) end;
            inc(j)
        end;
    end;
    writeln(s);
    close(input);
    close(output);
end.