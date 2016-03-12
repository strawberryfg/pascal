var a,max,min,s:string;k,q,p,h,i,j,ii:longint;
begin
assign(input,'mystring.in');
assign(output,'mystring.out');
reset(input);rewrite(output);
readln(a);
p:=250;
for i:=1 to length(a) do
    if (a[i]=' ')or (i=length(a)) then for j:=i downto 1 do
                         if (a[j-1]=' ')or(j=1) then
                            begin
                            if i=length(a) then ii:=i else ii:=i-1;
                            for h:=j to ii do
                                begin
                                s:=s+a[h];
                                end;
                                if length(s)>q then
                                   begin
                                   q:=length(s);
                                   max:=s;
                                   end;
                                if length(s)<p then
                                   begin
                                   p:=length(s);
                                   min:=s;
                                   end;
                            s:='';
                            break;
                            end;
writeln(max);
writeln(min);
close(input);
close(output);
end.