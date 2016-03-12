var i,j,l,k,m,n,x,y:longint;
    f:array[-1..301,-1..301] of longint;
    a,b:array[-1..301] of longint;
begin
assign(input,'psolve.in');reset(input);
assign(output,'psolve.out'); rewrite(output);
 readln(m,n);
 for i:=1 to n do
    begin
       readln(x,y);
       a[i]:=a[i-1]+x;
       b[i]:=b[i-1]+y;
    end;
 k:=1;
 filldword(f,sizeof(f) div 4,100000);
 f[1,0]:=0;
 repeat
   inc(k);
   f[k,0]:=0;
   for i:=0 to n do
     for j:=i downto 0 do
        begin
        {if a[i]-a[j]<0 then x:=0 else }x:=a[i]-a[j];
          if f[k-1,j]+x<=m then
            begin
              {if b[i]-b[j]<0 then y:=0 else }y:=b[i]-b[j];
              f[k,i]:=y;
              break;
            end;
        end;
 until f[k,n]=0;
write(k);
close(input);
close(output);
end.

