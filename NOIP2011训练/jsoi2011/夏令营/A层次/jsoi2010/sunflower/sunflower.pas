// 22:10; 22:59; finish writing; 23:09 testdata AC
type rec=array[1..2]of longint;
var n,r,c,x,y,tot,i,final:longint;
    a:array[1..150]of rec;
    sta:array[1..150]of longint;
    row,col:array[0..150,0..150]of longint;
    trow,tcol:array[0..15,0..1,0..16]of longint;
    hash:array[-150..150,-150..150]of longint;
procedure solve;
var i,j,k,cnt,ans,fmin,res:longint;
begin
for i:=0 to r do col[i,0]:=0;
for i:=0 to c do row[i,0]:=0;
for i:=1 to tot do
    begin
    if sta[i]=1 then
       begin
       //writeln('row ',i,' ');
       cnt:=row[a[i,1],0]+1;
       inc(row[a[i,1],0]);
       row[a[i,1],cnt]:=a[i,2]; //(hang li a[i,2])
       //writeln(a[i,2]);
       end
    else
       begin
       //writeln('col ',i,' ');
       cnt:=col[a[i,2],0]+1;
       inc(col[a[i,2],0]);
       col[a[i,2],cnt]:=a[i,1]; //(lie  li a[i,1])
       //writeln(a[i,1]);
       end;
    end;
ans:=0;
for i:=0 to c do
    begin
    fmin:=maxlongint;
    if row[i,0]<>0 then
       begin
       for j:=0 to row[i,0] do
           begin
           res:=0;
           for k:=1 to j do
               begin
               res:=res+row[i,k];
               end;
           for k:=j+1 to row[i,0] do
               begin
               res:=res+r-row[i,k];
               end;
           res:=res+trow[i,0,j]+trow[i,1,row[i,0]-j];
           if res<fmin then
           fmin:=res;
           end;
       ans:=ans+fmin;
       end;
    end;
for i:=0 to r  do
    begin
    fmin:=maxlongint;
    if col[i,0]<>0 then
       begin
       for j:=0 to col[i,0] do
           begin
           res:=0;
           for k:=1 to j do
               begin
               res:=res+col[i,k];
               end;
           for k:=j+1 to col[i,0] do
               begin
               res:=res+c-col[i,k];
               end;
           res:=res+tcol[i,0,j]+tcol[i,1,col[i,0]-j];
           if res<fmin then fmin:=res;
           end;
       ans:=ans+fmin;
       end;
    end;
if ans<final then final:=ans;
end;
procedure dfs(dep:longint);
var i:longint;
begin
if dep>tot then begin solve; exit; end;
for i:=1 to 2 do
    begin
    sta[dep]:=i;
    dfs(dep+1);
    end;
end;
procedure sort(l,r: longint);
      var i,j,x,y: longint; tmp:rec;
      begin
         i:=l; j:=r; x:=a[(l+r) div 2,1]; y:=a[(l+r)div 2,2];
         repeat
           while (a[i,1]<x)or((a[i,1]=x)and(a[i,2]<y)) do inc(i);
           while (x<a[j,1])or((a[j,1]=x)and(y<a[j,2])) do dec(j);
           if not(i>j) then
             begin tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp; inc(i); j:=j-1; end;
         until i>j;
         if l<j then sort(l,j);
         if i<r then sort(i,r);
      end;
procedure pre;
var i,j,now:longint;
begin
for i:=0 to c do
    begin
    now:=-1;
    for j:=1 to 15 do
        begin
        while (hash[i,now]=1) do dec(now);
        trow[i,0,j]:=trow[i,0,j-1]+(0-now);
        dec(now);
        end;
    now:=r+1;
    for j:=1 to 15 do
        begin
        while (hash[i,now]=1) do inc(now);
        trow[i,1,j]:=trow[i,1,j-1]+(now-r);
        inc(now);
        end;
    //writeln('row ',i,':',trow[i,0,15],' ',trow[i,1,15]);
    end;
for i:=0 to r do
    begin
    now:=-1;
    for j:=1 to 15 do
        begin
        while (hash[now,i]=1) do dec(now);
        tcol[i,0,j]:=tcol[i,0,j-1]+(0-now);
        dec(now);
        end;
    now:=c+1;
    for j:=1 to 15 do
        begin
        while (hash[now,i]=1) do inc(now);
        tcol[i,1,j]:=tcol[i,1,j-1]+(now-c);
        inc(now);
        end;
    //writeln('col ',i,':',tcol[i,0,15],' ',tcol[i,1,15]);
    end;
end;
begin
assign(input,'sunflower.in');
reset(input);
assign(output,'sunflower.out');
rewrite(output);
readln(n,r,c);
for i:=1 to n do
    begin
    readln(x,y);
    hash[y,x]:=1;
    if (0<=x)and(x<=r)and(0<=y)and(y<=c) then
       begin
       inc(tot);
       a[tot,1]:=y; a[tot,2]:=x;
       end;
    end;
//for i:=1 to tot do writeln(a[i,1],' ',a[i,2]);
sort(1,tot);
//for i:=1 to tot do writeln(a[i,1],' ',a[i,2]);
pre;
final:=maxlongint;
dfs(1);
writeln(final);
close(input);
close(output);
end.