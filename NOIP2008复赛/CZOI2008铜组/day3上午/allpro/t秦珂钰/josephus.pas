program josephus(input,output);
type arr=array[1..28] of boolean;
var a:arr;
    n,i,n2:longint;

function cl(i:longint; var n2:longint;var a:arr):boolean;
var j,s,sum,k:longint;
begin
  j:=0;
  sum:=0;
  cl:=false;
  while n2>n div 2 do
  begin
    s:=i+j;
    while s>n2 do
      s:=s-n2;
    if a[s]=false then if s=n2 then begin
                                      n2:=n2-1;
                                      sum:=sum+1;
                                     end
                               else begin
                                      for k:=s to n2 do
                                        a[s]:=a[s+1];
                                      n2:=n2-1;
                                      sum:=sum+1;
                                      end;
    j:=n2-s;
  end;
  if sum=n2 div 2 then cl:=true;
end;

begin
  assign(input,'josephus.in');
  reset(input);
  assign(output,'josephus.out');
  rewrite(output);
  readln(n);
  n2:=n*2;
  for i:=1 to n2 do
    if i<=n then a[i]:=true
            else a[i]:=false;
  i:=n2 div 2 +1;
  while i<100000 do
  begin
    if cl(i,n2,a) then break;
    i:=i+1;
  end;
  writeln(i);
  close(input);
  close(output);
end.
