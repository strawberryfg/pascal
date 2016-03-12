var i,n,d,a,nh,nj,c,j:longint;
    s,s1,s2:string;

function pd(ss:string):boolean;
var l,ii,nnh,nnj:longint;
begin
  l:=length(ss);
  nnh:=0;
  nnj:=0;
  for ii:=1 to l do
    if ss[ii]='H' then inc(nnh) else inc(nnj);
  if abs(nnh-nnj)>d then pd:=false else pd:=true;
  if (nnh=0)or(nnj=0) then pd:=true;
end;

begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
  readln(n,d);
  readln(s);
  randomize;
  for i:=1 to n do
    if s[i]='H' then inc(nh);
  nj:=n-nh;
         if (abs(nj-nh)<=d)or(nj=0)or(nh=0) then writeln(1)
           else 
           begin
             c:=0;
             while pd(s)=false do
               begin
                 for i:=1 to n do
                   begin
                     s1:=copy(s,n-i+1,i);
                     s2:=copy(s,1,n-i);
                     if pd(s2)=true then begin inc(c); s:=s1; break; end;
                   end;
               end;
             writeln(c+1);
           end;
close(input);
close(output);
end.
