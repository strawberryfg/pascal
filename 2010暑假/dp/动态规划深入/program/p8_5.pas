Program p8_5(Input, Output);
var
	F,V	:byte; 	{�����ͻ�ƿ����Ŀ}
	A	:array [1..100,1..100] of shortint; 	{A[i,j]����i���ڻ�ƿj�е���ѧֵ}
	Best	:array [0..100,0..100] of integer;
		{Best[i,j]ǰi��������ǰj����ƿ�е����Ž�}
	Previous	:array [1..100,1..100] of byte;
		{Previous[i,j]��Best[i,j]�����Ž��У�����i-1��λ��}

procedure ReadIn; 	{����}
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

procedure Work; 	{�滮������}
var
	i,j,t	:byte;
begin
	fillchar(Best[0],sizeof(Best[0]),0); {�߽�����}
	for i:=1 to F do
		for j:=i to V+i-F do
		begin
			Best[i,j]:=low(Best[i,j]);
			for t:=i-1 to j-1 do	{ö�ٻ���i-1��λ��}
				if Best[i-1,t]>Best[i,j] then
				begin	{���µ�ǰ���Ž�}
					Best[i,j]:=Best[i-1,t];
					Previous[i,j]:=t;
				end;
			inc(Best[i,j],A[i,j]);
		end;
end;

procedure Print;	{��ӡ���Ž�}
var
	i,j	:byte;
	Put	:array [1..100] of byte;
begin
	i:=F;
	for j:=F+1 to V do	{ѡ��ȫ�����Ž�}
		if Best[F,j]>Best[F,i] then
			i:=j; 	{i���һ������λ��}
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
