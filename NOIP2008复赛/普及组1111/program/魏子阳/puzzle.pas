var ge,ha,li:array[1..9,1..9]of boolean;
    s,i,j,k,l:longint;
    a:array[1..9,1..9]of longint;
procedure slove(x:longint);
var tt1,tt2,ss1,ss2,i,j,k,l:longint;
    ok:boolean;
begin
ok:=true;
if (x>9)and(s<81) then exit;
if s=81 then begin
             for i:=1 to 9 do
                 begin
                 for j:=1 to 8 do
                 write(a[i,j],' ');
                 write(a[i,9]);
                 writeln;
                 end;
                 close(input);
                 close(output);
                 halt;
             end
        else begin
                 k:=x;
                 ss1:=((k-1) div 3)*3+1;
                 ss2:=((k-1) div 3)*3+3;
                 tt1:=((k-1) mod 3)*3+1;
                 tt2:=((k-1) mod 3)*3+3;
                 for i:=ss1 to ss2 do
                     begin
                     for j:=tt1  to ((k-1) mod 3)*3+3    do
                         begin
                         if a[i,j]=0 then begin
                                          ok:=false;
                                          for l:=1 to 9 do
                                              begin
                                              if (ha[i,l]=false)and(li[j,l]=false)and(ge[k,l]=false) then
                                                 begin
                                                 ha[i,l]:=true;li[j,l]:=true;ge[k,l]:=true;
                                                 a[i,j]:=l;
                                                 inc(s);
                                                 slove(x);
                                                 ha[i,l]:=false;li[j,l]:=false;ge[k,l]:=false;
                                                 a[i,j]:=0;dec(s);
                                                 end;
                                              end;
                                          end;
                         end;
                     end;
             if ok=true then begin slove(x+1);inc(s);end;
             end;
end;
begin
assign(input,'puzzle.in');
assign(output,'puzzle.out');
rewrite(output);
reset(input);
fillchar(ge,sizeof(ge),false);
fillchar(ha,sizeof(ha),false);
fillchar(li,sizeof(li),false);
s:=0;
for i:=1 to 9 do
    begin
    for j:=1 to 9 do
        begin
        read(a[i,j]);
        if a[i,j]<>0 then begin ha[i,a[i,j]]:=true;
                                li[j,a[i,j]]:=true;
                                ge[((i-1) div 3)*3+((j-1) div 3)+1,a[i,j]]:=true;
                                inc(s);
                                end;
        end;
    readln;
    end;
slove(1);
close(input);
close(output);
end.
