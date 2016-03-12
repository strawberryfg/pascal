var i,n,s:longint;
    a:array[1..1000]of longint;
procedure try(dep:longint);
var i,k:longint;
begin
k:=0;
if dep>n then writeln(s)
         else begin
              for i:=1 to dep-1 do
              if a[i]>a[dep] then inc(k);
              for i:=dep+1 to n do
                  begin
              if a[i]>a[dep] then dec(k);
              if k<0 then begin
                          try(dep+1);
                          exit;
                          end;
                  end;
              if k=0 then inc(s);
              try(dep+1);
              end;
end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
        readln(a[i]);
try(1);
close(input);
close(output);
end.