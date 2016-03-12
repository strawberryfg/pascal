var a,b,c:array[1..100]of char;
    i,n1,n2,t,j,k,l:longint;
    xu:array[1..100]of boolean;
procedure change;
var x,i,j:longint;
    ch:char;
    ok:boolean;
begin
i:=1;
while i<n1+n2 do
      begin
      if (xu[i]=true)and(xu[i+1]=false) then
                        begin
                        ok:=xu[i];
                        xu[i]:=xu[i+1];
                        xu[i+1]:=ok;
                        ch:=c[i];
                        c[i]:=c[i+1];
                        c[i+1]:=ch;
                        inc(i,2);
                        end
                                        else inc(i);
      end;
end;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
read(n1,n2);
readln;
for i:=1 to n1 do
    begin
    read(a[i]);
    xu[i]:=true;
    end;
readln;
for i:=1 to n2 do
    begin
    read(b[i]);
    xu[i+n1]:=false;
    end;
readln;
read(t);
for i:=1 to n1 do
    begin
    c[i]:=a[n1-i+1];
    end;
for i:=1 to n2 do
    begin
    c[n1+i]:=b[i];
    end;
for i:=1 to t do change;
for i:=1 to n1+n2 do
    write(c[i]);
close(input);
close(output);
end.
