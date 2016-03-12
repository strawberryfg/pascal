var i,j,m,n,len,k,min,minnum,x,y,t,p,q,l,r:longint;
    st,en,f,num,a:array[1..100000]of longint;
begin
assign(input,'min.in');
reset(input);
assign(output,'min.out');
rewrite(output);
readln(n,m);
for i:=1 to n do read(a[i]);
k:=trunc(sqrt(n));
len:=n div k;
for i:=1 to len do
    begin
    st[i]:=k*(i-1)+1; en[i]:=k*i;
    min:=maxlongint;
    for j:=k*(i-1)+1 to i*k do if a[j]<min then begin min:=a[j];minnum:=j; end;
    f[i]:=min; num[i]:=minnum;
    end;
if n mod k<>0 then
   begin
   inc(len);
   st[len]:=k*(len-1)+1; en[len]:=k*len;
   min:=maxlongint;
   //spe:=k*(len-1)+1;
   for i:=k*(len-1)+1 to len*k do if a[i]<min then begin min:=a[i];minnum:=i; end;
   f[len]:=min; num[len]:=minnum;
   end;
for i:=1 to m do
    begin
    read(t);
    if t=1 then
       begin
       read(x,y);
       p:=x div k;
       q:=x mod k;
       if q<>0 then inc(p);

          if (x<>num[p])and(y>f[p]) then a[x]:=y
             else if (x=num[p])and(y>=f[p]) then
                      begin
                      a[x]:=y;
                      min:=maxlongint;
                      for j:=st[p] to en[p] do
                          begin
                          if a[j]<min then begin min:=a[j];minnum:=j; end;
                          end;
                      f[p]:=min; num[p]:=minnum;
                      end
                  else if (y<f[p]) then
                          begin
                          a[x]:=y;
                          f[p]:=y;
                          num[p]:=x;
                          end
                       else a[x]:=y;

       end
    else
       begin
       read(l,r);
       p:=l div k; q:=r div k;
       min:=maxlongint;
       if l mod k<>0 then inc(p);
       if r mod k<>0 then inc(q);
       for j:=p+1 to q-1 do if f[j]<min then min:=f[j];
       if p<>q then
          begin
          for j:=l to p*k do if a[j]<min then min:=a[j];
          for j:=(q-1)*k+1 to r do if a[j]<min then min:=a[j];
          end
       else for j:=l to r do if a[j]<min then min:=a[j];
       writeln('MIN(',l,',',r,')=',min);
       end;
    end;
close(input);
close(output);
end.
