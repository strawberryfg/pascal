var n,d,j,h,i,total,max:longint;
        s:string;

function pd(a,b:longint):boolean;
  var sum:longint;
  begin
  if (a=0)or(b=0) then begin pd:=true;exit; end;
  pd:=true;
  sum:=abs(a-b);
  if sum=d then pd:=false;
  end;

begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
readln(s);
j:=0;h:=0;
total:=0;
for i:=1 to length(s) do
        begin
        if s[i]='J' then inc(j)
                    else inc(h);
        if j>h then max:=j
		else max:=h;
        if (max=j)and((j-h)>=d) then if (s[i+1]='H') then continue;
	if (max=h)and((h-j)>=d) then if (s[i+1]='J') then continue;
	if not pd(j,h) then
                        begin
                        inc(total);
                        h:=0;
                        j:=0;
                        end;
        end;
writeln(total+1);
close(input);
close(output);
end.
