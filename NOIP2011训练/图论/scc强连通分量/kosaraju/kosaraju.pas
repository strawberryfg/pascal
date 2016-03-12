program Kosaraju;

var
   link,link2:array[0..110,0..110]of longint;
   a,d,f:array[0..110]of longint;
   rec:array[0..110]of boolean;
   col:array[0..110]of longint;
   color,i,j,n,m,p,x,y,tme:longint;

function max(a,b:longint):longint;
begin
  if a>b then exit(a) else exit(b);
end;
procedure sou(x:longint);
var
   i:longint;
begin
  inc(tme); d[x]:=tme;
  rec[x]:=true;
  for i:=1 to link[x,0] do
    if not rec[link[x,i]] then sou(link[x,i]);
  inc(p);
  inc(tme); f[x]:=tme;
  a[p]:=x;
end;

procedure sou2(x:longint);
var
   i:longint;
begin
  col[x]:=color;
  for i:=1 to link2[x,0] do
    if col[link2[x,i]]=0 then sou2(link2[x,i]);
end;

BEGIN
  assign(input,'kosaraju.in');reset(input);
  {assign(output,'kosaraju.out');rewrite(output);}
  readln(n,m);
  for i:=1 to m do
  begin
    readln(x,y);
      inc(link[x,0]);
      link[x,link[x,0]]:=y;
      inc(link2[y,0]);
      link2[y,link2[y,0]]:=x;  { 2.��ԭͼÿ���߽��з���}
  end;
  fillchar(rec,sizeof(rec),0);
  for i:=1 to n do             { 1.��ԭͼ����DFS��}
    if not rec[i] then sou(i);
  color:=0;
  for i:=p downto 1 do         {������ջ˳��a[i]�������򣬵õ���˳���������˳��}
    if col[a[i]]=0 then
    begin
      inc(color);
      sou2(a[i]);              {3.����1������˳���ٽ���DFSȾɫȾ��ͬɫ����һ��ǿ��ͨ��}
    end;
  for i:=1 to n do writeln(i,'     :',col[i]);
  for i:=1 to n do writeln(d[i],' ',f[i]);
  close(input);close(output);
END.
