var     name:array[1..200]of string;
        num,n,i,j,t:longint;
        a,b,c:array[1..100]of longint;
        d:array[1..100,1..2]of longint;
        ch:char;
        s:string;
begin
        assign(input,'party.in');
        reset(input);
        assign(output,'party.out');
        rewrite(output);
        readln(n);
        for i:=1 to n do
        begin
                s:='';
                read(ch);
                repeat
                        s:=s+ch;
                        read(ch);
                until ch=' ';
                for j:=1 to num do if name[j]=s then break;
                if name[j]<>s then begin inc(num); name[num]:=s; j:=num; end;
                a[i]:=j;
                read(b[i]);
                readln(s);
                while s[1]=' ' do delete(s,1,1);
                while s[length(s)]=' ' do delete(s,length(s),1);
                for j:=1 to num do if name[j]=s then break;
                if name[j]<>s then begin inc(num); name[num]:=s; j:=num; end;
                c[i]:=j;
        end;
        for i:=1 to n-1 do
                for j:=i+1 to n do
                        if a[i]=c[j] then
                        begin
                                t:=a[i];a[i]:=a[j];a[j]:=t;
                                t:=b[i];b[i]:=b[j];b[j]:=t;
                                t:=c[i];c[i]:=c[j];c[j]:=t;
                        end;
        a[n+1]:=c[n];
        for i:=1 to n+1 do
        begin
                for j:=1 to i-1 do
                if c[j]=a[i] then
                begin
                        inc(d[i,1],d[j,2]);
                        if d[j,1]<d[j,2]
                                then inc(d[i,2],d[j,2])
                                else inc(d[i,2],d[j,1]);
                end;
                inc(d[i,1],b[i]);
        end;
        writeln(d[n+1,2]);
        close(input);
        close(output);
end.
