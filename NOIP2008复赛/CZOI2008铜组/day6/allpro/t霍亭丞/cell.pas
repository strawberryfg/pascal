var n,m,i,j,total:longint;a:array[0..61,0..61]of char;s:string;
procedure try(wide,leng:longint);
begin
a[wide,leng]:='0';
if wide<m then begin if a[wide+1,leng]<>'0' then try(wide+1,leng);end;
if leng<n then begin if a[wide,leng+1]<>'0' then try(wide,leng+1);end;
if wide>1 then begin if a[wide-1,leng]<>'0' then try(wide-1,leng);end;
if leng>1 then begin if a[wide,leng-1]<>'0' then try(wide,leng-1);end;
end;
begin
assign(input,'cell.in');assign(output,'cell.out');
reset(input);rewrite(output);
readln(n,m);
total:=0;
for i:=1 to n do
        begin
        readln(s);
        for j:=1 to length(s) do
            a[i,j]:=s[j];
        end;
for i:=1 to n do
    for j:=1 to m do
        if a[i,j]<>'0' then begin total:=total+1;try(i,j);end;
writeln(total);
close(input);close(output);
end.
