var b:array[1..10,1..10] of string;
    a:array[1..10,1..10] of longint;
    i,j,n,k,u,l:longint;
begin
assig(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        read(b[i,j]);
    readln;
    end;
k:=1;
begin
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        if b[i,j]='.'then a[i,j]:=0;
        if b[i,j]='X'then a[i,j]:=1;
        end;
    end;
end;
for i:=1 to n do
    begin
    for j:=1 to n do
        if (a[i,j]=1)and(i<>1) then begin
                                        begin
                                        for u:=1 to j-1 do
                                                if a[i,u]<>1 then
                                                a[i,u]:=3;
                                        a[i,j-1]:=9;
                                        end;
                                        begin
                                        for u:=j+1 to n do
                                                if a[i,u]<>1 then
                                                a[i,u]:=3;
                                        a[i,j+1]:=9;
                                        end;
                                        begin
                                        for u:=1 to n do
                                                if a[u,j]<>1 then
                                                a[u,j]:=3;
                                        a[i+1,j]:=9;
                                        end;
                                        begin
                                        for u:=1 to i-1 do
                                                if a[u,j]<>1 then
                                                a[u,j]:=3;
                                        a[i-1,j]:=9;
                                        end;
                                   end
     else if (a[i,j]=1)and(i=1) then begin
                                        begin
                                        for u:=1 to j-1 do
                                                if a[i,u]<>1 then
                                                a[i,u]:=3;
                                        a[i,j-1]:=9;
                                        end;
                                        begin
                                        for u:=j+1 to n do
                                                if a[i,u]<>1 then
                                                a[i,u]:=3;
                                        a[i,j+1]:=9;
                                        end;
                                        begin
                                        for u:=1 to n do
                                                if a[u,j]<>1 then
                                                a[u,j]:=3;
                                        a[i+1,j]:=9;
                                        end;
                                   end;
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
        if a[i,j]=0 then begin
                         for u:=1 to n do
                             begin
                             a[u,j]:=3;
                             a[i,j]:=3;
                             end;
                         a[i,j]:=9;
                         end;
    end;
l:=0;
for i:=1 to n do
    begin
    for j:=1 to n do
            if a[i,j]=9 then l:=l+1;
    end;
writeln(l);
close(input);
close(output);
end.

