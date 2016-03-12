const
  MAXN = 10;
  MAXM = 10;
  delt: array[1..8,1..2] of integer = ((1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1), (-2, -1), (-1, -2));

var
  n, m, sx, sy: longint;
  board: array[1..MAXN, 1..MAXM] of boolean;
  route: array[1..MAXN * MAXM] of longint;

function search(step, x, y: longint): boolean;
var
  i, x1, y1: longint;
begin
  if board[x, y] then
    search := false
  else
  begin
    board[x, y] := true;
    route[step] := 100 * x + y;
    if (step = n * m) then
    begin
      write('(', route[1] div 100, ',', route[1] mod 100, ')');
      for i := 2 to n * m do
        write('->(', route[i] div 100, ',', route[i] mod 100, ')');
      writeln;
      search := true;
    end
    else
    begin
      for i := 1 to 8 do
      begin
        x1 := x + delt[i, 1];
        y1 := y + delt[i, 2];
        if (x1 > 0) and ( x1 <= n) and (y1 > 0) and( y1 <= m) then
          if search(step + 1, x1, y1) then
          begin
            search := true;
            exit
          end
      end;
      board[x, y] := false;
      search := false
    end
  end
end;

begin
  assign(input, 'knight.in');
  reset(input);
  read(n, m, sx, sy);
  close(input);
  fillchar(board, 0, sizeof(board));
  assign(output, 'knight.out');
  rewrite(output);
  if  not search(1, sx, sy) then
    writeln('No Answer!');
  close(output)
end.