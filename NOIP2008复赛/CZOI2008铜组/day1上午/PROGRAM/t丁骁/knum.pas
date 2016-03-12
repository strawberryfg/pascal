const maxn=10000;
var n,k,i:longint;
    num:array[1..maxn] of longint;
procedure done;
var j,k,n1:longint;
begin
n1:=1;
while n1>k do
      begin
      for j:=n1+1 to n do
          if num[j]>num[n1] then begin
                                 k:=num[j];
                                 num[j]:=num[n1];
                                 num[n1]:=k;
                                 end;
      end;
writeln(num[k]);
end;
begin
assign(input,'knum.in');
assign(output,'knum.in');
reset(input);
rewrite(output);
readln(n,k);
for i:=1 to n do
    readln(num[i]);
done;
close(input);
close(output);
end.