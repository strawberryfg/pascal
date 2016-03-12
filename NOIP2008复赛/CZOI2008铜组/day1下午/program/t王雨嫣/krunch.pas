var a:string;
    i,s1,s2,j:longint;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(a);
s1:=1;
s2:=length(a);
while a[s1]=' ' do
      inc(s1);
while a[s2]=' ' do
      dec(s2);
for i:=s1 to s2-1 do
    for j:=i+1 to s2 do
        if (a[j]<>' ')and(a[i]<>' ')and(a[j]=a[i]) then a[j]:='0';
for i:=s1 to s2-1 do
    begin
    if (a[i]='A')or(a[i]='E')or(a[i]='I')or(a[i]='O')or(a[i]='U') then a[i]:='0';
    if a[i]=' ' then
       if (a[i-1]=' ')or(a[i+1]=' ')or(a[i+1]=',')or(a[i+1]='.')or(a[i+1]='?') then a[i]:='0';
    end;
for i:=s1 to s2 do
    if a[i]=' 'then begin
                    j:=i;
                    while (a[j+1]='0')or(a[j+1]=' ')do
                          begin
                          inc(j);
                          a[j]:='0';
                          end;
                    end;
for i:=s1 to s2 do
    if a[i]<>'0' then write(a[i]);
writeln;
close(input);
close(output);
end.
