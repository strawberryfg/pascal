var t,p,i,a,b,n,p1,p2:longint;
        k:array[1..200]of longint;
begin
        assign(input,'lift.in');
	reset(input);
	assign(output,'lift.out');
	rewrite(output);

	readln(n,a,b);
	for i:=1 to n do
        read(k[i]);
        p:=a;
        t:=0;
        p1:=0;
        p2:=0;
        while p<>b do
        begin
        p1:=p+k[p];
        p2:=p-k[p];
        if (p1>0) and (p1<=n) then p:=p1
                          else p:=p2;

        inc(t);
        end;
        writeln(t);
	close(input);
	close(output);


end.
