var i,j,k,h,m,s,h1,m1,s1,sum:longint;
    st,ss:string;
begin
    assign(input,'natrij.in');reset(input);
    assign(output,'natrij.out');rewrite(output);
    readln(st);
    ss:=st[1]+st[2];val(ss,h,i);
    ss:=st[4]+st[5];val(ss,m,i);
    ss:=st[7]+st[8];val(ss,s,i);
    readln(st);
    ss:=st[1]+st[2];val(ss,h1,i);
    ss:=st[4]+st[5];val(ss,m1,i);
    ss:=st[7]+st[8];val(ss,s1,i);
    if (h=h1) and (m=m1) and (s=s1)
    then writeln('24:00:00')
    else
    begin
        while not((h=h1) and (m=m1) and (s=s1)) do
        begin
            inc(sum);inc(s);
            if s=60 then
            begin
                s:=0;inc(m);
                if m=60 then begin m:=0;inc(h);if h=24 then h:=0 end;
            end;
        end;
        s:=sum mod 60;m:=sum div 60;
        h:=m div 60;m:=m mod 60;
        if h<10 then write(0);write(h,':');
        if m<10 then write(0);write(m,':');
        if s<10 then write(0);write(s);
    end;
    close(input);
    close(output)
end.
