var a:string;
    x,s,l:integer;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);

  readln(a);
  a:=length(a);
  if a[1]=' ' then delete(a,1,1)
              else if a[x]=' ' then delete(a,x,1);
  for i:=1 to x-1 do
      for l:=s+1 to x do
        begin
        case a[s] of
                  'A','E','I','O','U':delete(a,i,1);
        end;
    if (a[s]=a[l]) and (a[s]>' ') and (a[s]<' ')then delete(a,l,1);
        end;
        x:=length(a);
for s:=1 to length(a) do
    while (s[s]=' ') and (a[s+1]=' ') do delete(a,s,1);
for i:=1 to length(a) do
    if a[s]=a[s+1] then  delete(a,s+1,1);
writeln(a);

close(input);
close(output);
end.