var n,i,j,sum:longint;
    a:array[1..15,1..15]of char;
    b:array[1..15,1..15]of boolean;
    x,ne,nw,s,next,pre:array[0..30]of longint;
procedure try(dep:longint);
var i:longint;
begin
if dep>n then inc(sum)
         else begin
              i:=0;
              i:=next[i];
              while i<=n do
              begin
              if (x[i]=0)and(ne[i+dep]=0)and(nw[dep-i+n]=0)and(b[dep,i]=true) then
                 begin
                 x[i]:=1; ne[i+dep]:=1; nw[dep-i+n]:=1;
                 next[pre[i]]:=next[i]; pre[next[i]]:=pre[i];
                 s[dep]:=i;
                 try(dep+1);
                 x[i]:=0; ne[i+dep]:=0; nw[dep-i+n]:=0;
                 next[pre[i]]:=i; pre[next[i]]:=i;
                 end;
              i:=next[i];
              end;
              end;
end;
begin
assign(input,'queens.in');
reset(input);
assign(output,'queens.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(a[i,j]);
        if a[i,j]='.' then b[i,j]:=false else b[i,j]:=true;
        end;
    readln
    end;
for i:=1 to n do
    begin
    pre[i]:=i-1;
    next[i]:=i+1;
    end;
pre[n+1]:=n;
next[0]:=1;
try(1);
writeln(sum);
 close(input);
close(output);
end.
