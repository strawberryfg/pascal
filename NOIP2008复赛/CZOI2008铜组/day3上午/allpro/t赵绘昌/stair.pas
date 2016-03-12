var a,b:array[0..3000] of longint;
    i,j,k,n,l:longint;
    xxx:set of 1..30;
    total:longint;
function pd(x:longint):boolean;
  var i:longint;
  begin
  pd:=true;
  for i:=1 to k do
      if x=b[i] then begin pd:=false;exit;end;
  end;
procedure print(x:longint);
  var i,s:longint;
  begin
  s:=0;
  for i:=0 to x do
      s:=s+a[i];
  if s=n then inc(total);
  end;
procedure try(dep:longint);
  var i,j:longint;
  begin
  if dep>=n then print(dep)
           else for i:=3 downto 1 do
                begin
                a[dep]:=i;
                if pd(dep+i) then try(dep+i);
                end;
  end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
read(n);
read(k);
if n=1 then begin writeln(1); close(input);close(output); halt;end;
for i:=1 to k do
    read(b[i]);
try(0);
writeln(total);
close(input);
close(output);
end.
