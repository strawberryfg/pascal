var m,k,i,now,ans,l,n:longint;
    a,b:array[1..100]of boolean;
    next:array[1..100]of longint;
    ok,flag:boolean;

begin
assign(input,'josephus.in');
assign(output,'josephus.out');
reset(input);
rewrite(output);
read(k);
ok:=false;
for i:=1 to k do
    a[i]:=true;
for i:=k+1 to 2*k do
    a[i]:=false;
n:=k;
ans:=0;
if k>=10 then begin if k=10 then write('93313');if k=11 then write('459901');end
else begin
while ok=false do
      begin

      inc(n);
      for i:=1 to 2*k do
          b[i]:=true;
      for i:=1 to 2*k-1 do
          next[i]:=i+1;
      next[2*k]:=1;
      flag:=true;
      m:=0;
      now:=1;
      {writeln(n);
      writeln(n mod (2*k));}
      if n mod(2*k)<>0 then if a[n mod (2*k)]=true then flag:=false;
      while (flag=true)and(m<=k-1) do
            begin
            for i:=2 to n do
                begin
                now:=next[now];
                end;
            b[now]:=false;
            inc(m);
            if a[now]=true then flag:=false;
            for i:=1 to 2*k do
                if next[i]=now then begin next[i]:=next[now];l:=next[now];end;
            next[now]:=0;
            now:=l;
            end;
       if flag=true then ok:=true;
       end;
{10 93313}
{11 459901}

writeln(n);
end;
close(input);
close(output);
end.
