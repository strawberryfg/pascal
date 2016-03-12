var st:string;
    ls,i,n,max,min:longint;
    a:array[1..250] of string;
    len:array[1..250] of longint;
begin
assign(input,'mystring.in');
assign(output,'mystring.out');
reset(input);
rewrite(output);
readln(st);
ls:=length(st);
n:=1;
while i<=ls do
      begin
      if st[i]<>' ' then begin
                         inc(len[n]);
                         a[n]:=a[n]+st[i];
                         end
                    else inc(n);
      inc(i);
      end;
max:=1; min:=1;
for i:=2 to n do
    begin
    if len[i]>len[max] then max:=i;
    if len[i]<len[min] then min:=i;
    end;
writeln(a[max]);
writeln(a[min]);
close(input);
close(output);
end.
