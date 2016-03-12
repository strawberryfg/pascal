program subset;
const
  maxd=500;
type
  bignum=record
    dig:longint;
    num:array[1..maxd]of longint;
  end;
var
  n:longint;
  ans:bignum;

  procedure init;
  begin
    assign(input,'subset.in');
    reset(input);
    assign(output,'subset.out');
    rewrite(output);
    readln(n);
  end;

  procedure mul(var a:bignum;b:longint);
  var
    i,g:longint;
  begin
    g:=0;
    for i:=1 to a.dig do
    begin
      a.num[i]:=a.num[i]*b+g;
      g:=a.num[i] div 10;
      a.num[i]:=a.num[i] mod 10;
    end;
    while g<>0 do
    begin
      inc(i);
      a.num[i]:=g mod 10;
      g:=g div 10;
    end;
    a.dig:=i;
  end;

  procedure sub1(var a:bignum);
  var
    i:longint;
  begin
    i:=1;
    while a.num[i]=0 do
    begin
      a.num[i]:=9;
      inc(i);
    end;
    dec(a.num[i]);
    if a.num[a.dig]=0
      then dec(a.dig);
  end;

  procedure work;
  var
    i:longint;
  begin
    fillchar(ans,sizeof(ans),0);
    ans.dig:=1;
    ans.num[1]:=1;
    for i:=1 to n+1 do
      mul(ans,i);
    sub1(ans);
  end;

  procedure out;
  var
    i:longint;
  begin
    for i:=ans.dig downto 1 do
      write(ans.num[i]);
    writeln;
  end;

begin
  init;
  work;
  out;
end.
