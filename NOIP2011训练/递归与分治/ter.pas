const maxn=1000;
type rec=record
     lc,rc:longint;
     end;
var s,t:string;
    len,now,i,j:longint;
    tree:array[0..maxn]of rec;
    belong,hash:array[0..maxn]of longint;
procedure work(st,en,last,x:longint);
var i,fmax,num:longint;
begin
fmax:=0;
for i:=st to en do
    begin
    if (hash[belong[i]]=0)and(belong[i]>fmax) then
       begin
       fmax:=belong[i];
       num:=i;
       end;
    end;
if st>en then exit;
if x=1 then
   begin
   tree[last].lc:=belong[num];
   hash[belong[num]]:=1;
   if st<=num-1 then work(st,num-1,tree[last].lc,1);
   if num+1<=en then work(num+1,en,tree[last].lc,2);
   end
else begin
     tree[last].rc:=belong[num];
     hash[belong[num]]:=1;
     if st<=num-1 then work(st,num-1,tree[last].rc,1);
     if num+1<=en then work(num+1,en,tree[last].rc,2);
     end;
end;
procedure print(x:longint);
begin
if x<>0 then write(t[x]);
if tree[x].lc<>0 then print(tree[x].lc);
if tree[x].rc<>0 then print(tree[x].rc);
end;
begin
{assign(input,'ter.in');
reset(input);
assign(output,'ter.out');
rewrite(output);}
while not eof do
  begin
  readln(t);
  readln(s);
  fillchar(tree,sizeof(tree),0);
  fillchar(hash,sizeof(hash),0);
  fillchar(belong,sizeof(belong),0);
  for i:=1 to length(s) do
      begin
      for j:=1 to length(t) do
          begin
          if s[i]=t[j] then belong[i]:=j;
          end;
      end;

  tree[0].lc:=length(t);
  {hash[length(t)]:=1;}
  work(1,length(t),0,1);
  print(0);
  writeln;
  end;

{close(input);
close(output);}
end.
