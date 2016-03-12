Var n,m,i:longint;
    s:ansistring;
    ch:char;
    a:array[0..2501]of longint;
Procedure search(s:ansistring);
          var i,count,min:longint;
              ok:boolean;
          begin
            count:=0;
            min:=maxlongint;
            ok:=true;
            for i:=1 to length(s) do
                begin
                  if (i<>1)and(s[i-1]<>s[i]) then ok:=false;
                  if s[i]='H' then inc(count)
                     else dec(count);
                  if (abs(count)<=m)or(ok) then
                     begin
                       if (a[length(s)-i]=0)and(length(s)<>i) then search(copy(s,i+1,length(s)-i));
                       if a[length(s)-i]<min then min:=a[length(s)-i];
                     end;
                end;
            a[length(s)]:=min+1;
          end;
Begin
  assign(input,'bus.in');
  assign(output,'bus.out');
  reset(input);rewrite(output);
  readln(n,m);
  s:='';
  for i:=1 to n do
      begin
        read(ch);
        s:=s+ch;
      end;
  search(s);
  writeln(a[n]);
  close(input);close(output);
End.
