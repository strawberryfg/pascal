program cell;
var i,j,m,n,count:longint;
    a:array[1..60,1..60]of longint;
    ch:char;

procedure search(x,y:longint);
var i:longint;
begin
        a[x,y]:=0;
        i:=1;
                if (x+i>0)and(x+i<=m)and(a[x+i,y]<>0) then search(x+i,y);
                if (x-i>0)and(x-i<=m)and(a[x-i,y]<>0) then search(x-i,y);
                if (y+i>0)and(y+i<=n)and(a[x,y+i]<>0) then search(x,y+i);
                if (y-i>0)and(y-i<=n)and(a[x,y-i]<>0) then search(x,y-i);
end;

begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
        readln(m,n);
        fillchar(a,sizeof(a),0);
        for i:=1 to m do
                begin
                for j:=1 to n do
                        begin
                        read(ch);
                        a[i,j]:=ord(ch)-48;
                        end;
                readln;
                end;
        count:=0;
        for i:=1 to m do
                for j:=1 to n do
                        begin
                        if a[i,j]<>0 then begin inc(count);search(i,j);end;
                        end;
        writeln(count);
close(input);
close(output);
end.
