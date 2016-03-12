var n,i,total:longint;
        a,b,c,a1,b1:array[1..1000]of longint;

function pd(i,j:longint):boolean;
  begin
  pd:=true;
  if (a1[i]<=a1[j])and(a1[j]<=b1[i]) then pd:=false;
  if (a1[i]>=a1[j])and(a1[i]<=b1[j]) then pd:=false;
  if ((a1[i]<=a1[j])and(b1[i]>=b1[j]))or((a1[i]>=a1[j])and(b1[i]<=b1[j])) then
  pd:=false;
  end;

procedure print;
  var i,sum,d,j:longint;
  begin
  d:=0;
  sum:=0;
  for i:=1 to n do
        if c[i]=1 then begin inc(d);a1[d]:=a[i];b1[d]:=b[i];end;
  for i:=1 to d-1 do
        for j:=i+1 to d do
                if not pd(i,j) then exit;
  for i:=1 to d do
        sum:=sum+b1[i]-a1[i]+1;
  if sum>total then total:=sum;
  end;

procedure try(dep:longint);
  var i:longint;
  begin
  if dep>n then print
           else for i:=0 to 1 do
                    begin
                    c[dep]:=i;
                    try(dep+1);
                    end;
  end;

begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do
        readln(a[i],b[i]);
total:=0;
try(1);
writeln(total);
close(input);
close(output);
end.