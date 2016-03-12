var str,max,min:string;
    i,j,k,l:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(str);
max:='';
for i:=1 to 251 do
        min:=min+'a';
i:=1;j:=0;l:=1;
while i<=length(str) do
        begin
        j:=0;
        while (str[i]<>' ')and(i<=length(str)) do
                begin
                inc(i);
                inc(j);
                end;
        if j<length(min) then
                begin
                min:='';
                for k:=l to l+j-1 do
                        min:=min+str[k];
                end;
        if j>length(max) then
                begin
                max:='';
                for k:=l to l+j-1 do
                        max:=max+str[k];
                end;
        inc(i);
        l:=i;
        end;
writeln(max);
writeln(min);
close(input);
close(output);
end.