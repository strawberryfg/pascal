var i,n,ans,x,y:longint;

function min(a,b:longint):longint;
 begin
  if a>b then exit(b) else exit(a);
 end;

begin
 assign(input,'seq.in');
 assign(output,'seq.out');
 reset(input);
 rewrite(output);
 
 ans:=maxlongint;
 readln(n);
 readln(x);
 for i:=2 to n do
  begin
   readln(y);
   ans:=min(ans,abs(y-x)+1);
   x:=y;
  end;
 
 writeln(ans);
 close(input);
 close(output);
 end.