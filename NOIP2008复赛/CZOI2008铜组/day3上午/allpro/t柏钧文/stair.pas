var  n,k,i,sum1:longint;
     a,b:array[1..30]of longint;

function pd1(m:longint):boolean;
  var i,sum2:longint;
  begin
  sum2:=0;
  for i:=1 to m do
      sum2:=sum2+b[i];
  pd1:=true;
  for i:=1 to k do
        if sum2=a[i] then begin pd1:=false;exit;end;
  if sum2>n then pd1:=false;
  end;


function pd(m:longint):longint;
  var i,sum2:longint;
  begin
  sum2:=0;
  for i:=1 to m do
      sum2:=sum2+b[i];
  pd:=sum2;
  end;

procedure try(dep:longint);
  var i,j:longint;
  begin
  if pd(dep-1)=n then inc(sum1)
           else
                for i:=1 to 3 do
                    begin
                    b[dep]:=i;
                    if pd1(dep) then try(dep+1);
                    end;
  end;

begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(k);
sum1:=0;
for i:=1 to k do
    readln(a[i]);
try(1);
writeln(sum1);
close(input);
close(output);
end.