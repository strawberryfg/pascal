var l,s:boolean;
    n1,n2,j1,j2:longint;
    i,total:longint;
function ok(i,j:longint):boolean;
var t,k:longint;
    a:array[1..100000] of integer;
begin
   fillchar(a,sizeof(a),0);
   ok:=true;
   t:=1;
   while i<>0 do
   begin
   a[t]:=i mod j;
   i:=i div j;
   inc(t);
   end;
   for k:=t-1 downto 1 do if a[k]<>a[t-k] then begin ok:=false; exit; end;
end;

begin
  assign(input,'base.in');
  reset(input);
  assign(output,'base.out');
  rewrite(output);
  read(n1,n2,j1,j2);
  n1:=trunc(sqrt(n1));
  n2:=trunc(sqrt(n2));
  total:=0;
  for i:=n1 to n2 do
    begin
    l:=ok(sqr(i),j1);
    s:=ok(sqr(i),j2);
    if l and not s or s and not l then inc(total);
    end;
    writeln(total);
    close(input);
    close(output);
end.
