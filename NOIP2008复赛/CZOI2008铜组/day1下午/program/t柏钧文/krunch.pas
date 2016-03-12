var j,i,k,sum,dep:longint;
        a,b:array[1..100]of char;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
i:=0;
while not eoln do
      begin
      inc(i);
      read(a[i]);
      end;
for j:=1 to i do
    begin
    sum:=0;
    if (a[j]=' ')or(a[j]='*') then continue;
    for k:=j+1 to i do
        if a[k]=a[j] then begin inc(sum);a[k]:='*'; end;
    end;
for j:=1 to i do
    if (a[j]='A')or(a[j]='E')or (a[j]='I')or(a[j]='O')or(a[j]='U')
    then a[j]:='*';
dep:=1;
while a[dep]=' ' do
        begin
        a[dep]:='*';
        inc(dep);
        end;
dep:=i;
while a[dep]=' ' do
        begin
        a[dep]:='*';
        dec(dep);
        end;
for j:=1 to i do
   if ((a[j]=' ')and(a[j+1]=' '))or((a[j]=' ')and(a[j-1]=' ')) then a[j-1]:='*';
for j:=1 to i do
        if (a[j]='.')or(a[j]=',')or(a[j]='?')and(a[j-1]=' ')then a[j-1]:='*';
for j:=1 to i do
    if (a[1]<>'*')and(a[1]<>' ')then break
                              else if (a[j]<>'*')and(a[j]=' ')then begin a[j]:='*';break;end;
for j:=i downto 1 do
    if (a[i]<>'*')and(a[i]<>' ')then break
                                else if (a[j]<>'*')and(a[j]=' ')then begin a[j]:='*';break;end;
dep:=1;
for j:=1 to i do
    if (a[j]<>'*')and(a[j]<>b[dep-1]) then begin b[dep]:=a[j];inc(dep); end;
for j:=1 to dep do
    write(b[j]);
writeln;
close(input);
close(output);
end.