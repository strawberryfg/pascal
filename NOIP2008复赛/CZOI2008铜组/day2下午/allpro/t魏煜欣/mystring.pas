var max,xiao,zuixiao,i,j,zuida,b:longint;
    s:string;
    a,b1,b2:array[1..250] of longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mysrting.out');
rewrite(output);
max:=0;
xiao:=100000;
readln(s);
s:=s+' '  ;
b:=1;
j:=1;
for i:=1 to length(s) do
    if s[i]=' ' then begin
                     a[j]:=i-b;
                     b1[j]:=b;
                     b2[j]:=i-1;
                     b:=i+1;
                     inc(j);
                     end;
for i:=1 to j-1 do
        begin
        if a[i]>max then begin
                         max:=a[i];
                         zuida:=i;
                         end;
        if a[i]<xiao then begin
                          xiao:=a[i];
                          zuixiao:=i;
                          end;
        end;
for i:=b1[zuida] to b2[zuida] do
        write(s[i]);
writeln;
for i:=b1[zuixiao] to b2[zuixiao] do
        write(s[i]);
writeln;
close(input);
close(output);
end.
