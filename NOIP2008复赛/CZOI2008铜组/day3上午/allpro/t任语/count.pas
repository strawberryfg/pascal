program ex1;
var n,p,i,j,k,l:longint;
    a:array[0..9] of longint;
begin
    assign(input,'count.in');
    reset(input);
    assign(output,'count.out');
    rewrite(output);
    readln(n);
    if (n<=100) and (n>=20) then begin
                                     for i:=1 to 9 do
                                        a[i]:=1;
                                     a[0]:=2;
                                     l:=n div 10;
                                     k:=n mod 10;
                                     for i:=1 to l-1 do
                                          a[i]:=10;
                                     if k<l then for i:=1 to k do a[i]:=a[i]+1;
                                     if k>l then begin
                                                     a[l]:=a[l]+1;
                                                     for i:=1 to k do a[i]:=a[i]+1;
                                                     for i:=l+1 to k do
                                                         a[i]:=a[i]+1;

                                                 end;
                                     for i:=1 to l-1 do
                                         for j:=0 to 9 do
                                             a[j]:=a[j]+1;

                                 end;
    for i:=0 to 9 do
        writeln(a[i]);
    close(input);
    close(output);
end.









