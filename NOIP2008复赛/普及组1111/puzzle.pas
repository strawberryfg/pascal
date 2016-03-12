const jiu:array[1..9,1..2]of integer=((1,1),(1,4),(1,7),(4,1),(4,4),(4,7),(7,1),(7,4),(7,7));
var i,j,k,n,p,q,v,sti,stj:longint;
    s,t:string;
    a,fi,fj,nine,belong:array[1..9,1..9]of integer;
    fang:array[1..9,1..9,1..9]of integer;
procedure print;
var i,j:longint;
begin
for i:=1 to n*n do
    begin
    for j:=1 to n*n do
        begin
        write(a[i,j]);
        if j<>n*n then write(' ');
        end;
    writeln;
    end;
close(input);
close(output);
halt;
end;
function search(x,y:longint):longint;
var i:longint;
begin
if belong[x,y]<>0 then exit(belong[x,y]);
for i:=1 to 9 do
    begin
    if (x>=jiu[i,1])and(x<=jiu[i,1]+2)and(y>=jiu[i,2])and(y<=jiu[i,2]+2) then
       begin belong[x,y]:=i; exit(i); end;
    end;
end;
procedure find(x,y:longint);
begin
if y+1>n*n then if x+1<=n*n then begin p:=x+1;q:=1; end else begin p:=0;q:=0; end
           else begin p:=x;q:=y+1; end;
end;
procedure try(x,y:longint);
var i:longint;
begin
if a[x,y]<>0 then begin find(x,y);if (p=0)and(q=0) then print else try(p,q); end;
if a[x,y]=0 then
   begin
   for i:=1 to n*n do
       begin
       if (fang[x,y,i]=1)and(fi[x,i]=0)and(fj[y,i]=0) then
          if nine[search(x,y),i]=0 then
          begin
          a[x,y]:=i;
          fi[x,i]:=1;
          fj[y,i]:=1;
          nine[search(x,y),i]:=1;
          find(x,y);
          if (p<>0)and(q<>0) then try(p,q) else print;
          a[x,y]:=0;
          fi[x,i]:=0;
          fj[y,i]:=0;
          nine[search(x,y),i]:=0;
          end;
       end;
   end;
end;
begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
{readln(n);}
n:=3;
for i:=1 to n*n do
    for j:=1 to n*n do
        begin
        read(a[i,j]);
        if a[i,j]<>0 then begin fi[i,a[i,j]]:=1; fj[j,a[i,j]]:=1; end;
        end;
for i:=1 to n*n do
    begin
    sti:=jiu[i,1];stj:=jiu[i,2];
    for j:=0 to 2 do
        for k:=0 to 2 do
            begin
            v:=a[sti+j,stj+k];
            if v<>0 then nine[i,v]:=1;
            end;
    end;
for i:=1 to n*n do
    for j:=1 to n*n do
        if a[i,j]=0 then
           begin
           s:='';
           for k:=1 to n*n do
               s:=s+chr(fi[i,k]+48);
           t:='';
           for k:=1 to n*n do
               t:=t+chr(fj[j,k]+48);
           for k:=1 to n*n do
               begin
               if (ord(s[k])-48)or(ord(t[k])-48)=0 then fang[i,j,k]:=1
                  else fang[i,j,k]:=0;
               end;
           end;
try(1,1);
close(input);
close(output);
end.
