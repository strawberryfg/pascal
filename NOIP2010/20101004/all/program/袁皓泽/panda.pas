var n,k,i,j,ll:longint;
    z,l:array[1..100]of longint;
    q:array[0..100000]of int64;
    min,s:int64;

begin
assign(input,'panda.in');
assign(output,'panda.out');
reset(input);
rewrite(output);
  readln(n,k);
  for i:=1 to n do read(z[i]);
  readln;
  q[0]:=1;
  for i:=1 to k do
    begin
      min:=maxlongint;
      for j:=1 to n do
        begin
          if q[i-1]=q[l[j]]*z[j] then inc(l[j]);
          s:=q[l[j]]*z[j];
          if min>s then begin min:=s; ll:=j; end
        end;
      q[i]:=min;
      inc(l[ll]);
    end;
  writeln(q[k]);
close(input);
close(output);
end.