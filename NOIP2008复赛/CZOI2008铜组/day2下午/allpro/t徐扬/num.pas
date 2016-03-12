var a:array[0..1001] of integer;
    n,i,s1,s2,s,mid:integer;
begin
  readln(n);
  for i:=1 to n do
      readln(a[i]);
  mid:=n div 2;
  s:=0;
  while (mid>=1) and (mid<=n) do
    begin
     s1:=0;s2:=0;
     for i:=1 to mid-1 do
         if a[i]>a[mid] then s1:=s1+1;
     for i:=mid+1 to n do
         if a[i]>a[mid] then s2:=s2+1;
     if s1=s2 then begin s:=s+1;mid:=mid+1; end
        else if s1>s2 then mid:=mid-1 else mid:=mid+1;
    end;
  writeln(s);
end.