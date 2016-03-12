var a:array[1..100000]of longint;
    i,j,k,n,m,ans,flag,l,r,w:longint;

procedure doit(flag,l,r,w:longint);
 var i,j:longint;
  begin
   if flag=2 then
    for i:=l to r do inc(a[i],w);
   if flag=3 then
    for i:=l to r do if w>a[i] then a[i]:=w;
   if flag=1 then begin
    for i:=l to r do if a[i]<=0 then exit;
    for i:=l to r do dec(a[i],w);
    inc(ans);
    end;
  end;

begin
 assign(input,'highway.in');
 assign(output,'highway.out');
 reset(input);
 rewrite(output);

 ans:=0;
 readln(n,m,k);
 for i:=1 to n do a[i]:=k;
 for i:=1 to m do
  begin
   readln(flag,l,r,w);
   doit(flag,l,r,w);
  end;
 writeln(ans);
 close(input);
 close(output);
end.
