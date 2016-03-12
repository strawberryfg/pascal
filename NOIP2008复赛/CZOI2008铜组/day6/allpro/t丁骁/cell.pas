const
     maxn=60;
var
     n,m,i,j,next:longint;
     a:array[1..maxn] of string;

procedure del(x,y:longint);
begin
     a[x][y]:='0';
     {shang}
     if (x-1>=1)and(a[x-1][y]<>'0') then del(x-1,y);
     {xia}
     if (x+1<=m)and(a[x+1][y]<>'0') then del(x+1,y);
     {zuo}
     if (y-1>=1)and(a[x][y-1]<>'0') then del(x,y-1);
     {you}
     if (y+1<=n)and(a[x][y+1]<>'0') then del(x,y+1);
end;
procedure find;
begin
     for i:=1 to m do
         for j:=1 to n do
             if a[i][j]<>'0' then exit;
end;
function pd:boolean;
begin
     pd:=false;
     for i:=1 to m do
         for j:=1 to n do
             if a[i][j]<>'0' then begin pd:=true;exit;end;
end;
begin
     assign(input,'cell.in');
     assign(output,'cell.out');
     reset(input);
     rewrite(output);

     readln(m,n);
     for i:=1 to m do
         readln(a[i]);
     next:=0;
     while pd do
        begin
        inc(next);
        find;
        del(i,j);
        end;
     writeln(next);

     close(input);
     close(output);
end.
