program knight;
var n,m,x,y:longint;
    a:array[1..10,1..10]of longint;
    b,c:array[1..8]of longint;
    bl:boolean;

procedure print;
var i,j,k:longint;
begin
        write('(',x,',',y,')');
        k:=2;
        while k<=m*n do
        for i:=1 to n do
                for j:=1 to m do
                        if a[i,j]=k then
                                        begin
                                        inc(k);
                                        write('->(',j,',',i,')');
                                        end;
	writeln;
end;

procedure try(xx,yy:longint);
var i:longint;
begin
        if a[xx,yy]=n*m then begin print;close(input);close(output);halt;end;
        for i:=1 to 8 do
                begin
                if (xx+b[i]>0)and(xx+b[i]<=n)and(yy+c[i]>0)and(yy+c[i]<=m)
                        and(a[xx+b[i],yy+c[i]]=0) then
                                                        begin
                                                        a[xx+b[i],yy+c[i]]:=a[xx,yy]+1;
                                                        bl:=true;
                                                        try(xx+b[i],yy+c[i]);
                                                        if not bl then a[xx+b[i],yy+c[i]]:=0;
                                                        end
                                                  else bl:=false;
                end;
end;

begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
        readln(m,n,x,y);
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        fillchar(c,sizeof(c),0);
        bl:=true;
        b[1]:=1;c[1]:=2;
        b[2]:=1;c[2]:=-2;
        b[3]:=2;c[3]:=1;
        b[4]:=2;c[4]:=-1;
        b[5]:=-1;c[5]:=2;
        b[6]:=-1;c[6]:=-2;
        b[7]:=-2;c[7]:=1;
        b[8]:=-2;c[8]:=-1;
        a[x,y]:=1;
        try(x,y);
        writeln('No Answer!');
close(input);
close(output);
end.
