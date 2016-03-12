var h1,m1,s1,h2,m2,s2,h3,m3,s3,l,k:longint;
    c1,c2,c3:string;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
readln(c1);
readln(c2);
val(copy(c1,1,2),h1);
val(copy(c1,4,2),m1);
val(copy(c1,7,2),s1);
val(copy(c2,1,2),h2);
val(copy(c2,4,2),m2);
val(copy(c2,7,2),s2);
if(h1>h2)or((h1=h2)and((c1>c2)or((c1=c2)and(s1>s2))))
  then h2:=h2+24;
k:=0;
if s1<=s2 then s3:=s2-s1
         else begin s3:=s2+60-s1;k:=1;end;
l:=0;
if m1<=m2 then m3:=m2-m1-k
         else begin m3:=m2+60-m1-k;l:=1;end;
if m3<0 then begin m3:=m3+60;inc(l);end;
if h1<=h2 then begin h3:=h2-h1-l;end
         else begin h3:=h2+60-h1-l;end;
str(h3,c1);if length(c1)<2 then c1:='0'+c1;
str(m3,c2);if length(c2)<2 then c2:='0'+c2;
str(s3,c3);if length(c3)<2 then c3:='0'+c3;
writeln(c1,':',c2,':',c3);
close(input);
close(output);
end.