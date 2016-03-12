program oil(input, output);

type integer = longint;
     real = extended;

var c, len : array [0..51] of real;
    st : array [0..51] of integer;
    n, i, j : integer;
    maxv, l0, l, u : real;

begin
  assign(input, 'oil.in'); reset(input);
  readln(l0);
  readln(maxv, l, u, n);
  fillchar(st, sizeof(st), $7F);
  len[0] := 0; st[0] := round(u * 100);
  for i := 1 to n do
    readln(len[i], c[i]);
  len[n + 1] := l0; c[n + 1] := 0;

  for i := 1 to n + 1 do
    for j := 0 to i - 1 do
      begin
        u := (len[i] - len[j]) / l;
        if u <= maxv
         then if (u * 2 > maxv) or (i = n + 1)
                then if st[j] + u * c[i] + 200 < st[i]
                       then st[i] := st[j] + round(u * c[i]) + 200
                       else
                else if ((maxv - u) * l < len[i + 1] - len[i])
                      and (st[j] + round(u * c[i]) + 200 < st[i])
                       then st[i] := st[j] + round(u * c[i]) + 200
      end;

  writeln((st[n + 1] - 200) / 100 :0:2);

  close(input)
end.