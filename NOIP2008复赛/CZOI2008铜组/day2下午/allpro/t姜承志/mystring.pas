var a:string;
    bn,en:byte;
    bm,em,bi,ei:byte;
    i,l,i2,d,p:byte;
begin
assign(input,'mystring.in');
assign(output,'mystring.out');
reset(input);
readln(a);
close(input);
a:=' '+a;
l:=length(a);
en:=l;
ei:=l;
for i:=l downto 1 do
    begin
    if a[i]=' ' then
       begin
       bn:=i+1;
       if en-bn>em-bm then begin
                                 em:=en;
                                 bm:=bn;
                                 end
                            else
       if en-bn=em-bm then begin
                                 em:=en;
                                 bm:=bn;
                                 end;
       if en-bn<ei-bi then begin
                                 ei:=en;
                                 bi:=bn;
                                 end
                            else
       if en-bn=ei-bi then begin
                                 ei:=en;
                                 bi:=bn;
                                 end;
       en:=i-1;
       end;
    end;
rewrite(output);
for i:=bm to em do
    write(a[i]);
writeln;
for i:=bi to ei do
    write(a[i]);
writeln;
close(output);
end.
