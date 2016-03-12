{
ID: xiaweiy1
PROG: preface
LANG: PASCAL
}
const ten:array[1..10,1..7]of integer=
          ((1,0,0,0,0,0,0),(2,0,0,0,0,0,0),(3,0,0,0,0,0,0),(1,1,0,0,0,0,0),
           (0,1,0,0,0,0,0),(1,1,0,0,0,0,0),(2,1,0,0,0,0,0),(3,1,0,0,0,0,0),
           (1,0,1,0,0,0,0),(0,0,1,0,0,0,0));
      signal:array[1..7]of longint=(1,5,10,50,100,500,1000);
      ch:array[1..7]of char=('I','V','X','L','C','D','M');
      mi:array[1..3]of integer=(10,100,1000);
var f,a:array[1..7]of longint;
    v:array[10..3500,0..7]of longint;
    i,j,n,en1,en2:longint;
procedure work(k:longint);
var p:longint;
begin
if v[k,0]<>0 then begin for i:=1 to 7 do a[i]:=a[i]+v[k,i]; exit; end;
p:=k div signal[3];
if p<=3 then inc(a[3],p)
    else if p=4 then begin inc(a[3]);inc(a[4]); end
        else if p=5 then inc(a[4])
                    else if (p>5)and(p<9) then begin inc(a[4]);inc(a[3],p-5); end
                                          else if p=9 then begin inc(a[3]);inc(a[5]); end
                                                      else begin
                                                           p:=k div signal[5];
                                                           if p<=3 then inc(a[5],p)
                                                               else if p=4 then begin inc(a[5]);inc(a[6]); end
                                                                   else if p=5 then inc(a[6])
                                                                               else if (p>5)and(p<9) then begin inc(a[6]);inc(a[5],p-5); end
                                                                                              else if p=9 then begin inc(a[5]);inc(a[7]); end
                                                                                                         else begin p:=k div signal[7];inc(a[7],p); end;
                                                           end;
for i:=1 to 7 do v[k,i]:=a[i];
v[k,0]:=1;
end;
procedure pro;
var i,j,k,m,sum:longint;
    ts:string;
begin
for i:=1 to n div 10 do
    begin
    fillchar(a,sizeof(a),0);
    k:=i; sum:=0;
    while k<>0 do
          begin
          k:=k div 10;
          inc(sum);
          end;
    k:=i*10;
    while k<>0 do
          begin
          work(k-k mod mi[sum]);
          k:=k mod mi[sum];
          str(k,ts);
          sum:=length(ts)-1;
          end;
    if i<n div 10 then begin en1:=9; en2:=10; end else begin en1:=n-i*10;en2:=en1+1; end;
    if i=1 then dec(en2);
       for j:=1 to en1 do
           for m:=1 to 7 do
               inc(f[m],ten[j,m]);
       for j:=1 to en2 do
           for m:=1 to 7 do
               inc(f[m],a[m]);
    end;
end;
begin
assign(input,'preface.in');
reset(input);
assign(output,'preface.out');
rewrite(output);
readln(n);
if n<=10 then begin
              for i:=1 to n do
                  for j:=1 to 7 do
                      inc(f[j],ten[i,j]);
              for i:=1 to 7 do
                  if f[i]<>0 then begin write(ch[i],' ',f[i]);writeln; end;
              end
         else begin
              for i:=1 to 10 do
                  for j:=1 to 7 do
                      inc(f[j],ten[i,j]);
              pro;
              for i:=1 to 7 do
                  if f[i]<>0 then begin write(ch[i],' ',f[i]);writeln; end;
              end;
close(input);
close(output);
end.
