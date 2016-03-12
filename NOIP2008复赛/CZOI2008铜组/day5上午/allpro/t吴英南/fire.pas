var i,j,max,sum,n:longint;
    a:array[1..11,1..11]of longint;
    c:char;
function check(c,d:longint):boolean;
  var i,j:longint;
  begin
  if a[c,d]<>0 then begin check:=false;exit end;
  i:=c-1;
  j:=d-1;
  while i<>0 do
    if a[i,d]=1 then break
                else if a[i,d]=0 then dec(i)
                                 else begin check:=false;exit;end;
  while j<>0 do
    if a[c,j]=1 then break
                else if a[c,j]=0 then dec(j)
                                 else begin check:=false;exit;end;
  i:=c+1;
  j:=d+1;
  while i<=n do
    if a[i,d]=1 then break
                else if a[i,d]=0 then inc(i)
                                 else begin check:=false;exit;end;
  while j<=n do
    if a[j,d]=1 then break
                else if a[j,d]=0 then inc(j)
                                 else begin check:=false;exit;end;
  check:=true;
  end;
procedure print;
  var i,j:longint;
  begin
  sum:=0;
  for i:=1 to n do
      for j:=1 to n do
          if a[i,j]=2 then sum:=sum+1;
  if sum>max then max:=sum;
  end;
procedure fire(i,j:longint);
  var k,l:longint;
  begin
  if (i=n)and(j=n) then print
                   else begin
                        if check(i,j) then begin a[i,j]:=2;
                                           if i+1<=n then fire(i+1,j)
                                                     else fire(1,j+1);
                                           end;
                        if a[i,j]=2 then a[i,j]:=0;
                        if i+1<=n then fire(i+1,j)
                                  else fire(1,j+1);
                        end;
  end;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(c);
        if c='X' then a[i,j]:=1;
        end;
    readln;
    end;
fire(1,1);
writeln(max);
close(input);
close(output);
end.
