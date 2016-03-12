type atype=array[1..1000] of longint;
var s,b:atype;
    n,i,j,sum:longint;

procedure sort(l,r: longint);
var i,j,x,y: longint;
begin
  i:=l;
  j:=r;
  x:=s[(l+r) div 2];
  repeat
    while s[i]<x do inc(i);
    while x<s[j] do dec(j);
    if not(i>j) then begin
                        y:=s[i];
                        s[i]:=s[j];
                        s[j]:=y;
                        y:=b[i];
                        b[i]:=b[j];
                        b[j]:=y;
                        i:=i+1;
                        j:=j-1;
                      end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  read(n);
  for i:=1 to n do
    read(s[i],b[i]);
  sort(1,n);
  i:=1;
  j:=2;
  repeat
    if b[i]>=s[j] then begin
                          if (b[i]-s[i]+1)>(b[j]-s[j]+1) then begin
                                                                 s[j]:=0;
                                                                 b[j]:=0;
                                                                 j:=j+1;
                                                              end
                                                          else begin
                                                                  s[i]:=0;
                                                                  b[i]:=0;
                                                                  i:=i+1;
                                                               end;
                        end;
    j:=j+1;
  until j>n;
  for i:=1 to n do
    if (s[i]<>0)and(b[i]<>0) then sum:=sum+(b[i]-s[i]+1);
  writeln(sum);
  close(input);
  close(output);
end.

