var s,a,b,c:string;
    i,t,a1,b1,c1:longint;
begin
assign(input,'add.in');
reset(input);
assign(output,'add.out');
rewrite(output);
readln(s);
i:=1;
while s[i]<>'+' do inc(i);
a:=copy(s,1,i-1);
inc(i);
while s[i]<>'=' do inc(i);
t:=length(a)+2;
b:=copy(s,t,i-t);
delete(s,1,length(a)+length(b)+2);
c:=s;
val(a,a1);
val(b,b1);
val(c,c1);
if (a<>'a')and(b<>'b') then writeln('c=',a1+b1)
   else if(a<>'a')and(c<>'c') then writeln('b=',c1-a1)
        else writeln('a=',c1-b1);
close(input);
close(output);
end.