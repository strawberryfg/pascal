var a:array[1..9,1..9] of byte;
    i,j:longint;
function pd(x,y,i:longint):boolean;
var xx,yy,j,k:longint;
begin
pd:=true;
for j:=1 to 9 do
        begin
        if j<>x then if a[j,y]=i then begin
                                      pd:=false;
                                      exit;
                                      end;
        if j<>y then if a[x,j]=i then begin
                                      pd:=false;
                                      exit;
                                      end;
        end;
if x mod 3 = 0 then xx:=x div 3
               else xx:=x div 3 + 1 ;
if y mod 3 = 0 then yy:=y div 3
               else yy:=y div 3 + 1 ;
for j:=(xx-1)*3+1 to xx*3 do
        for k:=(yy-1)*3+1 to yy*3 do
                if a[j,k]=i then if (j<>x) and (k<>y) then begin
                                                           pd:=false;
                                                           exit;
                                                           end;
end;
procedure print;
var i,j:longint;
begin
for i:=1 to 9 do
        begin
        for j:=1 to 9 do
                write(a[i,j]);
        writeln;
        end;
close(input);
close(output);
halt;
end;
procedure search(x,y:longint);
var i:longint;
begin
if (x<10) and (a[x,y]>0) then if y<9 then begin
                                          search(x,y+1);
                                          exit;
                                          end
                                     else begin
                                          search(x+1,1);
                                          exit;
                                          end;
if x=10  then print
         else for i:=1 to 9 do
                  if pd(x,y,i) then begin
                                    if y<9 then begin
                                                a[x,y]:=i;
                                                search(x,y+1);
                                                a[x,y]:=0;
                                                end
                                           else begin
                                                a[x,y]:=i;
                                                search(x+1,1);
                                                a[x,y]:=0;
                                                end;
                                    end;
end;
begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
for i:=1 to 9 do
        for j:=1 to 9 do
                read(a[i,j]);
search(1,1);
end.