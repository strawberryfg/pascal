var max,n,s,zuixiao:longint;
    a:array[1..1000]of longint;
procedure gongyue(n:longint);
var i,j,k:longint;
    pd:boolean;
begin
i:=0;
while true do
        begin
        inc(i);
        if i*i>a[i] then break;
        end;
for j:=i downto 1 do
        begin
        pd:=true;
        for k:=1 to s do
            if a[k] mod j <>0 then begin
                                   pd:=false;
                                   break;
                                   end;
        if pd then begin
                   writeln(j);
                   exit;
                   end;
        end;
end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
max:=10000000;
while not eof do
        begin
        inc(s);
        readln(a[s]);
        if a[s]<max then begin
                         max:=a[s];
                         zuixiao:=s;
                         end;
        end;
gongyue(zuixiao);
close(input);
close(output);
end.
