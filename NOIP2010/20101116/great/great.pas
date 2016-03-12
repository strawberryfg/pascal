var knum,a,b,max,now,i,tail,head:longint;
    tnum:int64;
    dis,num,opt:array[1..1000]of longint;
    hash:array[0..1000000000]of boolean;
    pd:boolean;
begin
assign(input,'great.in');
reset(input);
assign(output,'great.out');
rewrite(output);
readln(a,b);

if (a=b) then writeln(0)
   else if (a=0) then writeln(-1)
         else if (b=0)or(b=1) then writeln(1)
              else

begin
tail:=1; head:=1;
num[1]:=a; dis[1]:=0;
knum:=-1;
if a>b then max:=a else max:=b;
{for i:=1 to max do f[i]:=32767;
f[0]:=32767;
f[a]:=0;}
dis[1]:=0;
while tail<=head do
  begin
  now:=num[tail];
  pd:=false;
  for i:=1 to 4 do
      begin
      case i of
      1:tnum:=int64(now)*int64(2);
      2:tnum:=0;
      3:tnum:=int64(now)*int64(now);
      4:tnum:=1;
      end;
      if i<=2 then
         begin
         if opt[tail]=3-i then continue;
         end
      else if opt[tail]=7-i then continue;
      if tnum>b then continue;
      if hash[tnum]=true then continue;
      {if f[now]+1>f[tnum] then continue
        else begin
             if (f[now]+1=f[tnum])and(hash[tnum]=1) then continue;
             end;}
      hash[tnum]:=true;
      inc(head);
      num[head]:=tnum;
      opt[head]:=i;
      dis[head]:=dis[tail]+1;
      //f[tnum]:=f[now]+1;
        if num[head]=b then
           begin
           pd:=true;

           knum:=dis[head];
           break;
           end;
      end;
  if pd then break;
  inc(tail);
  end;
writeln(knum);
end;

close(input);
close(output);
end.
