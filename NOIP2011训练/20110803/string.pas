var ss:string;
    sum,i,j,t,k:longint;
begin
assign(input,'string.in');
reset(input);
assign(output,'string.out');
rewrite(output);
readln(ss);
sum:=0;
i:=1;
while i<=length(ss) do
 begin
 if (ord(ss[i])>=48)and(ord(ss[i])<=57) then
    begin
    j:=i;
    t:=ord(ss[i])-48;
    while (j+1<=length(ss))and(ord(ss[j+1])>=48)and(ord(ss[j+1])<=57) do
      begin
      t:=t*10+ord(ss[j+1])-48;
      inc(j);
      end;
    i:=j+1;
    end
 else
    begin
    if t=0 then begin write(ss[i]);inc(sum);if sum mod 40=0 then writeln; end
       else begin
            for k:=1 to t do
                begin
                write(ss[i]);
                inc(sum);
                if sum mod 40=0 then writeln;
                end;
            t:=0;
            end;
    inc(i);
    end;
 end;
if sum mod 40<>0 then writeln;
close(input);
close(output);
end.
