var d:array[1..10000] of longint;
    s:int64;
    n,k,c,i:longint;
procedure qsort(l,r:longint);
          var i,j,mid,tmp:longint;
          begin
          i:=l;
          j:=r;
          mid:=d[(l+r) div 2];
          repeat
          while d[i]<mid do
                inc(i);
          while mid<d[j] do
                dec(j);
          if i<=j
             then begin
                  tmp:=d[i];
                  d[i]:=d[j];
                  d[j]:=tmp;
                  inc(i);
                  dec(j);
                  end;
          until i>j;
          if l<j
             then qsort(l,j);
          if i<r
             then qsort(i,r);
          end;
begin
assign(input,'divide.in');
reset(input);
readln(n,k,c);
for i:=1 to n do
    read(d[i]);
close(input);
qsort(1,n);
i:=1;
s:=0;
while i+k<=n do
      begin
      s:=s+c+(d[i+k]-d[i])*(d[i+k]-d[i]);
      i:=i+k;
      end;
if i+k<n
   then s:=s+c+(d[n]-d[i])*(d[n]-d[i]);
assign(output,'divide.out');
rewrite(output);
writeln(s);
close(output);
end.
