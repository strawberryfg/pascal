Var i:longint;
    s,s1:string;
    a,b:array[1..3]of longint;
Begin
  assign(input,'natrij.in');
  assign(output,'natrij.out');
  reset(input);rewrite(output);
  readln(s);
  readln(s1);
  close(input);
  val(copy(s,1,2),a[1]);
  val(copy(s,4,2),a[2]);
  val(copy(s,7,2),a[3]);
  val(copy(s1,1,2),b[1]);
  val(copy(s1,4,2),b[2]);
  val(copy(s1,7,2),b[3]);
  for i:=3 downto 2 do
    if a[i]>b[i] then
       begin
	 b[i]:=b[i]+60;
	 dec(b[i-1]);
       end;
  if a[1]>b[1] then b[1]:=b[1]+24;
  if b[1]-a[1]<10 then write('0',b[1]-a[1],':')
                  else write(b[1]-a[1],':');
  if b[2]-a[2]<10 then write('0',b[2]-a[2],':')
                  else write(b[2]-a[2],':');
  if b[3]-a[3]<10 then write('0',b[3]-a[3])
                  else write(b[3]-a[3]);
  writeln;
  close(output);
End.
