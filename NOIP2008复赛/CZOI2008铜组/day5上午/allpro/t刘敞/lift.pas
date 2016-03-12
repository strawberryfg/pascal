var n,a,b,i,left,right,m:longint;
    s,t,r:array[1..10000]of longint;
function same(m:longint):boolean;
        var i:longint;
        begin
        same:=false;
        for i:=1 to right do
                if m=s[i] then exit(true);
        end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
for i:=1 to n do
        read(r[i]);
fillchar(t,sizeof(t),0);
left:=1;right:=1;
s[1]:=a;
i:=0;
while left<=right do
        begin
        inc(i);
        m:=s[left]+r[s[left]];
        if m=b then break;
        if (m<=n)and not same(m) then begin inc(right);s[right]:=s[left]+r[s[left]];t[right]:=i;end;
        m:=s[left]-r[s[left]];
        if m=b then break;
        if (m>=1)and not same(m) then begin inc(right);s[right]:=s[left]-r[s[left]];t[right]:=i;end;
        inc(left);
        end;
if left>right then writeln(-1) else writeln(i);
close(input);
close(output);
end.
