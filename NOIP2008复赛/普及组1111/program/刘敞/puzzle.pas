var i,j,t:longint;
    a:array[1..9,1..9]of char;
function check(x,y:longint;c:char):boolean;
        var i,j,m,n:longint;
        begin
        check:=true;
        for i:=1 to 9 do
                if a[x,i]=c then exit(false);
        for i:=1 to 9 do
                if a[i,y]=c then exit(false);
        m:=(x-1) div 3+1;
        n:=(y-1) div 3+1;
        for i:=m*3-2 to m*3 do
                for j:=n*3-2 to n*3 do
                        if a[i,j]=c then exit(false);
        end;
procedure print;
        var i,j:longint;
        begin
        for i:=1 to 9 do
                begin
                for j:=1 to 8 do
                        write(a[i,j],' ');
                write(a[i,9]);
                writeln;
                end;
        close(input);
        close(output);
        halt;
        end;
procedure func(i,j:longint);
        var k:char;
        begin
        if i>9 then print
                else
                begin
                if a[i,j]='0' then
                        for k:='1' to'9' do
                                begin
                                if check(i,j,k) then
                                        begin
                                        a[i,j]:=k;
                                        if j=9
                                        then func(i+1,1)
                                        else func(i,j+1);
                                        a[i,j]:='0';
                                        end;
                                end
                        else
                        if j=9 then func(i+1,1) else func(i,j+1);
                end;
        end;
begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
for i:=1 to 9 do
        for j:=1 to 9 do
                begin
                read(t);
                a[i,j]:=chr(t+48);
                end;
func(1,1);
close(input);
close(output);
end.
