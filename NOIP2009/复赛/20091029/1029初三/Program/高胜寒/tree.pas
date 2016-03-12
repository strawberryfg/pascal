var n,i,t,a,b,max:longint;
    p:boolean;
    count:array[0..101]of longint;
begin
  assign(input,'tree.in'); reset(input);
  assign(output,'tree.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
  begin
    t:=0; p:=true;
    while not eoln do
    begin
      if p then begin read(a); count[i]:=count[i]+a; p:=false; end
                else begin read(b); count[b]:=count[i]; end;
    end;
    readln;
    if count[i]>max then max:=count[i];
  end;
  writeln(max);
  close(input); close(output);
end.