Program p8_6(Input, Output);
type
  node=record
         cost:longint;
         pre:integer;
       end;

  arr=array[0..30] of node;
  arr1=array[1..300] of longint;

var
  work:array[0..300] of ^arr;
  cor:array[0..300] of integer;
  n,h:integer;
  build:array[1..300] of integer;

  mcost:array[1..300] of ^arr1;

procedure start;   {输入输出准备}
begin
  assign(input,'post.in');
  reset(input);
  assign(output,'post.out');
  rewrite(output);
end;

procedure over;   {结束工作}
begin
  close(input);
  close(output);
end;

procedure init;
var
  i:integer;
begin
  readln(n,h);
  for i:=1 to n do
    read(cor[i]);
  readln;

end;

function mincost(a,b:integer; var hcor:integer):longint;
   {在村庄a与b之间插入一个邮局，最小消耗}
var
  sum,i,min,k:longint;
begin
  hcor:=a+((b-a+1) div 2);
  sum:=0;
  for i:=hcor-1 downto a do
    sum:=sum+cor[hcor]-cor[i];
  for i:=hcor+1 to b do
    sum:=sum+cor[i]-cor[hcor];
  mincost:=sum;

  hcor:=cor[hcor];
end;

function smaller(a,b:longint):longint;
begin
  if a>b then smaller:=b else smaller:=a;
end;

procedure doit;  {规划过程}
var
  i,j,k,c,x,y,sum,min,sum1:longint;
  hc:integer;
begin
  for i:=1 to n do
    begin
      new(mcost[i]);
      for j:=1 to n do mcost[i]^[j]:=maxlongint;
    end;

  for i:=1 to n do mcost[i]^[i]:=0;

  for i:=1 to n do
    for j:=i+1 to n do
      mcost[i]^[j]:=mincost(i,j,hc);

  for i:=0 to n do
    begin
      new(work[i]);
      fillchar(work[i]^,sizeof(work[i]^),0);
    end;

  for i:=2 to n do
    begin
      work[i]^[1].cost:=mcost[1]^[i];
      for j:=2 to smaller(i,h) do
        begin
          work[i]^[j].cost:=maxlongint;
          for k:=1 to i-1 do
            begin
              c:=work[k]^[j-1].cost+mcost[k+1]^[i];
              if c<work[i]^[j].cost then
                begin
                  with work[i]^[j] do
                    begin
                      cost:=c;
                      pre:=k;
                    end;
                end;
            end;
        end;
      end;
  writeln(work[n]^[h].cost);

  x:=n;
  for i:=h downto 1 do
    begin
      y:=mincost(work[x]^[i].pre,x,build[i]);
      x:=work[x]^[i].pre;
    end;

  for i:=1 to h do
    write(build[i],' ');
  writeln;
end;

begin
  start;
  init;
  doit;
  over;
end.
