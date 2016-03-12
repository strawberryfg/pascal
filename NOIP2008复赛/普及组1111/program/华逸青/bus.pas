var i,j,k,n,d:longint;
    s:array[1..2500] of char;
    sh,sj:array[0..2500] of longint;
    f:array[0..2500] of longint;
begin
    assign(input,'bus.in');reset(input);
    assign(output,'bus.out');rewrite(output);
    readln(n,d);
    fillchar(sh,sizeof(sh),0);
    fillchar(sj,sizeof(sj),0);
    for i:=1 to n do
    begin
        read(s[i]);
        sh[i]:=sh[i-1];sj[i]:=sj[i-1];
        if s[i]='H' then inc(sh[i]) else inc(sj[i]);
    end;
    f[1]:=1;
    for i:=2 to n do
    begin
        f[i]:=maxlongint;
        for j:=i downto 1 do
            if (abs((sh[i]-sh[j-1])-(sj[i]-sj[j-1]))<=d)
               or (sh[i]-sh[j-1]=0) or (sj[i]-sj[j-1]=0) then
                  if f[j-1]+1<f[i] then f[i]:=f[j-1]+1;
    end;
    writeln(f[n]);
    close(input);
    close(output);
end.
