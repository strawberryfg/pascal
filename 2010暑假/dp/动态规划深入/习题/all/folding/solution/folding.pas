{ SOLUTION for "Folding" problem for NEERC'2002 }
{ (C) Roman Elizarov, 2002 }

{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}
program FOLDING_SOLUTION;

const
  MAX_N = 100;

type
  TArray = array[1..MAX_N, 1..MAX_N] of integer;
  PArray = ^TArray;

var
  s: string;
  n, i, j, k, l, lr, x, p, q, ofs: integer;
  a, op: PArray;
  min, bestop, tmp: integer;
  c: char;
  ok: boolean;

procedure recwrite(i, j: integer);
var
  bestop, l, x: integer;
begin
  bestop := op^[i, j];
  if bestop = 0 then begin
    for l := i to j do
      write(s[l]);
  end else if bestop > 0 then begin
    recwrite(i, bestop);
    recwrite(bestop + 1, j);
  end else begin
    l := -bestop;
    x := (j - i + 1) div l;
    write(x, '(');
    recwrite(i, i + l - 1);
    write(')');
  end;
end;

begin
  { Allocate memory }
  new(a);
  new(op);
  { Open input/output }
  assign(input, 'folding.in'); reset(input);
  assign(output, 'folding.out'); rewrite(output);
  { Read }
  readln(s);
  n := length(s);
  { Solve }
  for i := 1 to n do begin
    a^[i, i] := 1;
    op^[i, i] := 0;
  end;
  for l := 2 to n do { lenght of subsequences to optimize }
    for i := 1 to n - l + 1 do begin { from s[i] }
      j := i + l - 1; { to s[j] }
      min := l;
      bestop := 0;
      { Try concatenation }
      for k := i to j - 1 do begin
        tmp := a^[i, k] + a^[k + 1, j];
        if tmp < min then begin
          min := tmp;
          bestop := k;
        end;
      end;
      { Try repeating }
      for lr := 1 to l div 2 do { length of repeating seq }
        if l mod lr = 0 then begin
          x := l div lr; { repeat count }
          ok := true;
          for p := 1 to lr do begin
            ofs := i + p - 1;
            c := s[ofs];
            for q := 2 to x do begin
              inc(ofs, lr);
              if s[ofs] <> c then begin
                ok := false;
                break;
              end;
            end;
            if not ok then
              break;
          end;
          if ok then begin
            tmp := 3 + a^[i, i + lr - 1];
            if x >= 10 then
              inc(tmp);
            if x >= 100 then
              inc(tmp);
            if tmp < min then begin
              min := tmp;
              bestop := -lr;
            end;
          end;
        end;
      { assign result }
      a^[i, j] := min;
      op^[i, j] := bestop;
    end;
  { Write }
  recwrite(1, n);
  writeln;
end.
