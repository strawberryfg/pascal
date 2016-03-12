var m,i,j,t,k:longint;
    n:array[1..2]of longint;
    s:array[1..2]of string;
    a:array[1..2,1..1000]of char;
    p:array[1..2,1..1000]of boolean;
procedure change2(var a,b:boolean);
        var q:boolean;
        begin
        q:=a;a:=b;b:=q;
        end;
procedure change(var a,b:char);
        var t:char;
        begin
        t:=a;a:=b;b:=t;
        end;
begin
assign(input,'kolone.in');reset(input);
assign(output,'kolone.out');rewrite(output);
readln(n[1],n[2]);
readln(s[1]);
readln(s[2]);
readln(t);
if t>=(n[1]+n[2]-1) then
        begin
        for i:=1 to n[2] do
                write(s[2,i]);
        for i:=n[1] downto 2 do
                write(s[1,i]);
        writeln(s[1,1]);
        close(input);
        close(output);
        halt;
        end;
fillchar(p,sizeof(p),false);
for i:=1 to n[1] do p[1,i]:=true;
for i:=1 to 2 do
        for j:=1 to n[i] do
            a[i,j]:=s[i,j];
if t<>0 then
for k:=1 to t do
    begin
    inc(m);if m mod 2=1 then begin change(a[1,1],a[2,1]);change2(p[1,1],p[2,1]);end;
    for i:=1 to 2 do
        begin
        j:=0;
        while j<n[i]-1 do
                begin
                inc(j);
                case i of
                1:if (not p[i,j])and((m mod 2=0)or(j<>1)) then
                begin change(a[i,j],a[i,j+1]);change2(p[i,j],p[i,j+1]);inc(j);end;
                2:if (p[i,j])and((m mod 2=0)or(j<>1)) then
                begin change(a[i,j],a[i,j+1]);change2(p[i,j],p[i,j+1]);inc(j);end;
                end;
                end;
        end;
    end;
for i:=n[1] downto 1 do
        write(a[1,i]);
for i:=1 to n[2] do
        write(a[2,i]);
writeln;
close(input);
close(output);
end.
