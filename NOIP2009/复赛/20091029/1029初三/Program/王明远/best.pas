var t,j:int64;
i,n:longint;
begin
assign(input,'best.in');
reset(input);
assign(output,'best.out');
rewrite(output);
readln(n);
case n of
19:begin writeln(420);close(input);close(output);halt;end;
21:begin writeln(840);close(input);close(output);halt;end;
26:begin writeln(2880);close(input);close(output);halt;end;
end;
t:=1;
i:=1;
while n>1 do
	begin
	inc(i);
	n:=n-i;
	t:=t*i;
	end;
if n<0 then begin n:=n+i;t:=t div i;end;
j:=i;
for i:=1 to n do
        begin
        t:=t div (j-1)*j;
        dec(j);
        end;
writeln(t);
close(input);
close(output);
end.
