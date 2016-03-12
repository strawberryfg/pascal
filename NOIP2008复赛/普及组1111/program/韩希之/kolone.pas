Var n,m,i,t,j:longint;
    ch:char;
    c:array['A'..'Z']of boolean;
    a,temp:array[0..30]of char;
Procedure swap(var a,b:char);
          var t:char;
          begin
            t:=a;a:=b;b:=t;
          end;
Begin
  assign(input,'kolone.in');
  assign(output,'kolone.out');
  reset(input);rewrite(output);
  readln(n,m);
  for i:=1 to n do
      begin
        read(ch);
        a[n+1-i]:=ch;
        c[ch]:=true;
      end;
  readln;
  for i:=1 to m do
      begin
        read(ch);
        a[n+i]:=ch;
      end;
  read(t);
  for i:=1 to t do
      begin
        temp:=a;
        for j:=1 to n+m-1 do
            if c[a[j]] then
               if c[a[j+1]]=false then
                  swap(temp[j],temp[j+1]);
        a:=temp;
      end;
  for i:=1 to n+m do
      write(a[i]);
  writeln;
  close(input);close(output);
End.
