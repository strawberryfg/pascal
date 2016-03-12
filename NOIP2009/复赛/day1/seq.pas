var pd:boolean;
    i,tt,sum,a,b,c,max,z,t:longint;
    hash,k:array[0..1000000]of longint;
    x:array[1..1000]of longint;
procedure check;
var j:longint;
begin
for j:=1 to sum-1 do
    if x[j]=x[sum] then begin tt:=i+1;pd:=false;break; end;
end;
begin
assign(input,'seq.in');
reset(input);
assign(output,'seq.out');
rewrite(output);
readln(a,b,c);
k[0]:=1;
i:=0;
max:=1000000;
hash[0]:=0;
z:=-1;
while true do
   begin
   if i>max then
      begin
      inc(sum);
      if sum=1 then x[sum]:=((a*k[max])mod c+k[max] mod b mod c)mod c
         else x[sum]:=((a*x[sum-1])mod c+x[sum-1]mod b mod c)mod c;
      if ((x[sum]<=max)and(hash[x[sum]]<>0))or(x[sum]=k[0]) then begin z:=i+1;break; end;
      if (x[sum]<=max)and(hash[x[sum]]=0) then hash[x[sum]]:=i+1;
      if x[sum]>max then begin pd:=true;check;
                              if pd=false then
                                 begin
                                 if tt>2000000 then writeln(-1)
                                    else writeln(tt);
                                 break;
                                 end;
                         end;
      end
   else
      begin
      t:=((a*k[i])mod c+k[i]mod b mod c)mod c;
      if t>max then
         begin
         inc(sum);
         x[sum]:=t;
         pd:=true;
         check;
         if pd=false then begin if tt>2000000 then
                                   writeln(-1)
                                else writeln(tt);break;
                          end;
         end
      else
         begin
         k[i+1]:=t;
         if t=k[0] then begin z:=i+1;break; end;
         if hash[t]=0 then hash[t]:=i+1 else begin z:=i+1;break; end;
         end;
      end;
   inc(i);
   end;
if z<>-1 then if z>2000000 then writeln(-1) else writeln(z);
close(input);
close(output);
end.