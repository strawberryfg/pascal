var n,a,b,i,j,t:integer;
    k:array[1..200] of integer;

procedure try(m,sum:integer);
begin
  if (m+k[m]<=n) and (m+k[m]>=1)
               then begin if m+k[m]=b then begin writeln(sum); t:=sum; halt; end
                                      else try(m+k[m],sum+1); end;
  if (m-k[m]>=1) and (m-k[m]<=n)
               then begin if m-k[m]=b then begin writeln(sum); t:=sum; halt; end
                                      else try(m-k[m],sum+1); end;
end;

begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  readln(n,a,b); t:=0;
  fillchar(k,sizeof(k),0);
  for i:=1 to n do read(k[i]);
  try(a,1);
  if t=0 then writeln('-1');
  close(input);
  close(output);
end.
