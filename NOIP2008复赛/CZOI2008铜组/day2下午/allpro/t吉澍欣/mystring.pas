var i,j,l,n:longint;
    s1,s2,max,min:string;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s1);
j:=0;
n:=length(s1);
for i:=1 to 255 do
    min:=min+'a';
for i:=1 to n do
    if s1[i]=' ' then
       begin
       s2:=copy(s1,j+1,i-j-1);
       j:=i;
       if length(s2)>length(max) then max:=s2;
       if length(s2)<length(min) then min:=s2;
       end;
writeln(max);
writeln(min);
close(input);
close(output);
end.