Const
	MaxN = 1000000;
Type
	TIndex = longint;
	TList = array [0..MaxN] of TIndex;
	TPSet = array [1..MaxN,1..2] of TIndex;
Var
	n: TIndex;
	HList, FList, LList: TList;
	PSet: TPSet;

	Function PreWork: boolean;
	Var
		i, a, b, num: TIndex;
	Begin
		readln(n);
		{MakeFList;}
		for i:=1 to n do
		begin
			{read(a,b);}
			a := i;
			b := i mod n + 1;
			inc(FList[a]);
			inc(FList[b]);
			PSet[a,FList[a]]:=b;
			PSet[b,FList[b]]:=a;
		end;
		num:=1;
		for i:=1 to n do
		begin
			FList[i]:=num;
			if PSet[num,1]=FList[i-1] then num:=PSet[num,2] else num:=PSet[num,1];
		end;
		{MakeLList;}
		for i:=1 to n do
		begin
			read(PSet[i,1],PSet[i,2]);
			inc(LList[PSet[i,1]]);
			inc(LList[PSet[i,2]]);
		end;
		PreWork:=false;
		for i:=1 to n do
			if LList[i]<>2 then exit;
		LList[0]:=PSet[1,1];
		num:=1;
		for i:=1 to n do
		begin
			LList[i]:=num;
			if PSet[num,1]=LList[i-1] then num:=PSet[num,2]
			else
				if PSet[num,2]=LList[i-1] then num:=PSet[num,1]
				else exit;
			if (num=1) and (i<n) then exit;
		end;
		PreWork:=true;
	End;

	Procedure exchange(var x, y: TIndex);
	Var
		t: TIndex;
	Begin
		t:=x;
		x:=y;
		y:=t;
	end;

	Procedure Work;
	Var
		i, max, Li: TIndex;
	Begin
		for i:=1 to n do
			HList[LList[i]]:=i;
		for i:=1 to n do
			LList[i]:=HList[i];
		fillchar(HList,sizeof(HList),0);
		for i:=1 to n do
		begin
			Li:=LList[FList[i]];
			if Li>i then inc(HList[Li-i]) else inc(HList[Li+n-i]);
		end;
		max:=HList[1];
		for i:=2 to n do
			if max<HList[i] then
				max:=HList[i];
		{turn over}
		for i:=1 to n div 2 do
			exchange(FList[i],FList[n+1-i]);
		fillchar(HList,sizeof(HList),0);
		for i:=1 to n do
		begin
			Li:=LList[FList[i]];
			if Li>i then inc(HList[Li-i]) else inc(HList[Li+n-i]);
		end;
		for i:=1 to n do
			if max<HList[i] then
				max:=HList[i];
		writeln(n-max);
	End;

Begin
	if PreWork then Work else writeln(-1);
End.