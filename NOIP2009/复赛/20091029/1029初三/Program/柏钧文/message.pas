var m,n,i:longint;
    d,a,b,e:array[1..10000]of longint;
    c:array[1..1000,1..1000]of integer;

procedure print;
  begin
  if e[i]=1 then exit;
  if d[i]=1 then writeln('T')
                else writeln('F');
  e[i]:=1;
  end;

procedure try(nn,dep:longint);
  var j:longint;
  begin
  if dep>(2*n-1) then print
           else for j:=1 to n do
                if c[nn,j]=1 then
                        begin
                        d[j]:=1;
                        if d[i]=1 then begin print;exit;end;
                        try(j,dep+1);
                        if d[i]=1 then begin print;exit;end;
                        end;
  end;

begin
assign(input,'message.in');
reset(input);
assign(output,'message.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
        begin
        readln(a[i],b[i]);
        c[a[i],b[i]]:=1;
        end;
fillchar(e,sizeof(e),0);
for i:=1 to n do
    begin
    fillchar(d,sizeof(d),0);
    try(i,1);
    end;
close(input);
close(output);
end.