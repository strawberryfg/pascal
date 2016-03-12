const hash:array[1..17,1..17]of 0..1=
((1,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0),
(1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1),
(0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0),
(1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0),
(0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0),
(1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1),
(0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0),
(0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0),
(0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0),
(1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0),
(0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0),
(1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1),
(0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0),
(0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1),
(0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0),
(1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0),
(0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0));


var a:array[1..17] of integer;
    n:integer;

procedure out;
var i:integer;
begin
  write(a[1]);
  for i:=2 to n do
    write(' ',a[i]);
  writeln;
end;

function use(n,m:integer):boolean;
var i:integer;
begin
  use:=true;
  for i:=1 to m do if a[i]=n then use:=false;
end;


procedure sou(m:integer);
var i:integer;
begin
  if (m=n)  then if(hash[a[n],a[1]]=1) then out
                                       else
            else
  begin
      for i:=1 to n do
        if use(i,m) and (hash[i,a[m]]=1) then begin a[m+1]:=i;sou(m+1);end;
  end;
end;


begin
  assign(input,'prime.in');reset(input);
  assign(output,'prime.out');rewrite(output);
  readln(n);
  a[1]:=1;
  sou(1);
  close(input);
  close(output);
end.

