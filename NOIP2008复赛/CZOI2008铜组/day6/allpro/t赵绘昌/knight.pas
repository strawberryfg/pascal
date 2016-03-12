const tt:array[1..8] of longint=(1,2,2,1,-1,-2,-2,-1);
      kk:array[1..8] of longint=(-2,-1,1,2,2,1,-1,-2);
      maxn=1000;
var i,j,k,l,n,m,start,endd:longint;
    ta,tb:array[1..maxn] of longint;
    dd:array[1..maxn,1..maxn] of longint;
    no:string;
procedure print;
  var i,k:longint;
  begin
  for i:=1 to n*m-1 do
      if ta[i]<>0 then write('(',ta[i],',',tb[i],')->');
  if ta[n*m]<>0 then write('(',ta[n*m],',',tb[n*m],')');
  halt;
  end;
procedure try(x,y,l:longint);
  var i,j,k,kx,ky:longint;
  begin
  kx:=0;
  ky:=0;
  if l>n*m then print
          else for i:=1 to 8 do
               begin
               kx:=x+tt[i];
               ky:=y+kk[i];
               if (kx>=1)and(kx<=n)and(ky>=1)and(ky<=m)and(dd[kx,ky]=0) then
                         begin
                         dd[kx,ky]:=1;
                         ta[l]:=kx; tb[l]:=ky;
                         try(kx,ky,l+1);
                         dd[ta[l],tb[l]]:=0;
                         ta[l]:=0;
                         tb[l]:=0;
                         kx:=0;
                         ky:=0;
                         end
                         else begin kx:=0; ky:=0; end;
               end;
  end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
no:='No Answer';
readln(n,m,start,endd);
dd[start,endd]:=1;
ta[1]:=start;
tb[1]:=endd;
try(start,endd,2);
writeln(no);
close(input);
close(output);
end.
