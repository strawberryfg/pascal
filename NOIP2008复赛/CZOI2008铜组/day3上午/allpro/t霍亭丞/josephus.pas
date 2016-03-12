const max=1000000;
var k,i,w,t:longint;sum:string;
procedure try(n:longint);
var ls:longint;
begin
ls:=length(sum);
if ls=k then
   begin writeln(n);halt;end;
w:=w+n;
if (w)>ls then begin while w>ls do w:=w-ls;end;
if sum[w]='0' then exit else begin delete(sum,w,1);w:=w-1;try(n);end;
end;
begin
assign(input,'josephus.in');
assign(output,'joesphus.out');
reset(input);rewrite(output);
readln(k);
w:=0;
for i:=2*k to max do
    begin
    sum:='';
    for t:=1 to k do
        sum:=sum+'0';
    for t:=k+1 to 2*k do
        sum:=sum+'1';
    try(i);
    w:=0;
    end;
close(input);close(output);
end.
