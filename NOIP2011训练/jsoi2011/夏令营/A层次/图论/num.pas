const maxn=100;
var n,p,q,i,j,res:longint;
    flag:boolean;
    edge,from:array[0..maxn,0..maxn]of longint;
    ans,hash,s,a:array[0..maxn]of longint;

procedure topsort;
var tot,i:longint;
    pd:boolean;
begin
tot:=0;
while tot<=n do
  begin
  pd:=true;
  for i:=0 to n do
      begin
      if hash[i]=1 then continue;
      if (i+p<=n)and(from[i,i+p]=1) then continue;
      if (i-q>=0)and(from[i,i-q]=1) then continue;
      pd:=false;
      inc(tot);ans[tot]:=i;
      if (i+q<=n) then
         begin
         edge[i,i+q]:=0; from[i+q,i]:=0;
         end;
      if (i-p>=0) then
         begin
         edge[i,i-p]:=0; from[i-p,i]:=0;
         end;

      hash[i]:=1;
      break;
      end;
  if pd then begin flag:=true; exit; end;
  end;
end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n,p,q);
for i:=0 to n-p do
    begin
    edge[i+p,i]:=1;
    from[i,i+p]:=1;
    end;
for i:=0 to n-q do
    begin
    edge[i,i+q]:=1;
    from[i+q,i]:=1;
    end;
flag:=false;
topsort;
if flag then writeln('NO')
        else begin
             for i:=1 to n+1 do
                 begin
                 if ans[i]=0 then break;
                 end;
             for j:=i-1 downto 1 do s[ans[j]]:=s[ans[j+1]]+1;
             for j:=i+1 to n+1 do s[ans[j]]:=s[ans[j-1]]-1;
             for i:=1 to n-1 do
                 begin
//                 a[i]:=s[i]-s[i-1];
                 write(s[i]-s[i-1],' ');
                 end;
             write(s[n]-s[n-1]);
             writeln;
             end;
close(input);
close(output);
end.
