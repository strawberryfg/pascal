program view(input, output);

type integer = longint;
     states = array [0..100, 0..100] of integer;

var m, n, i, j, k, x, y, v : integer;
    st, c : ^states;

begin
  new(st); fillchar(st^, sizeof(st^), $80); st^[0][0] := 0;
  new(c); fillchar(c^, sizeof(c^), 0);
  readln(m);
  readln(n);
  for i := 1 to n do
    begin
      readln(x, y, v);
      for j := 1 to x do
        for k := y to m do
          inc(c^[j][k], v)
    end;
  readln(k);

  for i := 1 to m do
    for j := 1 to k do
      begin
        for x := 0 to i - 1 do
          if st^[x][j - 1] + c^[x + 1][i] > st^[i][j]
            then st^[i][j] := st^[x][j - 1] + c^[x + 1][i];

      end;

  writeln(st^[m][k])
end.