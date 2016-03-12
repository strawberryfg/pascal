const
	wordLimit	= 100000 + 100;
        valueLimit	= 100000;

type
	integer		= longint;

var
        word, prefix    : array[0 .. wordLimit] of string;

procedure sort(var A : array of string; l, r : integer);
var
	i, j		: integer;
        mid, temp	: string;
begin
	i := l; j := r; mid := A[(l + r) shr 1];
        while (i <= j) do begin
        	while (A[i] < mid) do i := i + 1;
                while (A[j] > mid) do j := j - 1;
                if (i <= j) then begin
                	temp := A[i]; A[i] := A[j]; A[j] := temp;
                        i := i + 1; j := j - 1;
                end;
        end;
        if i < r then sort(A, i, r);
        if l < j then sort(A, l, j);
end;


procedure make(nCase, N, M, ABsize, wordLengthLimit, prefixLengthLimit : integer);
var
	inf,
	caseStr		: string;
        wordLength,
        prefixLength,
        i, j, nN, nM	: integer;
begin
        str(nCase, caseStr);
        inf := 'engzam' + caseStr + '.in';

        assign(output, inf); rewrite(output);

        word[0] := ''; prefix[0] := '';

        for i := 1 to N do begin
		wordLength := random(wordLengthLimit) + 1;
                word[i] := '';
                for j := 1 to wordLength do
                	word[i] := word[i] + char(ord('a') + random(ABsize));
        end;
        for i := 1 to M do begin
		prefixLength := random(prefixLengthLimit) + 1;
                prefix[i] := '';
                for j := 1 to prefixLength do
                	prefix[i] := prefix[i] + char(ord('a') + random(ABsize));
        end;
        sort(word, 1, N);
        sort(prefix, 1, M);

        nN := 1; nM := 1;
        for i := 2 to N do if word[i] <> word[i - 1] then inc(nN);
        for i := 2 to M do if prefix[i] <> prefix[i - 1] then inc(nM);

        writeln(nN, ' ', nM);

        for i := 1 to N do if word[i] <> word[i - 1] then
        	writeln(word[i], ' ', random(valueLimit) + 1);

        for i := 1 to M do if prefix[i] <> prefix[i - 1] then
                writeln(prefix[i], ' ', random(valueLimit) + 1);
        close(output);
end;

begin
	make(0, 10, 10, 2, 5, 5);
	make(1, 100, 10, 2, 10, 3);
	make(2, 1000, 10, 2, 10, 4);
	make(3, 1000, 1000, 2, 10, 9);
	make(4, 1000, 1000, 4, 10, 4);
	make(5, 5000, 1000, 4, 10, 10);
	make(6, 5000, 5000, 4, 10, 6);
	make(7, 10000, 10000, 4, 10, 10);
	make(8, 50000, 50000, 10, 10, 8);
	make(9, 100000, 100000, 26, 10, 7);
end.
