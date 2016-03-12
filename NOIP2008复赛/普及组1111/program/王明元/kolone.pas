var n1,n2,t,k,s,i:longint;
str1,str2,str3:string;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n1,n2);
readln(str1);
readln(str2);
readln(t);
for i:=length(str1) downto 1 do
        str3:=str3+str1[i];
str1:=str3;
s:=0;
k:=0;
if t=0 then begin
            write(str1[i]);
            write(str2);
            close(input);
            close(output);
            halt;
            end;
if (t<n1)and(t<n2) then 
	for i:=1 to length(str1+str2) do
		if k=0 then begin write(str1[i-s]);inc(k);inc(s);end
			else begin write(str2[i-s]);dec(k);end;
close(input);
close(output);
end.
