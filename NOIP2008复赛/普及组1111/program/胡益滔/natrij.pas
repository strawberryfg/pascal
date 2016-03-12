var
	s1,s2:string;
    	time1,time2,time:longint;

function c(s:string):longint;
var
	i:longint;
begin
  	c:=0;
  	for i:=1 to length(s) do
    		c:=c*10+ord(s[i])-48;
end;

begin
  	assign(input,'natrij.in');
 	reset(input);
  	assign(output,'natrij.out');
  	rewrite(output);
  	readln(s1);
  	readln(s2);
  	time1:=c(copy(s1,1,2))*3600+c(copy(s1,4,2))*60+c(copy(s1,7,2));
  	time2:=c(copy(s2,1,2))*3600+c(copy(s2,4,2))*60+c(copy(s2,7,2));
        if time2<time1 then inc(time2,3600*24);
  	time:=time2-time1;
  	if time div 3600<10 then write('0',time div 3600,':') else write(time div 3600,':');
  	time:=time mod 3600;
  	if time div 60<10 then write('0',time div 60,':') else write(time div 60,':');
  	time:=time mod 60;
 	if time<10 then writeln('0',time) else writeln(time);
  	close(input);
  	close(output);
end.
