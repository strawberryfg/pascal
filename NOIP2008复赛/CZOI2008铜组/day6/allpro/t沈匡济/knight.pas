const x1:array[1..8]of longint=(2,2,1,1,-2,-2,-1,-1);
      y1:array[1..8]of longint=(1,-1,2,-2,1,-1,2,-2);
var m,n,x,y:longint;
    a:array[-1..100,-1..100]of longint;
procedure print;
        var i,j,k:longint;
        begin
        for i:=1 to n*m-1 do
                for j:=1 to n do
                        for k:=1 to m do
                                if a[j,k]=i then write('(',j,',',k,')->');
        for j:=1 to n do
                for k:=1 to m do
                        if a[j,k]=n*m then writeln('(',j,',',k,')');
        end;
procedure work(x,y,dep:longint);
        var i,t:longint;
        begin
        if dep>n*m then begin print;close(input);close(output);halt;end
                   else for i:=1 to 8 do
                        begin
                        t:=a[x+x1[i],y+y1[i]];
                        a[x+x1[i],y+y1[i]]:=dep;
                        if (x+x1[i]<=n)and(y+y1[i]<=m)and(x+x1[i]>0)and(y+y1[i]>0)and(t=0)
                               then work(x+x1[i],y+y1[i],dep+1);
                        a[x+x1[i],y+y1[i]]:=t;
                        end;
        end;
begin
assign(input,'knight.in');reset(input);
assign(output,'knight.out');rewrite(output);
readln(n,m,x,y);
a[x,y]:=1;
work(x,y,2);
writeln('No Answer!');
close(input);
close(output);
end.