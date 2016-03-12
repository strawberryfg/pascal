program bigexp;
var
  i,n,k:longint;
  num:array[1..15]of longint;
  sum:array[1..15]of longint;

function try(x,k:longint):longint;
var
  i,max,m:longint;
begin
  if k>0 then
    begin
      max:=num[x]*try(x+1,k-1);
      for i:=1 to n-k-x do
        begin
          m:=(sum[x+i]-sum[x-1])*try(x+i+1,k-1);
          if m>max then max:=m;
        end;
      try:=max;
    end
  else if k=0 then try:=sum[n]-sum[x-1]
              else try:=1;
end;

begin
  assign (input,'bigexp.in');
  reset(input);
  assign (output,'bigexp.out');
  rewrite(output);
  readln(n,k);
  for i:=1 to n do
    read (num[i]);
  sum[1]:=num[1];
  for i:=2 to n do
    sum[i]:=sum[i-1]+num[i];
  writeln(try(1,k));
  close(input);
  close(output);
end.
