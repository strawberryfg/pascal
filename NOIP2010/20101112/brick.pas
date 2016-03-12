var n,m,k,i,j,t,u,v,l,down,x,y,willbe,tk,nowdown,nowup,fmax:longint;
    a:array[0..100,0..100]of longint;
    f:array[0..21,0..21,0..21,0..410]of longint;
function calc(dep,st,en:longint):longint;
var sum,i:longint;
begin
sum:=0;
for i:=st to en do
    begin
    sum:=sum+a[dep,i];
    end;
exit(sum);
end;
function handle(st,en:longint):longint;
begin
if en<st then exit(m);
exit(m-(en-st+1));
end;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;
begin
assign(input,'brick.in');
reset(input);
assign(output,'brick.out');
rewrite(output);
readln(n,m,k);
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        read(a[i,j]);
        end;
    readln;
    end;
down:=min(k,m);
for i:=0 to down do
    begin
    for j:=1 to m+1-i do
        begin
        tk:=handle(j,j+i-1);
        f[1,j,j+i-1,tk]:=calc(1,j,j+i-1);
        end;
    end;
for i:=2 to n do
    begin
    for j:=0 to down do        //lastlen
        begin
        for v:=1 to m+1-j do   //laststart
            begin
            willbe:=v+j-1;
            if i=n then begin x:=1; y:=down; end
               else begin x:=0; y:=down; end;
            for l:=x to y do
                begin
                  for u:=1 to m+1-l do
                      begin
                      if (l=0)or(j=0)or(u+l-1>=v)and(u<=v+j-1) then
                      begin
                      tk:=handle(u,u+l-1);
                      for t:=0 to k-tk do
                          begin
                          if t>(i-1)*m then continue;
                          if (tk+t>i*m) then continue;
                          f[i,u,u+l-1,tk+t]:=max(f[i-1,v,v+j-1,t]+calc(i,u,u+l-1),f[i,u,u+l-1,tk+t]);
                          if (i=n)and(f[i,u,u+l-1,tk+t]>fmax)and(tk+t=k) then
                             fmax:=f[i,u,u+l-1,tk+t];
                          end;
                      end;
                      end;

                end;
            end;
        end;
    end;
writeln(fmax);
close(input);
close(output);
end.
