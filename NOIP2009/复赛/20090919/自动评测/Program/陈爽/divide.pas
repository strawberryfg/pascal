var f:array [0..10005] of int64;
    a:array [0..10005] of longint;
    i,j,k,n,c:longint;
    tmp:int64;

function min(a,b:int64):int64;
begin
   if a<b then exit(a)
          else exit(b);
end;

procedure qsort(l,r:longint);
var i,j,mid,temp:longint;
begin
   i:=l; j:=r; mid:=a[random(r-l+1)+l];
   repeat while a[i]<mid do inc(i);
          while a[j]>mid do dec(j);
          if not (i>j) then
          begin
             temp:=a[i]; a[i]:=a[j]; a[j]:=temp;
             inc(i); dec(j);
          end;
   until i>j;
   if i<r then qsort(i,r);
   if l<j then qsort(l,j);
end;

begin
   assign(input,'divide.in');
   assign(output,'divide.out');
   reset(input);
   rewrite(output);
   readln(n,k,c);
   for i:=1 to n do read(a[i]);
   qsort(1,n);
   f[0]:=0;
   for i:=1 to n do
   begin
     f[i]:=-1;
     for j:=i-k downto 0 do if f[j]>-1 then
     begin
       tmp:=f[j]+c+int64(a[i]-a[j+1])*(a[i]-a[j+1]);
       if f[i]=-1 then f[i]:=tmp
                  else f[i]:=min(f[i],tmp);
     end;
   end;
   writeln(f[n]);
   close(input);
   close(output);
end.
