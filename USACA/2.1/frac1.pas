{
ID: xiaweiy1
PROG: frac1
LANG: PASCAL
}
const prime:array[1..37]of integer=(2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53
                                   ,59,61,67,71,73,79,83,89,97,101,103,107,
                                   109,113,127,131,137,139,149,151,157);
var sum,i,j,k,n,p,st:longint;
    a,b:array[1..10000]of longint;
    re:array[1..10000]of real;
    hash,v:array[1..160]of longint;
    x:array[1..25600,0..6]of longint;
procedure sort(l,r: longint);
      var
         i,j,y: longint;
         z,p:real;
      begin
         i:=l;
         j:=r;
         z:=re[(l+r) div 2];
         repeat
           while re[i]<z do
            inc(i);
           while z<re[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                y:=b[i];
                b[i]:=b[j];
                b[j]:=y;
                p:=re[i];
                re[i]:=re[j];
                re[j]:=p;
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
assign(input,'frac1.in');
reset(input);
assign(output,'frac1.out');
rewrite(output);
readln(n);
a[1]:=0;
b[1]:=1;
sum:=1;
for i:=1 to 37 do hash[prime[i]]:=1;
for i:=2 to n do
    begin
    p:=sum;
    if hash[i]=1 then
       begin
       for j:=1 to i-1 do
           begin
           inc(sum); a[sum]:=j; b[sum]:=i;
           if (i*j<=n)and(j>1) then if x[i*j,0]=0 then
                             begin
                             x[i*j,0]:=x[j,0]+1;
                             for k:=1 to x[j,0] do
                                x[i*j,k]:=x[j,k];
                                x[i*j,k+1]:=i;
                             end;
           end;
       if i*i<=n then begin inc(x[i*i,0]);x[i*i,1]:=i; end;
       x[i,0]:=1; x[i,1]:=i;
       end
       else
       begin
        for j:=1 to i-1 do v[j]:=1;
        for j:=1 to x[i,0] do
            begin
            st:=x[i,j];    k:=st;
            while st<=i-1 do
                  begin
                  v[st]:=0;
                  st:=st+k;
                  end;
            end;
        for j:=1 to i-1 do
            if v[j]=1 then
               begin
               inc(sum); a[sum]:=j; b[sum]:=i;
               if (i*j<=n)and(j>1) then
                  begin
                  x[i*j,0]:=x[i,0]+1;
                  for k:=1 to x[i,0] do x[i*j,k]:=x[i,k];
                  x[i*j,k+1]:=j;
                  end;
               end
               else
               begin
               if i*j<=n then
                  begin
                  x[i*j,0]:=x[i,0];
                  for k:=1 to x[i,0] do
                      x[i*j,k]:=x[i,k];
                  end;
               end;
       if i*i<=n then begin
                      x[i*i,0]:=x[i,0];
                      for k:=1 to x[i,0] do x[i*i,0]:=x[i,k];
                      end;
       end;
    if sum-p>=1 then begin for k:=p+1 to sum do re[k]:=a[k]/b[k]; end;
    end;
sort(2,sum);
for i:=1 to sum do
    writeln(a[i],'/',b[i]);
writeln('1/1');
close(input);
close(output);
end.
