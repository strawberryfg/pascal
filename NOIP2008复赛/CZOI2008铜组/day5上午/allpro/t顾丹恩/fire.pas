var sum,sum2,a,b,c,d,i,j,m,n,k:longint;
s:string;
v:array[0..11,0..11] of shortint;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
begin
readln(s);
for j:=1 to n do
if s[j]='.' then v[i,j]:=0 else v[i,j]:=1;
end;

k:=n;
for i:=1 to n do
 for j:=1 to n do
	if v[i,j]=1 then
	begin
	for a:=1 to i-2 do
                begin
                sum:=0;sum2:=0;
                if v[a,j]=0 then sum:=sum+1
                        else if v[a,j]=1 then sum2:=sum2+1;
                if (sum>sum2) and (sum2>0) then k:=k+sum2
                        else if (sum>0) and (sum2>sum) then
                        begin
                        k:=k+sum;
                        v[a,j]:=3;
                        end;
                end;
 	for a:=i+2 to n do
                begin
                sum:=0;sum2:=0;
                if v[a,j]=0 then sum:=sum+1
                        else if v[a,j]=1 then sum2:=sum2+1;
                if (sum>sum2) and (sum2>0) then k:=k+sum2
                        else if (sum>0) and (sum2>sum) then
                        begin
                        k:=k+sum;
                        v[a,j]:=3;
                        end;
                end;
        for a:=1 to j-2 do
                begin
                sum:=0;sum2:=0;
                if v[i,a]=0 then sum:=sum+1
                        else if v[i,a]=1 then sum2:=sum2+1;
                if (sum>sum2) and (sum2>0) then k:=k+sum2
                        else if (sum>0) and (sum2>sum) then
                        begin
                        k:=k+sum;
                        v[i,a]:=3;
                        end;
                end;
	for a:=j+2 to n do
                begin
                sum:=0;sum2:=0;
                if v[i,a]=0 then sum:=sum+1
                        else if v[i,a]=1 then sum2:=sum2+1;
                if (sum>sum2) and (sum2>0) then k:=k+sum2
                        else if (sum>0) and (sum2>sum) then
                        begin
                        k:=k+sum;
                        v[i,a]:=3;
                        end;
                end;
	v[i,j]:=0;
	end;
writeln(k+1);
close(input);
close(output);
end.
