Program p8_5(Input, Output);
var
	F,V	:byte; 	{花束和花瓶的数目}
	A	:array [1..100,1..100] of shortint; 	{A[i,j]花束i放在花瓶j中的美学值}
	Best	:array [0..100,0..100] of integer;
		{Best[i,j]前i束花放在前j个花瓶中的最优解}
	Previous	:array [1..100,1..100] of byte;
		{Previous[i,j]在Best[i,j]的最优解中，花束i-1的位置}

procedure ReadIn; 	{读入}
var
	i,j	:byte;
begin
	reset(input);
	readln(F,V);
	for i:=1 to F do
	begin
		for j:=1 to V do
			read(A[i,j]);
		readln;
	end;
	close(input);
end;

procedure Work; 	{规划主过程}
var
	i,j,t	:byte;
begin
	fillchar(Best[0],sizeof(Best[0]),0); {边界条件}
	for i:=1 to F do
		for j:=i to V+i-F do
		begin
			Best[i,j]:=low(Best[i,j]);
			for t:=i-1 to j-1 do	{枚举花束i-1的位置}
				if Best[i-1,t]>Best[i,j] then
				begin	{更新当前最优解}
					Best[i,j]:=Best[i-1,t];
					Previous[i,j]:=t;
				end;
			inc(Best[i,j],A[i,j]);
		end;
end;

procedure Print;	{打印最优解}
var
	i,j	:byte;
	Put	:array [1..100] of byte;
begin
	i:=F;
	for j:=F+1 to V do	{选择全局最优解}
		if Best[F,j]>Best[F,i] then
			i:=j; 	{i最后一束花的位置}
	rewrite(output);
	writeln(Best[F,i]);
	for j:=F downto 1 do
	begin
		Put[j]:=i;
		i:=Previous[j,i];
        end;
        write(Put[1]);
	for i:=2 to F do
		write(' ',Put[i]);
	writeln;
	close(output);
end;

begin
	assign(input,'flower.inp');
	assign(output,'flower.out');
	ReadIn;
	Work;
	Print;
end.
