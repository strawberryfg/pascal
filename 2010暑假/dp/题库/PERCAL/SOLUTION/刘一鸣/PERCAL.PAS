program percal;
const
    maxn=2000;
var
    num,l,r,bl,br,h:array[1..maxn] of longint;
    res,n:longint;

procedure find;
var
    i:longint;
begin
    for i:=1 to n do
        if num[i]=0 then begin
            l[i]:=i;
            if (i>1) and (l[i-1]<>-1) then l[i]:=l[i-1];
        end else l[i]:=-1;
    for i:=n downto 1 do
        if num[i]=0 then begin
            r[i]:=i;
            if (i<n) and (r[i+1]<>-1) then r[i]:=r[i+1];
        end else r[i]:=-1;
end;

procedure solve;
var
    i,j:longint;
begin
    for i:=1 to n do
        if num[i]=1 then begin
            h[i]:=0;
            bl[i]:=1;
            br[i]:=n;
        end
        else begin
            if bl[i]<l[i] then bl[i]:=l[i];
            if br[i]>r[i] then br[i]:=r[i];
            inc(h[i]);
            if (br[i]-bl[i]+1)*h[i]>res then
                res:=(br[i]-bl[i]+1)*h[i];
        end;
end;

var
    i,j:longint;
begin
    assign(input,'percal.in');reset(input);
    assign(output,'percal.out');rewrite(output);
    readln(n);
    for i:=1 to n do begin
        bl[i]:=1; br[i]:=n;
    end;
    for i:=1 to n do begin
        for j:=1 to n do read(num[j]);
        find;
        solve;
    end;
    writeln(res);
    close(input); close(output);
end.
