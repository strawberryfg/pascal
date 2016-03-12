var a,b:array[1..30]of integer;
    i,j,n,tn:longint;
    pd:boolean;

procedure pro(l,r:longint);
var i:longint;
begin
  for i:=l to r do
    a[i-1]:=a[i];
  a[r]:=0;
end;

begin
  assign(input,'josephus.in');reest(input);
  assign(output,'josephus.out');rewrite(output);
  readln(n);n:=2*n;
  fillchar(a,sizeof(a),0);
  for i:=1 to n div 2 do
    a[i]:=1;
  for i:=n div 2+1 to n do
    a[i]:=-1;
  b:=a;
  tn:=n;
  for i:=1 to 21473647 do
  begin
    for j:=1 to n div 2 do
    begin
      a[(n-1) mod i+1]:=0;
      pro((n-1)mod i+2,n);
      n:=n-1;
    end;
    pd:=true;
    for j:=1 to n div 2 do
      if a[j]=-1 then pd:=false;
    if pd then begin   close(input);close(output);writeln(i);halt;end;
    a:=b;
    n:=tn;
  end;
end.
