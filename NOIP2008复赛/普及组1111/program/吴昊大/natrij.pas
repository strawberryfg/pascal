var s,ss:string;
    h1,m1,s1,h2,m2,s2,count,count2,count3:longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(s);
readln(ss);
val(copy(s,1,2),h1);
val(copy(s,4,2),m1);
val(copy(s,7,2),s1);
val(copy(ss,1,2),h2);
val(copy(ss,4,2),m2);
val(copy(ss,7,2),s2);
if (h1=h2)and(m1=m2)and(s1=s2) then
                               begin
                               writeln('00:00:00');
                               close(input);
                               close(output);
                               end;
if h2<h1 then h2:=h2+24;
if m2<m1 then
         begin
         h2:=h2-1;
         inc(m2,60);
         end;
if s2<s1 then
         begin
         m2:=m2-1;
         inc(s2,60);
         end;
count3:=h2-h1;
count2:=m2-m1;
count:=s2-s1;
if count>60 then
            begin
            count:=count-60;
            inc(count2);
            end;
if count2>60 then
             begin
             count2:=count2-60;
             inc(count3);
             end;
if count3<10 then write('0',count3,':')
             else write(count3,':');
if count2<10 then write('0',count2,':')
             else write(count2,':');
if count<10 then writeln('0',count)
             else writeln(count);
close(input);
close(output);
end.