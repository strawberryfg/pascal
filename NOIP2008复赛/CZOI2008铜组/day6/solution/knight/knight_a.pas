const
  MAXN = 10;
  MAXM = 10;
  MAX = MAXN * MAXM;
  delt: array[1..8,1..2] of integer = ((1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1), (-2, -1), (-1, -2));

var
  n, m, sx, sy: longint;
  x, y, top, i: longint;
  stack: array[1..MAX] of longint;
  board: array[1..MAXN, 1..MAXM] of boolean;

begin
  assign(input, 'knight.in');
  reset(input);
  read(n, m, sx, sy);
  close(input);
  fillchar(board, sizeof(board), 0);
  x := sx; y := sy;
  board[x, y] := true;
  top := 1;
  stack[top] := 0;
  while (top >= 1) and (top < n * m) do
  begin
    inc(stack[top]);
    if (stack[top] <= 8) then
    begin
      inc(x, delt[stack[top], 1]);
      inc(y, delt[stack[top], 2]);
      if (x <= 0) or (x > n) or (y <= 0) or (y > m) or (board[x, y]) then
      begin
        dec(x, delt[stack[top], 1]);
        dec(y, delt[stack[top], 2])
      end
      else
      begin
        board[x, y] := true;
        inc(top);
        stack[top] := 0
      end
    end
    else
    begin
      board[x, y] := false;
      dec(top);
      dec(x, delt[stack[top], 1]);
      dec(y, delt[stack[top], 2])
    end
  end;
  assign(output, 'knight.out');
  rewrite(output);
  if (top > 1) then
  begin
    write('(', sx, ',', sy, ')');
    for i := 1 to n * m - 1 do
    begin
      inc(sx, delt[stack[i], 1]);
      inc(sy, delt[stack[i], 2]);
      write('->(', sx, ',', sy, ')')
    end;
    writeln
  end
  else
    writeln('No Answer!');
  close(output)
end.
