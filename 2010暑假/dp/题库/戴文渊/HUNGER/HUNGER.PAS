program hunger(input, output);

var s, e : array [1..1000] of integer;
    st : array [0..2000] of integer;
    n, i, j : integer;

begin
  assign(input, 'hunger.in'); reset(input);

  readln(n);
  for i := 1 to n do
    readln(s[i], e[i]);

  fillchar(st, sizeof(st), 0);
  for i := 1 to 2000 do
    begin
      st[i] := st[i - 1];
      for j := 1 to n do
        if (e[j] = i) and (st[s[j] - 1] + e[j] - s[j] + 1 > st[i])
          then st[i] := st[s[j] - 1] + e[j] - s[j] + 1
    end;

  writeln(st[2000]);

  close(input)
end.