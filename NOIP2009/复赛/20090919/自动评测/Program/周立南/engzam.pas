var ch:char;
    s:string;
    find:boolean;
    i,j,k,ans,n,m,x:longint;
    a:array [0..100000] of string;
    p:array [0..100000] of longint;

begin
  assign(input,'engzam.in');
  assign(output,'engzam.out');
  reset(input);
  rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      read(ch);
      s:='';
      while not(ch=' ') do
        begin
          s:=s+ch;
          read(ch);
        end;
      a[i]:=s;
      readln(p[i]);
    end;
  for i:=1 to m do
    begin
      ans:=0;
      read(ch);
      s:='';
      while not(ch=' ') do
        begin
          s:=s+ch;
          read(ch);
        end;
      readln(x);
      for j:=1 to n do
        begin
          if length(a[j])<length(s) then continue;
          find:=true;
          for k:=1 to length(s) do
            if a[j][k]<>s[k] then find:=false;
          if (find) and (p[j]>=x) then inc(ans);
        end;
      writeln(ans);
    end;
  close(input);
  close(output);
end.