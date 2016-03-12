var n,i,s:longint;
begin      
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
s:=0;
readln(n);
for i:=1 to n do
	begin
	if i div 10=0 then begin inc(s);continue;end;
	if i div 100=0 then begin s:=s+2;continue;end;
	if i div 1000=0 then begin s:=s+3;continue;end;
	if i div 10000=0 then begin s:=s+4;continue;end;
	if i div 100000=0 then begin s:=s+5;continue;end;
	if i div 1000000=0 then begin s:=s+6;continue;end;
	if i div 10000000=0 then begin s:=s+7;continue;end;
	if i div 100000000=0 then begin s:=s+8;continue;end;
	end;
writeln(s);
close(input);
close(output);
end.
