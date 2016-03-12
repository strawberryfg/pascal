program knight;
const dx:array[1..8]of longint=(1,1,-1,-1,2,2,-2,-2);
      dy:array[1..8]of longint=(2,-2,2,-2,1,-1,1,-1);
var n,m,x,y,i,j:longint;
    board:array[-2..12,-2..12]of longint;
    a:array[1..100,1..2]of longint;
procedure find(dep,x,y:longint);
var i:longint;
begin
     if dep<n*m then begin
                          for i:=1 to 8 do
                            begin
                                 a[dep,1]:=x;
                                 a[dep,2]:=y;
                                 board[x,y]:=1;
                                 if board[dx[i]+x,dy[i]+y]=0 then
                                 begin
                                 find(dep+1,dx[i]+x,dy[i]+y);
                                 end;
                                 board[x,y]:=0;
                                 a[dep,1]:=0;
                                 a[dep,2]:=0;
                            end;
                     end;
     if (dep=n*m) then exit;
end;
begin
     assign(input,'knight.in');reset(input);
     assign(output,'knight.out');rewrite(output);
     read(n,m,x,y);
     for i:=-1 to n+2 do
       for j:=-1 to m+2 do
           board[i,j]:=-1;
     for i:=1 to n do
        for j:=1 to m do
        board[i,j]:=0;
        find(1,x,y);
        if a[m*n,1]=0 then writeln('No Answer!')
                      else begin
       for i:=1 to n*m-1 do
       begin
            write('(',a[i,1],',',a[i,2],')->');
       end;
       writeln('(',a[m*n,1],',',a[m*n,2],')');
       end;
       close(input);
       close(output);
end.