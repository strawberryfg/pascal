var i,j:longint;
    a:array[1..100,1..100]of longint;
procedure try(x,y:longint);
var i,j,ii,jj,k,kk:longint;
    b:array[1..100]of longint;
begin
if (x=10) then begin
               for i:=1 to 9 do
                   begin
                   for j:=1 to 8 do
                       write(a[i,j],' ');
                   writeln(a[i,9]);
                   end;
               close(input);
               close(output);
               halt;
               end
          else if a[x,y]=0 then begin
                                fillchar(b,sizeof(b),0);
                                for ii:=1 to 9 do
                                    if a[x,ii]<>0 then b[a[x,ii]]:=1;
                                for ii:=1 to 9 do
                                    if a[ii,y]<>0 then b[a[ii,y]]:=1;
                                k:=((x-1) div 3)*3+1;
                                kk:=((y-1) div 3)*3+1;
                                for ii:=k to k+2 do
                                    for jj:=kk to kk+2 do
                                        if a[ii,jj]<>0 then b[a[ii,jj]]:=1;
                                for ii:=1 to 9 do
                                    if b[ii]=0 then begin
                                                    a[x,y]:=ii;
                                                    if y=9 then try(x+1,1)
                                                           else try(x,y+1);
                                                    a[x,y]:=0;
                                                    end;
                                end
                           else if y=9 then try(x+1,1)
                                       else try(x,y+1);

end;
begin
assign(input,'puzzle.in');
assign(output,'puzzle.out');
reset(input);
rewrite(output);
fillchar(a,sizeof(a),0);
for i:=1 to 9 do
    begin
    for j:=1 to 9 do
        read(a[i,j]);
    readln;
    end;
try(1,1);
close(input);
close(output);
end.
