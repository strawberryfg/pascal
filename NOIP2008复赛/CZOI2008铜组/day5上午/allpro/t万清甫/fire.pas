var i,j,n,sum:longint;
    a:array[1..10,1..10]of char;
    p:array[1..10,1..10]of integer;
function chkl(i,j:longint):boolean;
var m:longint;
begin
chkl:=true;
for m:=j-1 downto 1 do
    begin
    if a[i,m]='X' then break;
    if p[i,m]=1 then begin chkl:=false;break; end;
    end;
end;
function chkj(i,j:longint):boolean;
var m:longint;
begin
chkj:=true;
for m:=i-1 downto 1 do
    begin
    if p[m,j]=1 then begin chkj:=false;break; end
       else if a[m,j]='X' then break;
    end;
end;
{procedure print;
begin
for i:=1 to n do
    for j:=1 to n do
        if p[i,j]=1 then writeln('i:',i,' ','j:',j);
end;}
procedure try(dep:longint);
var k:longint;
begin
if dep>n then begin {print;}writeln(sum);close(input);close(output);halt; end;
k:=1;
while k<=n do
      begin
      if a[k,dep]<>'X' then
         begin
              if (chkj(k,dep)=true)and(chkl(k,dep)=true) then
                 begin
                 p[k,dep]:=1;
                 inc(sum);
                 end;
              end;
      inc(k);
      end;
try(dep+1);
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
        read(a[i,j]);
    readln;
    end;
try(1);
close(input);
close(output);
end.
