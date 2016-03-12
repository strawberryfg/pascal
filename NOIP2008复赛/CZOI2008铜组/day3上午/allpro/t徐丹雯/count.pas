var i,j,n,x,x1,x2,x3,x4,x5,x6,x7,x8,x9:longint;
    g,s,b,q,w,sw,bw:integer;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
  readln(n);
  if (n>=1)and(n<10) then
  for i:=1 to n do
 writeln('1');
  if (n>=10)and(n<=1000000) then   begin
  for i:=1 to n do begin
  s:=n div 10 mod 10;
  b:=n div 100 mod 10;
  q:=n div 1000 mod 10;
  w:=n div 10000 mod 10;
  sw:=n div 100000 mod 10;
  bw:=n div 1000000 mod 10;
  case s of
  0:x:=x+1;
  1:x1:=x+1;
  2:x2:=x2+1;
  3:x3:=x3+1;
  4:x4:=x4+1;
  5:x5:=x5+1;
  6:x6:=x6+1;
  7:x7:=x7+1;
  8:x8:=x8+1;
  9:x9:=x9+1;
  end;
    case b of
  0:x:=x+1;
  1:x1:=x+1;
  2:x2:=x2+1;
  3:x3:=x3+1;
  4:x4:=x4+1;
  5:x5:=x5+1;
  6:x6:=x6+1;
  7:x7:=x7+1;
  8:x8:=x8+1;
  9:x9:=x9+1;
  end;
  case q of
  0:x:=x+1;
  1:x1:=x+1;
  2:x2:=x2+1;
  3:x3:=x3+1;
  4:x4:=x4+1;
  5:x5:=x5+1;
  6:x6:=x6+1;
  7:x7:=x7+1;
  8:x8:=x8+1;
  9:x9:=x9+1;
  end;
    case w of
  0:x:=x+1;
  1:x1:=x+1;
  2:x2:=x2+1;
  3:x3:=x3+1;
  4:x4:=x4+1;
  5:x5:=x5+1;
  6:x6:=x6+1;
  7:x7:=x7+1;
  8:x8:=x8+1;
  9:x9:=x9+1;
  end;
    case sw of
  0:x:=x+1;
  1:x1:=x+1;
  2:x2:=x2+1;
  3:x3:=x3+1;
  4:x4:=x4+1;
  5:x5:=x5+1;
  6:x6:=x6+1;
  7:x7:=x7+1;
  8:x8:=x8+1;
  9:x9:=x9+1;
  end;
    case bw of
  0:x:=x+1;
  1:x1:=x+1;
  2:x2:=x2+1;
  3:x3:=x3+1;
  4:x4:=x4+1;
  5:x5:=x5+1;
  6:x6:=x6+1;
  7:x7:=x7+1;
  8:x8:=x8+1;
  9:x9:=x9+1;
  end;   end;    end;
  inc(x);
  inc(x1);
  inc(x2);
  inc(x3);
  inc(x4);
  inc(x5);
  inc(x6);
  inc(x7);
  inc(x8);
  inc(x9);
  writeln(x);
  writeln(x1);
  writeln(x2);
  writeln(x3);
  writeln(x4);
  writeln(x5);
  writeln(x6);
  writeln(x7);
  writeln(x8);
  writeln(x9);
close(input);
close(output);
end.

































































































