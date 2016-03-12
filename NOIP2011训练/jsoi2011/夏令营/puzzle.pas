//11:58  12:41 finish writing; 12:55 finish debugging; AC
var g:array[1..10,1..4,1..10,1..10]of char;
    col,row:array[1..10,1..4]of longint;
    i,j,u,k,n,m,x,y:longint;
    done:boolean;
    hash:array[1..10]of longint;
    used:array[1..10,1..10]of boolean;
    num,res:array[1..10,1..10]of longint;
procedure pre;
var i,j,u,v,x,y:longint;
begin
for i:=1 to k do
    begin
    x:=row[i,1]; y:=col[i,1];
    for j:=2 to 4 do
        begin
        if j mod 2=0 then begin row[i,j]:=y; col[i,j]:=x; end
           else begin row[i,j]:=x; col[i,j]:=y; end;
        for u:=1 to row[i,j-1] do
            begin
            for v:=1 to col[i,j-1] do
                begin
                g[i,j,v,row[i,j-1]+1-u]:=g[i,j-1,u,v];
                end;
            end;
        end;
    end;
{for i:=1 to k do
    begin
    for j:=1 to 4 do
        begin
        for u:=1 to row[i,j] do
            begin
            for v:=1 to col[i,j] do
                write(g[i,j,u,v]);
            writeln;
            end;
        end;
    writeln;
    end; }
end;
procedure check;
var i,j:longint;
    flag:boolean;
begin
flag:=false;
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        if (num[i,j]=maxlongint) then
            exit;
        if num[i,j]<res[i,j] then begin flag:=true;  end;
        if num[i,j]>res[i,j] then exit;
        end;
    if flag then break;
    end;
if flag then
   begin
   done:=true;
   res:=num;
   end;
// this process is difficult; it is important to write testdata;
end;
procedure dfs(dep:longint);
var i,j,u,v,p,q:longint;
    pd:boolean;
begin
if dep>k then begin check; exit; end;
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
               u:=dep;
               begin
               for v:=1 to 4 do
                   begin
                   if (i+row[u,v]-1<=n)and(j+col[u,v]-1<=m) then
                      begin
                      if ((not used[i,j])and(g[u,v,1,1]='#'))or
                      ((used[i,j])and(g[u,v,1,1]='.')) then
                         begin
                         pd:=true;
                         for p:=i to i+row[u,v]-1 do
                             begin
                             for q:=j to j+col[u,v]-1 do
                                 begin
                                 if ((used[p,q])and(g[u,v,p-i+1,q-j+1]='#')) then
                                    begin
                                    pd:=false;
                                    break;
                                    end;
                                 end;
                             if not pd then break;
                             end;
                         if not pd then continue;
                         for p:=i to i+row[u,v]-1 do
                             begin
                             for q:=j to j+col[u,v]-1 do
                                 begin
                                 if (g[u,v,p-i+1,q-j+1]='#') then
                                    begin
                                    used[p,q]:=true;
                                    num[p,q]:=u-1;
                                    end;
                                 end;
                             end;
                         dfs(dep+1);
                         for p:=i to i+row[u,v]-1 do
                             begin
                             for q:=j to j+col[u,v]-1 do
                                 begin
                                 if (g[u,v,p-i+1,q-j+1]='#') then
                                    begin
                                    used[p,q]:=false;
                                    num[p,q]:=maxlongint;
                                    end;
                                 end;
                             end;
                         end;
                      end;
                   end;
            end;
        end;
    end;
end;
begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
readln(n,m);
readln(k);
for i:=1 to k do
    begin
    readln(x,y);
    for j:=1 to x do
        begin
        for u:=1 to y do
            read(g[i,1,j,u]);
        readln;
        end;
    row[i,1]:=x; col[i,1]:=y;
    end;
pre;
done:=false;
for i:=1 to n do for j:=1 to m do res[i,j]:=maxlongint;
dfs(1);
if done then
   begin
   for i:=1 to n do
       begin
       for j:=1 to m do
           begin
           write(char(res[i,j]+48));
           end;
       writeln;
       end;
   end
else
   writeln(-1);
close(input);
close(output);
end.