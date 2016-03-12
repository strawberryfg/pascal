var a:array[1..17] of longint;
    i,j,k,n:longint;
function pan(x:longint):boolean;
  var i:longint;
  begin
  pan:=true;
  for i:=2 to trunc(sqrt(x)) do
        if x mod i=0 then begin pan:=false;exit;end;
  end;
function pd(x:longint):boolean;
  var i:longint;
  begin
  pd:=true;
  for i:=1 to x-1 do
      if a[i]=a[x] then begin pd:=false;exit; end;
  end;
procedure print;
  var i:longint;
  begin
  if pan(a[1]+a[n])  then begin
                             for i:=1 to n-1 do
                                 write(a[i],' ');
                             writeln(a[n]);
                             end;
  end;
procedure try(dep,x:longint);
  var i:longint;
  begin
  if dep>n then print
           else for i:=2 to n do
                    begin
                    a[dep]:=i;
                    if pd(dep)and(pan(a[dep]+a[dep-1]))
                        then try(dep+1,n);
                    end;
  end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
read(n);
if n mod 2=1 then begin
                  halt;
                  close(input);
                  close(output);
                  end;
a[1]:=1;
try(2,n);
close(input);
close(output);
end.
