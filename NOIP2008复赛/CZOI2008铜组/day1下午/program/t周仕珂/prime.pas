var a,hash:array[1..10000] of longint;
         total,n:longint;
function qc:boolean;
var i:longint;
begin
fillchar(hash,sizeof(hash),0);
qc:=true;
for i:=1 to n do
        inc(hash[a[i]]);
for i:=1 to n do
        if hash[i]>1 then begin qc:=false;exit; end;

end;
function prime(n:longint):boolean;
var i:longint;
begin
prime:=true;
for i:=2 to trunc(sqrt(n)) do
        if n mod i=0 then begin prime:=false;exit; end;
end;
function pd:boolean;
var i:longint;
begin
pd:=true;
if prime(a[1]+a[n])=false then begin pd:=false;exit; end;
for i:=1 to n-1 do
        if prime(a[i]+a[i+1])=false then begin pd:=false;exit; end;
end;
procedure print;

var i:longint;
begin
if (pd)and(qc) then
        begin for i:=1 to n-1 do
                write(a[i],' ');
        writeln(a[n]); end;
end;
procedure try(dep:longint);
var i:longint;
begin
if dep>n then print
        else for i:=2 to n do
                begin
                a[dep]:=i;
                try(dep+1);
                end;
end;

begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
read(n);
total:=0;
a[1]:=1;
try(2);
close(input);
close(output);
end.
