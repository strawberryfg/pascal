var n,i,j,fx1,fx2,fx3,fx4,total:longint;
        str:array[1..10]of string;
        a:array[-1..13,-1..13]of char;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
        readln(str[i]);
for i:=1 to n do
        for j:=1 to n do
                a[i,j]:=str[i][j];

for i:=0 to 10 do
        for j:=0 to 10 do
                if (a[i,j]<>'.')and(a[i,j]<>'X') then a[i,j]:='X';
for i:=1 to n do
        for j:=1 to n do
                begin
                        fx1:=0;
                        fx2:=0;
                        fx3:=0;
                        fx4:=0;
                     if a[i,j]<>'X' then inc(total);
                     if a[i,j]<>'X' then
                     begin
                     while a[i-fx1-1,j]<>'X' do
                                begin
                                inc(fx1);
                                if a[i-fx1,j]='X' then break;
                                a[i-fx1,j]:='X';
                                end;
                     while a[i+fx2+1,j]<>'X' do
                                begin
                                inc(fx2);
                                if a[i+fx2,j]='X' then break;
                                a[i+fx2,j]:='X';
                                end;
                     while a[i,j-fx3-1]<>'X' do
                                begin
                                inc(fx3);
                                if a[i,j-fx3]='X' then break;
                                a[i,j-fx3]:='X';
                                end;
                     while a[i,j+fx4+1]<>'X' do
                                begin
                                inc(fx4);
                                if a[i,j+fx4]='X' then break;
                                a[i,j+fx4]:='X';
                                end;
                     end;
                end;
writeln(total);
close(input);
close(output);
end.
