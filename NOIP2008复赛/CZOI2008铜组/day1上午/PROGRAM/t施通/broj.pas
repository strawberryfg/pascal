const
        q:array[1..8] of longint=(9,180,2700,36000,450000,5400000,63000000,720000000);
var
        i,n,t,x,k:longint;
begin
        assign(input,'broj.in');
        assign(output,'broj.out');
        reset(input);
        rewrite(output);
        read(n);
        t:=n;
        while t>0 do
        begin
                inc(i);
                t:=t div 10;
        end;
        t:=i-1;
        x:=0;
        for i:=1 to t do
                x:=x+q[i];
        k:=0;
        for i:=1 to t do
                k:=k*10+9;
        x:=x+(n-k)*(t+1);
        writeln(x);
        close(input);
        close(output);
end.