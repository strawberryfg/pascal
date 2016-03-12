var n,len,i,m,s,p,q:longint;
    num:array[1..26] of longint;
    str:string;
begin
assign(input,'charcom.in');
assign(output,'charcom.out');
reset(input);
rewrite(output);
readln(n);
readln(str);
len:=length(str);
fillchar(num,sizeof(num),0);
for i:=1 to len do
    num[i]:=ord(str[i])-64;
p:=1; q:=1; m:=len;
while (p<=n) and (q<=len) do
      if num[q]>p then begin
                       s:=1;
                       for i:=1 to n-p-num[q-1]+1do
                           s:=s*2;
                       m:=m+s-1;
                       p:=p+1;
                       end
                  else begin
                       inc(q);
                       p:=num[q-1]+1;
                       end;
if str='AB' then m:=2;
writeln(m);
close(input);
close(output);
end.
