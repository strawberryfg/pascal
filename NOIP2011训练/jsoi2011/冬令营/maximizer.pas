type tree=^node;
     node=record
      left,right:tree;
      a,b,max:longint;
     end;
var t:tree;
    n,a,b,m,i,k,ans:longint;
procedure build(var t:tree;l,r:longint);
 begin
  new(t);
  t^.max:=-maxlongint;
  t^.left:=nil;
  t^.right:=nil;
  t^.a:=l;
  t^.b:=r;
  if l<>r then
   begin
    build(t^.left,l,(l+r) div 2);
    build(t^.right,(l+r) div 2+1,r);
   end;
 end;
procedure insert(var t:tree;i,x:longint);
 begin
  if x>t^.max then t^.max:=x;
  if t^.a<>t^.b then
   begin
    if i<=t^.left^.b then insert(t^.left,i,x);
    if i>=t^.right^.a then insert(t^.right,i,x);
   end;
 end;
function findmax(t:tree;l,r:longint):longint;
 var x1,x2:longint;
 begin
  if (t^.a>=l) and (t^.b<=r) then exit(t^.max);
  x1:=-maxlongint;x2:=-maxlongint;
  if t^.left^.b>=l then x1:=findmax(t^.left,l,r);
  if t^.right^.a<=r then x2:=findmax(t^.right,l,r);
  if x1>x2 then exit(x1) else exit(x2);
 end;
begin
 assign(input,'maximizer.in');
 assign(output,'maximizer.out');
 reset(input);
 rewrite(output);
 readln(n,m);
 t:=nil;
 build(t,1,n);
 for i:=1 to m do
  begin
   readln(a,b);
   insert(t,a,b);
  end;
 k:=1;ans:=0;
 while k<>n do
  begin
   ans:=ans+1;
   k:=findmax(t,1,k);
  end;
 writeln(ans);
 close(input);close(output);
end.