var m,n,i,j,answer:longint;str:string;
    a:array[0..61,0..61]of shortint;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
    readln(m,n);
    for i:=1 to m do
        begin
        readln(str);
        for j:=1 to n do
            a[i,j]:=ord(str[j])-ord('1')+1;
        end;
    for i:=1 to n do
        begin a[0,i]:=a[1,i]; a[m+1,i]:=a[m,i];end;
    for i:=1 to m do
        begin a[i,0]:=a[i,1]; a[i,n+1]:=a[i,n];end;
    answer:=0;
    for i:=1 to m do
        for j:=1 to n do
            if (a[i,j]=a[i-1,j])and(a[i,j]=a[i,j-1])and(a[i,j]=a[i+1,j])and(a[i,j]=a[i,j+1])
            then inc(answer);
    writeln(answer);
close(input);
close(output);
end.
