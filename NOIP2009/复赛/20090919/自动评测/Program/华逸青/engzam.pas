type point=^node;
     node=record
               t:array['a'..'z'] of point;
               sum:longint;
          end;
var i,j,k,n,m,a,ans:longint;
    s:string;
    ch:char;
    o,q:point;
    p:array['a'..'z'] of point;
procedure work(q:point);
var i,j:char;
begin
    if (q^.sum>=k) then inc(ans);
    for i:='a' to 'z' do
        if q^.t[i]<>nil then work(q^.t[i]);
end;

begin
    assign(input,'engzam.in');reset(input);
    assign(output,'engzam.out');rewrite(output);
    readln(n,m);
    for i:=1 to 26 do
    begin
        new(p[chr(96+i)]);
    end;
    for i:=1 to n do
    begin
        read(ch);
        q:=p[ch];
        read(ch);
        while (ch<>' ') do
        begin
            if (q=nil) or (q^.t[ch]=nil) then
            begin
                new(o);q^.t[ch]:=o;
            end;
            q:=q^.t[ch];
            read(ch);
        end;
        readln(k);
        q^.sum:=k;
    end;
    for i:=1 to m do
    begin
        read(ch);
        q:=p[ch];
        read(ch);
        while (ch<>' ') do
        begin
            q:=q^.t[ch];
            read(ch);
        end;
        readln(k);
        ans:=0;
        work(q);
        writeln(ans);
    end;
    close(input);close(output);
end.
