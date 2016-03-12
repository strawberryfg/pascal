const
  maxn = 1000001;
  infinite = maxlongint * maxlongint;

type integer = longint;

var a, que: array[1 .. maxn] of int64;
    b, f, g: array[0 .. maxn] of int64;

procedure sort(l, r: integer);
var i, j: integer;
    mid, temp: int64;
begin
  i := l; j := r; mid := a[(l + r) shr 1];
  while i <= j do begin
    while a[i] < mid do i := i + 1;
    while a[j] > mid do j := j - 1;
    if i <= j then begin
      temp := a[i]; a[i] := a[j]; a[j] := temp;
      i := i + 1; j := j - 1;
    end;
  end;
  if i < r then sort(i, r);
  if l < j then sort(l, j);
end;

function calc(i, j: integer): int64;
begin
  calc := g[i] - b[i] * j;
end;

function area(i, j, k: integer): extended;
begin
  area := extended(b[j] - b[i]) * (g[k] - g[i]) - extended(b[k] - b[i]) * (g[j] - g[i]);
end;

procedure make(testnumber: integer; n, k, c, d: integer);
var number, inf, ouf: string;
    i, open, closed: integer;
begin
  str(testnumber, number);
  inf := 'divide' + number + '.in';
  ouf := 'divide' + number + '.out';

  assign(output, inf); rewrite(output);
  writeln(n, ' ', k, ' ', c);
  for i := 1 to n do begin
    a[i] := random(d) + 1;
    write(a[i], ' ');
  end; writeln;

  close(output);

  sort(1, n);
  move(a[1], b[0], sizeof(a));

  for i := 1 to k - 1 do f[i] := infinite;
  f[0] := 0; g[0] := b[0] * b[0];
  open := 0; closed := 0;

  for i := k to n do begin
    if f[i - k] < infinite then begin
      inc(closed); que[closed] := i - k;
      while (closed - open > 2) and (area(que[closed - 2], que[closed - 1], que[closed]) <= 0) do begin
        que[closed - 1] := que[closed];
        dec(closed);
      end;
    end;

    while (closed - open > 1) and (calc(que[open + 1], 2 * a[i]) >= calc(que[open + 2], 2 * a[i])) do inc(open);
    f[i] := calc(que[open + 1], 2 * a[i]) + a[i] * a[i] + c;
    g[i] := f[i] + a[i + 1] * a[i + 1];
  end;
  assign(output, ouf); rewrite(output);
  writeln(f[n]);
  close(output);
end;

begin
  randseed := 20061030;
  make(0, 5, 2, 100000, 10);
  make(1, 5, 1, 10, 1000);
  make(2, 10, 2, 3, 10);
  make(3, 10, 3, 600, 100);
  make(4, 20, 5, 3000, 1000);
  make(5, 100, 100, 100, 10000);
  make(6, 500, 150, 1000000, 10000);
  make(7, 1000, 10, 20000, 10000);
  make(8, 5000, 100, 100000, 10000);
  make(9, 10000, 20, 1000000, 500000);
end.
