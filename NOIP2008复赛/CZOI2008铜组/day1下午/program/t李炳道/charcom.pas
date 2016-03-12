const max=18;
var a:array[0..max] of integer;
    n,m,t:longint;

function prime(x:integer):boolean;
 var k:longint;
 begin
 prime:=true;
 for k:=2 to trunc(sqrt(x))do
 if x mod k=0 then begin prime:=false;eixt;end;
 end;

function la(x,i:longint):boolean;
var k:longint;
begin
la:=true;
for k:=1 to i-1 do
if a[k]=x then begin la:=false;exit;end;
end;

function lb(x,i:integer):boolean;
begin
 if i=1 then lb:=true
         else if i<n then lb:=prime(x+a[i-1])
                     else lb:=prime(x+a[i-1])and prome(x+a[i]);
end;

procedure p;
var k:integer;
begin
 t:=t+1;
 for k:=1 to n do write(a[k]:3);
 writeln;
end;

procedure try(i:integer);
var j:integer;
begin
 for j:=1 to n do
  begin
   if la(j,i)and lb(j,i) then
    begin
     a[i]:=j;
     if i=n then print
            else try(i+1);
     a[i]:=0;
    end;
  end;
end;

begin
 assign(input,'charcom.in');
 reset(input);
 assign(output,'charcom.out');
 rewrite(output);

 readln(n);
 for m:=1 to n do a[m]:=0;
 try(1);
 if t<>0 then writeln(t);

 close(input);
 close(output);
end.