var a:array[1..2500]of longint;
    p:array[1..2500]of char;
    s:array['H'..'J']of longint;
    d,i,n:longint;
function min(a,b:longint):longint;
        begin
        if a<b then min:=a else min:=b;
        end;
function max(a,b:longint):longint;
        begin
        if a>b then max:=a else max:=b;
        end;
function check(n:longint):boolean;
        var x,y:char;a,b:longint;
        begin
        if p[n]='J' then begin x:='J';y:='H';end
                    else begin x:='H';y:='J';end;
        a:=min(s[x]+1,s[y]);
        b:=max(s[x]+1,s[y]);
        if (a=0)or(b-a<=d) then check:=true else check:=false;
        end;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
for i:=1 to n do
        read(p[i]);
a[1]:=1;
s[p[1]]:=1;
for i:=2 to n do
  if check(i) then
        begin
        a[i]:=a[i-1];
        inc(s[p[i]]);
        end
        else
        begin
        s['H']:=0;s['J']:=0;
        a[i]:=a[i-1]+1;
        end;
writeln(a[n]);
close(input);
close(output);
end.