var str,l,s:string;
        max,least,ls,len,i,j:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(str);
l:='';
s:='';
max:=0;
least:=maxlongint;
ls:=length(str);
len:=0;
str[ls+1]:=' ';
for i:=1 to ls+1 do
        begin
                if str[i]<>' ' then inc(len)
                                else begin
                                        if len>max then
                                                begin
                                                l:='';
                                                for j:=i-1 downto i-len do
                                                        l:=str[j]+l;
                                                max:=len;
                                                end;
                                        if len<least then
                                                begin
                                                s:='';
                                                for j:=i-1 downto i-len do
                                                        s:=str[j]+s;
                                                least:=len;
                                                end;
                                        len:=0;
                                        end;
        end;
writeln(l);
writeln(s);
close(input);
close(output);
end.