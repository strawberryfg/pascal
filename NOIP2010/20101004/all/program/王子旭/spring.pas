program sdaf;
var
s,s1,i,j,k,m,n,l,x,y,t:longint;
a:array[1..21,1..21] of longint;
u:array[0..21] of boolean;
c:array[0..21] of longint;
procedure search(p:longint);
var
i,j,m:longint;
begin
   if p=n+1 then
      if s<s1 then begin
         s1:=s;
             exit; end;
   if s>s1 then exit;
   for i:=1 to n do
     if u[i]=false then  begin
         c[p]:=i;u[i]:=true;break;
                        end;
   for i:=1 to n do
      if u[i]=false then begin
         c[p+1]:=i;u[i]:=true;
        inc(s,a[c[p],c[p+1]]);
            search(p+2);
        dec(s,a[c[p],c[p+1]]);
        u[i]:=false;     end;
     u[c[p]]:=false;
end;
begin
 assign(input,'spring.in');
 assign(output,'spring.out');
 reset(input);
 rewrite(output);
 readln(n);
 for i:=1 to n do
   for j:=1 to n do
       read(a[i,j]);
 randomize;
 for i:=1 to n  do
   c[i]:=i;
 s1:=maxlongint;
 for l:=1 to 33333 do
   begin
     for j:=1 to 10 do
        begin
         x:=random(n)+1;
         y:=random(n)+1;
         if x<>y then begin
           t:=c[x];c[x]:=c[y];c[y]:=t;
             end;
        end;
      s:=0;
     for i:=1 to n div 2 do
        begin
          t:=i*2-1;
          inc(s,a[c[t],c[t+1]]);
        end;
      if s<s1 then s1:=s;
  end;
   s:=0;
 s:=0;
 search(1);
   writeln(s1);
  close(input);
  close(output);
end.