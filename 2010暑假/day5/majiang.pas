var n,k,i,sum,pd:longint;
    mark,two:boolean;
	times:array[1..14]of longint;
	a,b:array[1..20]of longint;
procedure try(dep:longint);
var i:longint;
begin
if (dep=0)and(two=true)then begin mark:=true;exit; end;
for i:=1 to 9 do
    begin
	if two=false then
	   begin
	   if times[i]>=2 then begin times[i]:=times[i]-2;two:=true;try(dep-2);two:=false;times[i]:=times[i]+2; end;
	   end
	else
	   begin
	   if times[i]>=3 then begin times[i]:=times[i]-3;try(dep-3);times[i]:=times[i]+3; end;
	   if mark=true then exit;
	   if (times[i]>=1)and(times[i+1]>=1)and(times[i+2]>=1) then
	      begin dec(times[i]); dec(times[i+1]); dec(times[i+2]); try(dep-3); inc(times[i]); inc(times[i+1]); inc(times[i+2]); end;
	   if mark=true then exit;
	   end;
    end;
end;
begin
assign(input,'majiang.in');
reset(input);
assign(output,'majiang.out');
rewrite(output);
while not eoln do
      begin
	  inc(n);
	  read(a[n]);
	  inc(times[a[n]]);
	  end;
k:=(13-n)mod 3;
if (n=0)or(n>13)or((13-n)mod 3<>0) then writeln('CHEAT!!!')
   else begin
        pd:=0;
        for i:=1 to 9 do
            begin
	    if times[i]=4 then continue;
            if times[i]>4 then  begin pd:=1;writeln('CHEAT!!!');break; end;
            inc(times[i]);
	    two:=false;
	    mark:=false;
            try(n+1);
            if mark=true then begin inc(sum);b[sum]:=i;pd:=2; end;
            dec(times[i]);
            end;
	if pd=0 then writeln('NO!')
	        else if pd=2 then begin
	                          for i:=1 to sum-1 do write(b[i],' ');
	        		  write(b[sum]);
                     		  writeln;
		                  end;
        end;
close(input);
close(output);
end.
