program hunger;
var temp,a,b:array[0..1001] of integer;
    i,j,k,max,s,n:integer;
    flag:boolean;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
      readln(a[i],b[i]);
  close(input);
  max:=0;
  for i:=1 to n do
      begin
      fillchar(temp,sizeof(temp),0);
      s:=0;
      for j:=i to n do
      begin
        flag:=true;
        for k:=a[j] to b[j] do
            if temp[k]=0 then temp[k]:=1
                         else begin flag:=false;break;end;
        if flag then s:=s+(b[j]-a[j])+1;
      end;
      if s>max then max:=s;
      end;
  writeln(max);
  close(output);
end.