var a,b:array[1..2000]of longint;
    i,j,p,t,number,n:longint;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
number:=0;t:=1;
while not eof do
   begin
   inc(number);
   readln(a[number]);
   end;
for i:=1 to number do
      if a[i]=1 then begin writeln(1); close(input);close(output);exit; end;
for i:=1 to trunc(sqrt(a[1])) do
    if a[1] mod i=0 then begin b[t]:=i; b[t+1]:=a[1] div i; t:=t+2;end;
for i:=1 to t-1 do
    for j:=i+1 to t do
        if b[j]>b[i] then begin p:=b[j]; b[j]:=b[i]; b[i]:=p;end;
for i:=1 to t do
    for j:=2 to number do
        begin
        if a[j] mod b[i]<>0 then break;
        writeln(b[i]);
        close(input);
        close(output);exit;
        end;
end.
