var n,i,j,fmin,r,e,q,w:longint;
    a,b,f,a1,b1,c:array[0..60000]of int64;
function work(i,j:longint):real;
begin
if (b[j+1]-b[i+1]<>0) then
   work:=(f[i]-f[j])/(b[j+1]-b[i+1])
else work:=0;
end;
    procedure sort(l,r: longint);
      var
         i,j,mid1,mid2,y: longint;
      begin
         i:=l;
         j:=r;
         mid1:=a[(l+r) div 2];
         mid2:=b[(l+r)div 2];
         repeat
           while (a[i]<mid1)or((a[i]=mid1)and(b[i]>mid2)) do
            inc(i);
           while (mid1<a[j])or((mid1=a[j])and(b[j]<mid2)) do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                y:=b[i];
                b[i]:=b[j];
                b[j]:=y;
                y:=a1[i];
                a1[i]:=a1[j];
                a1[j]:=y;
                y:=b1[i];
                b1[i]:=b1[j];
                b1[j]:=y;
                inc(i);
                dec(j);
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
assign(input,'acquire.in');
reset(input);
assign(output,'acquire.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a[i],b[i]);
    a1[i]:=a[i];
    b1[i]:=b[i];
    end;
sort(1,n);
r:=0;  e:=n;
while (r=0) do
begin
  i:=1;
  r:=1;
  while (i<e) do
  begin
  if b1[i]<=b1[i+1] then
     begin
     a1[i]:=0; b1[i]:=0; r:=0;
     end
  else if a[i]=a[i+1] then
          begin
          a1[i+1]:=0; b1[i+1]:=0; r:=0; inc(i);
          end;
  inc(i);
  end;
  n:=0;
  fillchar(a,sizeof(a),0); fillchar(b,sizeof(b),0);
  for j:=1 to e do
      if (b1[j]<>0)and(a1[j]<>0) then
         begin
         inc(n);
         a[n]:=a1[j];
         b[n]:=b1[j];
         end;
  a1:=a;
  b1:=b;
  e:=n;
end;
q:=1;
w:=1;
c[1]:=0;
for i:=1 to e do
    begin
    while (q<w)and(work(c[q],c[q+1])<a[i]) do inc(q);
    f[i]:=trunc(f[c[q]]+a[i]*b[c[q]+1]);
    while (q<w)and(work(c[w-1],c[w])>work(c[w],i)) do dec(w);
    inc(w);
    c[w]:=i;
    end;
writeln(f[e]);
close(input);
close(output);
end.