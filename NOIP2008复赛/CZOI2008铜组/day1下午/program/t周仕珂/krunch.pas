var s:string;
        ls,i:longint;
        hash:array[0..10000] of longint;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(s);
ls:=length(s);
for i:=1 to ls do
        if (s[i]='A')or(s[i]='U')or(s[i]='I')or(s[i]='E')or(s[i]='O')
                then s[i]:='0';
for i:=1 to ls do
        begin
        if (s[i]<>'0')and(s[i]<>' ') then
        begin
        inc(hash[ord(s[i])-ord('A')]);
        if hash[ord(s[i])-ord('A')]>1 then s[i]:='0';
        end;
        end;
if s[i]=' ' then s[i]:='0';
if s[ls]=' ' then s[ls]:='0';
for i:=1 to ls do
        begin
        if (s[i]=' ') and (s[i+1]=' ') then s[i]:='0';
        if (s[i]=' ')and(s[i+1]=',')or
           (s[i]=' ')and(s[i+1]='.')or
           (s[i]=' ')and(s[i+1]='?') then s[i]:='0';

        end;
for i:=1 to ls do
        if s[i]<>'0' then write(s[i]);
writeln;
close(input);
close(output);
end.
