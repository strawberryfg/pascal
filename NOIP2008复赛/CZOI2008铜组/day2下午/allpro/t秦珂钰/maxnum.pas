program maxnum(input,output);
type tlist=array[1..1000] of integer;
var a:tlist;
    i,r,total,j:integer;

procedure qsort(var a:tlist);
  procedure sort(l,r: longint);
      var i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;

    begin
       sort(1,total);
    end;

function gcd(m,n:integer):integer;
var r:integer;
begin
  r:=m mod n;
  while (r<>0) do
  begin
    m:=n;
    n:=r;
    r:=m mod n;
  end;
  gcd:=n;
end;

begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  i:=0;
  while not eof do
  begin
    i:=i+1;
    readln(a[i]);
  end;
  total:=i;
  qsort(a);
  for j:=1 to i do if a[i]=1 then r:=1
                             else begin
                                    r:=gcd(a[1],a[2]);
                                    for j:=3 to i do
                                      if gcd(r,a[j])=1 then r:=1
                                                       else r:=gcd(r,a[j]);
                                   end;
  writeln(r);
  close(input);
  close(output);
end.