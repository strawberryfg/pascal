const tx:array[1..8]of longint=(1,2,2,1,-1,-2,-2,-1);
      ty:array[1..8]of longint=(-2,-1,1,2,2,1,-1,-2);
var n,m,x,y:longint;
    a,b:array[1..10000]of integer;
    step:array[1..10,1..10]of boolean;
function check(x,y:longint):boolean;
        begin
        if (x>0)and(x<=n)and(y>0)and(y<=m) then check:=true else check:=false;
        end;
procedure print;
        var i:longint;
        begin
        for i:=1 to n*m-1 do
                write('(',a[i],',',b[i],')->');
        write('(',a[n*m],',',b[n*m],')');
        writeln;
        close(input);
        close(output);
        halt;
        end;
procedure try(dep,x,y:longint);
        var i:longint;
        begin
        if dep>n*m then print
                else
                for i:=1 to 8 do
                        begin
                        if check(x+tx[i],y+ty[i])and(step[x+tx[i],y+ty[i]])
                                then
                                begin
                                a[dep]:=x+tx[i];
                                b[dep]:=y+ty[i];
                                step[a[dep],b[dep]]:=false;
                                try(dep+1,x+tx[i],y+ty[i]);
                                step[a[dep],b[dep]]:=true;
                                end;
                        end;
        end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
read(n,m,x,y);
fillchar(step,sizeof(step),true);
a[1]:=x;
b[1]:=y;
step[x,y]:=false;
try(2,x,y);
writeln('No Answer!');
close(input);
close(output);
end.