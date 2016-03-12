var a:array [1..17]of longint;
    n,k,j,i,c:longint;

function su(x:longint):boolean;
var b:boolean;
    i:longint;
begin
        b:=true;
        for i:=1 to trunc(sqrt(x)) do if x mod i=0then begin b:=false; break;end;
end;

procedure find(i:longint);
begin
        while k<8 do
        begin
        a[i]:=1;
        for j:=1 to n do if a[j]=0 then break;
                if su(i+j) then begin find(j); inc(k);end
                           else begin for c:=1 to n do if a[c]=0 then break;
                           a[j]:=0;
                           find(c);
                           dec(k);
                           end;
        end;
        a[k]:=i;
end;

begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
        readln(n);
        a[1]:=1;
        for i:=1 to n do
        begin
        for j:=2 to n do a[j]:=0;
        k:=0;
        find(i);
        for j:=1 to n-1 do write(a[j],' ');
        writeln(a[n]);
        end;
close(input);
close(output);
end.