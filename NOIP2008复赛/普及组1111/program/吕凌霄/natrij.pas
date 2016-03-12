var s1,s2,t:string;
    h1,h2,h,f1,f2,f,m1,m2,m:longint;
    code:integer;
begin
assign(input,'natrij.in');reset(input);
assign(output,'natrij.out');rewrite(output);
readln(s1);
readln(s2);
t:=copy(s1,1,2);val(t,h1,code);
t:=copy(s1,4,2);val(t,f1,code);
t:=copy(s1,7,2);val(t,m1,code);
t:=copy(s2,1,2);val(t,h2,code);
t:=copy(s2,4,2);val(t,f2,code);
t:=copy(s2,7,2);val(t,m2,code);
m:=m2-m1;if m<0 then begin m:=m+60;f2:=f2-1;end;
f:=f2-f1;if f<0 then begin f:=f+60;h2:=h2-1;end;
h:=h2-h1;
if h div 10=0 then write(0);
write(h,':');
if f div 10=0 then write(0);
write(f,':');
if m div 10=0 then write(0);
writeln(m);
close(input);close(output);
end.