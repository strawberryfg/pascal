const maxn=10;
type arrchr=array[1..maxn,1..maxn]of char;
var i,j,n,s:longint;c:arrchr;
function check(a,b:longint):boolean;
        var i:longint;
        begin
        check:=true;
        for i:=a-1 downto 1 do
                if c[i,b]='o' then exit(false)
                        else if c[i,b]='X' then break;
        for i:=b-1 downto 1 do
                if c[a,i]='o' then exit(false)
                        else if c[a,i]='X' then break;
        for i:=a+1 to n do
                if c[i,b]='o' then exit(false)
                        else if c[i,b]='X' then break;
        for i:=b+1 to n do
                if c[a,i]='o' then exit(false)
                        else if c[a,i]='X' then break;
        end;
procedure print;
        var i,j,k:longint;
        begin
        k:=0;
        for i:=1 to n do
                for j:=1 to n do
                        if c[i,j]='o' then inc(k);
        if k>s then s:=k;
        end;
procedure try(len,wide:longint);
        var i:longint;
        begin
        if len>n then print
                else
                for i:=0 to 1 do
                        begin
                        if (i=1)and(c[len,wide]='.') then c[len,wide]:='o';
                        if (i=0)or(check(len,wide)) then
                                if wide=n then try(len+1,1)
                                        else try(len,wide+1);
                        if c[len,wide]='o' then c[len,wide]:='.';
                        end;
        end;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
        begin
        for j:=1 to n do
                read(c[i,j]);
        readln;
        end;
try(1,1);
writeln(s);
close(input);
close(output);
end.