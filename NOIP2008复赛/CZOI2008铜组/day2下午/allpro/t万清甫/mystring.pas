var s,t,max,min:string[251];
    i,j,k:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s);
i:=0;
max:='';
for j:=1 to 251 do min:=min+'a';
repeat
begin
inc(i);
if s[i]<>' 'then t:=t+s[i]
            else begin
                 if length(t)>length(max) then max:=t;
                 if length(t)<length(min) then min:=t;
                 t:='';
                 end;
end;
until i=length(s);
if length(t)>length(max) then max:=t;
if length(t)<length(min) then min:=t;
writeln(max);
writeln(min);
close(input);
close(output);
end.
