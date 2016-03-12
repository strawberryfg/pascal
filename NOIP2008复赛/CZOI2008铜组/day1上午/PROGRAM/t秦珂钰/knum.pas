program knum(input,output);
var a:array[1..10000] of integer;
    k,n,i,j,t:integer;
begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);
  readln(n,k);
  for i:=1 to n do
    readln(a[i]);
  for i:=1 to n-1 do
    if i<=n-k+1 then  for j:=i+1 to n do
                    if a[i]>a[j] then begin
                                        t:=a[i];
                                        a[i]:=a[j];
                                        a[j]:=t;
                                      end
            else break;
  writeln(a[n-k+1]);
  close(input);
  close(output);
end.