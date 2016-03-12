var  n,k,t,i:longint;
     a:array[0..9] of longint;
begin
  assign(input,'count.in');
  assign(output,'count.out');
  reset(input);
  rewrite(output);
  readln(n);
  fillchar(a,sizeof(a),0);
  for i:=1 to n  do
     begin
       k:=i;
        while k<>0 do
           begin
            a[k mod 10]:=a[k mod 10] +1;
            k:=k div 10;
           end;
     end;
 for i:=0 to 9 do
    writeln(a[i]);
 close(input);
 close(output);
end.
