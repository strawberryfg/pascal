type arr=array[-1..100]of longint;
var spe,fmax,res1,res2,sum,final:arr;
    f,d:array[1..100,0..100]of arr;
    two:array[0..100]of arr;
    i,j,k,l,t,n,m,tt:longint;
function gjd(x,y:arr):arr;
var final:arr;
    i,num:longint;
begin
if x[-1]>y[-1] then num:=x[-1] else num:=y[-1];
fillchar(final,sizeof(final),0);
for i:=0 to num do
    begin
    final[i]:=final[i]+x[i]+y[i];
    final[i+1]:=final[i+1]+final[i] div 10;
    final[i]:=final[i] mod 10;
    end;
if final[num+1]<>0 then inc(num);
final[-1]:=num;
exit(final);
end;
function mul(x,y:arr):arr;
var i,j,num,k:longint;
begin
num:=x[-1]+y[-1];
fillchar(final,sizeof(final),0);
for i:=0 to x[-1] do
  begin
  for j:=0 to y[-1] do
     begin
     final[i+j]:=final[i+j]+x[i]*y[j];
     k:=i+j;
     while final[k]>=10 do
       begin
       if k>num then num:=k;
       final[k+1]:=final[k+1]+final[k] div 10;
       final[k]:=final[k] mod 10;
       inc(k);
       end;
     end;
  end;
while final[k]>=10 do
  begin
  inc(k);
  if k>num then num:=k;
  final[k+1]:=final[k+1]+final[k] div 10;
  final[k]:=final[k] mod 10;
  end;
if (final[k]<>0)and(k>num) then  num:=k;
final[-1]:=num;
exit(final);
end;
function max(x,y:arr):arr;
var i:longint;
begin
if x[-1]>y[-1] then exit(x);
if x[-1]<y[-1] then exit(y);
for i:=x[-1] downto 0 do
    begin
    if x[i]>y[i] then exit(x);
    if x[i]<y[i] then exit(y);
    end;
exit(x);
end;
procedure print;
var i,t:longint;
begin
write(sum[sum[-1]]);
for i:=sum[-1]-1 downto 0 do
   begin
   t:=sum[i];
   write(t);
   end;
writeln;
end;
begin
assign(input,'game.in');
reset(input);
assign(output,'game.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        read(tt);

        d[i,j,-1]:=0; d[i,j,0]:=tt;
        l:=0;
        while d[i,j,l]>=10 do
          begin
          d[i,j,l+1]:=d[i,j,l+1]+d[i,j,l] div 10;
          d[i,j,l]:=d[i,j,l] mod 10;
          inc(l);
          if l>d[i,j,-1] then d[i,j,-1]:=l;
          end;
        if d[i,j,l]<>0 then d[i,j,-1]:=l;
        end;
    readln;
    end;
two[0,0]:=1; spe[0]:=2;
for i:=1 to m do two[i]:=mul(two[i-1],spe);
for i:=1 to n do
   begin
   fillchar(f,sizeof(f),0);
   for l:=0 to fmax[-1] do fmax[l]:=0;
   fmax[-1]:=0;
   for j:=1 to m do
      begin
      for k:=j-1 to m do
          begin
          t:=m-k+j;
          if t<=m then
             res1:=gjd(f[j,k-1],mul(d[i,t],two[k]))
          else
            begin
            for l:=0 to res1[-1] do res1[l]:=0;
            res1[-1]:=0;

            end;
          if j-1>=1 then
             res2:=gjd(f[j-1,k-1],mul(d[i,j-1],two[k]))
          else
            begin
            for l:=0 to res2[-1] do res2[l]:=0;
            res2[-1]:=0;
            end;
          f[j,k]:=max(res1,res2);
          end;
      fmax:=max(f[j,m],fmax);
      end;
   sum:=gjd(sum,fmax);
   end;
print;
close(input);
close(output);
end.
