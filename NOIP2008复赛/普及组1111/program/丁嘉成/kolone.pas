const maxn=9;

type list=array[1..2,1..maxn]of char;

var a:list;
    n1,n2,n,t:longint;

procedure startt;
begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
end;

procedure endt;
begin
  close(input);
  close(output);
end;

procedure intt;
var i:longint;
begin
  readln(n1,n2);
  for i:=n1 downto 1 do
    begin
      read(a[1,i]);
      a[2,i]:='>';
    end;
  readln;
  for i:=n1+1 to n1+n2 do
    begin
      read(a[1,i]);
      a[2,i]:='<';
    end;
  readln;
  readln(t);
  n:=n1+n2;
end;

procedure outt;
var i:longint;
begin
  for i:=1 to n do
    write(a[1,i]);
  writeln;
end;

procedure runt;
var i,j:longint;
    temp:char;
begin
  for i:=1 to t do
    for j:=1 to n-1 do
      if (a[2,j]='>')and(a[2,j+1]='<')
        then begin
               temp:=a[1,j];
               a[1,j]:=a[1,j+1];
               a[1,j+1]:=temp;
               temp:=a[2,j];
               a[2,j]:=a[2,j+1];
               a[2,j+1]:=temp;
               j:=j+1;
               if j>=n then
                         break;
             end;
end;

begin
startt;
intt;
runt;
outt;
endt;
end.