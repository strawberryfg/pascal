var a:array[1..9,1..9]of longint;
    bi,bj,b:array[1..9,1..9]of boolean;
    i,j,temp:longint;
function find(ti,tj:longint):longint;
var t1,t2:longint;
begin
t1:=(ti-1) div 3+1;
t2:=(tj-1) div 3+1;
find:=(t1-1)*3+t2;
end;
procedure print;
var i,j:longint;
begin
for i:=1 to 9 do
    begin
    for j:=1 to 8 do
        write(a[i,j],' ');
    writeln(a[i,9]);
    end;
close(input);
close(output);
halt;
end;
procedure try(ti,tj:longint);
var i,temp:longint;
begin
if ti=10 then print;
if a[ti,tj]<>0 then if tj=9 then try(ti+1,1)
                            else try(ti,tj+1)
               else for i:=1 to 9 do
                        if bi[ti,i]=true then
                           if bj[tj,i]=true then
                              begin
                              temp:=find(ti,tj);
                              if b[temp,i]=true then
                                 begin
                                 a[ti,tj]:=i;
                                 bi[ti,i]:=false;
                                 bj[tj,i]:=false;
                                 b[temp,i]:=false;
                                 if tj=9 then try(ti+1,1)
                                         else try(ti,tj+1);
                                 a[ti,tj]:=0;
                                 bi[ti,i]:=true;
                                 bj[tj,i]:=true;
                                 b[temp,i]:=true;
                                 end;
                              end;
end;
begin
assign(input,'puzzle.in');
assign(output,'puzzle.out');
reset(input);
rewrite(output);
fillchar(bi,sizeof(bi),true);
fillchar(bj,sizeof(bj),true);
fillchar(b,sizeof(b),true);
for i:=1 to 9 do
    for j:=1 to 9 do
        begin
        read(a[i,j]);
        if a[i,j]<>0 then
           begin
           bi[i,a[i,j]]:=false;
           bj[j,a[i,j]]:=false;
           temp:=find(i,j);
           b[temp,a[i,j]]:=false;
           end;
        end;
try(1,1);
end.