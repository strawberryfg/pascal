var h,m,s,h1,m1,s1,h2,m2,s2:longint;
    t1,t2:string;
procedure zz(t:string; var h,m,s:longint);
begin
h:=(ord(t[1])-48)*10+(ord(t[2])-48);
m:=(ord(t[4])-48)*10+(ord(t[5])-48);
s:=(ord(t[7])-48)*10+(ord(t[8])-48);
end;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(t1);
readln(t2);
zz(t1,h1,m1,s1);
zz(t2,h2,m2,s2);
if h2<h1 then h2:=h2+24;
if (h2=h1) and (m2<m1) then h2:=h2+24;
if (h2=h1) and (m2=m1) and (s2<s1) then h2:=h2+24;
if s2>=s1 then s:=s2-s1
          else begin s:=s2-s1+60; m2:=m2-1; end;
if m2>=m1 then m:=m2-m1
          else begin m:=m2-m1+60; h2:=h2-1; end;
h:=h2-h1;
if h>=10 then write(h,':')
         else write('0',h,':');
if m>=10 then write(m,':')
         else write('0',m,':');
if s>=10 then write(s)
         else write('0',s);
writeln;
close(input);
close(output);
end.
