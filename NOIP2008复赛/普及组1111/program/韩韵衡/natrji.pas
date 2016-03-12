var
	st1,st2:string;
	dh,dm,ds,h1,h2,m1,m2,s1,s2,code:longint;
begin
assign(input,'natrji.in');
reset(input);
assign(output,'natrji.out');
rewrite(output);
readln(st1);
readln(st2);
val(copy(st1,1,2),h1,code);
val(copy(st1,4,2),m1,code);
val(copy(st1,7,2),s1,code);
val(copy(st2,1,2),h2,code);
val(copy(st2,4,2),m2,code);
val(copy(st2,7,2),s2,code);
if s2<s1 then begin ds:=s2+60-s1; m2:=m2-1; end;
if s2>=s1 then ds:=s2-s1;
if m2<m1 then begin dm:=m2+60-m1; h2:=h2-1; end;
if m2>=m1 then dm:=m2-m1;
if h2<h1 then dh:=h2+24-h1;
if h2>=h1 then dh:=h2-h1;
if dh<10 then write('0');
write(dh);
write(':');
if dm<10 then write('0');
write(dm);
write(':');
if ds<10 then write('0');
write(ds);
writeln;
close(input);
close(output);
end.
