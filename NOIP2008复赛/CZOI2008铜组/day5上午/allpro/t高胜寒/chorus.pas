type ar=array[0..101]of longint;
     arr=array[0..101]of boolean;
var i,c,total:longint;
    he:ar;
    o:arr;
procedure pd(o:arr;c:integer);
var i,count:longint;
    pd:boolean;
    st:ar;
begin
  for i:=1 to 100 do st[i]:=0;
  count:=0;
  for i:=1 to total do
      if o[i]=false then begin count:=count+1; st[count]:=he[i]; end;
  pd:=true;
  for i:=2 to count do
  begin
    if st[i]=st[i-1]then exit;
    if pd=true then begin if st[i]<st[i-1] then pd:=false; end
               else if st[i-1]<=st[i] then exit;
  end;
  writeln(c);
  close(input);
  close(output);
  halt;
end;
procedure shan(ge,c:integer;o:arr);
var i:longint;
begin
  if ge=0 then begin pd(o,c); exit; end;
  for i:=1 to total do
    if o[i]=false then begin o[i]:=true; shan(ge-1,c,o); o[i]:=false; end;
end;
begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);
  readln(total);
  for i:=1 to total do read(he[i]);
  for i:=0 to total do
  begin
    c:=i;
    shan(i,c,o);
  end;
  close(input);
  close(output);
end.