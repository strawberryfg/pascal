var i,n,k,j,sum:longint;
    a:array[1..10000] of boolean;
    b:array[1..1000] of longint;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
fillchar(a,sizeof(a),true);
while not eof do
      begin
      inc(i);
      readln(b[i]);
      end;
k:=i;
a[1]:=false;
for i:=2 to 5000 do
    if a[i]=true then
       begin
       j:=2*i;
       while j<=10000 do
       begin
       a[j]:=false;
       inc(j,i);
       end;
       end;
for i:=1 to k do
    if a[b[i]]=true then inc(sum);
writeln(sum);
close(input);
close(output);
end.
