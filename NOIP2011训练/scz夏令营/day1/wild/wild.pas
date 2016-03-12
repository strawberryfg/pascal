//21:37; 21:42;
var s,t:string;
    x,tot:int64;
    len:longint;
procedure dfs(dep:longint;pd:boolean;now:int64); //true: a>b false a=b
begin
if dep>len then begin if pd then tot:=int64(tot)+int64(now); exit; end;
if s[dep]='?' then
   begin
   if pd then dfs(dep+1,pd,int64(now)*int64(10))
      else begin
           dfs(dep+1,true,int64(9-(ord(t[dep])-48))*int64(now));
           dfs(dep+1,false,now);
           end;
   end
else
   begin
   if pd then dfs(dep+1,pd,now)
      else begin
           if s[dep]<t[dep] then exit;
           if s[dep]=t[dep] then dfs(dep+1,false,now);
           if s[dep]>t[dep] then dfs(dep+1,true,now);
           end;
   end;
end;
begin
assign(input,'wild.in');
reset(input);
assign(output,'wild.out');
rewrite(output);
readln(s);
len:=length(s);
readln(x);
str(x,t);
dfs(1,false,1);
writeln(tot);
close(input);
close(output);
end.