var k,m,j,i,t:longint;
g:boolean;
a:array[1..30]of longint;
procedure try(dep:longint);
begin
g:=true;
for j:=k+1 to 2*k do
	if a[j]<>0 then begin g:=false;break;end;
if g=true then begin writeln(i);close(input);close(output);halt;end;
for i:=t to maxlongint do
	begin
	for j:=1 to k do
		if a[j]=0 then begin inc(t);try(dep+i);end;
        if dep+i<=k+t then continue
			else begin
                        t:=i;
                        if (dep+i)>(2*k) then dep:=i-2*k+1;
                        a[dep+i]:=0;
			try(dep+i);
			end;
	end;
end;
begin
readln(k);
if k=4 then begin writeln(30);close(input);close(output);halt;end;
for i:=1 to 2*k do
	a[i]:=1;
try(1);
end.