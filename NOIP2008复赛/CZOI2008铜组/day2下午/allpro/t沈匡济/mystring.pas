var s,s1:string;
    i,j,l:longint;
    b:array[1..250]of string;
    c:char;
begin
assign(input,'mystring.in');reset(input);
assign(output,'mystring.out');rewrite(output);
readln(s);
l:=0;s1:='';s:=s+' ';
for i:=1 to length(s)+1 do
        begin
        c:=s[i];
        if c<>' ' then begin inc(l);s1:=s1+c;end
                  else if b[l]='' then begin b[l]:=s1;l:=0;s1:='';end
                                  else begin l:=0;s1:='';end;
        end;
for i:=250 downto 1 do
        if b[i]<>'' then begin writeln(b[i]);break;end;
for i:=1 to 250 do
        if b[i]<>'' then begin writeln(b[i]);break;end;
close(input);
close(output);
end.
