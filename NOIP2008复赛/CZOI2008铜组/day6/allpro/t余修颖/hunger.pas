var i,j,b,t,x,s:longint;
	a,c:array[1..2000,1..2]of longint;

begin
        assign(input,'hunger.in');
	reset(input);
	assign(output,'hunger.out');
	reset(output);
	readln(b);
	for i:=1 to b do
	for j:=1 to 2 do
	read(a[i,j]);
        for x:=1 to 2000 do
        for i:=1 to b-1 do
        for t:=i+1 to b do
        if (x>=a[i,1]) and (x<=a[i,2]) and (x>=a[t,1]) and (x<=a[t,2])
        then inc(s);
        writeln(s);

	close(input);
	close(output);



end.
