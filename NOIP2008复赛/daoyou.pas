var f,r,k,c10,c7,c3,i,tot:longint;
    a,b,c,d,e:array[1..100]of longint;
function check(n,x,y,z:longint):boolean;
var i:longint;
begin
check:=true;
for i:=1 to n do
    if (x=a[i])and(y=b[i])and(z=c[i]) then exit(false);
end;
begin
a[1]:=10;
b[1]:=0;
c[1]:=0;
d[1]:=1;
f:=1;
r:=1;
while f<=r do
      begin
      for i:=1 to 6 do
          case i of
          1:{10-7}
          begin
          k:=a[f]+b[f];
          c3:=c[f];
          if k<7 then begin c10:=0;c7:=k; end
             else begin c7:=7;c10:=k-7; end;
          if check(r,c10,c7,c3)=true then
             begin
             inc(r);
             a[r]:=c10; b[r]:=c7; c[r]:=c3; d[r]:=f;
             end;
          end;
          2:{7-10}
          begin
          k:=a[f]+b[f];
          c3:=c[f];
          if k<10 then begin c7:=0;c10:=k; end
             else begin c10:=10;c7:=k-10; end;
          if check(r,c10,c7,c3)=true then
             begin
             inc(r);
             a[r]:=c10; b[r]:=c7; c[r]:=c3; d[r]:=f;
             end;
          end;
          3:{10-3}
          begin
          k:=a[f]+c[f];
          c7:=b[f];
          if k<3 then begin c10:=0;c3:=k; end
             else begin c3:=3;c10:=k-3; end;
          if check(r,c10,c7,c3)=true then
             begin
             inc(r);
             a[r]:=c10; b[r]:=c7; c[r]:=c3; d[r]:=f;
             end;
          end;
          4:{3-10}
          begin
          k:=a[f]+c[f];
          c7:=b[f];
          if k<10 then begin c3:=0;c10:=k; end
             else begin c10:=10;c3:=k-10; end;
          if check(r,c10,c7,c3)=true then
             begin
             inc(r);
             a[r]:=c10; b[r]:=c7; c[r]:=c3; d[r]:=f;
             end;
          end;
          5:{7-3}
          begin
          k:=b[f]+c[f];
          c10:=a[f];
          if k<3 then begin c7:=0;c3:=k; end
             else begin c3:=3;c7:=k-3; end;
          if check(r,c10,c7,c3)=true then
             begin
             inc(r);
             a[r]:=c10; b[r]:=c7; c[r]:=c3; d[r]:=f;
             end;
          end;
          6:{3-7}
          begin
          k:=b[f]+c[f];
          c10:=a[f];
          if k<7 then begin c3:=0;c7:=k; end
             else begin c7:=7;c3:=k-7; end;
          if check(r,c10,c7,c3)=true then
             begin
             inc(r);
             a[r]:=c10; b[r]:=c7; c[r]:=c3; d[r]:=f;
             end;
          end;
          end;
      if (a[r]=5)or(b[r]=5)or(c[r]=5) then break;
      inc(f);
      end;
tot:=1;
e[1]:=r;
while e[tot]<>1 do
      begin
      inc(tot);
      e[tot]:=d[e[tot-1]];
      end;
for i:=tot downto 1 do write(e[i]:4);
end.
