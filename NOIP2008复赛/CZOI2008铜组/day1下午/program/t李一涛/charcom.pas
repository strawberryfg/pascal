var i,k,j,n,w,l,total:integer;
    s:string;
    ch:char;
begin
  assign(input,'charcom.in');
  reset(input);
  assign(output,'charcom.out');
  rewrite(output);
  readln(n);
  readln(s);
  l:=length(s); w:=1; total:=0;
  for i:=1 to l-1 do
  begin
    ch:=s[i];
    k:=ord(ch)-ord('A')+1;
    for j:=1 to k do w:=w*2;
    total:=total+w;
  end;
  writeln(total);
  close(input);
  close(output);
end.