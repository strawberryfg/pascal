const maxn=1000;
var i,j,k:longint;
    n,z,m:longint;
    a,b:array[1..maxn]of boolean;
procedure setup;
begin
  assign(input,'comfort.in');
  reset(input);
  assign(output,'comfort.out');
  rewrite(output);
end;
procedure endit;
begin
  close(input);
  close(output);
end;
begin
  setup;
  readln(n,z,m);
  fillchar(a,sizeof(a),false);
  for i:=1 to m do 
    begin
      read(k);
      a[k]:=true;
    end;
  a[1]:=true;
  b:=a;
  for k:=1 to n do 
    begin
      i:=1;
      while i<>z do 
        begin
          i:=i+k;
          if i>n then i:=i-n;
          if a[i] then break;
          a[i]:=true;
        end;
      if i=z then break;
      a:=b;
    end;
  writeln(k);
  endit;
end.