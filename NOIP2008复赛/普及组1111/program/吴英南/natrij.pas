var s1,s2,s3,s:string;
    i:longint;
    m,h,d:array[1..3]of longint;
procedure check;
  begin
  if m[2]<0 then begin m[2]:=m[2]+60;dec(h[2]);check;end;
  if h[2]<0 then begin h[2]:=h[2]+24;end;
  end;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
for i:=1 to 2 do
    begin
      readln(s);
      s1:=copy(s,1,2);
      val(s1,h[i]);
      s2:=copy(s,4,2);
      val(s2,m[i]);
      s3:=copy(s,7,2);
      val(s3,d[i]);
    end;
if d[1]<=d[2] then d[3]:=d[2]-d[1]
             else begin dec(m[2]);d[3]:=d[2]+60-d[1];check;end;
if m[1]<=m[2] then m[3]:=m[2]-m[1]
             else begin dec(h[2]);m[3]:=m[2]+60-m[1];check;end;
if h[1]<=h[2] then h[3]:=h[2]-h[1]
             else begin h[3]:=h[2]+24-h[1];end;
if d[3]<10 then s3:='0'+char(d[3]+48) else s3:=' ';
if m[3]<10 then s2:='0'+char(m[3]+48) else s2:=' ';
if h[3]<10 then s1:='0'+char(h[3]+48) else s1:=' ';
if s1=' ' then write(h[3])
          else write(s1);
write(':');
if s2=' ' then write(m[3])
          else write(s2);
write(':');
if s3=' ' then write(d[3])
          else write(s3);
writeln;
close(input);
close(output);
end.
