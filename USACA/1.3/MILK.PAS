{
ID: xiaweiy1
PROG: milk
LANG: PASCAL
}
var i,j,n,m,t,sum:longint;
    p:array[1..5000]of integer;   a:array[1..5000]of longint;
procedure try(s,e:longint);
var x,y,i,j:longint;
begin
if s<e then begin
            i:=s;
            j:=e;
            x:=p[i];
            y:=a[i];
            repeat
            begin
            while (x<=p[j])and(i<j) do
                  dec(j);
            if (p[j]<x)and(i<j) then
                                begin
                                p[i]:=p[j];
                                a[i]:=a[j];
                                inc(i);
                                end;
            while (p[i]<=x)and(i<j) do
                  inc(i);
            if (p[i]>x)and(i<j) then
                                begin
                                p[j]:=p[i];
                                a[j]:=a[i];
                                dec(j);
                                end;
            end;
            until i=j;
            p[i]:=x;
            a[i]:=y;
            try(s,i-1);
            try(i+1,e);
            end;
end;
begin
assign(input,'milk.in');
reset(input);
assign(output,'milk.out');
rewrite(output);
readln(n,m);
if m<>0 then
        begin
        for i:=1 to m do
            readln(p[i],a[i]);
        try(1,m);
        end;
t:=0;
sum:=0;
for i:=1 to m do
    if sum+a[i]<=n then
                   begin
                   sum:=sum+a[i];
                   t:=t+p[i]*a[i];
                   end
                   else
                   begin
                   t:=t+(n-sum)*p[i];
                   break;
                   end;
writeln(t);
end.