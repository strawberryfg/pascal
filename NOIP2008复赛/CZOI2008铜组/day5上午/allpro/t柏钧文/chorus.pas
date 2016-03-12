type arr=array[0..110]of longint;
var a,b,c:arr;
    n,total,i:longint;

function pd(c:arr;j:longint):boolean;
  var i,k:longint;
  begin
  pd:=true;
  for i:=1 to j do
      begin
      for k:=1 to i do
        if c[k]<=c[k-1] then begin pd:=false;exit;end;
      for k:=i to n do
        if c[k]>=c[k-1] then begin pd:=false;exit;end;
      end;
  end;

procedure print;
  var i,j:longint;
  begin
  j:=0;
  for i:=1 to n do
        if b[i]=1 then begin inc(j);c[j]:=a[i];end;
  if pd(c,j) then if (n-j)<total then total:=n-j;
  end;

procedure try(dep:longint);
  var i:longint;
  begin
  if dep>n then print
           else for i:=0 to 1 do
                    begin
                    b[dep]:=i;
                    try(dep+1)
                    end;
  end;

begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
total:=maxlongint;
for i:=1 to n do
    read(a[i]);
try(1);
writeln(total div 2);
close(input);
close(output);
end.