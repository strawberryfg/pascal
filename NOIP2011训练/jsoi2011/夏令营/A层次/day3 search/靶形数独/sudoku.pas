const dx:array[1..4]of longint=(0,1,0,-1);
      dy:array[1..4]of longint=(1,0,-1,0);
var i,j,fmax,t,p:longint;
    col,row,hash,c,a:array[1..9,0..9]of longint;
    b:array[0..4,-1..10,-1..10]of longint;

procedure handle(x,y,num,i:longint);
var t,p:longint;
begin
if x mod 3=0 then p:=x div 3-1 else p:=x div 3;
if y mod 3=0 then t:=(p)*3+y div 3
             else t:=(p)*3+y div 3+1;
                     if num=0 then a[x,y]:=0 else a[x,y]:=i;
                     col[y,i]:=num;
                     row[x,i]:=num;
                     hash[t,i]:=num;
end;
function work:longint;
var ans,i,j,ttt:longint;
begin
ans:=0;
for i:=1 to 9 do
    for j:=1 to 9 do
        begin
        ans:=ans+c[i,j]*a[i,j];
        end;

exit(ans);
end;
procedure work(x,y,dir,layer:longint);
var tx,ty,i,p:longint;
begin
if a[x,y]<>0 then
   begin
   if layer=4 then
      begin
      if work>fmax then
        begin

        fmax:=work;
        end;
      exit;
      end;
   tx:=x+dx[dir]; ty:=y+dy[dir];
   if (b[layer,tx,ty]=1)and(layer<4) then
      begin
      dir:=dir+1; if dir=5 then dir:=1;
      tx:=x+dx[dir]; ty:=y+dy[dir];
      if (tx=layer+2)and(ty=layer+2) then
         work(layer+2,layer+2,1,layer+1)
      else
         work(tx,ty,dir,layer);
      end
   else
      work(tx,ty,dir,layer);
   end
else
   begin
   for i:=1 to 9 do
       begin
       if (col[y,i]=0)and(row[x,i]=0) then
          begin
                  if x mod 3=0 then p:=x div 3-1 else p:=x div 3;
                  if y mod 3=0 then t:=(p)*3+y div 3
                     else t:=(p)*3+y div 3+1;
                  if hash[t,i]=0 then
                     begin
                     handle(x,y,1,i);

                     tx:=x+dx[dir]; ty:=y+dy[dir];
                     if (layer=4) then
                        begin
                        if work>fmax then
                           begin
                           fmax:=work;

                           end;
                        handle(x,y,0,i);
                        end;
                     if (b[layer,tx,ty]=1)and(layer<4) then
                        begin
                        dir:=dir+1; if dir=5 then dir:=1;
                        tx:=x+dx[dir]; ty:=y+dy[dir];
                        if (tx=layer+1)and(ty=layer+1) then
                           begin
                           work(layer+2,layer+2,1,layer+1);
                           handle(x,y,0,i);
                           end
                        else
                           begin
                           work(tx,ty,dir,layer);
                           handle(x,y,0,i);
                           end;
                        end
                     else
                        begin
                        work(tx,ty,dir,layer);
                        handle(x,y,0,i);
                        end;
                     end;
          end;
       end;
   end;
end;
begin
assign(input,'sudoku.in');
reset(input);
assign(output,'sudoku.out');
rewrite(output);
for i:=1 to 9 do
    begin
    for j:=1 to 9 do
        begin
        read(a[i,j]);
        end;
    readln;
    end;
for i:=1 to 5 do
    begin
    t:=9-(i-1)*2;
    for j:=i to i+t-1 do
        begin
        c[i,j]:=i+5;
        c[i+t-1,j]:=i+5;
        c[j,i]:=i+5;
        c[j,i+t-1]:=i+5;
        end;
    end;
for i:=1 to 9 do
    begin
    for j:=1 to 9 do
        begin
        col[j,a[i,j]]:=1; row[i,a[i,j]]:=1;
        if i mod 3=0 then p:=i div 3-1 else p:=i div 3;
        if j mod 3=0 then t:=(p)*3+j div 3
                     else t:=(p)*3+j div 3+1;
        hash[t,a[i,j]]:=1;
        end;
    end;
for i:=0 to 4 do
    begin
    t:=9-(i-1)*2;
    for j:=i to i+t-1 do
        begin
        b[i,j,i]:=1; b[i,i,j]:=1;
        b[i,j,i+t-1]:=1; b[i,i+t-1,j]:=1;
        end;
    b[i,i+1,i+1]:=1;
    end;
fmax:=0;
work(1,1,1,0);
if fmax=0 then writeln(-1) else writeln(fmax);
close(input);
close(output);
end.
