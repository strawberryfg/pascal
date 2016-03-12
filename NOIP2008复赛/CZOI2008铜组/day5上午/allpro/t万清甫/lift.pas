type arr=array[1..200]of longint;
var n,a,b,i:longint;
    go,k,t:arr;
function func(dep,e:longint):longint;
begin
if go[dep]=0 then go[dep]:=1
   else if go[dep]=1 then go[dep]:=2;
if dep=a then func:=0 else func:=1;
if dep=e then func:=1 else
case go[dep] of
     2:if dep-k[dep]>0 then func:=func+func(dep-k[dep],e)
          else begin writeln(-1);close(input);close(output);halt; end;
     1:begin
        if dep+k[dep]<=n then
           begin
           func:=func+func(dep+k[dep],e);
           if go[dep]=1 then begin writeln(-1);close(input);close(output);halt;end;
           end
        else
           if dep-k[dep]>0 then
              begin
              go[dep]:=2;func:=func+func(dep-k[dep],e);
              if go[dep]=2 then begin writeln(-1);close(input);close(output);halt;end;
              end
           else exit(0);
        end;
     end;
end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
for i:=1 to n do
    read(k[i]);
writeln(func(a,b));
close(input);
close(output);
end.
