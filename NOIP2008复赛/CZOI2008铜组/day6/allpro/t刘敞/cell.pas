const tx:array[1..4]of longint=(0,-1,0,1);
      ty:array[1..4]of longint=(-1,0,1,0);
type arr=array[1..100,1..100]of char;
     arraytype=array[1..5000]of longint;
var cell:arr;a,b:arraytype;
    n,m,i,j,left,right,total,x,y,xx,yy:longint;
function nocl(a:arr):boolean;
        var i,j:longint;
        begin
        nocl:=true;
        for i:=1 to n do
                for j:=1 to m do
                        if a[i,j]<>'0' then exit(false);
        end;
procedure search(a:arr);
        var i,j:longint;
        begin
        for i:=1 to n do
                for j:=1 to m do
                        if a[i,j]<>'0' then
                                begin x:=i;y:=j;exit;end;
        end;
function check(x,y:longint):boolean;
        begin
        if (x>0)and(x<=n)and(y>0)and(y<=m)and(cell[x,y]<>'0') then check:=true else check:=false;
        end;
procedure clean(a,b:arraytype);
        var i:longint;
        begin
        for i:=1 to right do cell[a[i],b[i]]:='0';
        end;
function same(x,y:longint):boolean;
        var i:longint;
        begin
        same:=false;
        for i:=1 to right do
                if (a[i]=x)and(b[i]=y) then exit(true);
        end;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
        begin
        for j:=1 to  m do
                read(cell[i,j]);
        readln;
        end;
while not nocl(cell) do
        begin
        search(cell);
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        left:=1;right:=1;
        a[1]:=x;b[1]:=y;
        while left<=right do
                begin
                for i:=1 to 4 do
                        begin
                        xx:=a[left]+tx[i];
                        yy:=b[left]+ty[i];
                        if check(xx,yy)and not same(xx,yy) then
                                begin inc(right);a[right]:=xx;b[right]:=yy;end;
                        end;
                inc(left);
                end;
        clean(a,b);
        inc(total);
        end;
writeln(total);
close(input);
close(output);
end.
