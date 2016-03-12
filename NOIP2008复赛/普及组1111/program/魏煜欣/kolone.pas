var i,s,n,m,k,j,t:longint;
    temp:char;
    hash:array[1..1000000] of byte;
    a:array[1..1000000] of char;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n,m);
fillchar(hash,sizeof(hash),5);
for i:=n downto 1 do
        begin
        read(a[i]);
        hash[i]:=1;
        end;
readln;
for i:=n+1 to m+n do
        begin
        read(a[i]);
        hash[i]:=0;
        end;
readln(t);
for i:=1 to t do
        begin
        s:=0;
        for k:=1 to n+m-1 do
            if (hash[k]=1) and (hash[k+1]=0) then inc(s);
        j:=1;
        repeat
                if (s>0) and (hash[j]=1) and (hash[j+1]=0) then
                        begin
                        hash[j]:=0;
                        hash[j+1]:=1;
                        temp:=a[j];
                        a[j]:=a[j+1];
                        a[j+1]:=temp;
                        dec(s);
                        j:=j+2;
                        end
                                                           else
                        inc(j);
                        until s=0;
        end;
for i:=1 to m+n do
        write(a[i]);
close(input);
close(output);
end.
