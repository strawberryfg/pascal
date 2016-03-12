var h:array[1..100000,1..2] of longint;
    d:array[0..100000] of longint;
    ti:int64;
    n,k,i:longint;
function comp(l1,l2,l3,l4:longint):boolean;
         var i1,i2,i3,i4:int64;
         begin
         i1:=l1;
         i2:=d[l2];
         i3:=l3;
         i4:=d[l4];
         if i1*i2<i3*i4
            then comp:=true
            else comp:=false;
         end;
procedure heap(ti:longint);
          var x:array[1..2] of longint;
              i,j:longint;
          begin
          x:=h[ti];
          i:=ti;
          j:=ti*2;
          while j<=n do
                begin
                if (j<n) and comp(h[j+1,1],h[j+1,2],h[j,1],h[j,2])
                   then inc(j);
                if comp(h[j,1],h[j,2],x[1],x[2])
                   then begin
                        h[i]:=h[j];
                        i:=j;
                        j:=j*2;
                        end
                   else j:=n+1;
                end;
          h[i]:=x;
          end;
begin
assign(input,'panda.in');
reset(input);
readln(n,k);
d[0]:=1;
for i:=1 to n do
    begin
    read(h[i,1]);
    h[i,2]:=0;
    end;
close(input);
for i:=n div 2 downto 1 do
    heap(i);
for i:=1 to k do
    d[i]:=maxlongint;
for i:=1 to k do
    begin
    d[i]:=h[1,1]*d[h[1,2]];
    ti:=d[i];
    while d[i]=ti do
          begin
          inc(h[1,2]);
          heap(1);
          ti:=h[1,1];
          ti:=ti*d[h[1,2]];
          end;
    end;
assign(output,'panda.out');
rewrite(output);
writeln(d[k]);
close(output);
end.
