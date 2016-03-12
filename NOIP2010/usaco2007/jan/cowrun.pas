var n,m,i,j,res:longint;
    can:array[0..10000,0..1000,1..2]of boolean;
    f:array[0..10000,0..1000,1..2]of longint;
    a:array[1..10000]of longint;
function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;
begin
assign(input,'cowrun.in');
reset(input);
assign(output,'cowrun.out');
rewrite(output);
readln(n,m);
for i:=1 to n do readln(a[i]);
can[1,0,1]:=true; can[1,0,2]:=true;
f[1,0,1]:=a[1];
for i:=2 to n-1 do
    begin
    for j:=0 to m do
        begin
        if j-1>=0 then
           begin
           if can[i-1,j-1,1]=true then
              begin
              can[i,j,1]:=true;
              f[i,j,1]:=max(f[i,j,1],f[i-1,j-1,1]+a[i]);
              can[i,j,2]:=true;
              f[i,j,2]:=max(f[i,j,2],f[i-1,j-1,1]);
              end;
           end;
        if j+1<=m then
           begin
           if can[i-1,j+1,2]=true then
              begin
              {if j=0 then
                 begin
                 can[i,j,1]:=true;
                 f[i,j,1]:=max(f[i,j,1],f[i-1,j+1,2]+a[i]);
                 end;}
              can[i,j,2]:=true;
              f[i,j,2]:=max(f[i,j,2],f[i-1,j+1,2]);
              end;
           if can[i-1,j,1]=true then
              begin
              can[i,j,2]:=true;
              f[i,j,2]:=max(f[i,j,2],f[i-1,j,1]);
              end;
           end;
        if j=0 then
           begin
           if can[i-1,j,2]=true then
              begin
              can[i,j,2]:=true;
              can[i,j,1]:=true;
//              f[i,j,1]:=f[i-1,j,2];
              f[i,j,1]:=max(f[i,j,1],f[i-1,j,2]+a[i]);
              f[i,j,2]:=max(f[i,j,2],f[i-1,j,2]);
              end;
           end;
        end;
    end;
if can[n-1,1,2]=true then
   res:=max(res,f[n-1,1,2]);
if can[n-1,0,2]=true then
   res:=max(res,f[n-1,0,2]);
writeln(res);
close(input);
close(output);
end.
