program mystring;
var  s:string;
     a:array[0..250] of string;
     i,k,max,min,len:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
        readln(s);
        len:=length(s);
        k:=0;
        max:=0;
        min:=0;
        for i:=0 to 250 do a[i]:='';
        for i:=1 to len do
                if s[i]<>' ' then a[k]:=a[k]+s[i]
                             else inc(k);
        for i:=1 to k do
                begin
                if length(a[i])>length(a[max]) then max:=i;
                if length(a[i])<length(a[min]) then min:=i;
                end;
        writeln(a[max]);
        writeln(a[min]);
close(input);
close(output);
end.
