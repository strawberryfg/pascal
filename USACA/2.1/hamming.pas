{
ID: xiaweiy1
PROG: hamming
LANG: PASCAL
}
const binary:array[1..8]of integer=(2,4,8,16,32,64,128,256);
var a:array[1..62]of longint;
    hash:array[0..258]of longint;
    n,b,d,t:longint;
procedure print;
var i,j,q:longint;
begin
for i:=1 to n-1 do
    for j:=i+1 to n do
        begin
        if a[i]>a[j] then begin q:=a[i];a[i]:=a[j];a[j]:=q; end;
        end;
for i:=1 to n do
    begin
    if i=n then begin write(a[n]);break; end;
    if i mod 10=0 then begin write(a[i]);writeln; end else write(a[i],' ');
    end;
writeln;
close(input);
close(output);
halt;
end;
procedure try(dep,wei:longint);
var k,p,i,j,tot:longint;
begin
for i:=1 to t do
    begin
    if (i<>a[dep])and(hash[i]=0) then
       begin
       k:=a[dep] xor i;
       tot:=0;
       while k<>0 do
            begin
            p:=k mod 2;
            if p=1 then inc(tot);
            k:=k div 2;
            end;
       if tot>=d then
          begin
          for j:=1 to dep-1 do
              begin
                k:=a[j] xor i;
                tot:=0;
                while k<>0 do
                  begin
                  p:=k mod 2;
                  if p=1 then inc(tot);
                  k:=k div 2;
                  end;
                if tot<d then break;
              end;
          if tot<d then continue
          else begin
               a[dep+1]:=i;
               hash[i]:=1;
               if dep+1=wei then print else try(dep+1,wei);
               a[dep+1]:=0;
               hash[i]:=0;
               end;
          end;
       end;
    end;
end;
begin
assign(input,'hamming.in');
reset(input);
assign(output,'hamming.out');
rewrite(output);
readln(n,b,d);
t:=binary[b]-1;
a[1]:=0;
hash[0]:=1;
try(1,n);
writeln;
close(input);
close(output);
end.
