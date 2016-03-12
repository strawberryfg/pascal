var a:array[1..100]of longint;
    n,sum,i,k,j:longint;
    b:string;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(b);
for i:=1 to n-1 do
    begin
    a[i]:=1;
    for j:=1 to n-i do
        a[i]:=a[i]*2;
    end;
sum:=0;
for i:=1 to length(b) do
    begin
    k:=ord(b[i])-64-1;
    for j:=1 to k do
        begin
        sum:=sum+a[j];
        a[j]:=0;
        end;
    a[k+1]:=0;
    sum:=sum+1;
    end;
writeln(sum);
close(input);
close(output);
end.