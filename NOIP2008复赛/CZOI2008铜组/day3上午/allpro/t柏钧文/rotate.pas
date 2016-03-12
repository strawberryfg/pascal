var  i,tm,n,j,ttn,m,tn,k:longint;
     a:array[0..21,0..21]of integer;

procedure print;
  var p,q:longint;
  begin
  for p:=1 to tn do
      begin
      for q:=1 to tn do
          write(a[p,q]:4);
      writeln;
      end;
  end;


procedure try(dep:longint);
  begin
  if dep=tm then begin a[i,j]:=dep;exit;end
             else begin
                  a[i,j]:=dep;
                  {if (a[i,j+1]=0)and(i<=(n+1)div 2)and() then inc(j)
                                else if (a[i+1,j]=0)and(j>(n+1)div 2) then inc(i)
                                                   else if (a[i,j-1]=0)and(i>(n+1)div 2) then dec(j)
                                                                      else if (a[i-1,j]=0)and(j<=(n+1)div 2) then dec(i);}
                  if (a[i,j+1]=0)and(i=k) then inc(j)
                                  else if (a[i+1,j]=0)and(j=n) then inc(i)
                                                     else if (a[i,j-1]=0)and(i=n) then dec(j)
                                                                                  else if (a[i-1,j]=0)and(j=k) then dec(i);
                  try(dep+1);
                  end;
  end;

begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
for i:=0 to n+1 do
    for j:=0 to n+1 do
        a[i,j]:=1;
for i:=1 to n do
    for j:=1 to n do
        a[i,j]:=0;
i:=1;j:=1;m:=1;tn:=n;ttn:=n;
tm:=(n-1)*4;
for k:=1 to (n+1)div 2 do
    begin
    try(m);
    m:=a[i,j]+1;
    ttn:=ttn-2;
    n:=n-1;
    tm:=(ttn-1)*4+tm;
    inc(j);
    end;
print;
close(input);
close(output);
end.
