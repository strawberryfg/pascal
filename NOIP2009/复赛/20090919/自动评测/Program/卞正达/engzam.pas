type stype=record
             str:string;
             x:longint;
           end;
var a:array[1..100000] of stype;
    ans,i,j,k,l,m,n,r:longint;
    b,s:string;
    ch:char;

procedure sort(l,r:longint);
var
  i,j:longint;
  x:string;
  y:stype;
begin
  i:=l;j:=r;x:=a[(l+r) div 2].str;
  repeat
    while a[i].str<x do
      inc(i);
    while x<a[j].str do
      dec(j);
    if i<=j
      then
        begin
          y:=a[i];a[i]:=a[j];a[j]:=y;
          inc(i);dec(j);
        end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
  assign(input,'engzam.in');reset(input);
  assign(output,'engzam.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      a[i].str:='';
      read(ch);
      while ch<>' ' do
        begin
          a[i].str:=a[i].str+ch;
          read(ch);
        end;
      readln(a[i].x);
    end;
  sort(1,n);
  for i:=1 to m do
    begin
      b:='';
      read(ch);
      while ch<>' ' do
        begin
          b:=b+ch;
          read(ch);
        end;
      readln(j);
      l:=1;r:=n;
      while l<r do
        begin
          s:=a[(l+r) div 2].str;
          if s<b
            then l:=(l+r) div 2
            else r:=(l+r) div 2;
        end;
      ans:=0;
      for k:=(l+r) div 2 to n do
        if copy(a[k].str,1,length(b))<>b
          then break
          else
            begin
              if a[k].x>=j then inc(ans);
            end;
      writeln(ans);
    end;
  close(input);close(output);
end.
