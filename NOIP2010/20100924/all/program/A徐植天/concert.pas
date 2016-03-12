var
   n,i,ans:longint;
   a,b,p1,p2:array[1..1000] of longint;

procedure search(c,l,s:longint);
var
   i,f,k,t:longint;
begin
  if c>n
  then begin
         k:=1;
         t:=0;
         f:=0;
         for i:=1 to n do
           if p1[i]=0 then begin k:=k*a[i];f:=1; end;
         if f=1 then inc(t,k);
         k:=1;
         f:=0;
         for i:=1 to n do
           if p2[i]=0 then begin k:=k*b[i];f:=1; end;
         if f=1 then inc(t,k);
         if s-t>ans then ans:=s-t;
       end
  else begin
         for i:=l to n do
           begin
             p1[c]:=1;
             p2[i]:=1;
             search(c+1,i+1,s+a[c]*b[i]);
             p1[c]:=0;
             p2[i]:=0;
           end;
         search(c+1,l,s);
       end;
end;

begin
  assign(input,'concert.in');reset(input);
  assign(output,'concert.out');rewrite(output);
  readln(n);
  for i:=1 to n do readln(a[i]);
  for i:=1 to n do readln(b[i]);
  fillchar(p1,sizeof(p1),0);
  fillchar(p2,sizeof(p2),0);
  ans:=0;
  search(1,1,0);
  writeln(ans);
  close(input);close(output);
end.
