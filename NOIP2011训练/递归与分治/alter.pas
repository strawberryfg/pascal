const maxn=1000;
type rec=record
     lc,rc:longint;
     end;
var s,t:string;
    len,now:longint;
    tree:array[0..maxn]of rec;
procedure print(x:longint);
begin

if tree[x].lc<>0 then
   print(tree[x].lc);

if tree[x].rc<>0 then
   print(tree[x].rc);
if x<>0 then write(s[x]);
end;
procedure work(st,en,last,x:longint);
var i:longint;
begin
//if st>en then exit;
for i:=st to en do
    begin
    if t[i]=s[now] then
       begin
       if x=1 then
          begin
          tree[last].lc:=now;
          if st<=i-1 then
             begin
             inc(now);
             work(st,i-1,tree[last].lc,1);
             end;
          if i+1<=en then
             begin
             inc(now);
             work(i+1,en,tree[last].lc,2);
             end;
          end
       else begin
            tree[last].rc:=now;
            if st<=i-1 then
               begin
               inc(now);
               work(st,i-1,tree[last].rc,1);
               end;
            if i+1<=en then
               begin
               inc(now);
               work(i+1,en,tree[last].rc,2);
               end;
            end;
       break;
       end;
    end
end;
begin
{assign(input,'alter.in');
reset(input);
assign(output,'alter.out');
rewrite(output);}
while not eof do
  begin
  readln(s);
  readln(t);
  fillchar(tree,sizeof(tree),0);

  len:=length(s);
  now:=1;
  work(1,len,0,1);
  print(0);
  writeln;
  end;
{close(input);
close(output);}
end.
