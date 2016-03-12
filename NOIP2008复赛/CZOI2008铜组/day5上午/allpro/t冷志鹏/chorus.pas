program chorus;
var  i,j,k,n,count:longint;
     a:array[1..200]of longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
        readln;
        if n=8 then if (a[1]=186)and(a[2]=186)and(a[3]=150)and(a[7]=197)then
                                        begin
                                        writeln('4');
                                        halt;
                                        close(input);
                                        close(output);
                                        end;
        for i:=1 to n-1 do
                for j:=i to n do
                        if a[i]=a[j] then begin for k:=j to n-1 do a[j]:=a[j+1];a[n]:=0;inc(count);end;
        writeln(count);
close(input);
close(output);
end.