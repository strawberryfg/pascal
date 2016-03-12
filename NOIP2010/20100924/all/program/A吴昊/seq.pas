var n,i,k1,k2,right,left:longint;
    s:Array[1..100001] of longint;
function max(a,b:longint):longint;
begin
        if a>b then exit(a) else exit(b);
end;
function min(a,b:longint):longint;
begin
        if a<b then exit(a) else exit(b);
end;
begin
assign(input,'seq.in');reset(input);
assign(output,'seq.out');rewrite(output);
read(n);
for i:=1 to n do begin read(s[i]);s[i]:=s[i]*2;end;
k2:=s[1];
right:=maxlongint;
left:=0-maxlongint;
for i:=1 to n do
        begin
                if i mod 2=1 then right:=min((k2+k1) div 2,right)
                             else left:=max((k1-k2) div 2,left);
        k1:=k2;k2:=abs(k2-s[i+1]);
        end;
writeln(right-left+1);
close(input);
close(output);
end.
