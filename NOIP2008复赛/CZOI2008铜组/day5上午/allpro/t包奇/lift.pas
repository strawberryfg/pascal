program lift;
var a:array[1..10000] of integer;
    de,l,temp,i,n,b:integer;
function djj(de:integer):integer;
var li:integer;
begin
  while temp<>b do
  begin
  if l=1 then begin
                inc(de);
                li:=temp+a[temp];
                if li>n then begin dec(de);l:=2;end
                        else temp:=li;
              end;
  if l=2 then begin
                inc(de);
                li:=temp-a[temp];
                if li<1 then begin dec(de);l:=1;end
                        else temp:=li;
              end;
  end;
  djj:=de;
end;
begin
  readln(n,temp,b);
  for i:=1 to n do
      read(a[i]);
  de:=0;
  writeln(djj(de));
end.