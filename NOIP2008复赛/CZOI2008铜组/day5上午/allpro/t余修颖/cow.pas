var n:longint;
function f(n:int64):int64;

begin
	if (n=1) or (n=2) or (n=3) then f:=1
				   else f:=f(n-1)+f(n-3);	

end;
begin
        assign(input,'cow.in');
	reset(input);
	assign(output,'cow.out');
	rewrite(output);

        readln(n);
        writeln(f(n));


	close(input);
	close(output);

end.
