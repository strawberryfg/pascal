var n,k,i,sum,temp:longint;
        a:array[0..30]of longint;
function s(t:longint):longint;
begin
    if t=0 then s:=0
            else if t=1 then s:=1
                        else if t=2 then s:=2
                                    else if t=3 then s:=4
                                                else s:=s(t-1)+s(t-2)+s(t-3);
end;

begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);     

  readln(n);
  readln(k);
  for i:=1 to k do
  readln(a[i]);
  for i:=1 to k do
  begin
  if a[i]>a[i+1] then begin  temp:=a[i];a[i]:=a[i+1];a[i+1]:=temp;end;
  end;
  sum:=s(a[1]-1);
  for i:=2 to k do
  sum:=sum*s(a[i]-a[i-1]-1);
  sum:=sum*s(n-a[k]);
  writeln(sum);
  close(input);
  close(output);
end.
