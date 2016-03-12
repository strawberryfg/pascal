var lift:array[1..10000]of longint;
    l:array[1..200]of longint;
    n,a,i,b,s,ss,sum:longint;
function pd(sum:longint):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to sum-1 do
    if lift[sum]=lift[i] then begin pd:=false;exit;end;
end;
procedure try(a,ss:longint);
begin
if pd(sum) then begin
                inc(sum);
                lift[sum]:=a;
                if a=b then begin if ss<s then s:=ss; end
                       else begin
                            if a+l[a]<=n then begin
                                              try(a+l[a],ss+1);
                                              lift[sum]:=0;
                                              dec(sum);
                                              end;
                            if a-l[a]>0 then begin
                                             try(a-l[a],ss+1);
                                             lift[sum]:=0;
                                             dec(sum);
                                             end;
                            end;
                end;
end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
sum:=0;
for i:=1 to n do
    read(l[i]);
s:=maxlongint-1;
try(a,0);
if s=maxlongint-1 then writeln('-1')
                  else writeln(s);
close(input);
close(output);
end.
