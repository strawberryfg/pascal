const maxn=1000;
var i:longint;
    a:array[1..maxn]of integer;
procedure print(n:longint);
begin
writeln(n);
close(input);
close(output);
end;
procedure try(m,n,dep,max,t:longint);
var r:longint;
begin
             r:=maxlongint;
             while r<>0 do
                   begin
                   r:=m mod n;
                   m:=n;
                   n:=r;
                   end;
             if (dep=max)or(m=1)then print(m) else
             begin if (t mod 2=0)or(dep+1=max) then
                   try(m,a[dep+1],dep+1,max,t+1)
                   else if t mod 2=1 then
                           try(m,a[dep+2],dep+2,max,t+1);
             end;
end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=0;
while not eof do
      begin
      inc(i);
      readln(a[i]);
      end;
try(a[1],a[2],1,i,1);
end.
