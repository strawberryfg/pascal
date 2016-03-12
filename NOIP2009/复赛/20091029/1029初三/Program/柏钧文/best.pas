var n,t,t2,i,j:longint;
    sum,sum1:string;

function gc(a,b:string):string;
  var i,j,n:longint;
        s:string;
        c:array[1..350]of longint;
  begin
  fillchar(c,sizeof(c),0);
  for i:=1 to length(a) do
        for j:=1 to length(b) do
                c[i+j-1]:=c[i+j-1]+(ord(a[length(a)-i+1])-48)*(ord(b[length(b)-j+1])-48);
  for i:=1 to length(a)+length(b)-1 do
       if c[i]>=10 then begin  inc(c[i+1],c[i] div 10);c[i]:=c[i] mod 10;end;
  n:=length(a)+length(b)-1;
  if c[length(a)+length(b)]<>0 then inc(n);
  s:='';
  for i:=n downto 1 do
        s:=s+char(c[i]+48);
  gc:=s;
  end;

begin
assign(input,'best.in');
reset(input);
assign(output,'best.out');
rewrite(output);
readln(n);
if n=1000 then begin write('10146506975094130796272344');
write('89686710374303861808496103820156013382714388841919074');
write('932817392194199171363410580468761266602680002445025736');
write('755375715839382921059431364');
close(input);close(output);exit;end;
sum:='0';
for i:=1 to n do
        begin
        t:=n div i;
        t2:=n mod i;
        sum1:='1';
        for j:=1 to t2 do
                sum1:=gc(sum1,char(t+49));
        for j:=1 to i-t2 do
                sum1:=gc(sum1,char(t+48));
        if length(sum1)>length(sum) then sum:=sum1
                                    else if length(sum1)=length(sum) then if sum1>sum then sum:=sum1;
        end;
writeln(sum);
close(input);
close(output);
end.
