const prime:array[1..11]of integer=(2,3,5,7,11,13,17,19,23,29,31);
var a,b:array[1..17]of integer;
    n:longint;
    pd:boolean;
function cf(n,k:longint):boolean;
var i:longint;
begin
cf:=true;
for i:=1 to n-1 do if a[i]=k then begin cf:=false;break;end;
end;
procedure print;
var i,j,t:longint;
begin
t:=a[n]+a[1];
for i:=1 to 11 do
    if t=prime[i] then begin
                       if pd=true then writeln;
                       if pd=false then pd:=true;
                        for j:=1 to n do
                            begin
                            if j<n then write(a[j],' ')
                               else begin write(a[j]);exit; end;
                            end;
                       end;
end;
procedure try(dep:longint);
var pd:boolean;
    t,j:longint;
begin
if dep>n then print
         else begin
              pd:=false;
              while pd=false do
                    begin
                    inc(b[dep]);
                    if b[dep]>11 then begin pd:=true;continue; end;
                    t:=prime[b[dep]]-a[dep-1];
                    if (t>0) and (t<=n) and (cf(dep,t)=true) then
                       begin
                       a[dep]:=t; try(dep+1);
                       for j:=dep+1 to n do b[j]:=0;
                       end
                       else if t>n then b[dep]:=12;
                    pd:=false;
                    end;
              end;
end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
readln(n);
a[1]:=1;
try(2);
close(input);
close(output);
end.