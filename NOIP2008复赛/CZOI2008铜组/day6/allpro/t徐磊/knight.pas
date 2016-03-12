var a:array[1..10,1..10]of boolean;
    ans:array[1..100,1..2]of longint;
    x,y,m,n:longint;

procedure change(var m,n,i:longint);
begin
  case i of
    1:begin m:=m-2;n:=n+1 end;
    2:begin m:=m-1;n:=n+2 end;
    3:begin m:=m+1;n:=n+2 end;
    4:begin m:=m+2;n:=n+1 end;
    5:begin m:=m+2;n:=n-1 end;
    6:begin m:=m+1;n:=n-2 end;
    7:begin m:=m-1;n:=n-2 end;
    8:begin m:=m-2;n:=n-1 end;
  end;
end;

function check(i,j:longint):boolean;
begin
  if (i>m)or(j>n)or(i<1)or(j<1)then exit(false);
  if a[i,j]=true then exit(false);
  check:=true;
end;

procedure print;
var i:longint;
begin
  write('(',ans[1,1],',',ans[1,2],')');
  for i:=2 to n*m do
    write('->(',ans[i,1],',',ans[i,2],')');
  writeln;
  close(input);
  close(output);
end;

procedure sou(t:longint);
var t1,t2,i,temp:longint;
begin
  if t=n*m then begin print;halt;end;
  for i:=8 downto 1 do
  begin
    t1:=x;t2:=y;temp:=i;
    change(x,y,temp);
    if check(x,y) then
    begin
      ans[t+1,1]:=x;
      ans[t+1,2]:=y;
      a[x,y]:=true;
      sou(t+1);
      a[x,y]:=false;
    end;
    x:=t1;y:=t2;
  end;
end;

begin
  assign(input,'knight.in');reset(input);
  assign(output,'knight.out');rewrite(output);
  fillchar(a,sizeof(a),false);
  readln(m,n,x,y);
  if m*n>50 then begin writeln('No Answer!');close(input);close(output);halt;end;
  ans[1,1]:=x;
  ans[1,2]:=y;
  a[x,y]:=true;
  sou(1);
  writeln('No Answer!');
  close(input);
  close(output);
end.
