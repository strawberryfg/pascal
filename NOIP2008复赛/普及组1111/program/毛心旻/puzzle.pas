type pp=array[1..9,1..9]of longint;
var a:pp;
    i,j:longint;
procedure pdd(a:pp);
var i,j:longint;
begin
for i:=1 to 9 do
    for j:=1 to 9 do
        if a[i,j]=0 then exit;
for i:=1 to 9 do
    begin
    for j:=1 to 8 do
        write(a[i,j],' ');
    writeln(a[i,9]);
    end;
close(input);
close(output);
halt;
end;
procedure search(h,l:longint;a:pp);
var i,j,k:longint;
    pd:boolean;
    hash:array[1..9]of boolean;
begin
for i:=1 to 9 do
    hash[i]:=true;
for i:=1 to 9 do
    begin
    if a[h,i]<>0 then hash[a[h,i]]:=false;
    if a[i,l]<>0 then hash[a[i,l]]:=false;
    end;
for i:=((h-1) div 3*3+1) to ((h-1) div 3*3+3) do
    for j:=((l-1) div 3*3+1) to((l-1) div 3*3+3) do
        if a[i,j]<>0 then hash[a[i,j]]:=false;
for i:=1 to 9 do
    if hash[i]=true then begin
                         pd:=true;
                         a[h,l]:=i;
                         pdd(a);
                         for j:=h to 9 do
                             begin
                             for k:=1 to 9 do
                                 if a[j,k]=0 then begin
                                                  search(j,k,a);
                                                  pd:=false;
                                                  break;
                                                  end;
                             if pd=false then break;
                             end;
                         a[h,l]:=0;
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
for i:=1 to 9 do
    for j:=1 to 9 do
        if a[i,j]=0 then begin
                         search(i,j,a);
                         end;
end.
