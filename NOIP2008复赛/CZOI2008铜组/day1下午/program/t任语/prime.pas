program ex;
const max=20;
var a:array[0..max] of integer;
    n,m:integer;
function prime(x:integer):boolean;
var k:integer;
begin
    prime:=true;
    for k:=2 to trunc(sqrt(x)) do
        if x mod k=0 then begin prime:=false;exit;end;
end;
function judge1(x,i:integer):boolean;
var k:integer;
begin
    judge1:=true;
    for k:=1 to i-1 do
        if a[k]=x then begin judge1:=false;exit;end;
end;
function judge2(x,i:integer):boolean;
begin
    if i=1 then judge2:=true
           else if i<n then judge2:=prime(x+a[1])
                       else judge2:=prime(x+a[1]) and prime(x+a[i]);
end;
procedure print;
var k:integer;
begin
    

    for k:=1 to n do write(a[k]:3);
    writeln;
end;
procedure try(i:integer);
var j:integer;
begin
    for j:=1 to n do
        begin
            if judge1(j,i) and judge2(j,i) then
               begin
                   a[i]:=j;
                   if i=n then print
                          else try(i+1);
                   a[i]:=0;
               end;
        end;
end;
begin
    assign(input,'prime.in');
    reset(input);
    assign(output,'prime.out');
    rewrite(output);
    readln(n);
    for m:=1 to n do a[m]:=0;
    try(1);
    close(input);
    close(output);
end.
