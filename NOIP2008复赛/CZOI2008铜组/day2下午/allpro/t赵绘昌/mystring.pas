var a,b,long,short:string;
    n,i,j,k:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(a);
a:=a+' ';
long:='';
short:='                                                                              ';
for i:=1 to length(a) do
    if a[i]<>' ' then b:=b+a[i]
                 else begin if length(b)>length(long) then
                                begin  long:=' '; long:=b; end;
                            if length(b)<length(short) then
                                begin  short:=' ';  short:=b;end;
                            b:='';
                            end;
writeln(long);
writeln(short);
close(input);
close(output);
end.