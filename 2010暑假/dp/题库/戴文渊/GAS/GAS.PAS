{$A+,B-,D-,E-,F-,G+,I-,L-,N+,O-,P+,Q-,R-,S-,T-,V-,X-,Y-}
{$M 65520,0,655360}
program gas(input, output);

type integer = longint;

var t0, a0, n, t1, a1, i, j, k : integer;
    t, a, w : array [1..1000] of integer;
    st : array [0..21, 0..79] of integer;

begin
  assign(input, 'gas.in'); reset(input);
  readln(t0, a0);
  readln(n);
  for i := 1 to n do
    readln(t[i], a[i], w[i]);

  fillchar(st, sizeof(st), $7F); st[0][0] := 0;
  for k := 1 to n do
  for i := t0 downto 0 do
    for j := a0 downto 0 do
        begin
          t1 := i + t[k]; if t1 > t0 then t1 := t0;
          a1 := j + a[k]; if a1 > a0 then a1 := a0;
          if st[i][j] + w[k] < st[t1][a1]
            then st[t1][a1] := st[i][j] + w[k]
        end;

  writeln(st[t0][a0]);

  close(input)
end.