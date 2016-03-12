{
ID: xiaweiy1
PROG: crypt1
LANG: PASCAL
}
var n,i,j,k,l,m,p,q,res,t,sum,tot,o,tt:longint;
    a,b,c,v:array[0..9]of integer;
    pd:boolean;
procedure chk(t,x,y:longint);
var p,k:longint;
begin
p:=x*10+y;
if p>=10000 then exit;
while p<>0 do
      begin
      k:=p mod 10;
      p:=p div 10;
      if v[k]=0 then exit;
      end;
inc(res);
end;
begin
assign(input,'crypt1.in');
reset(input);
assign(output,'crypt1.out');
rewrite(output);
readln(n);
for i:=1 to n do begin read(t);inc(sum);a[sum]:=t;v[t]:=1; end;
for i:=1 to sum-1 do
    for j:=i+1 to sum do
        if a[i]>a[j] then begin a[i]:=a[i]+a[j];a[j]:=a[i]-a[j];a[i]:=a[i]-a[j]; end;
for i:=1 to sum do
    for j:=1 to sum do
        for k:=1 to sum do
            begin
            t:=a[i]*100+a[j]*10+a[k];
            tot:=0; fillchar(b,sizeof(b),0);fillchar(c,sizeof(c),0);
            for l:=1 to sum do
                begin
                q:=t*a[l];
                if q>=1000 then break;
                p:=q;
                pd:=true;
                while p<>0 do
                      begin
                      tt:=p mod 10;
                      p:=p div 10;
                      if v[tt]=0 then begin pd:=false;break;end;
                end;
                if pd=false then continue;
                inc(tot); b[tot]:=a[l]; c[a[l]]:=q;
                end;
            for l:=1 to tot do
                for m:=1 to tot do
                    begin
                    o:=res;
                    chk(t,c[b[l]],c[b[m]]);
                    {if res-o=1 then begin write(a[i],a[j],a[k]);writeln;write(b[l],b[m]);writeln; end;}
                    end;
            end;
writeln(res);
close(input);
close(output);
end.